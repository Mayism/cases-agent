---
name: harmonyos-case-generator
description: 根据用户请求、工程路径、行业信息或出题方向意图生成 HarmonyOS 评测用例目录。Agent 需要识别任务属于 full_generation、requirement 还是 bug_fix，分析 HarmonyOS 工程与 README.md，或先为 requirement / bug_fix 场景输出可选择的出题方向表时使用此 skill。对于 full_generation，有参考工程时生成以产品需求文档为 prompt 的 case.yaml 和 prd/产品需求文档.md；无参考工程时先基于行业信息生成 2 个推荐方向。对于 requirement 和 bug_fix，如果用户只是要出题方向，则先按业务以表格输出方向和用例构造方式，待用户确认后再生成；正式生成时复制给定工程为 original_project，并同时输出 original_project、按 `.gitignore` 过滤后的 original_project.zip 与 case.yaml。生成的 constraints 仅允许 P0/P1，id 使用 EXP-MUST-XX / EXP-SHOULD-XX。
---

# HarmonyOS 用例生成 Skill

使用这个 skill，可以把“自然语言需求 + HarmonyOS 工程路径”转换成可直接落盘的评测用例目录。

## 工作流程

1. 解析用户请求，提取以下信息：
   - 场景类型：`full_generation`、`requirement` 或 `bug_fix`
   - 工程路径
   - 可选的用例标题、行业信息或领域关键词
   - 是否是在请求“出题方向 / 测试方向 / 用例方向”，而不是直接生成用例
2. 如识别到场景是 `requirement` 或 `bug_fix`，且用户请求的是出题方向：
   - 先结合业务场景和下方“出题方向推荐规则”输出方向表格
   - 只给方向，不生成 `case.yaml`，不复制工程，不打包 zip
   - 明确提示用户从表格中选择一个方向后，再继续生成用例
   - 用户确认方向后，再进入后续生成流程
3. 优先运行 `scripts/generate_case_bundle.py`。这个脚本会：
   - 在未显式指定时自动识别场景
   - 扫描工程结构、ArkTS 文件和 `README.md`
   - 生成一个可用的 `case.yaml`
   - 在 `requirement` 和 `bug_fix` 场景下复制 `original_project`
   - 在 `requirement` 和 `bug_fix` 场景下，基于复制后的工程按 `.gitignore` 打包 zip，并放在工程根目录
4. 对生成后的 `case.yaml` 进行复核和增强：
   - 收紧 `title`，避免空泛
   - 让 `prompt` 成为完整业务闭环描述
   - 确保 `constraints` 至少包含有意义的 `P0` 和 `P1`
   - 优先使用具体 AST 证据，而不是只有模糊的 `llm` 描述

## 场景规则

### `full_generation`

- 将给定工程视为参考工程，而不是 `original_project`
- 读取代码和 `README.md`
- 生成中文产品需求文档，并写入 `case.prompt`
- 同时将中间态产品需求文档输出到：
  - `data/cases/full_generation/<case_id>/prd/产品需求文档.md`
- 产品需求文档必须包含：
  - 业务功能
  - 交互逻辑
  - UX 原型交互（文字形式表达）
  - 技术约束
  - 组件拆分要求
  - kit能力接入要求
- 最终输出：
  - `data/cases/full_generation/<case_id>/case.yaml`
  - `data/cases/full_generation/<case_id>/prd/产品需求文档.md`

### `requirement`

- 如果用户只是要求给出出题方向：
  - 不生成用例产物
  - 按“增量需求出题方向表”输出候选方向
  - 等用户确认表格中的方向后，再生成 `case.yaml` 和 `original_project`
- 将给定路径视为 `original_project`
- 将工程复制到：
  - `data/cases/requirement/<case_id>/original_project`
- 复制完成后，在 `original_project` 根目录下基于 `.gitignore` 打包：
  - `data/cases/requirement/<case_id>/original_project/original_project.zip`
- 生成：
  - `data/cases/requirement/<case_id>/case.yaml`
- 用例内容应描述增量需求，不要写成从零搭建完整工程

### `bug_fix`

