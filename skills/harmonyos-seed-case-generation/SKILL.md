---
name: harmonyos-seed-case-generation
description: 用于根据不同场景生成 YAML 格式的 HarmonyOS 测试用例 spec。支持 `requirement`、`bug_fix`、`full_generation` 等场景。生成的 spec 将提供给 `case_generation_agent.py` 解析，并输出到 `output/test_cases/`。
---

# HarmonyOS 种子用例生成

## 流程指南

1. 确定需要生成的场景类型
   明确当前需要生成的测试目标。

2. 针对不同场景采取对应策略
   - `requirement`：基于输入中指定的 `template_project`（工程位置）或默认空工程，结合输入需求生成 case spec；如果输入中已给出工程位置，则该工程就是用例的 `original_project`，当前步骤不需要完成需求实现。
   - `bug_fix`：基于输入中指定的 `template_project`（工程位置）或默认空工程生成 case spec；如果输入中已给出工程位置，则该工程就是用例的 `original_project`，当前步骤不需要直接修复缺陷。
   - `full_generation`：基于空的元服务工程生成完整用例；该场景不依赖输入工程位置，也不需要生成 `original_project`。

3. 打印并获取 YAML 模板
   - 运行 `python ../../skills/harmonyos-seed-case-generation/scripts/print_case_template.py <scenario>`
   - 获取生成的 case spec 模板并检查内容结构。

4. 完善并填写 case spec
   根据具体业务逻辑和测试需求，完善 `data/cases/` 下的单个 YAML 文件。

5. 验证 case spec
   - 运行 `python ../../skills/harmonyos-seed-case-generation/scripts/validate_case_specs.py <文件路径或目录>`

6. 执行生成主流程以获取 test case
   - 运行 `python ../../case_generation_agent.py --clean`
   - 在 `../../output/test_cases/<scenario>/` 目录下检查最终生成的用例目录；对 `requirement`、`bug_fix` 检查 `case.yaml` 和 `original_project` 来源，对 `full_generation` 确认无需生成 `original_project`。

## 场景规范

### requirement

- 字段要求：`case` 中需包含 `id`、`scenario`、`title`、`input`、`keywords`、`existing_features`、`new_requirement_scope`、`template_constraints`，并提供 `constraints`
- `template_project` 含义：表示输入中指定的现有工程位置，用于生成 `original_project`，不是模板名称
- 缺省处理：如果未指定 `template_project`，将默认使用空工程 `../../resources/starter_projects/empty_atomic_project/` 作为 `original_project`
- 产出期望：如果输入中已给出工程位置，则用该工程直接作为 `original_project`；当前任务只需生成合法的 case spec 和用例产物，不要求在此步骤完成需求实现

### bug_fix

- 字段要求：`case` 中需包含 `id`、`scenario`、`title`、`input`、`keywords`，可选包含 `problem_statement`、`fix_targets`，并提供 `constraints`
- `template_project` 含义：表示输入中指定的待修复工程位置，代理应基于该工程生成 `original_project`
- 缺省处理：如果指定了 `template_project`，则直接将该工程作为 `original_project`；如果未指定，默认使用空工程，必要时仅在 case spec 中补充原始缺陷场景说明
- 产出期望：如果输入中已给出工程位置，则当前任务只需生成合法的 case spec 和用例产物，不要求在此步骤直接修复缺陷

### full_generation

- 字段要求：`case` 中需包含 `id`、`scenario`、`title`、`input`、`keywords`，并提供 `constraints`
- 工程来源：基于空的元服务工程 `../../resources/starter_projects/empty_atomic_project/` 从零开始全量构建，通常无需指定 `template_project`
- `original_project` 规则：该场景无需生成 `original_project`
- 产出期望：要求从空的元服务工程出发完成完整工程生成，并说明新增了哪些文件、主要实现内容及最终效果

## 通用要求

- `case.id` 必须全局唯一，推荐与文件名保持一致
- `case.scenario` 必须是 `requirement`、`bug_fix`、`full_generation` 之一
- `title` 应当简明扼要，能够准确概括该测试用例的核心目的
- `keywords` 应包含涉及的 ArkTS 核心 API、组件名称或特性标签
- `template_project` 如果出现在输入中，表示用户提供的工程路径或工程目录位置，不表示模板名；路径可以是相对路径或绝对路径，但必须能被准确解析
- 如果输入中出现工程位置，则生成出的 `original_project` 必须直接指向该工程；此时不要把当前任务扩展为“完成需求”或“修复 bug”
- `full_generation` 场景是例外：即使有其他上下文信息，也应基于空的元服务工程生成，且不产出 `original_project`
- 每个 case spec 至少应包含 1 条 `P0` 级约束和 1 条 `P1` 级约束
- 约束验证优先使用可被 AST 验证的证据
- 如果预期页面或模块很明确，`constraints.rules.target` 要尽量收窄
- `llm` 文本用于解释意图，不能替代结构化规则
- 确保所有引用的相对或绝对文件路径准确无误

## 目录结构

- case spec 存放目录：`../../data/cases/`
- 核心工作流脚本：`../../skills/harmonyos-seed-case-generation/scripts/`
- 用例生成主脚本：`../../case_generation_agent.py`
- 用例输出目录：`../../output/test_cases/`
- 模板工程存放目录：`../../resources/templates/`
- 空白元服务工程目录：`../../resources/starter_projects/empty_atomic_project/`

## 常用命令

```bash
python ../../skills/harmonyos-seed-case-generation/scripts/print_case_template.py bug_fix
python ../../skills/harmonyos-seed-case-generation/scripts/validate_case_specs.py ../../data/cases
python ../../case_generation_agent.py --clean
python ../../case_generation_agent.py --spec ../../data/cases/bug_fix/bug_fix_arkui_list_refresh_353.yaml
```

## 参考文档

- 详细字段规范、约束检查清单及产出流程请参考：`references/source-map.md`
