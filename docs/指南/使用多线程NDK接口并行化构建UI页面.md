---
title: 使用多线程NDK接口并行化构建UI页面
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread
category: 指南
updated_at: 2026-03-12T09:33:57.261Z
---

# 使用多线程NDK接口并行化构建UI页面

## 概述

在API version 22之前，UI组件的创建与属性设置等操作必须在应用的UI线程中执行。这导致开发者在使用NDK接口时，需将组件创建与属性设置等操作通过任务队列提交至UI线程执行，限制了组件创建过程的灵活性及应用的性能。

随着应用程序功能的日益复杂，应用页面内需要动态创建大量UI组件，这些组件的创建任务堆积在单一的UI线程中执行，会导致应用启动缓慢、动画丢帧及页面卡顿，直接影响用户体验。

针对这些问题，在API version 22，NDK接口引入了多线程支持能力，为开发者带来了以下提升：

-   **简化调用流程：** 开发者无需通过任务队列将组件创建任务提交至UI线程执行，可以在任意线程中直接调用组件创建和属性设置等接口，减少线程上下文切换次数，简化UI框架与应用间的交互逻辑。
    
-   **性能与体验显著优化：** 组件创建和属性设置等接口支持多线程并发调用，能够充分利用设备的多核CPU，降低页面创建阶段的总体耗时。UI线程专注于动画渲染与用户输入，确保界面流畅及交互及时。
    
-   **为后续功能扩展提供更好的灵活性：** 组件创建和属性设置等接口支持多线程调用，不仅能够解决应用当前的性能瓶颈问题，还为未来开发更复杂、高负载的UI页面提供扩展空间，帮助开发者在设计时拥有更多的灵活性，为持续提升用户体验创造条件。
    

综上所述，在复杂业务场景中，多线程NDK接口将为开发者带来高性能的UI页面创建体验。

## 多线程NDK接口使用方式

-   在使用多线程NDK接口前，建议开发者先阅读[NDK接口概述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-ui-overview)，掌握使用NDK接口必备的基本概念和基础知识。
    