- 如果用户只是要求给出出题方向：
  - 不生成用例产物
  - 按“问题修复出题方向表”输出候选方向
  - 等用户确认表格中的方向后，再生成 `case.yaml` 和 `original_project`
- 将给定路径视为 `original_project`
- 将工程复制到：
  - `data/cases/bug_fix/<case_id>/original_project`
- 复制完成后，在 `original_project` 根目录下基于 `.gitignore` 打包：
  - `data/cases/bug_fix/<case_id>/original_project/original_project.zip`
- 生成：
  - `data/cases/bug_fix/<case_id>/case.yaml`
- 用例内容应描述复现与修复目标、根因方向和不可破坏链路

## 出题方向推荐规则

当用户要求“给出题方向”“设计测试方向”“先给用例方向”“看看哪些点能测插件增强效果”时，如果场景属于 `requirement` 或 `bug_fix`，必须先输出表格，不要直接生成用例。

### 增量需求出题方向表

表格列建议为：

- `编号`
- `方向来源`
- `出题方向`
- `业务方向示例`
- `用例构造方式（改哪些文件）`
- `主要考察点`
- `容易暴露的问题`

推荐顺序必须按以下三类组织：

1. 当前工程已有功能剥离
   - 优先扫描当前工程和 README，识别已有功能中涉及 HarmonyOS Kit 集成、高阶组件使用、高阶动画、创新场景的能力。
   - 提示用户：这些能力可以从当前功能中剥离出来，形成增量需求用例。
   - 适合的方向包括：地图/定位/支付/账号/扫码/分享/文件/通知等 Kit 能力，`Navigation`、复杂 `List`、`LazyForEach`、自定义弹窗、复杂表单、高阶动画、跨端协同、智能推荐等。
   - 表格中的 `方向来源` 写为 `当前工程已有功能剥离`。
   - `主要考察点` 要强调：是否理解原工程结构、是否沿用现有路由/组件/ViewModel、是否最小增量接入、是否保护原有主链路。

2. 同类应用能力剥离
   - 结合当前工程所属行业、业务形态或模板类型，补充同类应用中常见但当前工程未必已有的能力。
   - 提示用户：这些能力可以从同类应用中抽象出来，作为当前工程的新增需求用例。
   - 这类用例生成时，不要写成纯粹依赖原工程的大改造；需求描述应参考 `full_generation` 的 PRD 写法进行简化，形成轻量需求文档。
   - 轻量需求文档至少包含：业务目标、核心功能、主交互链路、异常/降级逻辑、组件拆分建议、Kit/高阶组件/动画接入点。
   - 表格中的 `方向来源` 写为 `同类应用能力剥离`。
   - `主要考察点` 要强调：模型能否把同类应用能力迁移到当前业务、能否生成业务闭环、能否补齐技术约束，而不是只写静态页面。

3. 插件不足补充方向
   - 如果前两类方向不足，或用户明确想找插件没有提升的点，再结合当前插件不足生成补充方向。
   - 表格中的 `方向来源` 写为 `插件不足补充`。
   - 优先覆盖以下薄弱点：
     - 既有架构理解：是否先读懂页面、组件、ViewModel、路由、公共模块；容易暴露新增孤岛页面、自创目录结构、不接主链路。
     - 既有路由接入：是否正确接入 `Navigation`、`NavPathStack`、路由表、入口页；容易暴露页面进不去、参数传递错、返回链路异常。
     - ViewModel 状态接入：是否沿用现有状态管理方式；容易暴露状态分散、UI 不刷新、业务逻辑塞进 `build()`。
     - 多模块工程接入：是否正确处理 HAR/HSP/entry 间依赖、import、共享类型；容易暴露 import 错、模块边界乱、跨模块硬引用。
     - 公共组件复用：是否复用项目已有 Header、Button、Card、Empty、Loading 等；容易暴露样式割裂、重复造组件、交互不一致。
     - 资源与主题一致性：是否使用现有 `color.json`、`string.json`、spacing/font 资源；容易暴露硬编码颜色、文案、尺寸。
     - 异步与加载态：是否处理请求中、成功、失败、空数据、重试；容易暴露只有 happy path。
     - 数据模型扩展：是否在现有 model/types 基础上扩展字段和接口；容易暴露类型重复、字段不一致、mock 和 UI 脱节。
     - 编译可行性：import、装饰器、资源引用、API 使用是否可编译；容易暴露语法像鸿蒙但过不了 hvigor。

