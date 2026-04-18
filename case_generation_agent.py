import argparse
import os
import re
import shutil
from collections import defaultdict
from pathlib import Path

import yaml


BASE_DIR = Path(__file__).resolve().parent
CASE_SPECS_DIR = BASE_DIR / "data" / "cases"
TEMPLATES_DIR = BASE_DIR / "resources" / "templates"
STARTER_PROJECTS_DIR = BASE_DIR / "resources" / "starter_projects"
EMPTY_PROJECT_DIR = STARTER_PROJECTS_DIR / "empty_atomic_project"
OUTPUT_BASE_DIR = BASE_DIR / "output" / "test_cases"

ALLOWED_SCENARIOS = {"requirement", "bug_fix", "full_generation"}

SCENARIO_PREFIX_MAP = {
    "bug_fix": "BUGFIX",
    "requirement": "REQ",
    "full_generation": "FULL",
}

OUTPUT_REQUIREMENTS_MAP = {
    "requirement": "请基于 original_project 完成需求实现，并说明新增页面、组件和导航链路。",
    "full_generation": "请从零完成完整工程生成，并说明新增文件、主要实现内容及最终效果。",
}


def get_next_case_number(scenario: str) -> int:
    scenario_dir = OUTPUT_BASE_DIR / scenario
    if not scenario_dir.exists():
        return 1

    max_num = 0
    for entry in scenario_dir.iterdir():
        if entry.is_dir() and re.fullmatch(r"\d+", entry.name):
            max_num = max(max_num, int(entry.name))
    return max_num + 1


def find_harmonyos_project_root(template_dir: Path | None) -> Path | None:
    if not template_dir or not template_dir.is_dir():
        return None

    if (template_dir / "entry" / "src" / "main" / "ets").is_dir():
        return template_dir

    for root, _dirs, _files in os.walk(template_dir):
        current = Path(root)
        depth = len(current.relative_to(template_dir).parts)
        if depth > 3:
            continue
        if (current / "entry" / "src" / "main" / "ets").is_dir():
            return current
    return None


def resolve_template_project(template_project: str | None) -> Path | None:
    if not template_project or not isinstance(template_project, str):
        return None

    value = template_project.strip()
    if not value:
        return None

    exact_path = TEMPLATES_DIR / value
    if exact_path.is_dir():
        return exact_path

    target_name = value.split("/")[-1]
    for root, dirs, _files in os.walk(TEMPLATES_DIR):
        for dirname in dirs:
            if dirname == value or dirname == target_name:
                candidate = Path(root) / dirname
                if candidate.is_dir():
                    return candidate
    return None


def resolve_starter_project(starter_kind: str | None) -> Path | None:
    if not starter_kind or not isinstance(starter_kind, str):
        return None

    value = starter_kind.strip()
    if not value:
        return None

    starter_path = STARTER_PROJECTS_DIR / value
    if starter_path.is_dir():
        project_root = find_harmonyos_project_root(starter_path)
        if project_root:
            return project_root

    return None


def load_case_spec(path: Path) -> dict:
    with path.open("r", encoding="utf-8") as file:
        data = yaml.safe_load(file) or {}

    if not isinstance(data, dict):
        raise ValueError(f"Case spec must be a mapping: {path}")

    case_meta = data.get("case")
    if not isinstance(case_meta, dict):
        raise ValueError(f"Case spec missing top-level 'case' mapping: {path}")

    scenario = case_meta.get("scenario")
    if scenario not in ALLOWED_SCENARIOS:
        raise ValueError(f"Unsupported scenario in {path}: {scenario}")

    return data


def resolve_case_spec_paths(spec: str | None = None, spec_dir: str | None = None) -> list[Path]:
    if spec and spec_dir:
        raise ValueError("--spec and --spec-dir cannot be used together")

    if spec:
        path = Path(spec).resolve()
        if not path.is_file():
            raise FileNotFoundError(f"Case spec file not found: {path}")
        return [path]

    base_dir = Path(spec_dir).resolve() if spec_dir else CASE_SPECS_DIR
    if not base_dir.exists():
        raise FileNotFoundError(f"Case spec directory not found: {base_dir}")
    if not base_dir.is_dir():
        raise NotADirectoryError(f"Case spec path is not a directory: {base_dir}")

    return sorted(path for path in base_dir.rglob("*.yaml") if path.is_file())


