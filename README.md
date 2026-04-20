# cases-agent

## 目录

- [工程简介](#工程简介)
- [工程结构](#工程结构)
- [实现原理](#实现原理)
- [使用方式](#使用方式)
- [产物说明](#产物说明)

## 工程简介

本工程用于生成 HarmonyOS 测试用例目录，当前支持 3 类场景：

- `requirement`：基于现有工程或空工程生成增量需求类用例
- `bug_fix`：基于现有工程修复缺陷，或先构造缺陷再修复
- `full_generation`：从零生成完整工程类用例

现在的输入是 `data/cases/` 下的单个 case spec，生成脚本会把它转换成 `output/test_cases/<scenario>/<编号>/` 目录下的最终用例产物。

需要特别注意：

- 日常编写的是 `data/cases/*.yaml` 里的 case spec
- 生成后产物中也会有一个 `case.yaml`
- 这两者字段并不是完全一致，生成时会发生字段转换

## 工程结构

```text
cases-agent/
├─ case_generation_agent.py
├─ config/
├─ data/
│  └─ cases/
│     ├─ requirement/
│     ├─ bug_fix/
│     └─ full_generation/
├─ resources/
│  ├─ templates/
│  └─ starter_projects/
│     └─ empty_atomic_project/
├─ skills/
│  └─ harmonyos-case-generation/
│     ├─ SKILL.md
│     ├─ references/
│     │  └─ source-map.md
│     └─ scripts/
│        ├─ print_case_template.py
│        └─ validate_case_specs.py
└─ output/
   └─ test_cases/
      ├─ requirement/
      ├─ bug_fix/
      └─ full_generation/
```

各目录职责如下：

- `data/cases/`：手写输入 spec 的地方，是主要维护对象
- `resources/templates/`：可复用的行业模板工程
- `resources/starter_projects/`：空工程或预置起始工程
- `case_generation_agent.py`：把 case spec 生成为最终 test case
- `skills/harmonyos-case-generation/`：约束编写规范、字段映射和辅助脚本
- `output/test_cases/`：生成结果目录

## 实现原理

### 1. 整体流程

生成流程如下：

1. 在 `data/cases/` 下新增或修改一个 case spec
2. 用 `validate_case_specs.py` 做结构校验
3. `case_generation_agent.py` 读取 spec
4. 根据 `template_project` / `starter_kind` / 默认空工程 解析 `original_project` 来源
5. 把源工程复制到 `output/test_cases/<scenario>/<编号>/original_project`
6. 生成最终产物 `case.yaml`
7. 为约束自动补齐编号、描述等标准字段

### 2. 输入 spec 与输出 case.yaml 的关系

输入层是 `data/cases/*.yaml`，输出层是 `output/test_cases/.../case.yaml`。

常见字段转换如下：

- `case.id`：输入中是逻辑 ID，例如 `requirement_005_scenic_atomic_mapkit_current_location`
- 输出 `case.id`：会变成编号形式，例如 `requirement_005`
- `case.input`：会被转换为输出 `case.prompt`
- `case.output_requirements`：如果未填写，脚本会按场景自动补默认文案
- `constraints[].id`：如果输入没写，脚本会自动生成如 `HM-REQ-005-01`
- `constraints[].description`：如果输入没写，会默认使用 `name`

因此，编写时应以 `data/cases/*.yaml` 为准；查看交付结果时再看 `output/test_cases/.../case.yaml`。

### 3. case.yaml 编写说明

这里说的“编写”默认指编写 `data/cases/*.yaml` 里的输入 spec。

一个典型结构如下：

```yaml
case:
  id: requirement_example
  scenario: requirement
  title: 实现景区元服务接入MapKit并默认展示当前位置需求
  input: 基于当前工程完成地图导览能力接入...
  template_project: IndustryTemplate/ProjectName
  keywords:
    - MapKit
    - MapComponent
    - 当前位置
  existing_features:
    - 当前工程已有首页和基础导航
  new_requirement_scope:
    - 新增地图主视图
    - 新增定位权限与当前位置展示
  template_constraints:
    - 保留现有首页主链路
  output_requirements: 请说明关键实现点与修改文件
constraints:
  - name: 首页必须接入 MapKit 地图组件
    priority: P0
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: call
            name: MapComponent
        llm: 检查首页是否真实使用 MapComponent 作为地图主视图
```

字段说明如下。

#### `case` 下通用字段

- `id`：逻辑唯一标识，建议与文件名一致，方便检索和迁移
- `scenario`：只能是 `requirement`、`bug_fix`、`full_generation`
- `title`：一句话概括用例目标，面向人读
- `input`：最核心的任务描述，决定生成后的 `prompt`
- `keywords`：检索标签，建议包含业务词、ArkTS 能力词、关键组件词
- `output_requirements`：对最终实现和回答内容的明确要求；不写时脚本会按场景补默认值

#### 场景专属字段

`requirement` 场景通常需要：

- `existing_features`：当前工程已经具备什么
- `new_requirement_scope`：本次新增什么
- `template_constraints`：哪些既有链路、页面或结构不能破坏
- `template_project`：可选，指定输入中给出的工程位置；不写时默认使用 `empty_atomic_project`

`bug_fix` 场景通常可选：

- `template_project`：待修复工程位置
- `problem_statement`：问题现象
- `fix_targets`：修复目标列表

`full_generation` 场景通常只需要：

- 保留核心 `case` 字段
- 用 `input` 明确业务角色、链路和技术约束

### 4. constraints 编写说明

`constraints` 是用例质量的核心，决定如何验证生成结果是否符合预期。

每条约束的基础结构如下：

```yaml
constraints:
  - name: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
    priority: P0
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: call
            name: MapComponent
        llm: 检查首页是否真实使用 MapComponent 作为地图主视图
```

基础字段含义：

- `name`：约束名称，直接描述“必须满足什么”
- `priority`：`P0`、`P1`、`P2`
- `rules`：一组具体校验规则，至少包含 1 条 rule

约束编写建议：

- 至少有 1 条 `P0`
- 至少有 1 条 `P1`
- 优先使用 AST 可验证的硬证据
- 只在 AST 不足以表达业务意图时补充 `llm`
- 已知目标页面时，`target` 要尽量收窄

### 5. AST 约束规则说明

AST 规则是 `constraints.rules` 中最核心的部分，建议把这一节当成 AST 写法速查表。

#### 5.1 单条 rule 结构

单条 `rule` 通常由 `target`、`ast`、`llm` 三部分组成：

```yaml
rules:
  - target: "**/pages/*.ets"
    ast:
      - type: call
        name: MapComponent
      - type: call
        name: getCurrentLocation
    llm: 检查地图组件和当前位置获取逻辑是否都已接入
```

字段含义：

- `target`：规则作用范围，通常是 glob 路径
- `ast`：结构化语法证据列表，用于做静态检查
- `llm`：自然语言提示，用于补充 AST 难以完全表达的语义

使用原则：

- `ast` 是主证据，`llm` 是补充说明，不能反过来
- 同一条 `rules[].ast` 下的多条 AST 规则默认是 AND 关系
- `no_*` 类型表示“禁止出现”，适合做负向约束
- 一条业务链路若跨多个文件层级，建议拆成多条 rule，而不是把 `target` 放得很宽

#### 5.2 `target` 怎么写

常见写法：

- `**/pages/*.ets`：校验页面层
- `**/*.ets`：校验全工程 ArkTS 文件
- `**/module.json5`：校验模块配置
- `**/app.json5`：校验应用配置
- `**/EntryAbility.ets`：校验特定入口文件

编写建议：

- 页面明确时，不要偷懒写成很宽的 `**/*.ets`
- 配置类规则尽量直接指向 `module.json5`、`app.json5`
- 如果同一目标分别落在页面、模型、配置层，拆成多条 rule 更容易定位问题

#### 5.3 AST 类型一览

`ast` 类型建议以 [skills/constraint-score-review/SKILL.md](</E:/repo/cases-agent/skills/constraint-score-review/SKILL.md:136>) 为准。每条 AST 规则本质上都在描述：目标文件里“必须出现什么结构”或“不能出现什么结构”。

| type | 含义 | 常用字段 | 示例 |
|------|------|------|------|
| `decorator` | 存在指定装饰器 | `name` | `{type: decorator, name: ComponentV2}` |
| `no_decorator` | 不存在指定装饰器 | `name` | `{type: no_decorator, name: State}` |
| `call` | 存在指定函数或组件调用 | `name` | `{type: call, name: ForEach}` |
| `no_call` | 不存在指定函数调用 | `name` | `{type: no_call, name: router.push}` |
| `property` | 存在指定属性定义 | `name` | `{type: property, name: navPathStack}` |
| `property_access` | 存在指定属性访问 | `name` | `{type: property_access, name: id}` |
| `variable` | 存在指定变量声明 | `name` | `{type: variable, name: navPathStack}` |
| `import` | 存在指定导入 | `name` | `{type: import, name: model}` |
| `no_import` | 不存在指定导入 | `name` | `{type: no_import, name: router}` |
| `class` | 存在指定类定义 | `name` | `{type: class, name: RestaurantModel}` |
| `method` | 存在指定方法定义 | `name` | `{type: method, name: getFilteredRestaurants}` |
| `no_literal_number` | 不使用数字字面量作为样式或逻辑代码中的魔法数 | `context` | `{type: no_literal_number, context: style_property}` |
| `navigation` | 存在导航到指定页面的跳转 | `target` | `{type: navigation, target: DetailPage}` |
| `navigation_with_params` | 存在带参数的导航跳转 | 无 | `{type: navigation_with_params}` |

字段选择规则：

- 大多数 AST 类型使用 `name`
- `navigation` 使用 `target`
- `no_literal_number` 可按场景补充 `context`，例如 `style_property`、`logic_code`
- `navigation_with_params` 一般不需要额外字段

推荐优先使用下面这几类，因为最常见、也最容易稳定复核：

- `call`
- `decorator`
- `no_decorator`
- `property_access`
- `import`
- `no_import`
- `navigation`

#### 5.4 AST 规则怎么落地写

写 AST 时优先选择“可落地、可观察、可定位”的证据：

- 优先写真实 API、组件名、装饰器名、导航目标名
- 先写最小闭环证据，再用 `llm` 补业务语义
- 需要禁止旧实现时，优先使用 `no_call`、`no_decorator`、`no_import`
- 需要表达数据访问链路时，优先使用 `property_access`
- 需要表达代码结构已存在时，可用 `class`、`method`、`variable`
- 需要表达页面跳转语义时，优先使用 `navigation` 或 `navigation_with_params`
- 避免只写抽象业务口号，例如“实现地图功能”“支持用户定位”

常见写法示例：

存在组件调用：

```yaml
ast:
  - type: call
    name: MapComponent
```

存在多个关键调用：

```yaml
ast:
  - type: call
    name: requestPermissionsFromUser
  - type: call
    name: getCurrentLocation
```

存在装饰器，且禁止旧状态装饰器：

```yaml
ast:
  - type: decorator
    name: ComponentV2
  - type: no_decorator
    name: State
  - type: no_decorator
    name: Link
```

检查属性访问：

```yaml
ast:
  - type: property_access
    name: id
```

检查导入：

```yaml
ast:
  - type: import
    name: model
  - type: no_import
    name: router
```

检查类和方法：

```yaml
ast:
  - type: class
    name: RestaurantModel
  - type: method
    name: getFilteredRestaurants
```

检查导航：

```yaml
ast:
  - type: navigation
    target: ScenicMapPage
```

检查带参数导航：

```yaml
ast:
  - type: navigation_with_params
```

推荐写法：

```yaml
- name: 必须按需申请位置权限并获取设备当前位置
  priority: P0
  rules:
    - target: "**/*.ets"
      ast:
        - type: call
          name: requestPermissionsFromUser
        - type: call
          name: getCurrentLocation
      llm: 检查是否完成权限申请与当前位置获取闭环
```

不推荐写法：

```yaml
- name: 地图体验要完整
  priority: P0
  rules:
    - target: "**/*.ets"
      llm: 检查地图体验是否完整
```

原因：没有结构化证据，几乎无法稳定复核。

## 使用方式

### Agent 使用方式

Agent运行的整个流程如下：

1. 你输入一段自然语言 prompt
2. Agent 先根据 prompt 在 `data/cases/` 下生成或修改一个 case spec YAML
3. Agent 再自动执行 `python case_generation_agent.py --clean`
4. 最终产物输出到 `output/test_cases/`

也就是说，Agent 并不是跳过 `data/cases/` 直接凭空生成 `output/test_cases/`，而是始终分成两步：

- 第一步：生成输入 spec
- 第二步：由脚本消费 spec，生成最终 test case

对应到当前仓库，职责分工是：

- `data/cases/*.yaml`：Agent 帮你生成的输入层
- `case_generation_agent.py`：把输入层转成标准测试用例产物
- `output/test_cases/...`：最终输出层

例如你输入这样的需求：

```text
帮我生成一个景区元服务接入 MapKit 的 requirement 用例，地图默认展示当前位置
```

正常情况下，Agent 会先生成类似下面这样的文件：

- [data/cases/requirement/requirement_005_scenic_atomic_mapkit_current_location.yaml](</E:/repo/cases-agent/data/cases/requirement/requirement_005_scenic_atomic_mapkit_current_location.yaml:1>)

然后再继续生成最终产物：

- [output/test_cases/requirement/005/case.yaml](</E:/repo/cases-agent/output/test_cases/requirement/005/case.yaml:1>)
- [output/test_cases/requirement/005/original_project](</E:/repo/cases-agent/output/test_cases/requirement/005/original_project:1>)

如果你发现只生成了 `data/cases/*.yaml`，但还没有生成 `output/test_cases/`，说明流程只走完了第一步，还没有执行生成脚本。

### 1. 安装依赖

```bash
pip install pyyaml
```

### 2. 打印模板

```bash
python skills/harmonyos-case-generation/scripts/print_case_template.py requirement
python skills/harmonyos-case-generation/scripts/print_case_template.py bug_fix
python skills/harmonyos-case-generation/scripts/print_case_template.py full_generation
```

### 3. 校验 case spec

```bash
python skills/harmonyos-case-generation/scripts/validate_case_specs.py data/cases
python skills/harmonyos-case-generation/scripts/validate_case_specs.py data/cases/requirement/requirement_005_scenic_atomic_mapkit_current_location.yaml
```

### 4. 生成用例

这里的“生成用例”不是直接生成最终业务代码，而是把你写好的 case spec 转成标准测试用例目录。

整个过程可以理解成：

1. 读取 `data/cases/*.yaml` 里的输入 spec
2. 根据 `template_project`、`starter_kind` 或默认空工程，确定 `original_project` 来源
3. 把源工程复制到 `output/test_cases/<scenario>/<编号>/original_project/`
4. 把输入 spec 转成标准化的 `case.yaml`
5. 自动补齐编号后的 `case.id`、`constraints[].id`、`description` 等字段

最终你会得到一个这样的目录：

```text
output/test_cases/requirement/005/
├─ case.yaml
└─ original_project/
```

其中：

- `original_project/` 是起始工程
- `case.yaml` 是最终交付给下游流程消费的标准化用例描述

最常用的几种生成方式如下。

生成全部：

```bash
python case_generation_agent.py
```

含义：

- 读取 `data/cases/` 下所有 spec
- 按场景分别生成到 `output/test_cases/<scenario>/`
- 如果已有历史编号，会在当前最大编号后继续追加

清空当前场景后重生成：

```bash
python case_generation_agent.py --clean
```

含义：

- 先删除对应场景下已有生成结果
- 再从 `001` 开始重新编号生成

只生成单个 spec：

```bash
python case_generation_agent.py --spec data/cases/requirement/requirement_005_scenic_atomic_mapkit_current_location.yaml
```

含义：

- 只读取这一份 spec
- 适合调试单个 case
- 这是日常最推荐的方式

按目录批量生成：

```bash
python case_generation_agent.py --spec-dir data/cases/requirement
```

含义：

- 只读取某个目录下的一批 spec
- 适合只重建某个场景

以景区 MapKit 这个例子来说：

- 输入 spec 是 [requirement_005_scenic_atomic_mapkit_current_location.yaml](</E:/repo/cases-agent/data/cases/requirement/requirement_005_scenic_atomic_mapkit_current_location.yaml:1>)
- 执行 `python case_generation_agent.py --spec data/cases/requirement/requirement_005_scenic_atomic_mapkit_current_location.yaml`
- 输出目录会生成到 [output/test_cases/requirement/005](</E:/repo/cases-agent/output/test_cases/requirement/005:1>)
- 其中 [case.yaml](</E:/repo/cases-agent/output/test_cases/requirement/005/case.yaml:1>) 是标准化结果
- [original_project](</E:/repo/cases-agent/output/test_cases/requirement/005/original_project:1>) 是复制出来的起始工程

一句话总结：

`生成用例 = 读取 spec + 复制起始工程 + 生成标准 case.yaml + 写入 output/test_cases/<scenario>/<编号>/`

## 产物说明

每个生成结果位于：

```text
output/test_cases/<scenario>/<编号>/
├─ case.yaml
└─ original_project/
```

其中：

- `case.yaml`：最终交付给下游模型或流程消费的标准化用例描述
- `original_project/`：作为实现起点的原始工程

生成后的 `case.yaml` 结构通常如下：

```yaml
case:
  id: requirement_005
  scenario: requirement
  title: 实现景区元服务接入MapKit并默认展示当前位置需求
  prompt: ...
  output_requirements: ...
constraints:
  - id: HM-REQ-005-01
    name: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
    priority: P0
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: call
            name: MapComponent
        llm: 检查首页是否真实接入 MapComponent
    description: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
```

输出字段说明：

- `case.id`：场景内顺序编号，不再使用输入 spec 的逻辑 ID
- `case.prompt`：由输入 `case.input` 或自定义 `case.prompt` 生成
- `case.output_requirements`：场景级默认文案或输入自定义文案
- `constraints[].id`：自动生成的标准约束编号
- `constraints[].description`：默认继承 `name`

如果你要新增或修改用例，建议优先维护：

- `data/cases/*.yaml`
- `skills/harmonyos-case-generation/references/source-map.md`

而不是直接手改 `output/test_cases/.../case.yaml`。