输出建议：

- 优先给 6-10 个方向。
- 如果用户给了工程路径，必须尽量结合工程中的真实页面、README、模块名、Kit 能力或业务功能来写业务方向示例。
- 如果用户给了工程路径，`用例构造方式（改哪些文件）` 必须写清楚建议基于哪些真实文件或目录构造用例，例如页面文件、组件文件、ViewModel、model/types、路由表、`module.json5`、资源文件、mock 数据等。
- 对 `当前工程已有功能剥离` 方向，构造方式应说明如何从已有页面/组件/能力中剥离出一个可独立验证的增量需求。
- 对 `同类应用能力剥离` 方向，构造方式应说明需要在当前工程新增或接入哪些页面、组件、ViewModel、配置和资源，并提示后续生成简化版 PRD。
- 对 `插件不足补充` 方向，构造方式应说明如何通过修改工程中的具体链路放大插件薄弱点，例如路由接入、跨模块 import、状态管理、资源引用或异步加载。
- 如果用户没有给工程路径，但给了行业或业务类型，可以只输出同类应用能力剥离和插件不足补充方向。
- 如果用户选中 `同类应用能力剥离` 方向，后续生成 `case.prompt` 时应采用简化版 PRD，而不是一句增量描述。

### 问题修复出题方向表

表格列建议为：

- `编号`
- `难度层级`
- `出题方向`
- `业务问题示例`
- `用例构造方式（改哪些文件）`
- `主要考察点`
- `容易暴露的问题`

问题修复方向要比普通“编译报错 / 单页面 UI 异常”更难一些，优先设计成复合型缺陷：表面现象在页面，根因可能在 ViewModel、数据源、路由、生命周期、权限配置或异步链路中。

优先从以下高难方向中结合用户行业、模板工程或业务关键词选择 6-10 个方向：

- 状态链路深层失效：页面展示异常，但根因在 `@ObservedV2` / `@Trace` 标注、嵌套对象、数组替换、ViewModel 暴露方式或组件参数传递；考察能否定位到状态追踪链路，而不是只刷新 UI。
- 列表渲染与数据源不一致：`ForEach` / `LazyForEach` 的 key、数据源复用、分页追加、筛选重排、局部刷新交织；考察是否能修复稳定渲染，同时保持分页、筛选、搜索等原功能。
- 跨页面路由状态污染：从列表进入详情、编辑后返回、再次进入其他详情时出现旧数据、筛选丢失或导航栈错乱；考察路由参数、页面生命周期、缓存状态和返回态恢复。
- 异步竞态与旧响应覆盖：快速切换 Tab、连续搜索、切换筛选条件、重复进入页面后，旧请求覆盖新数据；考察请求令牌、结果归属、loading 状态和取消/忽略旧响应策略。
- 权限/Kit 失败链路缺陷：定位、相机、扫码、账号、支付、分享等 Kit 在拒权、未开通、配置缺失、调用失败时导致页面卡死或状态错误；考察权限声明、运行时申请、失败兜底和用户可继续操作路径。
- 多模块依赖与配置错位：问题表现为页面不可达、能力不可用或运行异常，根因在 HAR/HSP/entry 依赖、路由表、`module.json5`、资源路径或 export 配置；考察跨模块定位和最小配置修复。
- 复杂表单状态回滚：多步骤表单、预约、支付确认、地址选择等流程中，返回、取消、重试、失败后字段错乱或按钮状态错误；考察表单状态机、防重复提交、错误清理和恢复逻辑。
- 生命周期与资源释放问题：页面反复进入后重复订阅、重复请求、计时器未释放、弹窗残留、返回后仍更新已销毁页面；考察生命周期回收、订阅解绑和副作用边界。
- 缓存与本地存储一致性：本地缓存、Preferences、Storage 或 mock 数据更新后 UI 未同步，或者离线/重新进入后展示旧状态；考察缓存更新策略、状态同步和降级逻辑。
- 高阶动画/手势状态异常：一镜到底、滑动吸顶、拖拽排序、手势切换等高阶交互在快速操作或数据变化后状态错乱；考察动画状态、布局测量、手势冲突和数据同步。
- 回归保护型修复：修复一个缺陷时必须保留已有搜索、筛选、分页、详情跳转、权限降级等相邻链路；考察最小侵入、相邻功能验证和避免无关重构。
- 误导性根因题：缺陷表面像 UI 样式、网络慢或组件 bug，但真实原因在参数传递、状态共享、权限配置或数据模型字段映射；考察是否能通过代码证据定位，而不是凭现象猜修。

