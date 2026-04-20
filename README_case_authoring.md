# case.yaml 编写说明

- 参考仓库里的 `case.yaml`，应该怎么写出一个高质量的 `case.yaml`

重点：

- `case` 各字段是什么意思
- `constraints` 应该怎么设计
- `rules` 应该怎么写
- `ast` 字段应该怎么写，什么场景用什么类型

## 目录

- [1. 一个标准的 `case.yaml` 长什么样](#1-一个标准的-caseyaml-长什么样)
- [2. case 怎么选](#2-case-怎么选)
- [3. `case` 字段怎么写](#3-case-字段怎么写)
- [4. `constraints` 怎么写](#4-constraints-怎么写)
- [5. `rules` 怎么写](#5-rules-怎么写)
- [6. AST 规则怎么写](#6-ast-规则怎么写)
- [7. AST 和 LLM 应该怎么配合](#7-ast-和-llm-应该怎么配合)
- [8. 高质量 `case.yaml` 的写法原则](#8-高质量-caseyaml-的写法原则)
- [9. 常见正反例](#9-常见正反例)
- [10. 写 `case.yaml` 时的检查清单](#10-写-caseyaml-时的检查清单)
- [11. 一句话总结](#11-一句话总结)

## 1. 一个标准的 `case.yaml` 长什么样

```yaml
case:
  id: requirement_007
  scenario: requirement
  title: 实现景区元服务接入MapKit并默认展示当前位置需求
  prompt: 基于当前工程完成地图导览首页实现，首页以地图作为核心主视图，按需申请定位权限并默认展示当前位置，失败时提供可继续浏览的降级态。
  output_requirements: 请说明地图主视图放置位置、当前位置展示逻辑、权限处理方式、降级态设计以及涉及的关键页面与配置文件。
constraints:
  - id: HM-REQ-007-01
    name: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
    priority: P0
    rules:
      - target: "**/pages/*.ets"
        ast:
          - type: call
            name: MapComponent
        llm: 检查首页或核心导览页是否真实接入了 MapComponent 作为地图主视图，而不是静态占位
    description: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
```

可以把它理解成两层：

- `case`：告诉执行者“要做什么”
- `constraints`：告诉复核者“怎样算做到了”

## 2. case 怎么选

在开始写 `case.yaml` 之前，先要判断“这个题值不值得出”“应该归到哪一类 case”。

一个值得写成 case 的题，通常至少满足下面几条：

- 有明确的用户价值或开发价值
- 有清晰的输入和预期输出
- 能落到真实代码实现，不是纯概念讨论
- 能通过 `constraints` 验证，不是只能靠主观判断

### 2.1 先选 `scenario`

最先要选的是场景类型。

#### 选 `requirement`

当前HarmonyOS Plugin已针对鸿蒙元服务开发做过针对性优化，常见组件使用case和baseline agent拉不开差距。

适合这类任务：

- 在现有工程上新增一个业务能力，业务能力场景不建议太简单
- 在现有页面或链路上补一个新功能，最好是鸿蒙kit能力相关的，如新闻元服务接入横幅广告
- 高阶组件的使用，xComponent等
- 高阶视效/动画的实现，如一镜到底动画
- 基础kit中难度较大的kit接入实现，长时任务、ai能力等
- 保留原有主流程，只做增量实现

典型例子：

- 首页新增 MapKit 地图主视图
- 新增当前位置展示和权限申请
- 新增支付、分享、筛选、详情页等业务能力

判断方法：

- 重点是“新增什么”
- 不是修错
- 不是从零做完整工程

#### 选 `bug_fix`

当前HarmonyOS Plugin已针对鸿蒙元服务开发做过针对性优化，常见开发问题使用case和baseline agent拉不开差距。

适合这类任务：

- 当前工程里已经有问题，需要复现并修复
- 用户可见行为和预期不一致
- 有明确缺陷现象、根因方向和修复目标

典型例子：

- ForEach 数据变化后 UI 不刷新
- 商品数量变化后总价不更新
- 页面返回后状态丢失

判断方法：

- 重点是“哪里错了，怎么修”
- 不是做新功能
- 不是从零搭完整项目

#### 选 `full_generation`

适合这类任务：

- 从零生成一个完整 HarmonyOS 工程
- 需要明确业务角色、主链路、分层结构、状态管理方案
- 目标是完整工程，而不是某个页面补丁

典型例子：

- 从零生成内容创作者平台元服务
- 从零生成餐饮预约取号工程
- 从零生成新闻内容生产平台

判断方法：

- 重点是“完整工程”
- 不是在已有工程里增量改几处

### 2.2 优先选“可验证”的 case

好 case 不是越大越好，而是越容易被稳定验证越好。

优先选择下面这类题：

- 能落到真实系统能力或组件接入
- 能落到真实状态管理方式
- 能落到真实导航、配置、模型结构
- 能写出明确 AST 证据

更适合写成 case 的题：

- 接入 `MapComponent`
- 配置定位权限
- 增加详情页导航

不太适合直接写成 case 的题：

- “页面体验更高级”
- “界面更美观”
- “交互更自然”

原因：

- 太抽象
- 很难写稳定 AST
- 很难做一致复核

### 2.3 优先选“有业务闭环”的 case

一个高质量 case 最好不是只卡某个孤立 API，而是能形成最小业务闭环。

例如：

- 地图组件接入 + 定位权限申请 + 当前位置展示
- 列表状态修改 + 深层追踪 + UI 刷新
- 页面跳转 + 参数传递 + 详情页渲染

这种 case 的好处是：

- 更接近真实开发任务
- 更容易设计 `P0` / `P1`
- 更容易区分“真做了”和“只写了几行样板代码”

### 2.4 优先选“边界清楚”的 case

适合出题的 case 应该能说清下面几件事：

- 当前基础是什么
- 本次只改什么
- 哪些链路不能破坏
- 成功标准是什么

适合：

- 在首页新增地图模块，但保留原有首页入口
- 修复购物车价格刷新问题，但不改购物流程
- 新增详情页跳转，但不重构整个路由系统

不适合：

- “把整个应用优化一下”
- “把现有页面都改得更合理”
- “提升整体体验”

## 3. `case` 字段怎么写

`case` 是任务本身的定义。

### 3.1 `id`

```yaml
id: requirement_007
```

含义：

- 用例唯一标识
- 一般由场景名加编号组成

编写建议：

- 保持唯一
- 命名和场景一致
- 不要把 `id` 写成一长串需求描述

### 3.2 `scenario`

```yaml
scenario: requirement
```

含义：

- 用例类型

当前常见值：

- `requirement`：增量需求开发
- `bug_fix`：缺陷修复
- `full_generation`：从零生成完整工程

编写建议：

- 这个字段决定任务性质，不要写错
- 如果是“修问题”，不要写成 `requirement`
- 如果是“从零做完整工程”，不要写成 `bug_fix`

### 3.3 `title`

```yaml
title: 实现景区元服务接入MapKit并默认展示当前位置需求
```

含义：

- 一句话概括这个 case 的目标

编写建议：

- 直接描述最终结果
- 让人一眼看出业务目标
- 不要写成空话，例如“完善体验”“优化功能”

推荐写法：

```yaml
title: 修复ForEach数据源深层属性变化后界面不刷新的缺陷
```

不推荐写法：

```yaml
title: 列表优化
```

### 3.4 `prompt`

```yaml
prompt: 基于当前工程完成地图导览首页实现，首页以地图作为核心主视图，按需申请定位权限并默认展示当前位置，失败时提供可继续浏览的降级态。
```

含义：

- 这是最核心的执行说明
- 它直接定义“要生成什么代码结果”

高质量 `prompt` 应包含：

1. 当前任务背景
2. 核心用户链路
3. 关键功能点
4. 技术约束
5. 异常或降级处理

推荐写法：

```yaml
prompt: 基于当前工程继续做增量开发，首页以地图作为核心主视图，首次进入或主动触发定位时按需申请位置权限，授权成功后获取设备当前位置并默认展示当前位置；若用户拒绝授权或定位失败，页面仍需提供景区导览信息区和可继续浏览的降级态，整体使用 V2 状态管理组织地图状态、权限状态和定位结果。
```

不推荐写法：

```yaml
prompt: 做一个地图页面，体验完整一点。
```

问题在于：

- 没有关键链路
- 没有技术要求
- 没有异常场景
- 无法约束实现质量

### 3.5 `output_requirements`

```yaml
output_requirements: 请说明地图主视图放置位置、当前位置展示逻辑、权限处理方式、降级态设计以及涉及的关键页面与配置文件。
```

含义：

- 对最终交付说明的要求
- 不是代码约束，而是结果说明约束

适合写的内容：

- 要解释哪些关键页面
- 要说明哪些状态流转
- 要说明哪些配置修改
- 要说明根因、修复点、关键文件

## 4. `constraints` 怎么写

`constraints` 是 `case.yaml` 里最重要的验收部分。

它决定：

- 什么算真正完成
- 什么算伪实现
- 复核时去哪里找证据

一个标准约束如下：

```yaml
- id: HM-REQ-007-01
  name: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
  priority: P0
  rules:
    - target: "**/pages/*.ets"
      ast:
        - type: call
          name: MapComponent
      llm: 检查首页是否真实使用 MapComponent 作为地图主视图，而不是静态占位
  description: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
```

### 4.1 `constraints[].id`

含义：

- 约束唯一标识

编写建议：

- 保持唯一
- 与场景和顺序对应
- 推荐格式：`HM-REQ-007-01`、`HM-BUGFIX-002-01`

### 4.2 `constraints[].name`

含义：

- 约束名称
- 直接描述“必须满足什么”

推荐写法：

```yaml
name: 必须按需申请位置权限并获取设备当前位置用于地图默认展示
```

不推荐写法：

```yaml
name: 地图体验要完整
```

### 4.3 `constraints[].priority`

当前优先级：

- `P0`：关键硬要求，做不到基本算失败
- `P1`：重要要求，补全核心链路或体验
- `P2`：一般性要求

编写建议：

- `P0` 放核心能力、关键架构、关键状态链路
- `P1` 放异常处理、展示补全、配置补全、体验闭环

### 4.4 `constraints[].description`

含义：

- 约束补充说明

编写建议：

- 如果和 `name` 一样，可以直接复用
- 如果约束背景复杂，可以补充更完整说明

## 5. `rules` 怎么写

`rules` 是约束真正落地执行的检查项。

一条约束可以有一条或多条 `rule`。

标准结构：

```yaml
rules:
  - target: "**/pages/*.ets"
    ast:
      - type: call
        name: requestPermissionsFromUser
      - type: call
        name: getCurrentLocation
    llm: 检查是否完成权限申请与当前位置获取闭环
```

### 5.1 `target`

含义：

- 这个规则要在哪些文件里检查

常见写法：

- `**/pages/*.ets`：页面层
- `**/components/*.ets`：组件层
- `**/*.ets`：整个 ArkTS 工程
- `**/EntryAbility.ets`：入口文件
- `**/module.json5`：模块配置
- `**/app.json5`：应用配置

编写建议：

- 能写窄就写窄
- 已知目标页面时，不要偷懒写 `**/*.ets`
- 配置类要求尽量直接指向配置文件

推荐写法：

```yaml
- target: "**/module.json5"
  llm: 检查是否补充位置权限相关配置
```

不推荐写法：

```yaml
- target: "**/*"
  llm: 检查权限配置是否正确
```

### 5.2 `ast`

含义：

- 结构化代码证据
- 用来验证“代码里是否真的出现了某种实现”

编写原则：

- 优先写 AST，再用 `llm` 补语义
- AST 要能直接对应真实代码特征
- 不要把抽象业务目标直接写成 AST
- 对 `module.json5`、`app.json5` 这类配置文件，如果要检查是否声明了某个具体权限或配置值，通常推荐写成 `property + llm` 组合：AST 先检查如 `requestPermissions` 这类配置块是否存在，再由 `llm` 检查是否包含 `ohos.permission.INTERNET` 等具体值

### 5.3 `llm`

含义：

- 语义补充检查
- 用来验证 AST 不好表达的内容

适合用 `llm` 的内容：

- 降级态是否合理
- 保存后结果是否回传
- 页面是否同时满足多个业务展示要求
- 权限失败后是否仍能继续浏览

注意：

- `llm` 是补充，不是替代 AST
- 只写 `llm` 的约束稳定性通常更差

## 6. AST 规则怎么写

这是最关键的部分。

你可以把 `ast` 理解成“必须命中的结构化证据列表”。

例如：

```yaml
ast:
  - type: call
    name: requestPermissionsFromUser
  - type: call
    name: getCurrentLocation
```

含义是：

- 目标文件里必须能看到 `requestPermissionsFromUser`
- 同时也必须能看到 `getCurrentLocation`

同一条 `ast` 下多条规则默认是 AND 关系。

也就是：

- 写了几条，就要求几条都命中

### 6.1 AST 单项字段含义

一个典型 AST 项：

```yaml
- type: call
  name: MapComponent
```

常见字段：

| 字段 | 含义 | 说明 |
|------|------|------|
| `type` | 规则类型 | 决定查调用、查装饰器、查导入还是查导航 |
| `name` | 匹配目标名 | 多数规则使用这个字段 |
| `target` | 导航目标名 | 主要给 `navigation` 用 |
| `context` | 上下文限制 | 主要给 `no_literal_number` 这类规则用，可选如 `style_property`、`logic_code` |

### 6.2 AST 规则类型总表

| `type` | 作用 | 常见字段 | 示例 |
|------|------|------|------|
| `decorator` | 存在指定装饰器 | `name` | `name: ComponentV2` |
| `no_decorator` | 禁止指定装饰器 | `name` | `name: State` |
| `call` | 存在指定函数或组件调用 | `name` | `name: MapComponent` |
| `no_call` | 禁止指定函数调用 | `name` | `name: router.push` |
| `property` | 存在指定属性定义 | `name` | `name: navPathStack` |
| `property_access` | 存在指定属性访问 | `name` | `name: id` |
| `variable` | 存在指定变量声明 | `name` | `name: navPathStack` |
| `import` | 存在指定导入 | `name` | `name: model` |
| `no_import` | 禁止指定导入 | `name` | `name: router` |
| `class` | 存在指定类定义 | `name` | `name: RestaurantModel` |
| `method` | 存在指定方法定义 | `name` | `name: getFilteredRestaurants` |
| `no_literal_number` | 避免样式或逻辑代码中的魔法数 | `context` | `context: style_property` |
| `navigation` | 存在导航到指定页面 | `target` | `target: DetailPage` |
| `navigation_with_params` | 存在带参数导航 | 无或少量附加字段 | `type: navigation_with_params` |

### 6.3 每种 AST 规则适合什么场景

#### `call`

适合检查：

- 真实接入某个组件
- 真实调用某个 API
- 真实使用某个系统能力

示例：

```yaml
ast:
  - type: call
    name: MapComponent
```

#### `decorator` / `no_decorator`

适合检查：

- 是否使用 V2 状态管理
- 是否仍在使用旧装饰器

示例：

```yaml
ast:
  - type: decorator
    name: ObservedV2
  - type: decorator
    name: Trace
  - type: no_decorator
    name: State
```

#### `import` / `no_import`

适合检查：

- 是否引入新模块
- 是否还依赖旧模块

示例：

```yaml
ast:
  - type: import
    name: model
  - type: no_import
    name: router
```

#### `property_access`

适合检查：

- 是否有真实数据访问链路
- 是否使用稳定 key
- 是否访问关键字段

示例：

```yaml
ast:
  - type: property_access
    name: id
```

#### `class` / `method` / `variable` / `property`

适合检查：

- 某个结构是否真实存在
- 模型类、方法、变量是否已落地

示例：

```yaml
ast:
  - type: class
    name: RestaurantModel
  - type: method
    name: getFilteredRestaurants
```

#### `navigation` / `navigation_with_params`

适合检查：

- 页面跳转链路是否存在
- 是否有带参数的详情页或结果页跳转

示例：

```yaml
ast:
  - type: navigation
    target: ScenicDetailPage
```

#### `no_literal_number`

适合检查：

- 样式是否避免直接散落魔法数
- 逻辑代码是否避免直接散落魔法数
- 是否更倾向使用 token、资源值、统一常量

常见上下文：

- `style_property`：只检查样式属性值中的数字字面量，例如宽高、边距、圆角、字号
- `logic_code`：只检查逻辑代码中的数字字面量，例如重试次数、超时时间、分页大小、状态阈值

示例：

```yaml
ast:
  - type: no_literal_number
    context: style_property
```

```yaml
ast:
  - type: no_literal_number
    context: logic_code
```

### 6.4 最推荐优先写的 AST 类型

如果你不确定从哪里下手，优先选下面这些：

- `call`
- `decorator`
- `no_decorator`
- `import`
- `no_import`
- `property_access`
- `navigation`

原因：

- 这些规则最贴近真实实现
- 最容易稳定复核
- 最能区分“真做了”和“假做了”

## 7. AST 和 LLM 应该怎么配合

可以直接按这个分工写：

- AST 负责“有没有做”
- LLM 负责“是不是做对了”

例如：

```yaml
- name: 必须按需申请位置权限并获取设备当前位置用于地图默认展示
  priority: P0
  rules:
    - target: "**/*.ets"
      ast:
        - type: call
          name: requestPermissionsFromUser
        - type: call
          name: getCurrentLocation
      llm: 检查获取到的位置结果是否真实用于地图默认中心点或当前位置展示，而不是只做了变量声明或伪代码描述
```

这条约束里：

- AST 检查“权限申请和定位获取是否存在”
- LLM 检查“位置结果是否真的被用于地图展示”

## 8. 高质量 `case.yaml` 的写法原则

### 原则 1：`prompt` 要写业务闭环，不要写口号

推荐：

```yaml
prompt: 修复列表项深层状态变化后 UI 不刷新的问题，使用可追踪状态管理让列表项属性变更后界面实时刷新，并保留原有列表交互链路。
```

不推荐：

```yaml
prompt: 优化列表刷新体验。
```

### 原则 2：`constraints` 要能防伪实现

推荐：

```yaml
- name: 列表数据模型必须使用深层可追踪装饰器修饰
  priority: P0
  rules:
    - target: "**/pages/*.ets"
      ast:
        - type: decorator
          name: ObservedV2
        - type: decorator
          name: Trace
      llm: 检查列表所用的数据模型类是否使用了 @ObservedV2 装饰，且需要变化的属性是否使用了 @Trace 装饰
```

不推荐：

```yaml
- name: 列表刷新必须正确
  priority: P0
  rules:
    - target: "**/*.ets"
      llm: 检查列表刷新是否正确
```

### 原则 3：`target` 尽量收窄

推荐：

```yaml
- target: "**/EntryAbility.ets"
  ast:
    - type: call
      name: NavPathStack
```

不推荐：

```yaml
- target: "**/*.ets"
  ast:
    - type: call
      name: NavPathStack
```

### 原则 4：优先写真实 API、组件名、装饰器名

高价值 AST：

- `MapComponent`
- `requestPermissionsFromUser`
- `getCurrentLocation`
- `ObservedV2`
- `Trace`

低价值 AST：

- `Column`
- `Row`
- `Text`

因为后者太通用，对业务判断帮助很弱。

## 9. 常见正反例

### 正例：地图能力接入

```yaml
- id: HM-REQ-007-01
  name: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
  priority: P0
  rules:
    - target: "**/pages/*.ets"
      ast:
        - type: call
          name: MapComponent
      llm: 检查首页或核心导览页是否真实接入了 MapComponent 作为地图主视图，而不是静态占位
  description: 首页必须接入 MapKit 地图组件并将地图作为景区导览主视图
```

优点：

- 有真实组件证据
- 有业务语义补充
- `target` 范围合适

### 正例：定位权限与当前位置

```yaml
- id: HM-REQ-007-02
  name: 必须按需申请位置权限并获取设备当前位置用于地图默认展示
  priority: P0
  rules:
    - target: "**/*.ets"
      ast:
        - type: call
          name: requestPermissionsFromUser
        - type: call
          name: getCurrentLocation
      llm: 检查工程是否按需申请定位权限并实际调用定位能力获取当前位置，且该位置结果被用于地图默认中心点或当前位置展示
  description: 必须按需申请位置权限并获取设备当前位置用于地图默认展示
```

优点：

- 命中了最小闭环证据
- AST 和 LLM 分工清楚

### 反例：只有口号，没有代码证据

```yaml
- id: HM-REQ-007-99
  name: 地图体验要完整
  priority: P0
  rules:
    - target: "**/*.ets"
      llm: 检查地图体验是否完整
  description: 地图体验要完整
```

问题：

- 没有 AST
- 无法稳定复核
- 很难区分真实实现和伪实现

## 10. 写 `case.yaml` 时的检查清单

- `case.id` 是否唯一
- `scenario` 是否正确
- `title` 是否能直接说明目标
- `prompt` 是否写清业务链路、技术约束、异常处理
- `output_requirements` 是否明确要求说明关键实现点
- `P0` 是否都是真正的硬约束
- `rules.target` 是否尽量收窄
- 是否优先写了 AST，而不是只有 LLM
- AST 是否尽量使用真实 API、组件名、装饰器名、导航目标名
- 是否能通过约束判断“代码真的做了这件事”

## 11. 一句话总结

写 `case.yaml` 时，可以始终按这个思路：

- `case` 写任务目标
- `prompt` 写业务闭环
- `constraints` 写验收标准
- `P0` 写硬门槛
- `P1` 写补全项
- `rules.target` 写检查范围
- `ast` 写结构化代码证据
- `llm` 写 AST 不足以表达的语义
