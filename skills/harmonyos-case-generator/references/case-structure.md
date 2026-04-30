# Case Structure

## Scenario Mapping

- `full_generation`: 全新开发、从零实现、生成完整产品能力
- `requirement`: 增量开发、新增功能、在现有工程基础上接入 kit 或扩展业务链路
- `bug_fix`: 问题修复、缺陷复现与修复、异常行为纠正

## Output Layout

### `full_generation`

```text
data/cases/full_generation/<case_id>/
├─ case.yaml
└─ prd/
   └─ 产品需求文档.md
```

未提供工程时，会先进入方向推荐阶段：

```text
data/cases/full_generation/<case_id>/
└─ recommendations/
   └─ 产品方向推荐.md
```

### `requirement`

```text
data/cases/requirement/<case_id>/
├─ case.yaml
└─ original_project/
   ├─ original_project.zip
   └─ ...
```

### `bug_fix`

```text
data/cases/bug_fix/<case_id>/
├─ case.yaml
└─ original_project/
   ├─ original_project.zip
   └─ ...
```

## Required Fields

```yaml
case:
  id: requirement_demo_case
  scenario: requirement
  title: 示例标题
  prompt: 任务描述或 PRD
constraints:
  - id: EXP-MUST-01
    name: 关键约束
    priority: P0
    rules:
      - target: "**/*.ets"
        ast:
          - type: call
            name: SomeAbility
        llm: 语义补充说明
```

## Good Prompt Characteristics

- 写清业务目标
- 写清主交互链路
- 写清异常或降级逻辑
- 写清技术边界
- 写清组件拆分和 kit 接入要求

## Constraint Guidance

- `id` 使用 `EXP-MUST-01` / `EXP-SHOULD-01` 格式
- `priority` 只允许两个级别：`P0`、`P1`
- `P0` 对应 `MUST`，因此 id 必须使用 `EXP-MUST-XX`
- `P1` 对应 `SHOULD`，因此 id 必须使用 `EXP-SHOULD-XX`
- `P0`: 核心主链路、关键能力接入、不可缺失的结构
- `P1`: 状态处理、异常兜底、配置补全、交互完整性

优先写真实代码证据：

- `MapComponent`
- `requestPermissionsFromUser`
- `getCurrentLocation`
- `PaymentKit`
- `router.pushUrl`
- `Navigation`
- `@ObservedV2`
- `@Trace`

避免只有空泛表达：

- “体验完整”
- “页面更合理”
- “交互更自然”