输出建议：

- 每个方向都应包含明确的业务问题示例，例如“快速切换景区筛选后地图标记显示上一组数据”“拒绝定位权限后导览首页一直 loading”“从订单详情返回后列表筛选和总价状态错乱”。
- 如果用户给了工程路径，`用例构造方式（改哪些文件）` 必须写清楚建议在哪些真实文件或目录中埋入缺陷，以及期望修复时应关注哪些文件，例如页面文件、组件文件、ViewModel、model/types、路由表、`module.json5`、资源文件、mock 数据、网络/缓存封装等。
- 构造方式要说明“如何制造缺陷”和“修复时不应破坏哪些原链路”，例如在 ViewModel 中漏加 `@Trace`、在路由参数中复用旧对象、在请求回调中不校验当前筛选条件、在权限失败分支中不更新 loading 状态。
- `难度层级` 建议使用 `中高` 或 `高`，不要输出太基础的编译修复题。
- `主要考察点` 至少覆盖两类能力，例如“状态追踪 + 路由返回态”“权限失败 + 降级交互”“异步竞态 + loading 状态”。
- `容易暴露的问题` 要强调插件可能只改表面、过度重构、漏配置、破坏原链路、没有验证方式。

## Case 编写规则

- 最终产物写成标准 `case.yaml`，不要写成输入 spec 风格
- 必填字段包括：
  - `case.id`
  - `case.scenario`
  - `case.title`
  - `case.prompt`
  - `constraints`
- `constraints[*].id` 使用 `EXP-MUST-01` / `EXP-SHOULD-01` 格式
- `constraints[*].priority` 只允许两个级别：`P0` 和 `P1`
- `P0` 对应 `MUST`，因此 `P0` 约束的 id 必须写成 `EXP-MUST-XX`
- `P1` 对应 `SHOULD`，因此 `P1` 约束的 id 必须写成 `EXP-SHOULD-XX`
- `prompt` 要具体，不要写成口号
- 至少保证：
  - 1 条 `P0` 约束
  - 1 条 `P1` 约束
- 合适时优先使用以下 AST 类型：
  - `call`
  - `import`
  - `decorator`
  - `property`
  - `method`
  - `navigation`
  - `navigation_with_params`
- `llm` 用于补充语义，不要完全依赖 `llm`

## 命令

在仓库根目录执行：

```bash
python skills/harmonyos-case-generator/scripts/generate_case_bundle.py --project-path <path> --request "<user_request>"
```

可选参数示例：

```bash
python skills/harmonyos-case-generator/scripts/generate_case_bundle.py --project-path <path> --request "<user_request>" --scenario requirement --case-id requirement_demo_case
```

## 复核清单

- `scenario` 是否与用户意图一致？
- 对于 `full_generation`，`prompt` 是否是一份 PRD，而不是一句简短描述？
- 对于 `full_generation`，`prd/产品需求文档.md` 是否成功生成，且内容与 `case.prompt` 一致？
- 对于 `requirement` 和 `bug_fix`，`original_project` 是否复制正确？
- 对于 `requirement` 和 `bug_fix`，`original_project.zip` 是否成功生成，且内容遵循 `.gitignore` 过滤结果？
- `constraints[*].id` 是否符合 `EXP-MUST-XX` / `EXP-SHOULD-XX` 规范，并与 `priority` 一一对应？
- 约束是否指向真实 HarmonyOS 文件，如 `**/*.ets` 或 `**/module.json5`？
- AST 检查是否足够具体，能够区分真实实现与占位代码？

## 参考资料

如需查看字段含义或约束编写建议，请阅读：
- `references/case-structure.md`
