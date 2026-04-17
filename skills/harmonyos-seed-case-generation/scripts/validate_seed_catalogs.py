import argparse
from pathlib import Path
import sys

import yaml


ALLOWED_SCENARIOS = {"requirement", "bug_fix", "full_generation"}

COMMON_REQUIRED = {"seed_id", "title", "input", "keywords", "template", "constraints"}
SCENARIO_REQUIRED = {
    "requirement": {"existing_features", "new_requirement_scope", "template_constraints"},
    "bug_fix": set(),
    "full_generation": set(),
}


def ensure(condition: bool, message: str, errors: list[str]) -> None:
    if not condition:
        errors.append(message)


def validate_constraint(scenario: str, seed_id: str, constraint: dict, index: int, errors: list[str]) -> None:
    prefix = f"{scenario}.{seed_id}.constraints[{index}]"
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


def validate_seed(scenario: str, seed: dict, index: int, errors: list[str]) -> None:
    prefix = f"{scenario}[{index}]"
    ensure(isinstance(seed, dict), f"{prefix} must be a mapping", errors)
    if not isinstance(seed, dict):
        return

    required_keys = COMMON_REQUIRED | SCENARIO_REQUIRED[scenario]
    missing = sorted(key for key in required_keys if not seed.get(key))
    if missing:
        errors.append(f"{prefix} missing required fields: {', '.join(missing)}")

    seed_id = seed.get("seed_id", prefix)
    ensure(isinstance(seed.get("keywords"), list), f"{prefix}.keywords must be a list", errors)
    ensure(isinstance(seed.get("constraints"), list), f"{prefix}.constraints must be a list", errors)

    template = seed.get("template")
    ensure(isinstance(template, dict), f"{prefix}.template must be a mapping", errors)
    if isinstance(template, dict):
        for key in ("name", "industry", "app_type"):
            ensure(bool(template.get(key)), f"{prefix}.template.{key} is required", errors)

    constraints = seed.get("constraints") or []
    if isinstance(constraints, list):
        priorities = {item.get("priority") for item in constraints if isinstance(item, dict)}
        ensure("P0" in priorities, f"{prefix} must contain at least one P0 constraint", errors)
        ensure("P1" in priorities, f"{prefix} must contain at least one P1 constraint", errors)
        for constraint_index, constraint in enumerate(constraints):
            validate_constraint(scenario, seed_id, constraint, constraint_index, errors)


def validate_file(path: Path) -> list[str]:
    errors: list[str] = []
    if not path.exists():
        return [f"File not found: {path}"]

    with path.open("r", encoding="utf-8") as file:
        data = yaml.safe_load(file) or {}

    ensure(isinstance(data, dict), "Top-level YAML must be a mapping", errors)
    if not isinstance(data, dict):
        return errors

    actual_scenarios = set(data.keys())
    ensure(actual_scenarios <= ALLOWED_SCENARIOS, f"Unexpected scenarios: {sorted(actual_scenarios - ALLOWED_SCENARIOS)}", errors)

    for scenario in sorted(ALLOWED_SCENARIOS):
        if scenario not in data:
            continue
        seeds = data[scenario]
        ensure(isinstance(seeds, list), f"{scenario} must be a list", errors)
        if not isinstance(seeds, list):
            continue
        for index, seed in enumerate(seeds):
            validate_seed(scenario, seed, index, errors)

    return errors


def main() -> None:
    parser = argparse.ArgumentParser(description="Validate HarmonyOS seed catalogs structure.")
    parser.add_argument("path", help="Path to the seed catalog YAML file.")
    args = parser.parse_args()

    path = Path(args.path).resolve()
    errors = validate_file(path)
    if errors:
        print("Seed catalog validation failed:")
        for error in errors:
            print(f"- {error}")
        sys.exit(1)

    print(f"Seed catalog validation passed: {path}")


if __name__ == "__main__":
    main()
