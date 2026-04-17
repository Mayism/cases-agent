# 来源映射

## 规范输入

- 当前仓库正在使用的种子配置文件
  它是主规范来源，主要用于确认：
  - 场景分类
  - 字段顺序
  - 标题命名
  - 约束写法
  - 示例范式

- `../../resources/templates/`
  用来选择合适的 `template_project`，并理解模板现有业务链路。

## 场景字段清单

### requirement

- `seed_id`
- `title`
- `input`
- `template_project`（可选；缺省时默认使用空工程作为 `original_project`）
- `keywords`
- `template`
- `existing_features`
- `new_requirement_scope`
- `template_constraints`
- `starter_kind`
- `constraints`

### bug_fix

- `seed_id`
- `title`
- `input`
- `template_project`（可选；有模板时作为 `original_project`，无模板时先在 `original_project` 中构造原始缺陷场景）
- `keywords`
- `template`
- `problem_statement`（可选）
- `fix_targets`（可选）
- `constraints`
- `starter_kind`

### full_generation

- `seed_id`
- `title`
- `input`
- `keywords`
- `template`
- `constraints`

## 约束检查清单

- 至少包含一条 `P0`
- 至少包含一条 `P1`
- 优先使用可被 AST 验证的证据
- 如果预期页面或模块很明确，`target` 要尽量收窄
- `llm` 文本用于解释意图，不能替代结构化规则

## 产出流程

1. 编辑当前种子配置文件
2. 用 `scripts/validate_seed_catalogs.py` 做结构校验
3. 用 `../../case_generation_agent.py --clean` 生成 test case
4. 检查 `../../output/test_cases/<scenario>/` 下的结果
5. 对 `requirement` 场景，确认生成结果明确要求基于 `original_project` 实现；如果未指定 `template_project`，则 `original_project` 应来自空工程
6. 对 `bug_fix` 场景，确认仅凭 `input` 也能完成结构校验，且生成结果明确要求基于 `original_project` 修复；如果未指定 `template_project`，提示语应要求先在 `original_project` 中构造原始缺陷场景与代码
