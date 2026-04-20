---
name: harmonyos-case-generation
description: 用于根据输入直接生成完整的 HarmonyOS 测试用例产物。支持 `requirement`、`bug_fix`、`full_generation` 等场景。默认目标是理解用户输入并在 `output/test_cases/` 下生成完整用例目录，而不是停留在任何中间文件或中间步骤。
---

# HarmonyOS 用例生成

## 核心原则

- 当用户说“生成 xx 用例”“补一个 xx case”“做一个 xx requirement/bug_fix/full_generation 用例”时，默认理解为直接生成完整用例产物
- 完成标准是：`output/test_cases/<scenario>/` 下生成最终用例目录，并包含最终 `case.yaml`
- 对 `requirement`、`bug_fix` 场景，还应具备正确的 `original_project`
- 对 `full_generation` 场景，不生成 `original_project`
- 不要把任何中间文件、中间 YAML 或中间准备步骤当作任务完成状态
- 如果仓库内部实现需要经过中间步骤，可以自行完成，但不要向用户把这一步表述成主要目标或最终结果

## 流程指南

1. 判断用户要生成的用例场景
   从输入中识别当前更适合 `requirement`、`bug_fix` 还是 `full_generation`。

2. 直接理解输入并完成用例生成
   - `requirement`：基于输入中的工程位置或默认空工程，结合需求生成完整用例
   - `bug_fix`：基于输入中的工程位置或默认空工程，围绕缺陷现象生成完整用例
   - `full_generation`：基于空的元服务工程，从零生成完整工程类用例

3. 检查最终产物
   - 在 `../../output/test_cases/<scenario>/` 下确认最终目录已经生成
   - 对 `requirement`、`bug_fix` 检查 `case.yaml` 和 `original_project`
   - 对 `full_generation` 检查 `case.yaml`，并确认无需生成 `original_project`

4. 仅在最终目录已落到 `output/test_cases/` 时才算完成
   如果只完成了中间准备，但 `output/test_cases/` 下没有最终用例目录，则任务不算完成。

## 场景规范

### requirement

- 字段要求：最终产物中的 `case` 需包含 `id`、`scenario`、`title`、`prompt`、`output_requirements`，并提供 `constraints`
- 工程来源：如果输入中提供了工程位置，则该工程应作为用例的 `original_project`；如果未提供，则默认使用空工程 `../../resources/starter_projects/empty_atomic_project/`
- 产出期望：目标是生成完整用例产物，至少包括 `output/test_cases/.../case.yaml`，并在适用场景下生成或指向正确的 `original_project`
- 选题补充：如果输入中仅有工程位置，没有给出具体需求描述，则应基于该工程当前业务形态自动补出一个合适的 `requirement` 用例，按以下优先级从高到低选择方向：
  1. 履约经营能力开发相关高阶kit场景接入，参考文档：https://developer.huawei.com/consumer/cn/doc/atomic-guides/operations-fulfillment-capability-development
  2. 高阶视效或动画实现
  3. 行业创新功能实现
  4. 高阶组件的使用，如XComponent等，参考文档：https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-development
  5. 基础能力kit中难度较大的kit开发接入，参考文档：https://developer.huawei.com/consumer/cn/doc/atomic-guides/atomic-basic-capability-development
  6. 同行业应用主链路功能对比补齐
- 方向选择原则：需要结合工程当前行业、页面结构、已有主链路和缺失能力做判断，优先选择最贴合现有工程、最容易形成真实增量需求、且最能体现行业代表性的方向，不要脱离工程上下文凭空出题

### bug_fix

- 字段要求：最终产物中的 `case` 需包含 `id`、`scenario`、`title`、`prompt`、`output_requirements`，并提供 `constraints`
- 工程来源：如果输入中提供了工程位置，则该工程应作为用例的 `original_project`
- 缺省处理：如果未提供工程位置，则默认使用空工程；必要时可先补出原始缺陷场景，再生成最终用例
- 产出期望：当前任务目标仍是生成完整用例产物，不要求在此步骤直接修复缺陷，但必须完成 `output/test_cases/...` 下的最终用例生成

### full_generation

- 字段要求：最终产物中的 `case` 需包含 `id`、`scenario`、`title`、`prompt`、`output_requirements`，并提供 `constraints`
- 输入前提：`full_generation` 场景下，输入至少要包含明确的行业信息；如果没有行业信息，则不应直接生成该场景用例
- 工程来源：基于空的元服务工程 `../../resources/starter_projects/empty_atomic_project/` 从零开始全量构建
- `original_project` 规则：该场景无需生成 `original_project`
- 产出期望：要求从空的元服务工程出发完成完整工程生成，并说明新增了哪些文件、主要实现内容及最终效果
- 选题补充：如果输入只给出行业，没有给出更具体的业务方向，则应按 `project_gen` 的思路处理；在当前仓库中，这一要求对应 `full_generation` 场景
- 象限选择原则：先识别该行业现有模板或已覆盖场景分别落在哪个范式象限中，再寻找尚未覆盖的空象限；应优先在空象限中选择一个最有行业代表性的场景新增模板
- 示例：例如美食行业如果“点餐”已经覆盖 C 端消费象限，则后续优先从 B 端商家、骑手履约、门店经营等其他未覆盖象限中选择一个最具代表性的场景生成新模板，而不是继续重复 C 端消费链路

## 通用要求

- `case.id` 必须全局唯一，推荐与文件名或场景编号保持一致
- `case.scenario` 必须是 `requirement`、`bug_fix`、`full_generation` 之一
- `title` 应当简明扼要，能够准确概括该测试用例的核心目的
- `prompt` 应直接描述要完成的业务目标、主链路、关键能力和边界条件
- `keywords` 应包含涉及的 ArkTS 核心 API、组件名称或特性标签
- `template_project` 如果出现在输入中，表示用户提供的工程路径或工程目录位置，不表示模板名；路径可以是相对路径或绝对路径，但必须能被准确解析
- 如果输入中出现工程位置，则生成出的 `original_project` 必须直接指向该工程；此时不要把当前任务扩展为“完成需求”或“修复 bug”
- `full_generation` 场景是例外：即使有其他上下文信息，也应基于空的元服务工程生成，且不产出 `original_project`
- 每个用例至少应包含 1 条 `P0` 级约束和 1 条 `P1` 级约束
- 约束验证优先使用可被 AST 验证的证据
- 如果预期页面或模块很明确，`constraints.rules.target` 要尽量收窄
- `llm` 文本用于解释意图，不能替代结构化规则
- 确保所有引用的相对或绝对文件路径准确无误

## 目录结构

- 用例生成主脚本：`../../case_generation_agent.py`
- 用例输出目录：`../../output/test_cases/`
- 模板工程存放目录：`../../resources/templates/`
- 空白元服务工程目录：`../../resources/starter_projects/empty_atomic_project/`
- 详细字段规范、约束检查清单及产出流程请参考：`references/source-map.md`

## 常用命令

```bash
python ../../case_generation_agent.py --clean
```
