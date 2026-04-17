---
title: 应用启动框架AppStartup
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup
category: 指南
updated_at: 2026-03-12T03:22:26.051Z
---

# 应用启动框架AppStartup

## 概述

应用启动时通常需要执行一系列初始化启动任务，如果将启动任务都放在[HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hap-package)的[UIAbility](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-uiability)组件的[onCreate](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-uiability#oncreate)生命周期中，那么只能在主线程中依次执行，不但影响应用的启动速度，而且当启动任务过多时，任务之间复杂的依赖关系还会使得代码难以维护。

AppStartup提供了一种简单高效的应用启动方式，可以支持任务的异步启动，加快应用启动速度。同时，通过在一个配置文件中统一设置多个启动任务的执行顺序以及依赖关系，让执行启动任务的代码变得更加简洁清晰、容易维护。

## 运行机制

启动框架支持以自动模式或手动模式执行启动任务，默认采用自动模式。在构造[AbilityStage](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ability-terminology#abilitystage)过程中开始加载开发者配置的启动任务，以自动模式执行启动任务。开发者也可以在AbilityStage创建完后调用[startupManager.run](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startupmanager#startupmanagerrun)方法，执行手动模式的启动任务。

**图1** 启动框架执行时机

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/uFuZCaG8QcS8C3e5FhqGEw/zh-cn_image_0000002558044601.png?HW-CC-KV=V1&HW-CC-Date=20260312T032200Z&HW-CC-Expire=86400&HW-CC-Sign=6CB8551FF81BEC8ED0AFCA89846A0B72BFFDFFF92A922F3D427CF34D1F1BB2BD)

## 支持的范围

-   HAP：entry类型的HAP支持以自动和手动模式启动。从API version 20开始，feature类型的HAP支持以自动和手动模式启动。
    
-   HSP/HAR: 从API version 18开始，支持在[HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/in-app-hsp)和[HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-package)中配置启动任务。HSP和HAR的启动任务、so预加载任务无法主动配置为自动模式，但可以被HAP中自动模式的启动任务、so预加载任务拉起。
    
-   启动框架从API 18开始支持配置so预加载任务，so文件开发可以参考[Node-API](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/use-napi-process)创建Native C++工程。
    

## 约束限制

-   使用启动框架必须在[HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hap-package)的[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)中开启启动框架。
    
-   ExtensionAbility组件启动场景单一，使用启动框架会带来额外开销，因此不支持ExtensionAbility组件启动时拉起启动框架。
    
-   启动任务之间或so预加载任务之间不允许存在循环依赖。
    

## 开发流程

1.  [定义启动框架配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动框架配置文件)：在资源文件目录下创建并定义启动框架配置文件。
    
    1.  [创建启动框架配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#创建启动框架配置文件)：在资源文件目录下创建启动框架配置文件，并在[module.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)配置文件中引用。
    2.  [定义启动参数配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动参数配置)：在启动框架配置文件中添加启动参数的配置信息。
    3.  [定义启动任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置)：在启动框架配置文件中添加启动任务的配置信息
    4.  [定义预加载so任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义预加载so任务配置)：在启动框架配置文件中添加预加载so任务的配置信息。
2.  [设置启动参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#设置启动参数)：在启动参数文件中，设置超时时间和启动任务的监听器等参数。
    
3.  [为每个待初始化功能组件添加启动任务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#为每个待初始化功能组件添加启动任务)：通过实现[StartupTask](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startuptask)接口，启动框架将会按顺序执行初始化流程。
    
4.  [可选操作](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#可选操作)：开发者可以在复杂场景下更精细地控制启动框架的行为。
    
    -   [HSP与HAR中使用启动框架](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#hsp与har中使用启动框架)：在HSP与HAR中配置启动任务、so预加载任务。实现跨模块的启动任务依赖管理，提升大型应用的启动效率和代码可维护性。
    -   [修改启动模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#修改启动模式)：将启动任务、so预加载任务修改为手动模式，灵活控制任务执行时机，避免不必要的启动开销。
    -   [添加任务匹配规则](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#添加任务匹配规则)：根据场景通过匹配规则过滤启动任务。精准控制任务执行范围，避免加载无关任务。
    -   [设置启动任务调度阶段](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#设置启动任务调度阶段)：设置启动任务的调度阶段，提前执行任务，节省启动时间。

## 定义启动框架配置文件

### 创建启动框架配置文件

1.  在[HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hap-package)的“resources/base/profile”路径下，新建启动框架配置文件。文件名可以自定义，本文以"startup\_config.json"为例。
    
2.  在[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)的appStartup标签中，添加启动框架配置文件的索引。
    
    module.json5示例代码如下。
    
    ```cangjie
    {
      "module": {
        "name": "entry",
        "type": "entry",
        // ···
        "appStartup": "$profile:startup_config", // 启动框架的配置文件
        // ···
      }
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/entry/src/main/module.json5#L15-L72)
    

### 定义启动参数配置

在启动框架配置文件startup\_config.json中，可以添加启动参数的配置信息。

1.  在工程的“ets”目录下创建“startup”文件夹，并在“ets/startup”路径下创建启动参数配置文件。本例中，启动参数配置文件的文件名为StartupConfig.ets。
    
2.  在启动框架配置文件startup\_config.json中，添加启动参数配置文件的相关信息。
    
    startup\_config.json文件示例如下：
    
    ```cangjie
    {
      "startupTasks": [
        // 启动任务
      ],
      "appPreloadHintStartupTasks": [
        // 预加载so任务
      ],
      "configEntry": "./ets/startup/StartupConfig.ets" // 启动参数的配置
    }
    ```
    

**表1** startup\_config.json配置文件标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| startupTasks | [定义启动任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置) | 对象数组 | 该标签可缺省，缺省值为空。 |
| appPreloadHintStartupTasks | [定义预加载so任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义预加载so任务配置) | 对象数组 | 该标签可缺省，缺省值为空。 |
| configEntry | [设置启动参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#设置启动参数) | 字符串 | 该标签不可缺省。 |

### 定义启动任务配置

假设当前应用启动框架共包含6个启动任务，任务之间的依赖关系如下图所示。为了便于并发执行启动任务，单个启动任务文件包含的启动任务应尽量单一，本例中每个启动任务对应一个启动任务文件。

**图2** 启动任务依赖关系图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/28/v3/MbtS7bI1TqG0C1jNQE2gww/zh-cn_image_0000002526884790.png?HW-CC-KV=V1&HW-CC-Date=20260312T032200Z&HW-CC-Expire=86400&HW-CC-Sign=F178964668BCFF529DAF984998885CAA87E6C50A1071EA9BDD542BC3D55DE6A4)

1.  在“ets/startup”路径下，依次创建6个启动任务文件。文件名称必须确保唯一性。本例中的6个文件名分别为StartupTask\_001.ets~StartupTask\_006.ets。
    
2.  在启动框架配置文件startup\_config.json中，添加启动任务配置。
    
    startup\_config.json文件示例如下：
    
    ```cangjie
    {
      "startupTasks": [
        {
          "name": "StartupTask_001",
          "srcEntry": "./ets/startup/StartupTask_001.ets",
          "dependencies": [
            "StartupTask_002",
            "StartupTask_003"
          ],
          "runOnThread": "taskPool",
          "waitOnMainThread": false
        },
        {
          "name": "StartupTask_002",
          "srcEntry": "./ets/startup/StartupTask_002.ets",
          "dependencies": [
            "StartupTask_003",
            "StartupTask_004"
          ],
          "runOnThread": "taskPool",
          "waitOnMainThread": false
        },
        {
          "name": "StartupTask_003",
          "srcEntry": "./ets/startup/StartupTask_003.ets",
          "dependencies": [
            "StartupTask_004"
          ],
          "runOnThread": "taskPool",
          "waitOnMainThread": false
        },
        {
          "name": "StartupTask_004",
          "srcEntry": "./ets/startup/StartupTask_004.ets",
          "runOnThread": "taskPool",
          "waitOnMainThread": false
        },
        {
          "name": "StartupTask_005",
          "srcEntry": "./ets/startup/StartupTask_005.ets",
          "dependencies": [
            "StartupTask_006"
          ],
          "runOnThread": "mainThread",
          "waitOnMainThread": true,
          "excludeFromAutoStart": true
        },
        {
          "name": "StartupTask_006",
          "srcEntry": "./ets/startup/StartupTask_006.ets",
          "runOnThread": "mainThread",
          "waitOnMainThread": false,
          "excludeFromAutoStart": true
        }
      ],
      "appPreloadHintStartupTasks": [
        // 预加载so任务
      ],
      "configEntry": "./ets/startup/StartupConfig.ets"
    }
    ```
    

**表2** startupTasks标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 启动任务名称，可自定义，推荐与类名保持一致。 | 字符串 | 该标签不可缺省。 |
| srcEntry | [文件名混淆](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/source-obfuscation#section-enable-filename-obfuscation) | 字符串 | 该标签不可缺省。 |
| dependencies | 启动任务依赖的其他启动任务的类名数组。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| excludeFromAutoStart | [修改启动模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#修改启动模式) | 布尔值 | 该标签可缺省，缺省值为false。 |
| runOnThread | 执行初始化所在的线程。- mainThread：在主线程中执行。- taskPool：在异步线程中执行。 | 字符串 | 该标签可缺省，缺省值为mainThread。 |
| waitOnMainThread | 主线程是否需要等待启动框架执行。当runOnThread取值为taskPool时，该字段生效。- true：主线程等待启动框架执行完之后，才会加载应用首页。- false：主线程不等待启动任务执行。 | 布尔值 | 该标签可缺省，缺省值为true。 |
| matchRules | [添加任务匹配规则](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#添加任务匹配规则) | 对象 | 该标签可缺省。 |
| schedulerPhase | [设置启动任务调度阶段](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#设置启动任务调度阶段) | 字符串 | 该标签可缺省，缺省值为postAbilityStageLoad。 |

### 定义预加载so任务配置

假设当前应用启动框架共包含6个so预加载任务，任务之间的依赖关系如下图所示。不建议应用在so文件的加载回调中运行代码逻辑，so文件的加载不宜过长，否则会影响主线程的运行。

**图3** so预加载任务依赖关系图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/sjGvAFQ4TBOtZhXlmdyPwQ/zh-cn_image_0000002557924637.png?HW-CC-KV=V1&HW-CC-Date=20260312T032200Z&HW-CC-Expire=86400&HW-CC-Sign=00DD7475064FFCF06FC059F936FF0DC879766DA83D2B0F1AB8F387CA0A9DDF67)

1.  参考[Node-API](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/use-napi-process)创建so文件。本例中的6个so文件名称分别为libentry\_001.so~libentry\_006.so。
    
2.  在启动框架配置文件startup\_config.json中，添加预加载so任务配置。
    
    startup\_config.json文件示例如下：
    
    ```cangjie
    {
      "startupTasks": [
        // 启动任务
      ],
      "appPreloadHintStartupTasks": [
        {
          "name": "libentry_001",
          "srcEntry": "libentry_001.so",
          "dependencies": [
            "libentry_002",
            "libentry_003"
          ],
          "runOnThread": "taskPool"
        },
        {
          "name": "libentry_002",
          "srcEntry": "libentry_002.so",
          "dependencies": [
            "libentry_003",
            "libentry_004"
          ],
          "runOnThread": "taskPool"
        },
        {
          "name": "libentry_003",
          "srcEntry": "libentry_003.so",
          "dependencies": [
            "libentry_004"
          ],
          "runOnThread": "taskPool"
        },
        {
          "name": "libentry_004",
          "srcEntry": "libentry_004.so",
          "runOnThread": "taskPool"
        },
        {
          "name": "libentry_005",
          "srcEntry": "libentry_005.so",
          "dependencies": [
            "libentry_006"
          ],
          "runOnThread": "taskPool",
          "excludeFromAutoStart": true
        },
        {
          "name": "libentry_006",
          "srcEntry": "libentry_006.so",
          "runOnThread": "taskPool",
          "excludeFromAutoStart": true
        }
      ],
      "configEntry": "./ets/startup/StartupConfig.ets"
    }
    ```
    

**表3** appPreloadHintStartupTasks标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 预加载so文件名。 | 字符串 | 该标签不可缺省。 |
| srcEntry | 带后缀预加载so文件名。 | 字符串 | 该标签不可缺省。 |
| dependencies | 预加载任务依赖的其他预加载任务的so名数组。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| excludeFromAutoStart | [修改启动模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#修改启动模式) | 布尔值 | 该标签可缺省，缺省值为false。 |
| runOnThread | 执行预加载所在的线程。- taskPool：在异步线程中执行。说明：so预加载只允许在taskPool线程执行。 | 字符串 | 该标签不可缺省。 |
| matchRules | [添加任务匹配规则](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#添加任务匹配规则) | 对象 | 该标签可缺省。 |

## 设置启动参数

在启动参数配置文件（本文为“ets/startup/StartupConfig.ets”文件）中，使用[StartupConfigEntry](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startupconfigentry)接口实现启动框架公共参数的配置，包括超时时间和启动任务的监听器等参数，其中需要用到如下接口：

-   [StartupConfig](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startupconfig)：用于设置任务超时时间和启动框架的监听器。
-   [StartupListener](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startuplistener)：用于监听启动任务是否执行成功。

```TypeScript
import { StartupConfig, StartupConfigEntry, StartupListener } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
export default class MyStartupConfigEntry extends StartupConfigEntry {
  onConfig() {
    hilog.info(0x0000, 'testTag', `onConfig`);
    let onCompletedCallback = (error: BusinessError<void>) => {
      hilog.info(0x0000, 'testTag', `onCompletedCallback`);
      if (error) {
        hilog.error(0x0000, 'testTag', 'onCompletedCallback: %{public}d, message: %{public}s', error.code,
          error.message);
      } else {
        hilog.info(0x0000, 'testTag', `onCompletedCallback: success.`);
      }
    };
    let startupListener: StartupListener = {
      'onCompleted': onCompletedCallback
    };
    let config: StartupConfig = {
      'timeoutMs': 10000,
      'startupListener': startupListener
    };
    return config;
  }
// ···
}
```

[StartupConfig.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/entry/src/main/ets/startup/StartupConfig.ets#L15-L56)

## 为每个待初始化功能组件添加启动任务

上述操作中已完成启动框架配置文件、启动参数的配置，还需要在每个功能组件对应的启动任务文件中，通过实现[StartupTask](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startuptask)来添加启动任务。其中，需要用到下面的两个方法：

-   [init](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startuptask#init)：启动任务初始化。当该任务依赖的启动任务全部执行完毕，即onDependencyCompleted完成调用后，才会执行init方法对该任务进行初始化。
-   [onDependencyCompleted](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startuptask#ondependencycompleted)：当前任务依赖的启动任务执行完成时，调用该方法。

下面以[startup\_config.json](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置)中的StartupTask\_001.ets文件为例，示例代码如下。开发者需要分别为每个待初始化功能组件添加启动任务。

说明

由于StartupTask采用了[Sendable协议](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-sendable#sendable协议)，在继承该接口时，必须添加Sendable注解。

```TypeScript
import { StartupTask, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
@Sendable
export default class StartupTask_001 extends StartupTask {
  constructor() {
    super();
  }
  async init(context: common.AbilityStageContext) {
    hilog.info(0x0000, 'testTag', 'StartupTask_001 init.');
    return 'StartupTask_001';
  }
  onDependencyCompleted(dependence: string, result: Object): void {
    hilog.info(0x0000, 'testTag', 'StartupTask_001 onDependencyCompleted, dependence: %{public}s, result: %{public}s',
      dependence, JSON.stringify(result));
  }
}
```

[StartupTask\_001.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/entry/src/main/ets/startup/StartupTask_001.ets#L15-L35)

## 可选操作

### HSP与HAR中使用启动框架

通常大型应用会有多个[HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/in-app-hsp)和[HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-package)，本节将提供一个应用示例，以展示如何在HSP包和HAR包中使用启动框架。该示例应用包括两个HSP包（hsp1、hsp2）和一个HAR包（har1），并且包含启动任务和so预加载任务。

开发步骤如下：

1.  除[HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hap-package)外，在HSP包和HAR包的“resources/base/profile”目录下创建启动框架配置文件，不同模块可以使用相同文件名，本文以"startup\_config.json"为例。
    
2.  分别在各个模块的启动框架配置文件startup\_config.json中， 添加对应的配置信息。
    
    假设当前应用存在的启动任务与so预加载任务如下表所示。
    
    **表4** 应用启动任务与so预加载任务说明
    
    | 模块 | 启动任务 | so预加载任务 |
    | --- | --- | --- |
    | entry | HAP_Task_01 | libentry_01 |
    | hsp1 | HSP1_Task_01HSP1_Task_02 | libhsp1_01libhsp1_02 |
    | hsp2 | HSP2_Task_01 | libhsp2_01 |
    | har | HAR1_Task_01 | libhar1_01 |
    
    **图4** 启动任务与so预加载依赖关系图
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/99/v3/ePWjmIZaRsGQNrUlUWrX7A/zh-cn_image_0000002527044722.png?HW-CC-KV=V1&HW-CC-Date=20260312T032200Z&HW-CC-Expire=86400&HW-CC-Sign=AF5A485A1C2C826517530ADB63D68780B1C3EC705A5689028F38CB9D577A97FC)
    
    [HAP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hap-package)的startup\_config.json可参考[定义启动任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置)，HSP与HAR的startup\_config.json文件无法配置"configEntry"字段，以hsp1包配置文件为例，示例如下：
    
    ```json
    {
      "startupTasks": [
        {
          "name": "HSP1_Task_01",
          "srcEntry": "./ets/startup/HSP1_Task_01.ets",
          "dependencies": [
            "HSP1_Task_02",
            "HAR1_Task_01"
          ],
          "runOnThread": "taskPool",
          "waitOnMainThread": false,
          "excludeFromAutoStart": true
        }
      ],
      "appPreloadHintStartupTasks": [
        {
          "name": "libhsp1_01",
          "srcEntry": "libhsp1_01.so",
          "dependencies": [
            "libhsp1_02",
            "libhar1_01"
          ],
          "runOnThread": "taskPool",
          "excludeFromAutoStart": true
        }
      ]
    }
    ```
    
3.  分别在各个模块的[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)的appStartup标签中，添加启动框架配置文件的索引。
    
    hsp1、hsp2以及har1的module.json5示例代码如下。
    
    ```cangjie
    {
      "module": {
        "name": "hsp1",
        "type": "shared",
        // ···
        "appStartup": "$profile:startup_config", // 启动框架的配置文件
        // ···
      }
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/hsp1/src/main/module.json5#L15-L34)
    
    ```cangjie
    {
      "module": {
        "name": "hsp2",
        "type": "shared",
        // ···
        "appStartup": "$profile:startup_config", // 启动框架的配置文件
        // ···
      }
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/hsp2/src/main/module.json5#L15-L34)
    
    ```cangjie
    {
      "module": {
        "name": "har1",
        "type": "har",
        // ···
        "appStartup": "$profile:startup_config", // 启动框架的配置文件
      }
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/har1/src/main/module.json5#L15-L29)
    

其余步骤请参考[设置启动参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#设置启动参数)和[为每个待初始化功能组件添加启动任务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#为每个待初始化功能组件添加启动任务)章节进行配置。

### 修改启动模式

AppStartup分别提供了自动和手动两种方式来执行启动任务，entry模块中默认采用自动模式，开发者可以根据需要修改为手动模式，HSP与HAR只能配置为手动模式。

-   自动模式：当AbilityStage完成创建后，自动执行启动任务。
-   手动模式：在UIAbility完成创建后手动调用，来执行启动任务与so预加载任务。对于某些使用频率不高的模块，不需要应用最开始启动时就进行初始化。开发者可以选择将该部分启动任务修改为手动模式，在应用启动完成后调用[startupManager.run](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startupmanager#startupmanagerrun)方法来执行启动任务与so预加载任务。

下面以UIAbility的onCreate生命周期中为例，介绍如何采用手动模式来启动任务，示例代码如下。

```TypeScript
import { AbilityConstant, UIAbility, Want, startupManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
// ···
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let startParams = ['StartupTask_005', 'StartupTask_006'];
    try {
      startupManager.run(startParams).then(() => {
        console.info(`StartupTest startupManager run then, startParams = ${JSON.stringify(startParams)}.`);
      }).catch((error: BusinessError) => {
        console.error(`StartupTest promise catch error, error = ${JSON.stringify(error)}.`);
        console.error(`StartupTest promise catch error, startParams = ${JSON.stringify(startParams)}.`);
      })
    } catch (error) {
      let errMsg = (error as BusinessError).message;
      let errCode = (error as BusinessError).code;
      console.error(`Startup catch error, errCode= ${errCode}.`);
      console.error(`Startup catch error, errMsg= ${errMsg}.`);
    }
  }
// ···
}
```

[EntryAbility.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/entry/src/main/ets/entryability/EntryAbility.ets#L15-L77)

开发者还可以在页面加载完成后，在页面中调用启动框架手动模式，示例代码如下。

```TypeScript
import { startupManager } from '@kit.AbilityKit';
@Entry
@Component
struct Index {
  @State message: ResourceStr = $r('app.string.manual_mode'); // $r('app.string.manual_mode')为开发者自定义资源
  @State startParams1: Array<string> = ['StartupTask_006'];
  @State startParams2: Array<string> = ['libentry_006'];
  build() {
    RelativeContainer() {
      Button(this.message)
        .id('AppStartup')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          if (!startupManager.isStartupTaskInitialized('StartupTask_006')) { // 判断是否已经完成初始化
            startupManager.run(this.startParams1);
          }
          if (!startupManager.isStartupTaskInitialized('libentry_006')) {
            startupManager.run(this.startParams2);
          }
        })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}
```

[Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/entry/src/main/ets/pages/Index.ets#L15-L48)

### 添加任务匹配规则

在通过卡片、通知、意图调用等方式拉起某个页面时，为了实现功能服务一步直达，可以通过添加matchRules匹配规则，仅加载与当前场景相关的部分启动任务，无需加载全部默认的自动启动任务，以提高启动性能。

可以通过以下两种方式添加匹配规则：

-   通过matchRules中的uris、actions、insightIntents字段，根据UIAbility启动时的uri、action或意图名称，匹配不同场景启动任务及预加载so任务。
    
-   如果上述方式不能满足需求，可以通过matchRules中的customization自定义匹配规则。
    
    **表5** matchRules标签说明
    
    | 属性名称 | 含义 | 数据类型 | 是否可缺省 | 适用场景 |
    | --- | --- | --- | --- | --- |
    | uris | [Want](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-want) | 字符串数组 | 可缺省，缺省值为空。 | 通过特定uri拉起UIAbility的场景。 |
    | actions | [Want](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-want) | 字符串数组 | 可缺省，缺省值为空。 | 通过特定action拉起UIAbility的场景。 |
    | insightIntents | 表示自动模式执行的任务的意图名称取值范围。当UIAbility启动时，会将意图名称与此处配置的insightIntents数组取值进行匹配。 | 字符串数组 | 可缺省，缺省值为空。 | 通过特定意图名称拉起UIAbility的场景。 |
    | customization | [onRequestCustomMatchRule](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startupconfigentry#onrequestcustommatchrule20) | 字符串数组 | 可缺省，缺省值为空。 | 如果使用uris、actions、insightIntents字段无法满足要求，可以使用customization自定义规则。 |
    
    说明
    
    -   uris、insightIntents、actions、customization任一属性匹配成功即为任务匹配成功。
    -   匹配成功的任务及其依赖任务都将在自动模式执行。
    -   所有任务均匹配失败，则按任务的excludeFromAutoStart配置处理。
    

下面以uri匹配（action和意图名称类似）和customization匹配来举例，介绍如何实现添加任务匹配规则来筛选启动任务。

**场景1：uri匹配**

假定需要用户点击通知消息跳转到通知详情页面时，仅自动执行StartupTask\_004和libentry\_006任务。若启动通知详情UIAbility时Want中的uri属性为test://com.example.startupdemo/notification，可以通过uri匹配。示例如下：

1.  对[定义启动任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置)步骤中的startup\_config.json文件进行修改，增加StartupTask\_004任务和libentry\_006任务的matchRules配置。
    
    ```cangjie
    {
      "startupTasks": [
        {
          "name": "StartupTask_004",
          "srcEntry": "./ets/startup/StartupTask_004.ets",
          "runOnThread": "taskPool",
          "waitOnMainThread": false,
          "matchRules": {
            "uris": [
              "test://com.example.startupdemo/notification"
            ]
          }
        },
      ],
      "appPreloadHintStartupTasks": [
        {
          "name": "libentry_006",
          "srcEntry": "libentry_006.so",
          "runOnThread": "taskPool",
          "excludeFromAutoStart": true,
          "matchRules": {
            "uris": [
              "test://com.example.startupdemo/notification"
            ]
          }
        }
      ],
      "configEntry": "./ets/startup/StartupConfig.ets"
    }
    ```
    

**场景2：customization匹配**

假定需要用户点击天气卡片跳转到天气界面时，仅自动执行StartupTask\_006启动任务和excludeFromAutoStart=false配置的预加载so任务。若启动天气UIAbility时Want中传入的自定义参数fromType为card，可以通过customization匹配。示例如下：

1.  对[设置启动参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#设置启动参数)步骤中的MyStartupConfigEntry.ets文件进行修改，新增[onRequestCustomMatchRule](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-appstartup-startupconfigentry#onrequestcustommatchrule20)方法。
    
    ```TypeScript
    import { StartupConfigEntry, Want } from '@kit.AbilityKit';
    // ···
    export default class MyStartupConfigEntry extends StartupConfigEntry {
    // ···
      onRequestCustomMatchRule(want: Want): string {
        if (want?.parameters?.fromType == 'card') {
          return 'ruleCard';
        }
        return '';
      }
    }
    ```
    
    [StartupConfig.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Ability/AppStartup/entry/src/main/ets/startup/StartupConfig.ets#L16-L55)
    
2.  对[定义启动任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置)步骤中的startup\_config.json文件进行修改，增加StartupTask\_006任务的matchRules配置。预加载so任务不支持customization字段，按任务原有的excludeFromAutoStart配置处理。
    
    ```json
    {
      "startupTasks": [
        {
          "name": "StartupTask_006",
          "srcEntry": "./ets/startup/StartupTask_006.ets",
          "runOnThread": "mainThread",
          "waitOnMainThread": false,
          "excludeFromAutoStart": true,
          "matchRules": {
            "customization": [
              "ruleCard"
            ]
          }
        }
      ],
      "configEntry": "./ets/startup/StartupConfig.ets"
    }
    ```
    

### 设置启动任务调度阶段

从API version 21开始，支持设置启动任务调度阶段。启动任务默认在AbilityStage模块加载后、[AbilityStage.onCreate](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-abilitystage#oncreate)生命周期之前开始执行。对于大型应用，AbilityStage模块的加载可能耗时较长，开发者可以将启动任务的schedulerPhase字段配置为preAbilityStageLoad，使启动任务在AbilityStage模块加载前被调度，并在异步线程中与AbilityStage模块加载并发执行，从而缩短应用启动时间。

说明

由于启动任务在AbilityStage模块加载前被调度执行，改变了原有的执行顺序。如果启动任务依赖于AbilityStage模块的加载，可能会导致运行结果不符合预期，请参考[模块加载副作用及优化](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-module-side-effects)对依赖部分进行适配。

例如，应用首页需要通过网络请求获取Feed流数据，且希望该任务能在异步线程中与AbilityStage模块加载并发执行。假设网络请求任务为[定义启动任务配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup#定义启动任务配置)步骤中的StartupTask\_004，开发步骤如下：

1.  配置任务在AbilityStage模块加载前调度执行。在startup\_config.json文件中，将StartupTask\_004任务的schedulerPhase字段设为preAbilityStageLoad。
2.  配置任务在异步线程中与AbilityStage模块加载并发执行。将StartupTask\_004任务的runOnThread设为taskPool，waitOnMainThread设为false。

```json
{
  "startupTasks": [
    {
      "name": "StartupTask_004",
      "srcEntry": "./ets/startup/StartupTask_004.ets",
      "runOnThread": "taskPool",
      "waitOnMainThread": false,
      "schedulerPhase": "preAbilityStageLoad"
    }
  ],
  "configEntry": "./ets/startup/StartupConfig.ets"
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup*