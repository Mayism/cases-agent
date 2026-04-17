---
name: harmonyos-seed-case-generation
description: 用于根据不同场景生成 YAML 格式的 HarmonyOS 测试种子用例。支持 `requirement`、`bug_fix`、`full_generation` 等生成场景。可结合 FAQ 指南生成 `requirement` 场景。生成的用例将提供给 `case_generation_agent.py` 进行解析，并输出到 `output/test_cases/`。
---

# HarmonyOS 种子用例生成

## 流程指南

1. 确定需要生成的场景类型
   明确当前需要生成的测试目标
   准备对应的 seed 模板以便开始生成

2. 针对不同场景采取对应策略
   - `requirement`：基于指定的 `template_project` 或默认空工程，结合输入需求生成用例
   - `bug_fix`：基于指定的 `template_project` 修复缺陷，或在默认空工程中先构造缺陷场景再进行修复
   - `full_generation`：全量从头生成完整工程代码，不依赖 `template_project`

3. 准备相关依赖和前置条件
   - 确保本地已具备相应的 seed 模板

4. 打印并获取 YAML 种子模板
   - 运行 `python ../../skills/harmonyos-seed-case-generation/scripts/print_seed_template.py <scenario>`
   - 获取生成的 seed 模板并检查内容结构

5. 完善并填写种子内容
   根据具体的业务逻辑和测试需求，完善生成的 seed 细节

6. 验证生成的种子文件
   - 运行 `python ../../skills/harmonyos-seed-case-generation/scripts/validate_seed_catalogs.py <文件路径>`

7. 执行生成主流程以获取 test case
   - 运行 `python ../../case_generation_agent.py --clean`
   - 在 `../../output/test_cases/<scenario>/` 目录下检查最终生成的代码

## 场景规范

### requirement (需求生成)

- 字段要求：需包含 `input`、`keywords`、`existing_features`、`new_requirement_scope`、`template_constraints` 和 `constraints` 等
- 模板缺省处理：如果未指定 `template_project`，将默认使用空工程 `../../resources/starter_projects/empty_hos_project/` 作为 `original_project`
- 产出期望：要求基于 `original_project` 完成需求实现，保留现有首页，并说明新增页面、组件和导航链路

### bug_fix (缺陷修复)

- 字段要求：需包含 `input`、`keywords`、`problem_statement`（可选）、`fix_targets`（可选）和 `constraints` 等
- 模板缺省处理：如果有模板则直接修复；如果未指定 `template_project`，代理将要求先在 `original_project` 中构造可复现缺陷的原始场景和代码，再完成修复
- 产出期望：需明确说明（场景构造方式）、根因、修复点和修改文件

### full_generation (全量生成)

- 字段要求：需包含 `input`、`keywords` 和 `constraints` 等
- 模板处理：无需指定 `template_project`，代码结构、UI 界面和业务逻辑均需从零开始全量构建
- 产出期望：要求从零完成完整工程生成，并说明新增了哪些文件、主要实现内容及最终效果

## 通用要求

- `seed_id` 必须保证全局唯一
- `title` 应当简明扼要，能够准确概括该测试用例的核心目的
- `keywords` 应包含涉及的 ArkTS 核心 API、组件名称或特性标签
- 每个 seed 文件中至少应包含 1 个 `P0` 级别用例和 1 个 `P1` 级别用例
- 约束验证：优先使用可被 AST 验证的证据
- 目标收窄：如果预期页面或模块很明确，`constraints` 规则中的 `target` 要尽量收窄
- 意图与规则：`llm` 文本用于解释意图，不能替代结构化规则
- 确保所有引用的相对或绝对文件路径准确无误，若涉及代码重构，须确保 LLM 能够准确理解变更

## 目录结构

- 核心工作流脚本：`../../skills/harmonyos-seed-case-generation/scripts/`
- 用例生成主代理脚本：`../../case_generation_agent.py`
- 用例输出目录：`../../output/test_cases/`
- 模板工程存放目录：`../../resources/templates/`
- 空白初始化工程目录：`../../resources/starter_projects/empty_hos_project/`
- FAQ 文档参考目录：`../../docs/FAQ/`

## 常用命令

```bash
python ../../skills/harmonyos-seed-case-generation/scripts/print_seed_template.py requirement
python ../../skills/harmonyos-seed-case-generation/scripts/validate_seed_catalogs.py <文件路径>
python ../../case_generation_agent.py --clean
```

## 参考文档

- 详细的场景字段规范、约束检查清单及产出流程请参阅：`references/source-map.md`
