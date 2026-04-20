import argparse
from pathlib import Path
import sys

import yaml


ALLOWED_SCENARIOS = {"requirement", "bug_fix", "full_generation"}

COMMON_REQUIRED = {"id", "scenario", "title", "input", "keywords"}
SCENARIO_REQUIRED = {
    "requirement": {"existing_features", "new_requirement_scope", "template_constraints"},
    "bug_fix": set(),
    "full_generation": set(),
}


def ensure(condition: bool, message: str, errors: list[str]) -> None:
    if not condition:
        errors.append(message)


def validate_constraint(case_id: str, constraint: dict, index: int, errors: list[str]) -> None:
    prefix = f"{case_id}.constraints[{index}]"
    ensure(isinstance(constraint, dict), f"{prefix} must be a mapping", errors)
    if not isinstance(constraint, dict):
        return

    ensure(bool(constraint.get("name")), f"{prefix}.name is required", errors)
    ensure(constraint.get("priority") in {"P0", "P1", "P2"}, f"{prefix}.priority must be P0/P1/P2", errors)
    rules = constraint.get("rules")
    ensure(isinstance(rules, list) and bool(rules), f"{prefix}.rules must be a non-empty list", errors)
    if not isinstance(rules, list):
        return

    for rule_index, rule in enumerate(rules):
        rule_prefix = f"{prefix}.rules[{rule_index}]"
        ensure(isinstance(rule, dict), f"{rule_prefix} must be a mapping", errors)
        if not isinstance(rule, dict):
            continue
        ensure(bool(rule.get("target")), f"{rule_prefix}.target is required", errors)
        ensure(
            bool(rule.get("ast")) or bool(rule.get("llm")),
            f"{rule_prefix} must provide ast or llm",
            errors,
        )


def validate_case_spec(path: Path) -> list[str]:
    errors: list[str] = []
    if not path.exists():
        return [f"File not found: {path}"]

    with path.open("r", encoding="utf-8") as file:
        data = yaml.safe_load(file) or {}

    ensure(isinstance(data, dict), f"{path}: top-level YAML must be a mapping", errors)
    if not isinstance(data, dict):
        return errors

    case_meta = data.get("case")
    ensure(isinstance(case_meta, dict), f"{path}: top-level 'case' must be a mapping", errors)
    if not isinstance(case_meta, dict):
        return errors

    case_id = case_meta.get("id", str(path))
    scenario = case_meta.get("scenario")
    ensure(scenario in ALLOWED_SCENARIOS, f"{case_id}.scenario must be one of {sorted(ALLOWED_SCENARIOS)}", errors)
    if scenario not in ALLOWED_SCENARIOS:
        return errors

    required_keys = COMMON_REQUIRED | SCENARIO_REQUIRED[scenario]
    missing = sorted(key for key in required_keys if not case_meta.get(key))
    if missing:
        errors.append(f"{case_id} missing required case fields: {', '.join(missing)}")

    ensure(isinstance(case_meta.get("keywords"), list), f"{case_id}.case.keywords must be a list", errors)

    constraints = data.get("constraints")
    ensure(isinstance(constraints, list), f"{case_id}.constraints must be a list", errors)
    if isinstance(constraints, list):
        priorities = {item.get("priority") for item in constraints if isinstance(item, dict)}
        ensure("P0" in priorities, f"{case_id} must contain at least one P0 constraint", errors)
        ensure("P1" in priorities, f"{case_id} must contain at least one P1 constraint", errors)
        for constraint_index, constraint in enumerate(constraints):
            validate_constraint(case_id, constraint, constraint_index, errors)

    return errors


def validate_path(path: Path) -> list[str]:
    if path.is_file():
        return validate_case_spec(path)

    if not path.is_dir():
        return [f"Path not found: {path}"]

    errors: list[str] = []
    spec_files = sorted(path.rglob("*.yaml"))
    if not spec_files:
        return [f"No YAML case specs found under: {path}"]

    for spec_file in spec_files:
        errors.extend(validate_case_spec(spec_file))
    return errors


def main() -> None:
    parser = argparse.ArgumentParser(description="Validate HarmonyOS case spec structure.")
    parser.add_argument("path", help="Path to a case spec YAML file or directory.")
    args = parser.parse_args()

    path = Path(args.path).resolve()
    errors = validate_path(path)
    if errors:
        print("Case spec validation failed:")
        for error in errors:
            print(f"- {error}")
        sys.exit(1)

    print(f"Case spec validation passed: {path}")


if __name__ == "__main__":
    main()