def get_case_meta(spec: dict) -> dict:
    case_meta = spec.get("case")
    if not isinstance(case_meta, dict):
        raise ValueError("Case spec missing 'case' mapping")
    return case_meta


def resolve_source_dir(case_meta: dict) -> Path:
    template_path = resolve_template_project(case_meta.get("template_project"))
    if template_path:
        project_root = find_harmonyos_project_root(template_path)
        if project_root:
            return project_root

    starter_path = resolve_starter_project(case_meta.get("starter_kind"))
    if starter_path:
        return starter_path

    if EMPTY_PROJECT_DIR.is_dir():
        return EMPTY_PROJECT_DIR

    raise FileNotFoundError(f"Default empty project directory not found: {EMPTY_PROJECT_DIR}")


def format_rules(constraint: dict) -> list[dict]:
    rules = constraint.get("rules")
    if not isinstance(rules, list):
        return []

    formatted = []
    for rule in rules:
        if not isinstance(rule, dict):
            continue

        entry = {"target": rule.get("target", "**/*.ets")}
        ast = rule.get("ast")
        llm = rule.get("llm")

        if isinstance(ast, list) and ast:
            entry["ast"] = ast
        if isinstance(llm, str) and llm.strip():
            entry["llm"] = llm.strip()

        formatted.append(entry)
    return formatted


def build_bug_fix_prompt(case_meta: dict, has_template: bool, has_starter: bool) -> str:
    base_prompt = str(case_meta.get("input", "")).strip()
    if has_template or has_starter:
        return base_prompt

    problem_statement = str(case_meta.get("problem_statement", "")).strip()
    fix_targets = case_meta.get("fix_targets")
    fix_lines = []
    if isinstance(fix_targets, list):
        fix_lines = [str(item).strip() for item in fix_targets if str(item).strip()]

    parts = [base_prompt] if base_prompt else []
    parts.append("未提供模板来源，请先构造一个可复现该缺陷的 HarmonyOS 原始场景和原始代码，再在此基础上完成修复。")
    if problem_statement:
        parts.append(f"问题现象：{problem_statement}")
    if fix_lines:
        parts.append("修复目标：")
        parts.extend(f"- {line}" for line in fix_lines)
    return "\n".join(parts)


def build_case_prompt(case_meta: dict, scenario: str, has_template: bool, has_starter: bool) -> str:
    custom_prompt = str(case_meta.get("prompt", "")).strip()
    if custom_prompt:
        return custom_prompt

    if scenario == "bug_fix":
        return build_bug_fix_prompt(case_meta, has_template, has_starter)

    return str(case_meta.get("input", "")).strip()


def build_output_requirements(case_meta: dict, scenario: str, has_template: bool, has_starter: bool) -> str:
    explicit = str(case_meta.get("output_requirements", "")).strip()
    if explicit:
        return explicit

    if scenario == "bug_fix":
        if has_template or has_starter:
            return "请基于 original_project 修复缺陷，并说明根因、修复点和修改文件。"
        return "请先在 original_project 中构造原始缺陷场景和原始代码，再基于该 original_project 完成修复，并说明场景构造方式、根因、修复点和修改文件。"

    return OUTPUT_REQUIREMENTS_MAP.get(
        scenario,
        "请直接在当前工程中修改代码，并说明主要修改内容。",
    )


