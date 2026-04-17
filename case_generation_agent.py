import argparse
import os
import re
import shutil
from pathlib import Path

import yaml


BASE_DIR = Path(__file__).resolve().parent
SEED_CATALOG_PATH = BASE_DIR / "data" / "seeds" / "seed_catalogs.yaml"
TEMPLATES_DIR = BASE_DIR / "resources" / "templates"
EMPTY_PROJECT_DIR = BASE_DIR / "resources" / "starter_projects" / "empty_hos_project"
OUTPUT_BASE_DIR = BASE_DIR / "output" / "test_cases"

SCENARIO_PREFIX_MAP = {
    "bug_fix": "BUGFIX",
    "requirement": "REQ",
    "full_generation": "FULL",
}

OUTPUT_REQUIREMENTS_MAP = {
    "requirement": "请基于 original_project 完成需求实现，保留现有首页，并说明新增页面、组件和导航链路。",
    "full_generation": "请从零完成完整工程生成，并说明新增了哪些文件、主要实现内容及最终效果。",
}


def load_catalogs() -> dict:
    if not SEED_CATALOG_PATH.exists():
        raise FileNotFoundError(f"未找到种子配置文件: {SEED_CATALOG_PATH}")

    with SEED_CATALOG_PATH.open("r", encoding="utf-8") as file:
        data = yaml.safe_load(file) or {}

    if not isinstance(data, dict):
        raise ValueError("seed_catalogs.yaml 格式无效，顶层必须是对象。")
    return data


def get_next_case_number(scenario: str) -> int:
    scenario_dir = OUTPUT_BASE_DIR / scenario
    if not scenario_dir.exists():
        return 1

    max_num = 0
    for entry in scenario_dir.iterdir():
        if entry.is_dir() and re.fullmatch(r"\d+", entry.name):
            max_num = max(max_num, int(entry.name))
    return max_num + 1


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


def resolve_source_dir(seed: dict) -> Path:
    template_path = resolve_template_project(seed.get("template_project"))
    if template_path:
        project_root = find_harmonyos_project_root(template_path)
        if project_root:
            return project_root

    if EMPTY_PROJECT_DIR.is_dir():
        return EMPTY_PROJECT_DIR

    raise FileNotFoundError(f"未找到默认空工程目录: {EMPTY_PROJECT_DIR}")


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


def build_bug_fix_prompt(seed: dict, has_template: bool) -> str:
    base_prompt = str(seed.get("input", "")).strip()
    if has_template:
        return base_prompt

    problem_statement = str(seed.get("problem_statement", "")).strip()
    fix_targets = seed.get("fix_targets")
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


def build_output_requirements(seed: dict, scenario: str, has_template: bool) -> str:
    if scenario == "bug_fix":
        if has_template:
            return "请基于 original_project 修复缺陷，并说明根因、修复点和修改文件。"
        return "请先在 original_project 中构造原始缺陷场景和原始代码，再基于该 original_project 完成修复，并说明场景构造方式、根因、修复点和修改文件。"

    return OUTPUT_REQUIREMENTS_MAP.get(
        scenario,
        "请直接在当前工程中修改代码，并说明主要修改内容。",
    )


def build_case_content(seed: dict, scenario: str, case_num: str) -> dict:
    raw_constraints = seed.get("constraints", [])
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
        raise ValueError(f"seed {seed.get('seed_id', 'unknown')} 没有可用约束。")

    has_template = bool(resolve_template_project(seed.get("template_project")))
    prompt = seed.get("input", "")
    if scenario == "bug_fix":
        prompt = build_bug_fix_prompt(seed, has_template)

    return {
        "case": {
            "id": f"{scenario}_{case_num}",
            "scenario": scenario,
            "title": seed.get("title", ""),
            "prompt": prompt,
            "output_requirements": build_output_requirements(seed, scenario, has_template),
        },
        "constraints": formatted_constraints,
    }


def generate_cases(clean: bool = False) -> int:
    catalogs = load_catalogs()
    OUTPUT_BASE_DIR.mkdir(parents=True, exist_ok=True)
    total_generated = 0

    for scenario, seeds in catalogs.items():
        if not isinstance(seeds, list):
            continue

        next_num = 1 if clean else get_next_case_number(scenario)

        for seed in seeds:
            case_num = f"{next_num:03d}"
            target_dir = OUTPUT_BASE_DIR / scenario / case_num
            case_file_path = target_dir / "case.yaml"

            if clean and target_dir.exists():
                shutil.rmtree(target_dir)

            if case_file_path.exists():
                print(f"跳过已存在用例: {case_file_path.relative_to(BASE_DIR)}")
                next_num += 1
                continue

            source_dir = resolve_source_dir(seed)
            case_content = build_case_content(seed, scenario, case_num)

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
                f"(seed={seed.get('seed_id', 'unknown')}, constraints={len(case_content['constraints'])})"
            )
            total_generated += 1
            next_num += 1

    print(f"\n生成完成，共生成 {total_generated} 个用例。")
    return total_generated


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="根据种子配置批量生成 HarmonyOS 测试用例。")
    parser.add_argument(
        "--clean",
        action="store_true",
        help="生成前删除目标 case 目录中已存在的同编号内容。",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    print("开始生成测试用例...")
    generate_cases(clean=args.clean)


if __name__ == "__main__":
    main()
