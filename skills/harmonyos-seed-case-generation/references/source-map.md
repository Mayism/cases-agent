# 来源映射

## 规范输入

- `../SKILL.md`
  当前仓库正在使用的 case spec 规范说明，主要用于确认：
  - 场景分类
  - 字段顺序
  - 标题命名
  - 约束写法
  - 示例格式

- `../../resources/templates/`
  用来选择合适的 `template_project`，并理解模板现有业务链路。

## 场景字段清单

### requirement

- `case.id`
- `case.scenario`
- `case.title`
- `case.input`
- `case.template_project`（可选；如果输入中提供了工程位置，则直接作为 `original_project`；缺省时默认使用空工程）
- `case.keywords`
- `case.existing_features`
- `case.new_requirement_scope`
- `case.template_constraints`
- `constraints`

### bug_fix

- `case.id`
- `case.scenario`
- `case.title`
- `case.input`
- `case.template_project`（可选；如果输入中提供了工程位置，则直接作为 `original_project`；缺省时默认使用空工程）
- `case.keywords`
- `constraints`

### full_generation

- `case.id`
- `case.scenario`
- `case.title`
- `case.input`
- `case.keywords`
- `constraints`
- 基于空的元服务工程 `../../resources/starter_projects/empty_atomic_project/` 生成
- 不生成 `original_project`

## 约束检查清单

- 至少包含一条 `P0`
- 至少包含一条 `P1`
- 优先使用可被 AST 验证的证据
- 如果预期页面或模块很明确，`target` 要尽量收窄
- `llm` 文本用于解释意图，不能替代结构化规则

## 产出流程

1. 在 `data/cases/` 下新增或编辑单个 case spec 文件
2. 用 `scripts/validate_case_specs.py` 做结构校验
3. 用 `../../case_generation_agent.py --clean` 生成 test case
4. 检查 `../../output/test_cases/<scenario>/` 下的结果
5. 对 `requirement` 场景，若输入中已指定工程位置，确认生成结果将该工程作为 `original_project`，且当前步骤不要求完成需求实现；如未指定 `template_project`，则 `original_project` 应来自空工程
6. 对 `bug_fix` 场景，若输入中已指定工程位置，确认生成结果将该工程作为 `original_project`，且当前步骤不要求直接修复缺陷；如未指定 `template_project`，则 `original_project` 应来自空工程或由 case spec 补充原始缺陷场景说明
7. 对 `full_generation` 场景，确认生成结果基于空的元服务工程构建，且最终产物中不包含 `original_project`