def build_case_content(spec: dict, case_num: str) -> dict:
    case_meta = get_case_meta(spec)
    scenario = case_meta.get("scenario")
    raw_constraints = spec.get("constraints", [])
    formatted_constraints = []

    for index, constraint in enumerate(raw_constraints, start=1):
        if not isinstance(constraint, dict):
            continue

        rules = format_rules(constraint)
        if not rules:
            continue

        prefix = SCENARIO_PREFIX_MAP.get(scenario, "GEN")
        constraint_id = constraint.get("id") or f"HM-{prefix}-{case_num}-{index:02d}"

        item = {
            "id": constraint_id,
            "name": constraint.get("name", ""),
            "priority": constraint.get("priority", "P1"),
            "rules": rules,
        }

        description = constraint.get("description") or constraint.get("name", "")
        if description:
            item["description"] = description

        formatted_constraints.append(item)

    if not formatted_constraints:
        case_id = case_meta.get("id", "unknown")
        raise ValueError(f"case {case_id} has no usable constraints")

    has_template = bool(resolve_template_project(case_meta.get("template_project")))
    has_starter = bool(resolve_starter_project(case_meta.get("starter_kind")))

    return {
        "case": {
            "id": f"{scenario}_{case_num}",
            "scenario": scenario,
            "title": case_meta.get("title", ""),
            "prompt": build_case_prompt(case_meta, scenario, has_template, has_starter),
            "output_requirements": build_output_requirements(case_meta, scenario, has_template, has_starter),
        },
        "constraints": formatted_constraints,
    }


def group_specs_by_scenario(spec_paths: list[Path]) -> dict[str, list[Path]]:
    grouped: dict[str, list[Path]] = defaultdict(list)
    for path in spec_paths:
        spec = load_case_spec(path)
        scenario = get_case_meta(spec).get("scenario")
        grouped[scenario].append(path)

    return {scenario: sorted(paths) for scenario, paths in grouped.items()}


def generate_cases(clean: bool = False, spec: str | None = None, spec_dir: str | None = None) -> int:
    spec_paths = resolve_case_spec_paths(spec=spec, spec_dir=spec_dir)
    grouped_specs = group_specs_by_scenario(spec_paths)
    OUTPUT_BASE_DIR.mkdir(parents=True, exist_ok=True)
    total_generated = 0

    for scenario in sorted(grouped_specs):
        paths = grouped_specs[scenario]
        scenario_dir = OUTPUT_BASE_DIR / scenario

        if clean and scenario_dir.exists():
            shutil.rmtree(scenario_dir)

        next_num = 1 if clean else get_next_case_number(scenario)

        for spec_path in paths:
            case_num = f"{next_num:03d}"
            target_dir = scenario_dir / case_num
            case_file_path = target_dir / "case.yaml"

            spec_data = load_case_spec(spec_path)
            case_meta = get_case_meta(spec_data)
            if case_file_path.exists() and not clean:
                print(f"跳过已存在用例 {case_file_path.relative_to(BASE_DIR)}")
                next_num += 1
                continue
            source_dir = resolve_source_dir(case_meta)
            case_content = build_case_content(spec_data, case_num)

            target_dir.mkdir(parents=True, exist_ok=True)
            original_project_dir = target_dir / "original_project"
            if original_project_dir.exists():
                shutil.rmtree(original_project_dir)
            shutil.copytree(source_dir, original_project_dir)

            with case_file_path.open("w", encoding="utf-8") as file:
                yaml.dump(
                    case_content,
                    file,
                    allow_unicode=True,
                    sort_keys=False,
                    default_flow_style=False,
                )

            print(
                f"已生成 {case_file_path.relative_to(BASE_DIR)} "
                f"(spec={case_meta.get('id', spec_path.stem)}, constraints={len(case_content['constraints'])})"
            )
            total_generated += 1
            next_num += 1

    print(f"\n生成完成，共生成 {total_generated} 个用例。")
    return total_generated


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="根据 case spec 批量生成 HarmonyOS 测试用例。")
    parser.add_argument(
        "--clean",
        action="store_true",
        help="生成前删除目标场景目录中已存在的内容。",
    )
    parser.add_argument(
        "--spec",
        help="只生成单个 case spec 文件。",
    )
    parser.add_argument(
        "--spec-dir",
        help="批量读取 case spec 目录，默认使用 data/cases。",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    print("开始生成测试用例...")
    generate_cases(clean=args.clean, spec=args.spec, spec_dir=args.spec_dir)


if __name__ == "__main__":
    main()