-   为降低开发者适配多线程NDK接口的成本，多线程NDK接口的获取和使用方式与现有NDK接口保持一致。只需要调用[OH\_ArkUI\_GetModuleInterface](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-interface-h#oh_arkui_getmoduleinterface)接口，入参传入[ARKUI\_MULTI\_THREAD\_NATIVE\_NODE](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-interface-h#arkui_nativeapivariantkind)即可获取多线程NDK接口集合。例如：
    
    ```
    ArkUI\_NativeNodeAPI\_1 \*multiThreadNodeAPI = nullptr;
    // 获取多线程NDK接口集合。
    OH\_ArkUI\_GetModuleInterface(ARKUI\_MULTI\_THREAD\_NATIVE\_NODE, ArkUI\_NativeNodeAPI\_1, multiThreadNodeAPI);
    if (!multiThreadNodeAPI) {
      return;
    }
    // 调用集合中支持多线程的createNode接口创建UI组件。
    auto node = multiThreadNodeAPI->createNode(ARKUI\_NODE\_COLUMN);
    ```
    

支持多线程调用的全量NDK接口请参考[多线程NDK接口集合规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#多线程ndk接口集合规格)。

开发者可以使用多线程NDK接口在任意线程创建UI组件并设置属性，但是必须在UI线程中，把UI组件挂载到UI主树上。可以通过如下接口完成多线程UI组件创建任务的分发和执行。

-   对于可以在非UI线程执行的任务（如组件创建、属性设置等），可以使用[OH\_ArkUI\_PostAsyncUITask](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#oh_arkui_postasyncuitask)接口，将组件创建和属性设置等任务调度到系统线程池中执行，之后将组件挂载到主树的任务提交到UI线程执行。
    
-   当开发者需要在自己创建的非UI线程中创建UI组件时，使用[OH\_ArkUI\_PostUITask](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#oh_arkui_postuitask)接口将组件挂载到主树的任务提交到UI线程执行。
    
-   开发者在多线程创建UI组件的过程中需要执行只支持UI线程的任务时，使用[OH\_ArkUI\_PostUITaskAndWait](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#oh_arkui_postuitaskandwait)接口将任务提交到UI线程执行，调用此接口的非UI线程等待函数执行完成后继续创建组件。当UI线程负载很高时，调用此接口的非UI线程可能长时间阻塞，会影响多线程创建UI组件的性能收益，不建议频繁使用。
    

## 多线程NDK接口适配说明

1.  多线程NDK接口适用于页面跳转和列表滑动等高负载且性能敏感的场景，此类场景下UI线程需要执行耗时从几ms到几十ms的组件创建任务，开发者可以将组件创建任务拆分成多个子任务，分派给多个线程并发执行，以降低UI线程负载，提高页面启动与更新流畅度。
    
2.  当开发者在自己创建的线程中创建UI组件时，基于设备CPU核数等客观条件，建议并行的线程数量不要超过4个，以避免线程调度带来的性能开销。
    
3.  开发者可以在非UI线程预创建常用组件树，为性能敏感场景提供更好的用户体验。
    

## 多线程NDK接口调用规范

框架将UI组件划分为Free（游离）和Attached（已挂载）两种状态。

使用多线程[createNode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#createnode)接口创建的UI组件初始为Free状态，且可以在Free和Attached两种状态间进行转换，使用其他方式创建的UI组件初始为Attached状态且状态不可转换。

说明

-   开发者可以在任意线程使用多线程NDK接口操作处于Free状态的组件，为保证应用功能正常和线程安全，需遵守如下使用约束：
    
    -   禁止多线程同时操作同一个处于Free状态的组件或组件树，处于Free状态的组件内部是无锁的，多线程同时访问会出现稳定性问题。
    -   禁止使用[多线程NDK接口集合](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#多线程ndk接口集合规格)外的其他NDK接口操作处于Free状态的组件，需先将组件转换为Attach状态后才可以在UI线程使用其他NDK接口，否则接口功能会出现异常。
-   为兼顾性能，上述约束框架侧无运行时校验，需要开发者自行保证。
    
-   为保证接口多线程安全，处于Free状态的组件的一部分属性通过[setAttribute](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#setattribute)设置后，无法立即通过[getAttribute](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#getattribute)接口读取到，需要将组件转换为Attached状态后才能读取到正确的属性值。
    

当开发者进行如下操作后，UI组件状态从Free转换为Attached：

-   使用多线程[markDirty](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#markdirty)、[measureNode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#measurenode)或[layoutNode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#layoutnode)接口对Free组件进行标脏、测量或布局后，此组件所在组件树内所有处于Free状态的组件转换为Attached状态。
-   使用多线程[组件树操作](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件树操作)接口将处于Free状态的组件挂载为Attached组件的子组件，此组件所在组件树内所有处于Free状态的组件转换为Attached状态。
-   使用多线程[组件树操作](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件树操作)接口把Attached组件挂载为处于Free状态的组件的子组件，此组件所在组件树内所有处于Free状态的组件转换为Attached状态。

对于状态可转换的Attached组件，当开发者进行如下操作后，UI组件状态从Attached转换为Free：

-   使用多线程[组件树操作](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件树操作)接口将组件从组件树上移除，且移除后的组件所在组件树不包含不可转换的Attached组件，此组件所在组件树内所有组件转换为Free状态。

基于上述状态转换规则，每个UI组件树内所有组件都处于相同状态。

## 多线程NDK接口的错误与异常

多线程NDK接口调用规范请参考[多线程NDK接口集合规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#多线程ndk接口集合规格)。调用多线程NDK接口时必须检查接口返回值，如下两种情况接口会返回错误码[ARKUI\_ERROR\_CODE\_NODE\_ON\_INVALID\_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode)。

-   在非UI线程中调用集合中不支持多线程的接口。
    
-   在非UI线程调用多线程NDK接口操作处于Attached状态的组件。
    

多线程NDK适配过程中遇到的更多问题可以参考[UI并行化常见问题](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/multi-thread-ui-build-faq)。

## 多线程NDK接口集合规格

集合中支持多线程调用的接口包括：[组件创建销毁](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件创建销毁)，[组件属性读写](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件属性读写)，[组件事件注册解注册](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件事件注册解注册)，[组件树操作](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件树操作)和[组件自定义数据读写](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件自定义数据读写)。

集合中仅支持UI线程调用的接口包括：[全局事件注册解注册](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#全局事件注册解注册)和[组件测算布局](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread#组件测算布局)。

### 组件创建销毁

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | [ArkUI_NodeType](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#arkui_nodetype) | 支持 | 支持在任意线程调用。 |
| [disposeNode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#disposenode) | 销毁节点指针指向的节点对象。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口调用无效。 |

### 组件属性读写

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [setAttribute](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#setattribute) | 设置node节点的属性。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [ArkUI_AttributeItem](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-attributeitem) | 获取node节点的属性。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |
| [resetAttribute](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#resetattribute) | 重置node节点的属性为默认值。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [setLengthMetricUnit](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#setlengthmetricunit) | 指定node节点的单位。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |

### 组件事件注册解注册

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [registerNodeEvent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#registernodeevent) | 向node节点注册事件。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [unregisterNodeEvent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#unregisternodeevent) | node节点解注册事件。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口调用无效。 |
| [registerNodeCustomEvent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#registernodecustomevent) | 向node节点注册自定义事件。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [unregisterNodeCustomEvent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#unregisternodecustomevent) | node节点解注册自定义事件。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口调用不生效。 |
| [addNodeEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#addnodeeventreceiver) | 向node节点注册事件回调函数，用于接收该组件产生的组件事件。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [removeNodeEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#removenodeeventreceiver) | 删除node节点上注册的事件回调函数。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [addNodeCustomEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#addnodecustomeventreceiver) | 向node节点注册自定义事件回调函数，用于接收该组件产生的自定义事件（如布局事件，绘制事件）。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [removeNodeCustomEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#removenodecustomeventreceiver) | 删除node节点上注册的自定义事件回调函数。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |

### 组件树操作

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [addChild](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#addchild) | 将child节点挂载到parent节点的子节点列表中。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [removeChild](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#removechild) | 将child节点从parent节点的子节点列表中移除。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [insertChildAfter](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#insertchildafter) | 将child节点挂载到parent节点的子节点列表中，挂载位置在sibling节点之后。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [insertChildBefore](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#insertchildbefore) | 将child节点挂载到parent节点的子节点列表中，挂载位置在sibling节点之前。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [insertChildAt](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#insertchildat) | 将child节点挂载到parent节点的子节点列表中，挂载位置由position指定。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | 获取node节点的父节点。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [removeAllChildren](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#removeallchildren) | 移除node节点的所有子节点。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [getTotalChildCount](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#gettotalchildcount) | 获取node节点的子节点个数。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回0。 |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | 获取node节点的子节点指针，位置由position指定。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | 获取node节点的第一个子节点指针。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | 获取node节点的最后一个子节点指针。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | 获取node节点的上一个兄弟节点指针。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |
| [ArkUI_NodeHandle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-node8h) | 获取node节点的下一个兄弟节点指针。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |

### 组件自定义数据读写

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [setUserData](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#setuserdata) | 在node节点上保存自定义数据。 | 支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [getUserData](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#getuserdata) | 获取node节点上保存的自定义数据。 | 支持 | 在非UI线程调用函数操作Attached节点时，接口返回空指针。 |

### 全局事件注册解注册

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [registerNodeEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#registernodeeventreceiver) | 注册节点事件回调统一入口函数。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口不生效。 |
| [unregisterNodeEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#unregisternodeeventreceiver) | 解注册节点事件回调统一入口函数。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口不生效。 |
| [registerNodeCustomEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#registernodecustomeventreceiver) | 注册节点自定义事件回调统一入口函数。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口不生效。 |
| [unregisterNodeCustomEventReceiver](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#unregisternodecustomeventreceiver) | 解注册节点自定义事件回调统一入口函数。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口不生效。 |

### 组件测算布局

| 接口名 | 描述 | 非UI线程调用 | 多线程规格 |
| --- | --- | --- | --- |
| [setMeasuredSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#setmeasuredsize) | 在测算回调函数中设置组件测算完成后的宽和高。 | 不支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [setLayoutPosition](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#setlayoutposition) | 在布局回调函数中设置组件的位置。 | 不支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [ArkUI_IntSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-intsize) | 获取node节点测算完成后的宽高尺寸。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口返回默认值。 |
| [ArkUI_IntOffset](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-intoffset) | 获取node节点布局完成后的位置。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口返回默认值。 |
| [measureNode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#measurenode) | 对node节点进行测算，可以通过getMeasuredSize获取测算后的大小。节点所在组件树内所有Free节点的状态转换为Attached。 | 不支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [layoutNode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#layoutnode) | 对node节点进行布局并传递该组件相对父组件的期望位置。节点所在组件树内所有Free节点的状态转换为Attached。 | 不支持 | [ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-type-h#arkui_errorcode) |
| [markDirty](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-arkui-nativemodule-arkui-nativenodeapi-1#markdirty) | 强制标记node节点重新执行测量、布局或者绘制的区域。节点所在组件树内所有Free节点的状态转换为Attached。 | 不支持 | 只支持UI线程调用，在非UI线程调用接口调用不生效。 |

## 多线程NDK接口使用示例

此示例构造了一个多线程创建UI组件的场景，页面显示的Button组件在非UI线程被并行创建。

点击CreateNodeTree按钮触发在多个非UI线程并行创建Button组件，之后在UI线程将创建完成的Button组件挂载到UI主树上，使组件显示在页面上。点击DisposeNodeTree按钮将已创建的组件从UI主树上卸载并销毁，清空页面。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/38/v3/iAuKTtxpRHmzzVNIPUZ1UQ/zh-cn_image_0000002557925185.gif?HW-CC-KV=V1&HW-CC-Date=20260312T093356Z&HW-CC-Expire=86400&HW-CC-Sign=ECB5A73893548537B6399AD22D6573E97E4304CD218668D8A825EEC415110B40)

示例主要展示了如何获取和使用多线程NDK接口，并使用[OH\_ArkUI\_PostAsyncUITask](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#oh_arkui_postasyncuitask)、[OH\_ArkUI\_PostUITask](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#oh_arkui_postuitask)和[OH\_ArkUI\_PostUITaskAndWait](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#oh_arkui_postuitaskandwait)等接口将组件创建和属性设置等任务分发到多线程并行执行。

为简化编程和工程管理，在开始编写并行化组件创建代码前，请先参考[接入ArkTS页面](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-access-the-arkts-page)指导文档，在Native侧使用面向对象的方式将ArkUI\_NodeHandle封装为ArkUINode对象。

```typescript
// index.ets
import { NodeContent } from '@kit.ArkUI';
import entry from 'libentry.so';
@Component
struct CAPIComponent {
  private rootSlot = new NodeContent();
  aboutToAppear(): void {
    // 页面显示前多线程创建Native组件。
    entry.createNodeTreeOnMultiThread(this.rootSlot, this.getUIContext());
  }
  aboutToDisappear(): void {
    // 页面销毁前释放已创建的Native组件。
    entry.disposeNodeTreeOnMultiThread(this.rootSlot);
  }
  build() {
    Column() {
      // Native组件挂载点。
      ContentSlot(this.rootSlot)
    }
  }
}
@Entry
@Component
struct Index {
  @State isShow: boolean = false;
  @State message: string = "CreateNodeTree";
  build() {
    Flex() {
      Column() {
        Text('CreateNodeTreeOnMultiThread')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Button(this.message)
          .onClick(() => {
            this.isShow = !this.isShow;
            if (this.isShow) {
              this.message = "DisposeNodeTree"
            } else {
              this.message = "CreateNodeTree"
            }
          })
        if (this.isShow) {
          CAPIComponent()
        }
      }.width('100%')
    }.width('100%')
  }
}
```
```typescript
// index.d.ts
// entry/src/main/cpp/types/libentry/Index.d.ts
export const createNativeRoot: (content: Object) => void;
export const destroyNativeRoot: () => void;
export const createNodeTreeOnMultiThread: (content1: Object, content2: Object) => void;
export const disposeNodeTreeOnMultiThread: (content1: Object) => void;
```
```
\# CMakeLists.txt
# the minimum version of CMake.
cmake\_minimum\_required(VERSION 3.5.0)
project(ndk\_build\_on\_multi\_thread)
set(NATIVERENDER\_ROOT\_PATH ${CMAKE\_CURRENT\_SOURCE\_DIR})
if(DEFINED PACKAGE\_FIND\_FILE)
    include(${PACKAGE\_FIND\_FILE})
endif()
include\_directories(${NATIVERENDER\_ROOT\_PATH}
                    ${NATIVERENDER\_ROOT\_PATH}/include)
add\_library(entry SHARED napi\_init.cpp NativeEntry.cpp NativeModule.h ArkUIBaseNode.h ArkUINode.h ArkUIListNode.h ArkUIListItemNode.h ArkUITextNode.h NormalTextListExample.h CreateNode.h CreateNode.cpp)
target\_link\_libraries(entry PUBLIC libace\_napi.z.so libace\_ndk.z.so libhilog\_ndk.z.so)
```
```cpp
// NativeModule.h
#ifndef MYAPPLICATION\_NATIVEMODULE\_H
#define MYAPPLICATION\_NATIVEMODULE\_H
#include <arkui/native\_node.h>
#include <arkui/native\_interface.h>
#include <cassert>
namespace NativeModule {
class NativeModuleInstance {
public:
    static NativeModuleInstance \*GetInstance() {
        static NativeModuleInstance instance;
        return &instance;
    }
    NativeModuleInstance() {
        // 获取多线程NDK接口的函数指针结构体对象，用于后续操作。
        OH\_ArkUI\_GetModuleInterface(ARKUI\_MULTI\_THREAD\_NATIVE\_NODE, ArkUI\_NativeNodeAPI\_1, arkUINativeNodeApi\_);
        assert(arkUINativeNodeApi\_);
    }
    // 暴露给其他模块使用。
    ArkUI\_NativeNodeAPI\_1 \*GetNativeNodeAPI() { return arkUINativeNodeApi\_; }
private:
    ArkUI\_NativeNodeAPI\_1 \*arkUINativeNodeApi\_ = nullptr;
};
} // namespace NativeModule
#endif // MYAPPLICATION\_NATIVEMODULE\_H
```
```cpp
// CreateNode.h
#ifndef MYAPPLICATION\_CREATENODE\_H
#define MYAPPLICATION\_CREATENODE\_H
#include "ArkUINode.h"
#include <js\_native\_api.h>
namespace NativeModule {
// 封装Button组件。
class ArkUIButtonNode: public ArkUINode {
public:
    ArkUIButtonNode() :
        ArkUINode(NativeModuleInstance::GetInstance()->GetNativeNodeAPI()->createNode(ARKUI\_NODE\_BUTTON)) {}
    int32\_t SetLabel(ArkUI\_AttributeItem& label\_item) {
        return nativeModule\_->setAttribute(handle\_, NODE\_BUTTON\_LABEL, &label\_item);
    }
    int32\_t SetMargin(ArkUI\_AttributeItem& item) {
        return nativeModule\_->setAttribute(handle\_, NODE\_MARGIN, &item);
    }
};
// 封装Row组件。
class ArkUIRowNode: public ArkUINode {
public:
    ArkUIRowNode() :
        ArkUINode(NativeModuleInstance::GetInstance()->GetNativeNodeAPI()->createNode(ARKUI\_NODE\_ROW)) {}
};
// 封装Scroll组件。
class ArkUIScrollNode: public ArkUINode {
public:
    ArkUIScrollNode() :
        ArkUINode(NativeModuleInstance::GetInstance()->GetNativeNodeAPI()->createNode(ARKUI\_NODE\_SCROLL)) {}
};
// 封装Column组件。
class ArkUIColumnNode: public ArkUINode {
public:
    ArkUIColumnNode() :
        ArkUINode(NativeModuleInstance::GetInstance()->GetNativeNodeAPI()->createNode(ARKUI\_NODE\_COLUMN)) {}
};
// 多线程创建组件。
napi\_value CreateNodeTreeOnMultiThread(napi\_env env, napi\_callback\_info info);
// 释放多线程创建的组件。
napi\_value DisposeNodeTreeOnMultiThread(napi\_env env, napi\_callback\_info info);
} // namespace NativeModule
#endif // MYAPPLICATION\_CREATENODE\_H
```
```cpp
// CreateNode.cpp
#include "CreateNode.h"
#include <cstdint>
#include <hilog/log.h>
#include <map>
#include <thread>
#include <napi/native\_api.h>
#include <arkui/native\_node\_napi.h>
namespace NativeModule {
#define FRAMEWORK\_NODE\_TREE\_NUMBER 4 // 在框架线程创建组件树的数量。
#define USER\_NODE\_TREE\_NUMBER 3 // 在开发者线程创建组件树的数量。
struct AsyncData {
    napi\_env env;
    std::shared\_ptr<ArkUINode> parent = nullptr;
    std::shared\_ptr<ArkUINode> child = nullptr;
    std::string label = "";
};
// 保存ArkTs侧NodeContent指针与Native侧节点树根节点的对应关系。
std::map<ArkUI\_NodeContentHandle, std::shared\_ptr<ArkUIBaseNode>> g\_nodeMap;
ArkUI\_ContextHandle g\_contextHandle = nullptr;
// 创建组件树。
void CreateNodeTree(void \*asyncUITaskData) {
    auto asyncData = static\_cast<AsyncData\*>(asyncUITaskData);
    if (!asyncData) {
        return;
    }
    // 创建组件树根节点。
    auto rowNode = std::make\_shared<ArkUIRowNode>();
    asyncData->child = rowNode;
    // 创建button组件。
    auto buttonNode1 = std::make\_shared<ArkUIButtonNode>();
    ArkUI\_AttributeItem label\_item = { .string = asyncData->label.c\_str() };
    // 设置button组件的label属性。
    int32\_t result = buttonNode1->SetLabel(label\_item);
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "Button SetLabel Failed %{public}d", result);
    }
    ArkUI\_NumberValue value\[\] = {{.f32 = 5}, {.f32 = 5}, {.f32 = 5}, {.f32 = 5}};
    ArkUI\_AttributeItem item = {value, 4};
    // 设置button组件的margin属性。
    result = buttonNode1->SetMargin(item);
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "Button SetMargin Failed %{public}d", result);
    }
    // 设置button组件的width属性。
    buttonNode1->SetWidth(150);
   // 创建button组件。
    auto buttonNode2 = std::make\_shared<ArkUIButtonNode>();
    ArkUI\_AttributeItem label\_item2 = { .string = asyncData->label.c\_str() };
    // 设置button组件的label属性。
    result = buttonNode2->SetLabel(label\_item2);
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "Button SetLabel Failed %{public}d", result);
    }
    ArkUI\_NumberValue value2\[\] = {{.f32 = 5}, {.f32 = 5}, {.f32 = 5}, {.f32 = 5}};
    ArkUI\_AttributeItem item2 = {value2, 4};
    // 设置button组件的margin属性。
    result = buttonNode1->SetMargin(item2);
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "Button SetMargin Failed %{public}d", result);
    }
    // 设置button组件的width属性。
    buttonNode2->SetWidth(150);
    // 把组件挂载到组件树上。
    rowNode->AddChild(buttonNode1);
    rowNode->AddChild(buttonNode2);
}
// 把组件树挂载到UI组件主树上。
void MountNodeTree(void \*asyncUITaskData) {
    auto asyncData = static\_cast<AsyncData\*>(asyncUITaskData);
    if (!asyncData) {
        return;
    }
    auto parent = asyncData->parent;
    auto child = asyncData->child;
    // 把组件树挂载到UI组件主树上。
    parent->AddChild(child);
    delete asyncData;
}
void CreateNodeOnFrameworkThread(ArkUI\_ContextHandle contextHandle, std::shared\_ptr<ArkUIColumnNode> parent) {
    for (int i = 0; i < FRAMEWORK\_NODE\_TREE\_NUMBER; i++) {
        // UI线程创建子树根节点，保证scroll的子节点顺序。
        auto columnItem = std::make\_shared<ArkUIColumnNode>();
        parent->AddChild(columnItem);
        AsyncData\* asyncData = new AsyncData();
        asyncData->parent = columnItem;
        asyncData->label = "OnFwkThread";
        // 使用框架提供的非UI线程创建组件树，创建完成后回到UI线程挂载到主树上。
        int32\_t result = OH\_ArkUI\_PostAsyncUITask(contextHandle, asyncData, CreateNodeTree, MountNodeTree);
        if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
            OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_PostAsyncUITask Failed %{public}d", result);
            delete asyncData;
        }
    }
}
void CreateNodeOnUserThread(ArkUI\_ContextHandle contextHandle, std::shared\_ptr<ArkUIColumnNode> parent) {
    auto columnItem = std::make\_shared<ArkUIColumnNode>();
    parent->AddChild(columnItem);
    // 在开发者创建的非UI线程上创建组件树。
    std::thread userThread(\[columnItem, contextHandle\]() {
        for (int i = 0; i < USER\_NODE\_TREE\_NUMBER; i++) {
            AsyncData\* asyncData = new AsyncData();
            asyncData->parent = columnItem;
            asyncData->label = "OnUserThread1";
            CreateNodeTree(asyncData);
            // 组件树创建完成后回到UI线程挂载到主树上。
            int32\_t result = OH\_ArkUI\_PostUITask(contextHandle, asyncData, MountNodeTree);
            if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
                OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_PostUITask Failed %{public}d", result);
                delete asyncData;
            }
        }
    });
    userThread.detach();
}
void CreateNodeOnUserThreadAndWait(ArkUI\_ContextHandle contextHandle, std::shared\_ptr<ArkUIColumnNode> parent) {
    auto columnItem = std::make\_shared<ArkUIColumnNode>();
    parent->AddChild(columnItem);
    // 在开发者创建的非UI线程上创建组件树。
    std::thread userThread(\[columnItem, contextHandle\]() {
        for (int i = 0; i < USER\_NODE\_TREE\_NUMBER; i++) {
            AsyncData\* asyncData = new AsyncData();
            asyncData->parent = columnItem;
            asyncData->label = "OnUserThread2";
            CreateNodeTree(asyncData);
            // 组件树创建完成后回到UI线程挂载到主树上，等待挂载完成后继续创建剩余组件。
            int32\_t result = OH\_ArkUI\_PostUITaskAndWait(contextHandle, asyncData, MountNodeTree);
            if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
                OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_PostUITask Failed %{public}d", result);
                delete asyncData;
            }
        }
    });
    userThread.detach();
}
napi\_value CreateNodeTreeOnMultiThread(napi\_env env, napi\_callback\_info info) {
    size\_t argc = 2;
    napi\_value args\[2\] = { nullptr, nullptr };
    napi\_get\_cb\_info(env, info, &argc, args, nullptr, nullptr);
    // 获取ArkTs侧组件挂载点。
    ArkUI\_NodeContentHandle contentHandle;
    int32\_t result = OH\_ArkUI\_GetNodeContentFromNapiValue(env, args\[0\], &contentHandle);
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_GetNodeContentFromNapiValue Failed %{public}d", result);
        return nullptr;
    }
    // 获取上下文对象指针。
    if (!g\_contextHandle) {
        result = OH\_ArkUI\_GetContextFromNapiValue(env, args\[1\], &g\_contextHandle);
        if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
            OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_GetContextFromNapiValue Failed %{public}d", result);
            delete g\_contextHandle;
            g\_contextHandle = nullptr;
            return nullptr;
        }
    }
    // 创建Native侧组件树根节点。
    auto scrollNode = std::make\_shared<ArkUIScrollNode>();
    // 将Native侧组件树根节点挂载到UI主树上。
    result = OH\_ArkUI\_NodeContent\_AddNode(contentHandle, scrollNode->GetHandle());
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_NodeContent\_AddNode Failed %{public}d", result);
        return nullptr;
    }
    // 保存Native侧组件树。
    g\_nodeMap\[contentHandle\] = scrollNode;
    auto columnNode = std::make\_shared<ArkUIColumnNode>();
    scrollNode->AddChild(columnNode);
    // 在框架提供的线程池中创建组件。
    CreateNodeOnFrameworkThread(g\_contextHandle,columnNode);
    // 在开发者创建的非UI线程中创建组件。
    CreateNodeOnUserThread(g\_contextHandle,columnNode);
    CreateNodeOnUserThreadAndWait(g\_contextHandle,columnNode);
    return nullptr;
}
napi\_value DisposeNodeTreeOnMultiThread(napi\_env env, napi\_callback\_info info)
{
    size\_t argc = 1;
    napi\_value args\[1\] = { nullptr };
    napi\_get\_cb\_info(env, info, &argc, args, nullptr, nullptr);
    // 获取ArkTs侧组件挂载点。
    ArkUI\_NodeContentHandle contentHandle;
    int32\_t result = OH\_ArkUI\_GetNodeContentFromNapiValue(env, args\[0\], &contentHandle);
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_GetNodeContentFromNapiValue Failed %{public}d", result);
        return nullptr;
    }
    auto it = g\_nodeMap.find(contentHandle);
    if (it == g\_nodeMap.end()) {
        return nullptr;
    }
    auto rootNode = it->second;
    // 将Native侧组件树根节点从UI主树上卸载。
    result = OH\_ArkUI\_NodeContent\_RemoveNode(contentHandle, rootNode->GetHandle());
    if (result != ARKUI\_ERROR\_CODE\_NO\_ERROR) {
        OH\_LOG\_ERROR(LOG\_APP, "OH\_ArkUI\_NodeContent\_RemoveNode Failed %{public}d", result);
        return nullptr;
    }
    // 释放Native侧组件树。
    g\_nodeMap.erase(contentHandle);
    return nullptr;
}
} // namespace NativeModule
```
```cpp
// napi\_init.cpp
#include "napi/native\_api.h"
#include "NativeEntry.h"
#include "CreateNode.h"
EXTERN\_C\_START
static napi\_value Init(napi\_env env, napi\_value exports)
{
    // 绑定Native侧的创建组件和销毁组件。
    napi\_property\_descriptor desc\[\] = {
        {"createNativeRoot", nullptr,
        NativeModule::CreateNativeRoot, nullptr, nullptr,
        nullptr, napi\_default, nullptr},
        {"destroyNativeRoot", nullptr,
        NativeModule::DestroyNativeRoot, nullptr, nullptr,
        nullptr, napi\_default, nullptr},
        {"createNodeTreeOnMultiThread", nullptr,
        NativeModule::CreateNodeTreeOnMultiThread, nullptr, nullptr,
        nullptr, napi\_default, nullptr},
        {"disposeNodeTreeOnMultiThread", nullptr,
        NativeModule::DisposeNodeTreeOnMultiThread, nullptr, nullptr,
        nullptr, napi\_default, nullptr}
    };
    napi\_define\_properties(env, exports, sizeof(desc) / sizeof(desc\[0\]), desc);
    return exports;
}
EXTERN\_C\_END
static napi\_module demoModule = {
    .nm\_version = 1,
    .nm\_flags = 0,
    .nm\_filename = nullptr,
    .nm\_register\_func = Init,
    .nm\_modname = "entry",
    .nm\_priv = ((void \*)0),
    .reserved = {0},
};
extern "C" \_\_attribute\_\_((constructor)) void RegisterEntryModule(void) { napi\_module\_register(&demoModule); }
```

## 示例代码

如下实例展示了在高负载组件创建场景下如何使用多线程NDK接口，将组件创建任务拆分成多个子任务，分派给多个线程并发执行来优化页面跳转场景的响应时延和完成时延。

[使用NDK多线程创建UI组件](https://gitcode.com/HarmonyOS_Samples/guide-snippets/tree/master/ArkUISample/NdkBuildOnMultiThread)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ndk-build-on-multi-thread*