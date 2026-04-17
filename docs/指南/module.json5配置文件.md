---
title: module.json5配置文件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file
category: 指南
updated_at: 2026-03-12T02:51:53.298Z
---

# module.json5配置文件

模块级配置文件，包含模块的基本配置信息、UIAbility组件和ExtensionAbility组件信息，以及应用运行过程中需要的权限信息，用于向编译工具、操作系统和应用市场提供应用的基本信息。每个模块下必须包括一个module.json5配置文件，文件所在目录为工程名称/模块名称（例如entry）/src/main/module.json5。

说明

配置文件中的示例代码直接拷贝到工程中可能编译不通过，请开发者根据需求进行配置。例如：通过$符号引用的资源文件如果工程中不存在，需要开发者手动添加或替换为实际的资源文件。

配置文件中，字段可以重复，以最后一个配置为准。

## 配置文件示例

通过一个示例，整体了解module.json5配置文件。

```cangjie
{
  "module": {
    "name": "entry",
    "type": "entry",
    "description": "$string:module_desc",
    "mainElement": "EntryAbility",
    "deviceTypes": [
      "tv",
      "tablet"
    ],
    "deliveryWithInstall": true,
    "pages": "$profile:main_pages", // 资源配置，指向profile下面定义的配置文件main_pages.json
    "appStartup": "$profile:app_startup_config",
    "metadata": [
      {
        "name": "string",
        "value": "string",
        "resource": "$profile:distributionFilter_config"
      },
      // ...
    ],
    "abilities": [
      {
        "name": "EntryAbility",
        "srcEntry": "./ets/entryability/EntryAbility.ets",
        "description": "$string:EntryAbility_desc",
        "icon": "$media:layered_image",
        "label": "$string:EntryAbility_label",
        "startWindow": "$profile:start_window",
        "startWindowIcon": "$media:icon",
        "startWindowBackground": "$color:start_window_background",
        "exported": true,
        "skills": [
          // ...
          {
            "entities": [
              "entity.system.home"
            ],
            "actions": [
              "ohos.want.action.home"
            ]
          }
        ],
        // ...
        "continueType": [
          "continueType1"
        ],
        "continueBundleName": [
          "com.example.myapplication1",
          "com.example.myapplication2"
        ],
      }
    ],
    "requestPermissions": [
      {
        "name": "ohos.permission.ACCESS_BLUETOOTH",
        "reason": "$string:reason",
        "usedScene": {
          "abilities": [
            "EntryAbility"
          ],
          "when": "inuse"
        }
      }
    ],
    "querySchemes": [
      "app1Scheme",
      "app2Scheme"
    ],
    "routerMap": "$profile:router_map",
    "appEnvironments": [
      {
        "name": "name1",
        "value": "value1"
      }
    ],
    "fileContextMenu": "$profile:menu", // 资源配置，指向profile下面定义的配置文件menu.json
    "crossAppSharedConfig": "$profile:shared_config",
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L16-L186)

## 配置文件标签

module.json5配置文件包含以下标签。

**表1** module.json5配置文件标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | [文件管理接口](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-file-fs) | 字符串 | 该标签不可缺省。 |
| type | 标识当前Module的类型。支持的取值如下：- entry：应用的主模块。- feature：应用的动态特性模块。- har：静态共享包模块。- shared：动态共享包模块。 | 字符串 | 该标签不可缺省。 |
| srcEntry | [AbilityStage组件容器](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/abilitystage) | 字符串 | 该标签可缺省，缺省值为空。 |
| description | 标识当前Module的描述信息，开发者可以通过该标签描述当前模块的功能与作用，取值为长度不超过255字节的字符串，可以采用字符串资源索引格式。 | 字符串 | 该标签可缺省，缺省值为空。 |
| mainElement | [abilities](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#abilities标签) | 字符串 | 该标签可缺省，缺省值为空。 |
| [deviceTypes](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#devicetypes标签) | 标识当前Module可以运行在哪类设备上。说明：当存在多个模块时，各模块的配置可以不同，但都必须包含将要安装的设备类型，以确保正常运行。 | 字符串数组 | 该标签不可缺省。 |
| deliveryWithInstall | [按需分发](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/store-moduleinstall_arkts) | 布尔值 | 当前Module类型为HAP或HSP时，该标签不可缺省。 |
| installationFree | 标识当前Module是否支持免安装特性。- true：表示支持免安装特性，且符合免安装约束。- false：表示不支持免安装特性。 | 布尔值 | [bundleType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-configuration-file#配置文件标签) |
| virtualMachine | 标识当前Module运行的目标虚拟机类型，供云端分发使用，如应用市场和分发中心。如果目标虚拟机类型为ArkTS引擎，则其值为“ark+版本号”。 | 字符串 | 该标签可缺省，手动配置不生效，由编译构建时自动生成。 |
| [pages](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#pages标签) | 标识当前Module的profile资源，用于列举每个页面信息，取值为长度不超过255字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |
| [metadata](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#metadata标签) | [distributionFilter](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#distributionfilter标签) | 对象数组 | 该标签可缺省，缺省值为空。 |
| [abilities](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#abilities标签) | 标识当前Module中UIAbility的配置信息，只对当前UIAbility生效。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [extensionAbilities](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#extensionabilities标签) | 标识当前Module中ExtensionAbility的配置信息，只对当前ExtensionAbility生效。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [requestPermissions](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/declare-permissions#在配置文件中声明权限) | 标识当前应用运行时需向系统申请的权限集合。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [testRunner](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#testrunner标签) | [启动测试框架命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/aa-tool#启动测试框架命令test) | 对象 | 该标签可缺省，缺省值为空。 |
| [atomicService](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#atomicservice标签) | 标识当前应用是元服务时，有关元服务的相关配置。 | 对象 | 该标签可缺省，缺省值为空。 |
| [dependencies](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#dependencies标签) | 标识当前模块运行时依赖的共享库列表。 | 对象数组 | 该标签可缺省，缺省值为空。手动配置不生效，由编译构建时自动生成。 |
| targetModuleName | 标识当前包所指定的目标Module。取值为长度不超过128字节的字符串，不支持中文。配置该标签的Module具有overlay特性。仅在动态共享包（HSP）中适用。 | 字符串 | 该标签可缺省，缺省值为空。 |
| targetPriority | 标识当前Module的优先级，取值范围为1~100。配置targetModuleName标签之后，才需要配置该标签。仅在动态共享包（HSP）中适用。 | 整型数值 | 该标签可缺省，缺省值为1。 |
| [proxyData](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#proxydata标签) | 标识当前Module提供的数据代理列表。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| isolationMode | 标识当前Module的多进程配置项。支持的取值如下：- nonisolationFirst：优先在非独立进程中运行。- isolationFirst：优先在独立进程中运行。- isolationOnly：只在独立进程中运行。- nonisolationOnly：只在非独立进程中运行。说明：1.仅2in1和tablet设备支持将当前Module设置为独立进程。2.该标签仅对HAP生效。 | 字符串 | 该标签可缺省，缺省值为nonisolationFirst。 |
| generateBuildHash | [app.json5文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-configuration-file) | 布尔值 | 该标签可缺省，缺省值为false。 |
| compressNativeLibs | 在打包hap时，该标签标识libs库是否以压缩存储的方式打包到HAP。- true：libs库以压缩方式存储。- false：libs库以不压缩方式存储。 | 布尔值 | 该标签可缺省，在打包hap时缺省值为false。 |
| extractNativeLibs | 标识应用安装时，libs库是否解压到应用安装目录。当compressNativeLibs和extractNativeLibs都配置为false时，应用以不解压libs库的方式进行安装；其他场景，应用以解压libs库的方式进行安装。说明：从API version 20开始，支持该标签。 | 布尔值 | 该标签可缺省，缺省值为true。 |
| libIsolation | 在libs目录下是否生成模块名称目录存储so，用于区分同一应用中不同HAP的.so文件，以防止.so文件冲突。- true：当前HAP的.so文件会储存在libs目录中以Module名命名的路径下。- false：当前HAP的.so文件会直接储存在libs目录中。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| [fileContextMenu](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#filecontextmenu标签) | 标识当前HAP的右键菜单配置项，是一个profile文件资源。取值为长度不超过255字节的字符串。说明：仅在PC/2in1设备上生效。仅允许在entry类型模块中配置。 | 字符串 | 该标签可缺省，缺省值为空。 |
| querySchemes | 标识允许当前应用进行跳转查询的URL schemes，只允许entry类型模块配置，每个字符串取值不超过128字节。说明：从API version 21开始，最多允许配置200个URL scheme。API version 20及之前的版本，最多允许配置50个URL scheme。 | 字符串数组 | 该标签可缺省，缺省值为空。 |
| [routerMap](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#routermap标签) | 标识当前模块配置的路由表路径。取值为长度不超过255字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |
| [appEnvironments](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#appenvironments标签) | 标识当前模块配置的应用环境变量，只允许entry和feature模块配置。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| appStartup | [启动框架](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-startup) | 字符串 | 该标签可缺省，缺省值为空。 |
| [hnpPackages](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#hnppackages标签) | 标识当前应用包含的Native软件包信息。只允许entry类型模块配置。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [systemTheme](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#systemtheme标签) | 标识当前使用的系统主题配置项。只允许entry类型模块配置。取值为不超过255字节的字符串。说明：从API version 20开始，支持该标签。 | 字符串 | 该标签可缺省，缺省值为空。 |
| abilitySrcEntryDelegator | [startAbilityByCall](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inner-application-uiabilitycontext#startabilitybycall) | 字符串 | 该标签可缺省，缺省值为空。 |
| abilityStageSrcEntryDelegator | [startAbilityByCall](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inner-application-uiabilitycontext#startabilitybycall) | 字符串 | 该标签可缺省，缺省值为空。 |
| crossAppSharedConfig | [共享配置使用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/share-config#配置发布方) | 字符串 | 该标签可缺省，缺省值为空。 |
| formWidgetModule | [独立卡片包](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-creation#方式二独立包方式创建卡片) | 字符串 | 该标签可缺省，缺省值为空。 |
| formExtensionModule | [独立卡片包](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-creation#方式二独立包方式创建卡片) | 字符串 | 该标签可缺省，缺省值为空。 |
| [requiredDeviceFeatures](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#requireddevicefeatures标签) | 标识当前Module运行所需要的特定的设备特性，应用市场可以根据此配置，将应用分发给支持该特性的设备。说明：1.从API version 19开始，支持该字段。2.不支持插件应用配置。 | 对象 | 该标签可缺省，缺省值为空。 |

## deviceTypes标签

**表2** deviceTypes标签说明

| 设备类型 | 枚举值 | 说明 |
| --- | --- | --- |
| 手机 | phone | - |
| 平板 | tablet | - |
| PC/2in1 | 2in1 | 即PC设备，主要交互方式以多窗口、多任务及键盘鼠标操作为主，充分发挥设备的生产力属性。在HarmonyOS文档中，所有“2in1”均代表“PC/2in1”。 |
| 智慧屏 | tv | - |
| 智能手表 | wearable | 系统能力较丰富的手表，具备电话功能。 |
| 车机 | car | - |
| 默认设备 | default | 配置为default类型的应用，虽然可以正常编译构建，但是不支持发布上架。建议使用phone替代。 |

deviceTypes示例：

```cangjie
{
  "module": {
    "name": "myHapName",
    "type": "feature",
    "deviceTypes": [
      "tv",
      "tablet"
    ],
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/myHapName/src/main/module.json5#L15-L169)

## pages标签

该标签是一个profile文件资源，用于指定描述页面信息的配置文件。

```cangjie
{
  "module": {
    // ...
    "pages": "$profile:main_pages", // 资源配置，指向profile下面定义的配置文件main_pages.json
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L23-L179)

在开发视图的resources/base/profile下面定义配置文件main\_pages.json，其中文件名"main\_pages"可自定义，需要和pages标签指定的信息对应。配置文件中列举了当前应用组件中的页面信息，包含页面的路由信息和显示窗口相关的配置。

**表3** pages标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| src | 标识当前Module中所有页面的路由信息，包括页面路径和页面名称。其中，页面路径是以当前Module的src/main/ets为基准。该标签取值为一个字符串数组，其中每个元素表示一个页面。 | 字符串数组 | 该标签不可缺省。 |
| window | 标识用于定义与显示窗口相关的配置。 | 对象 | 该标签可缺省，缺省值为空。 |

**表4** window标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| designWidth | 标识页面设计基准宽度。以此为基准，根据实际设备宽度来缩放元素大小。 | 数值 | 可缺省，缺省值为720px。 |
| autoDesignWidth | 标识页面设计基准宽度是否自动计算。当配置为true时，designWidth将会被忽略，设计基准宽度由设备宽度与屏幕密度计算得出。当配置为false时，设计基准宽度为designWidth。 | 布尔值 | 可缺省，缺省值为false。 |

```json
{
  "src": [
    "pages/Index"
  ],
  "window": {
    "designWidth": 720,
    "autoDesignWidth": false
  }
}
```

## metadata标签

该标签标识HAP的自定义元信息，标签值为数组类型，包含name、value、resource三个子标签。

**表5** metadata标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 标识数据项的名称，取值为长度不超过255字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |
| value | 标识数据项的值，取值为长度不超过255字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |
| resource | 标识了用户自定义数据，取值为长度不超过255字节的字符串，内容为该数据的资源索引，例如配置成$profile:shortcuts_config，表示指向了/resources/base/profile/shortcuts_config.json配置文件。 | 字符串 | 该标签可缺省，缺省值为空。 |

```cangjie
{
  "module": {
    // ...
    "metadata": [
      // ...
      {
        "name": "pageConfig",
        "value": "main page config of application",
        "resource": "$profile:main_pages" // 资源配置，指向profile下面定义的配置文件main_pages.json
      }
    ],
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L17-L185)

## abilities标签

abilities标签描述UIAbility组件的配置信息，标签值为数组类型，该标签下的配置只对当前UIAbility生效。

**表6** abilities标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 标识当前UIAbility组件的名称，确保该名称在整个应用中唯一。取值为长度不超过127字节的字符串，以字母开头，可包含字母、数字、下划线（_）或点号（.）。 | 字符串 | 该标签不可缺省。 |
| srcEntry | 标识当前UIAbility的代码路径，取值为长度不超过127字节的字符串。 | 字符串 | 该标签不可缺省。 |
| [launchType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/uiability-launch-type) | [元服务规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/atomic-specifications) | 字符串 | 该标签可缺省，该标签缺省为“singleton”。 |
| description | 标识当前UIAbility组件的描述信息，开发者可以通过该标签描述当前组件的功能与作用，取值为长度不超过255字节的字符串。建议采用描述信息的资源索引，以支持多语言。 | 字符串 | 该标签可缺省，缺省值为空。 |
| icon | [图标](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/layered-image) | 字符串 | 该标签可缺省，缺省值为空。 |
| label | [名称](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/layered-image) | 字符串 | 该标签可缺省，缺省值为空。 |
| permissions | [应用权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| [metadata](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#metadata标签) | [窗口元数据配置中的metadata标签](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/window-config-m#metadata标签) | 对象数组 | 该标签可缺省，缺省值为空。 |
| exported | 标识当前UIAbility组件是否可以被其他应用拉起。- true：表示可以被其他应用拉起（入口UIAbility建议配置为true）。- false：只能由同应用或者具有ohos.permission.START_INVISIBLE_ABILITY权限（该权限仅系统应用支持申请）的应用拉起。例如，配置为false时，桌面具备该权限，桌面图标、快捷方式或push通知消息可以拉起当前UIAbility组件，但aa命令行工具没有权限无法拉起。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| continuable | 标识当前UIAbility组件是否支持跨端迁移。- true：表示支持迁移。- false：表示不支持迁移。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| [skills](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#skills标签) | [Want](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/want-overview) | 对象数组 | 该标签可缺省，缺省值为空。 |
| backgroundModes | [长时任务类型表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/continuous-task) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| [startWindow](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#startwindow标签) | 标识当前UIAbility组件启动页面profile资源，取值为长度不超过255字节的字符串，如果配置了该标签，startWindowIcon和startWindowBackground标签均不生效。说明：从API version 19开始，支持使用该字段配置增强启动页。 | 字符串 | 该标签可缺省，缺省值为空。 |
| startWindowIcon | 标识当前UIAbility组件启动页面图标资源文件的索引，取值为长度不超过255字节的字符串。 | 字符串 | 该标签不可缺省。 |
| startWindowBackground | 标识当前UIAbility组件启动页面背景颜色资源文件的索引，取值为长度不超过255字节的字符串。取值示例：$color:red。 | 字符串 | 该标签不可缺省。 |
| removeMissionAfterTerminate | 标识当前UIAbility组件销毁后，是否从任务列表中移除任务。- true表示销毁后移除任务。- false表示销毁后不移除任务。说明：2in1设备和平板设备的自由多窗模式下配置不生效，默认移除任务。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| orientation | 标识当前UIAbility组件启动时的方向，支持配置枚举，或启动方向资源索引。启动方向枚举支持的取值如下：- unspecified：未指定方向，由系统自动判断显示方向。- landscape：横屏。- portrait：竖屏。- follow_recent：跟随背景窗口的旋转模式。- landscape_inverted：反向横屏。- portrait_inverted：反向竖屏。- auto_rotation：随传感器旋转。- auto_rotation_landscape：传感器横屏旋转，包括横屏和反向横屏。- auto_rotation_portrait：传感器竖屏旋转，包括竖屏和反向竖屏。- auto_rotation_restricted：传感器开关打开，方向可随传感器旋转。- auto_rotation_landscape_restricted：传感器开关打开，方向可随传感器旋转为横屏，包括横屏和反向横屏。- auto_rotation_portrait_restricted：传感器开关打开，方向可随传感器旋转为竖屏，包括竖屏和反向竖屏。- locked：传感器开关关闭，方向锁定。- auto_rotation_unspecified：受开关控制和由系统判定的自动旋转模式。- follow_desktop：跟随桌面的旋转模式。配置启动方向的资源索引时，取值为长度不超过255字节的字符串，配置示例：$string:orientation。说明：- 从API version 14开始，支持配置启动方向资源索引。 | 字符串 | 该标签可缺省，缺省值为unspecified。 |
| supportWindowMode | [自由窗口](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/window-terminology#自由窗口) | 字符串数组 | 该标签可缺省，缺省值为["fullscreen", "split", "floating"]。 |
| maxWindowRatio | 标识当前UIAbility组件支持的最大的宽高比。该标签最小取值为0。 | 数值 | 该标签可缺省，缺省值为平台支持的最大的宽高比。 |
| minWindowRatio | 标识当前UIAbility组件支持的最小的宽高比。该标签最小取值为0。 | 数值 | 该标签可缺省，缺省值为平台支持的最小的宽高比。 |
| maxWindowWidth | [窗口大小限制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/window-overview#约束与限制) | 数值 | 该标签可缺省，缺省值为平台支持的最大的窗口宽度。 |
| minWindowWidth | [窗口大小限制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/window-overview#约束与限制) | 数值 | 该标签可缺省，缺省值为平台支持的最小的窗口宽度。 |
| maxWindowHeight | [窗口大小限制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/window-overview#约束与限制) | 数值 | 该标签可缺省，缺省值为平台支持的最大的窗口高度。 |
| minWindowHeight | [窗口大小限制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/window-overview#约束与限制) | 数值 | 该标签可缺省，缺省值为平台支持的最小的窗口高度。 |
| recoverable | 标识当前UIAbility组件是否支持在检测到应用故障后，恢复到应用原界面。- true：支持检测到出现故障后，恢复到原界面。- false：不支持检测到出现故障后，恢复到原界面。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| isolationProcess | 标识组件能否运行在独立的进程中。- true：表示能运行在独立的进程中。- false：表示不能运行在独立的进程中。说明：仅2in1和tablet设备支持将UIAbility设置为独立进程。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| excludeFromDock | 标识当前UIAbility组件是否支持从dock区域隐藏图标。- true：表示在dock区域隐藏。- false：表示不能在dock区域隐藏。说明：该标签配置不生效。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| preferMultiWindowOrientation | 标识当前UIAbility组件多窗布局方向：- default：缺省值，参数不配置默认值，建议其他应用类配置。- portrait：多窗布局方向为竖向，建议竖向游戏类应用配置。- landscape：多窗布局方向为横向，配置后支持横屏悬浮窗和上下分屏，建议横向游戏类应用配置。- landscape_auto：多窗布局动态可变为横向，需要配合API enableLandScapeMultiWindow/disableLandScapeMultiWindow使用，建议视频类应用配置。 | 字符串 | 该标签可缺省，缺省值为default。 |
| continueType | 标识当前UIAbility组件的跨端迁移类型。 | 字符串数组 | 该标签可缺省，缺省值为当前组件的名称。 |
| continueBundleName | 标识当前应用支持跨端迁移的其它应用名称列表。说明：不能配置为本应用包名，仅为了做异包名迁移使用。从API version 13开始，支持该标签。 | 字符串数组 | 该标签可缺省，缺省值为空。 |
| process | [进程模型定义](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/process-model-stage#其他进程类型) | 字符串 | 该标签可缺省，缺省值为空。 |

abilities示例：

```cangjie
{
  // ...
    "abilities": [
      {
        "name": "EntryAbility",
        "srcEntry": "./ets/entryability/EntryAbility.ets",
        "launchType": "singleton",
        "description": "$string:description_main_ability",
        "icon": "$media:layered_image",
        "label": "$string:EntryAbility_label",
        "permissions": [],
        "metadata": [],
        "exported": true,
        "continuable": true,
        "skills": [
          {
            "actions": [
              "ohos.want.action.home"
            ],
            "entities": [
              "entity.system.home"
            ],
            "uris": []
          }
        ],
        "backgroundModes": [
          "dataTransfer"
        ],
        "startWindowIcon": "$media:icon",
        "startWindowBackground": "$color:red",
        "removeMissionAfterTerminate": true,
        "orientation": "$string:orientation",
        "supportWindowMode": [
          "fullscreen",
          "split",
          "floating"
        ],
        "maxWindowRatio": 3.5,
        "minWindowRatio": 0.5,
        "maxWindowWidth": 2560,
        "minWindowWidth": 1400,
        "maxWindowHeight": 300,
        "minWindowHeight": 200,
        "excludeFromMissions": false,
        "preferMultiWindowOrientation": "default",
        "isolationProcess": false,
        "continueType": [
          "continueType1",
          "continueType2"
        ],
        "continueBundleName": [
          "com.example.myapplication1",
          "com.example.myapplication2"
        ],
        "process": ":processTag"
      }
    ],
    // ...
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/myHapName/src/main/module.json5#L16-L168)

## skills标签

该标签标识UIAbility组件或者ExtensionAbility组件能够接收的[Want](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/want-overview)的特征。

例如：在浏览器中下载PDF文件时，可以通过配置skills标签选择并打开该PDF文件。详情请参考[拉起文件处理类应用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/file-processing-apps-startup)。

**表7** skills标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| actions | [常见action与entities](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/actions-entities) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| entities | [常见action与entities](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/actions-entities) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| uris | 标识与Want中URI（Uniform Resource Identifier）相匹配的集合。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| permissions | [应用权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| domainVerify | [域名校验](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-linking-startup#section4452103365213) | 布尔值 | 该标签可缺省，缺省值为false。 |

**表8** uris标签说明

说明

以下字符串类型的标签不支持使用资源索引的方式（$string）配置。

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| scheme | 标识URI的协议名部分，常见的有http、https、file、ftp等。说明：从API 18开始，该标签在参与隐式Want匹配时不区分大小写。 | 字符串 | uris中仅配置type时可以缺省，缺省值为空，否则不可缺省。 |
| host | 标识URI的主机地址部分，该标签只有当scheme配置时才生效。常见的方式：- 域名方式，如example.com。- IP地址方式，如10.10.10.1。说明：从API 18开始，该标签在参与隐式Want匹配时不区分大小写。 | 字符串 | 该标签可缺省，缺省值为空。 |
| port | 标识URI的端口部分。如http默认端口为80，https默认端口是443，ftp默认端口是21。该标签只有当scheme和host都配置时才生效。 | 字符串 | 该标签可缺省，缺省值为空。 |
| path | pathStartWith | pathRegex | 标识URI的路径部分，path、pathStartWith和pathRegex配置时三选一。path标识URI与want中的路径部分全匹配，pathStartWith标识URI与want中的路径部分允许前缀匹配，pathRegex标识URI与want中的路径部分允许正则匹配。该标签只有当scheme和host都配置时才生效。 | 字符串 | 该标签可缺省，缺省值为空。 |
| type | [UniformDataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-data-uniformtypedescriptor) | 字符串 | 该标签可缺省，缺省值为空。 |
| utd | [标准化数据类型](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-data-uniformtypedescriptor) | 字符串 | 该标签可缺省，缺省值为空。 |
| maxFileSupported | 对于指定类型的文件，标识一次能接收或打开的最大数量，适用于分享等场景，需要与utd配合使用。 | 整数 | 该标签可缺省，缺省值为0。 |
| linkFeature | [linkFeature标签说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-uri-config#linkfeature标签说明) | 字符串 | 该标签可缺省，缺省值为空。 |

skills示例：

说明

如下示例为通用配置，部分组件和模块在实际配置时存在差异，例如[点击消息进入应用首页](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/push-send-alert#section697519219136)的限制，具体请参考对应文档说明。

```cangjie
{
  // ...
    "abilities": [
      {
        // ...
        "skills": [
          {
            "actions": [
              "ohos.want.action.home"
            ],
            "entities": [
              "entity.system.home"
            ],
            "uris": [
              {
                "scheme":"http",
                "host":"example.com",
                "port":"80",
                "path":"path",
                "type": "text/*",
                "linkFeature": "Login"
              }
            ],
            "permissions": [],
            "domainVerify": false
          },
          // ...
        ],
        // ...
    ],
    // ...
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L18-L184)

## extensionAbilities标签

描述extensionAbilities的配置信息，标签值为数组类型，该标签下的配置只对当前extensionAbilities生效。

**表9** extensionAbilities标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 标识当前ExtensionAbility组件的名称，确保该名称在整个应用中唯一，取值为长度不超过127字节的字符串。 | 字符串 | 该标签不可缺省。 |
| srcEntry | 标识当前ExtensionAbility组件所对应的代码路径，取值为长度不超过127字节的字符串。 | 字符串 | 该标签不可缺省。 |
| description | 标识当前ExtensionAbility组件的描述，开发者可以通过该标签描述当前组件的功能与作用，取值为长度不超过255字节的字符串，可以是对描述内容的资源索引，用于支持多语言。 | 字符串 | 该标签可缺省，缺省值为空。 |
| icon | 标识当前ExtensionAbility组件的图标，取值为资源文件的索引。 | 字符串 | 该标签可缺省，缺省值为空。 |
| label | 标识当前ExtensionAbility组件对用户显示的名称，取值为该名称的资源索引，以支持多语言，字符串长度不超过255字节。 | 字符串 | 该标签可缺省，缺省值为空。 |
| type | [ShareExtensionAbility](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-shareextensionability) | 字符串 | 该标签不可缺省。 |
| permissions | [应用权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| appIdentifierAllowList | [什么是appIdentifier](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/common-problem-of-application#什么是appidentifier) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| readPermission | 标识读取当前ExtensionAbility组件数据所需的权限，取值为长度不超过255字节的字符串。仅当预置的系统应用ExtensionAbility的type配置为dataShare时，该标签生效。dataShare类型仅支持系统应用支持配置，三方应用配置不生效。 | 字符串 | 该标签可缺省，缺省值为空。 |
| writePermission | 标识向当前ExtensionAbility组件写数据所需的权限，取值为长度不超过255字节的字符串。仅当预置的系统应用ExtensionAbility的type配置为dataShare时，该标签生效。dataShare类型仅支持系统应用支持配置，三方应用配置不生效。 | 字符串 | 该标签可缺省，缺省值为空。 |
| uri | 标识当前ExtensionAbility组件提供的数据URI，取值为长度不超过255字节的字符数组，用反向域名的格式表示。说明：该标签在type为dataShare类型的ExtensionAbility时，不可缺省。 | 字符串 | 该标签可缺省，缺省值为空。 |
| skills | [Want](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/want-overview) | 数组 | 该标签可缺省，缺省值为空。 |
| [metadata](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#metadata标签) | 标识当前ExtensionAbility组件的元信息。说明：该标签在type为form时，不可缺省，且必须存在一个name为ohos.extension.form的对象值，其对应的resource值不能缺省，为服务卡片的二级资源引用。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| exported | 标识当前ExtensionAbility组件是否可以被其他应用调用。- true：表示可以被其他应用调用。- false：表示不可以被其他应用调用，包括无法被aa工具命令拉起应用。 | 布尔值 | 该标签可缺省，缺省值为false。 |
| extensionProcessMode | [状态栏开放服务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/statusbar-extension-introduction) | 字符串 | 该标签可缺省，缺省值为空。 |
| dataGroupIds | [dataGroupId申请流程](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ime-kit-security#section4219152220459) | 字符串数组 | 该标签可缺省，缺省值为空。 |
| process | [进程模型定义](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/process-model-stage#其他进程类型) | 字符串 | 该标签可缺省，缺省值为空。 |
| isolationProcess | 标识ExtensionAbility组件能否运行在独立的进程中。- true：表示能运行在独立的进程中。- false：表示不能运行在独立的进程中。说明：仅当ExtensionAbility组件的type为"sys/commonUI"时该标签配置生效，且仅支持由系统应用配置type为"sys/commonUI"。从API version 20开始，支持该标签。 | 布尔值 | 该标签可缺省，缺省值为false。 |

extensionAbilities示例：

```cangjie
{
  // ...
    "extensionAbilities": [
      {
        "name": "FormName",
        "srcEntry": "./ets/form/MyForm.ets",
        "icon": "$media:icon",
        "label" : "$string:extension_name",
        "description": "$string:form_description",
        "type": "form",
        "permissions": ["ohos.permission.ACCESS_BLUETOOTH"],
        "exported": true,
        "uri":"scheme://authority/path/query",
        "skills": [{
          "actions": [],
          "entities": [],
          "uris": [],
          "permissions": []
        }],
        "metadata": [
          {
            "name": "ohos.extension.form",
            "resource": "$profile:form_config",
          }
        ],
        "extensionProcessMode": "instance",
        "dataGroupIds": [
          "testGroupId1"
        ]
      }
    ],
    // ...
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/myHapName/src/main/module.json5#L17-L167)

## shortcuts标签

shortcuts标识应用的快捷方式信息。标签值为数组，包含四个子标签shortcutId、label、icon、wants。

[metadata](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#metadata标签)中指定shortcut信息，其中：

-   name：指定shortcuts的名称，使用ohos.ability.shortcuts作为shortcuts信息的标识。
    
-   resource：指定shortcuts信息的资源位置。
    

说明

桌面展示快捷方式的数量有上限要求，最多展示4个。

**表10** shortcuts标签说明

| 属性名称 | 含义 | 类型 | 是否可缺省 |
| --- | --- | --- | --- |
| shortcutId | 标识快捷方式的ID，取值为长度不超过63字节的字符串。不支持通过资源索引的方式（$string）配置该标签。 | 字符串 | 该标签不可缺省。 |
| label | 标识快捷方式的标签信息，即快捷方式对外显示的文字描述信息。取值为长度不超过255字节的字符串，可以是描述性内容，也可以是标识label的资源索引。 | 字符串 | 该标签可缺省，缺省值为空。 |
| icon | 标识快捷方式的图标，取值为资源文件的索引。说明：图标分为单层图标和分层图标，单层图标包含一个图片，分层图标包含前景图和背景图，推荐使用如下配置的分层图标：1.前景图：图标显示大小为450*450px，资源大小为1024*1024px的透明图层。2.背景图：大小为1024*1024px。 | 字符串 | 该标签可缺省，缺省值为空。 |
| visible | 标识快捷方式是否显示，取值为true时显示快捷方式，取值为false时不显示快捷方式。说明：1.从API version 20开始，支持该标签。 | 布尔值 | 该标签可缺省，缺省为true。 |
| [wants](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#wants标签) | 标识快捷方式内定义的目标wants信息集合，在调用launcherBundleManager的startShortcut接口时，会拉起wants标签里的第一个目标组件，推荐只配置一个wants元素。 | 对象 | 该标签可缺省，缺省为空。 |

1.  在/resources/base/profile/目录下配置shortcuts\_config.json配置文件。
    
    ```json
    {
      "shortcuts": [
        {
          "shortcutId": "id_test1",
          "label": "$string:shortcut",
          "icon": "$media:aa_icon",
          "visible": true,
          "wants": [
            {
              "bundleName": "com.ohos.hello",
              "moduleName": "entry",
              "abilityName": "EntryAbility",
              "parameters": {
                "testKey": "testValue"
              }
            }
          ]
        }
      ]
    }
    ```
    
2.  在module.json5配置文件的abilities标签中，针对需要添加快捷方式的UIAbility进行配置metadata标签，使shortcut配置文件对该UIAbility生效。
    
    ```cangjie
    {
      "module": {
        // ...
        "abilities": [
          {
            "name": "EntryAbility",
            "srcEntry": "./ets/entryability/EntryAbility.ets",
            // ...
            "skills": [
              // ...
              {
                "entities": [
                  "entity.system.home"
                ],
                "actions": [
                  "ohos.want.action.home"
                ]
              }
            ],
            "metadata": [
              {
                "name": "ohos.ability.shortcuts",
                "resource": "$profile:shortcuts_config"
              }
            ],
            // ...
          }
        ],
        // ...
      }
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L22-L180)
    

### wants标签

此标签用于标识快捷方式内定义的目标wants信息集合。

**表11** wants标签说明

| 属性名称 | 含义 | 类型 | 是否可缺省 |
| --- | --- | --- | --- |
| bundleName | 表示快捷方式的目标包名。 | 字符串 | 该标签可缺省。 |
| moduleName | 表示快捷方式的目标模块名。 | 字符串 | 该标签可缺省。 |
| abilityName | 表示快捷方式的目标组件名。 | 字符串 | 该标签可缺省。 |
| parameters | 表示拉起快捷方式时的自定义数据，仅支持配置字符串类型的数据。其中键值均最大支持1024长度的字符串。 | 对象 | 该标签可缺省。 |

wants标签示例：

```json
{
  "wants": [
    {
      "bundleName": "com.ohos.hello",
      "moduleName": "entry",
      "abilityName": "EntryAbility",
      "parameters": {
        "testKey": "testValue"
      }
    }
  ]
}
```

## distributionFilter标签

该标签用于定义HAP对应的细分设备规格的分发策略，以便在应用市场进行云端分发应用包时做精准匹配。

说明

该标签从API version 10及以后版本开始生效，API version 9及以前版本使用distroFilter标签。

-   **适用场景：** 当一个工程中存在多个Entry，且多个Entry配置的deviceTypes存在交集时，则需要通过该标签进行区分。比如下面的两个Entry都支持tablet类型，就需要通过该标签进行区分。
    
    ```cangjie
    // entry1支持的设备类型
    {
      "module": {
        "name": "entry1",
        "type": "entry",
        "deviceTypes": [
          "tv",
          "tablet"
        ],
        // ...
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile03/entry1/src/main/module.json5#L16-L83)
    
    ```cangjie
    // entry2支持的设备类型
    {
      "module": {
        "name": "entry2",
        "type": "entry",
        "deviceTypes": [
          "tv",
          "tablet"
        ],
        // ...
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile02/entry2/src/main/module.json5#L16-L71)
    
-   **配置规则：** 该标签支持配置四个属性，包括屏幕形状([screenShape](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#screenshape标签))、窗口分辨率([screenWindow](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#screenwindow标签))、屏幕像素密度([screenDensity](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#screendensity标签) )、设备所在国家与地区([countryCode](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#countrycode标签))。详见下表。
    
    在分发应用包时，通过deviceTypes与这四个属性的匹配关系，唯一确定一个用于分发到设备的HAP。
    
    -   如果需要配置该标签，则至少包含一个属性。
    -   如果一个Entry中配置了任意一个或多个属性，则其他Entry也必须包含相同的属性。
    -   screenShape和screenWindow属性仅适用于轻量级智能穿戴设备。
-   **配置方式：** 该标签需要配置在/resources/base/profile资源目录下，并在metadata的resource标签中引用。
    

**表12** distributionFilter标签配置说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| [screenShape](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#screenshape标签) | 标识屏幕形状的支持策略。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [screenWindow](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#screenwindow标签) | 标识应用运行时的窗口分辨率的支持策略。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [screenDensity](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#screendensity标签) | 标识屏幕的像素密度（dpi：Dot Per Inch）的支持策略。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| [countryCode](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#countrycode标签) | 标识国家与地区的支持策略，取值参考ISO-3166-1标准。支持多个国家和地区枚举定义。 | 对象数组 | 该标签可缺省，缺省值为空。 |

### screenShape标签

**表13** screenShape标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| policy | 标识条件属性的过滤规则。- exclude：表示需要排除的value属性。- include：表示需要包含的value属性。 | 字符串 | 该标签不可缺省。 |
| value | 支持的取值为circle（圆形）、rect（矩形）。例如，针对智能穿戴设备，可为圆形表盘和矩形表盘分别提供不同的HAP。 | 字符串数组 | 该标签不可缺省。 |

### screenWindow标签

**表14** screenWindow标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| policy | 标识条件属性的过滤规则。当前取值仅支持“include”。- include：表示需要包含的value属性。 | 字符串 | 该标签不可缺省。 |
| value | 单个字符串的取值格式为“宽 * 高”，取值为整数像素值，例如“454 * 454”。 | 字符串数组 | 该标签不可缺省。 |

### screenDensity标签

**表15** screenDensity标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| policy | 标识条件属性的过滤规则。- exclude：表示需要排除的value属性。- include：表示需要包含的value属性。 | 字符串 | 该标签不可缺省。 |
| value | 标识屏幕的像素密度（dpi :Dot Per Inch）。支持的取值如下：- sdpi：表示小规模的屏幕密度（Small-scale Dots per Inch），适用于dpi取值为(0,120]的设备。- mdpi：表示中规模的屏幕密度（Medium-scale Dots Per Inch），适用于dpi取值为(120,160]的设备。- ldpi：表示大规模的屏幕密度（Large-scale Dots Per Inch），适用于dpi取值为(160,240]的设备。- xldpi：表示大规模的屏幕密度（Extra Large-scale Dots Per Inch），适用于dpi取值为(240,320]的设备。- xxldpi：表示大规模的屏幕密度（Extra Extra Large-scale Dots Per Inch），适用于dpi取值为(320，480]的设备。- xxxldpi：表示大规模的屏幕密度（Extra Extra Extra Large-scale Dots Per Inch），适用于dpi取值为(480, 640]的设备。 | 字符串数组 | 该标签不可缺省。 |

### countryCode标签

**表16** countryCode标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| policy | 标识条件属性的过滤规则。- exclude：表示需要排除的value属性。- include：表示需要包含的value属性。 | 字符串 | 该标签不可缺省。 |
| value | 标识应用需要分发的国家地区码。 | 字符串数组 | 该标签不可缺省。 |

示例如下：

1.  在开发视图的resources/base/profile下定义配置文件，文件名为distributionFilter\_config.json，文件名可以自定义。
    
    ```json
    {
      "distributionFilter": {
        "screenShape": {
          "policy": "include",
          "value": [
            "circle",
            "rect"
          ]
        },
        "screenWindow": {
          "policy": "include",
          "value": [
            "454*454",
            "466*466"
          ]
        },
        "screenDensity": {
          "policy": "exclude",
          "value": [
            "ldpi",
            "xldpi"
          ]
        },
        "countryCode": {
          "policy": "include",
          "value": [
            "CN"
          ]
        }
      }
    }
    ```
    
2.  在module.json5配置文件的module标签中定义metadata信息。
    

```cangjie
{
  "module": {
    // ...
    "metadata": [
      {
        "name": "ohos.module.distribution",
        "resource": "$profile:distributionFilter_config",
      }
    ],
    // ...
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile03/entry1/src/main/module.json5#L18-L82)

## testRunner标签

此标签用于支持对测试框架的配置。

**表17** testRunner标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 标识测试框架对象名称，取值为长度不超过255字节的字符串。 | 字符串 | 不可缺省。 |
| srcPath | 标识测试框架代码路径，取值为长度不超过255字节的字符串。 | 字符串 | 不可缺省。 |

testRunner标签示例：

```cangjie
{
  "module": {
    // ...
    "testRunner": {
      "name": "myTestRunnerName",
      "srcPath": "etc/test/TestRunner.ts"
    },
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/myHapName/src/main/module.json5#L20-L164)

## atomicService标签

此标签用于支持对元服务的配置。此标签仅在app.json5中将bundleType设置为atomicService时生效。

**表18** atomicService标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| preloads | 标识元服务中预加载列表。 | 对象数组 | 该标签可缺省，缺省值为空。 |
| resizeable | 标识元服务是否支持自适应窗口大小显示。当标签配置成true时，平板横屏模式切换或者折叠屏关闭，会自适应屏幕窗口的宽高，使得屏幕显示正常。说明：1.从API version 20开始，支持该标签。2.如果已经适配了平板横屏及折叠屏态显示，建议将该标签设置为true。- true：表示元服务可以自适应窗口大小。- false：表示元服务不可以自适应窗口大小。 | 布尔值 | 可缺省，缺省值为false。 |

**表19** preloads标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| moduleName | 标识元服务中当前模块被加载时，需预加载的模块名。不能配置自身modulename，且必须有对应的模块，取值为长度不超过31字节的字符串。 | 字符串 | 该标签不可缺省。 |

atomicService标签示例：

```cangjie
{
  "module": {
    // ···
    "atomicService": {
      "preloads":[
        {
          "moduleName":"feature"
        }
      ],
      "resizeable": true
    },
    // ···
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile04/entry/src/main/module.json5#L16-L67)

## dependencies标签

此标签标识模块运行时依赖的共享库列表。

**表20** dependencies标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| bundleName | 标识当前模块依赖的共享包包名。取值为长度7~128字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |
| moduleName | 标识当前模块依赖的共享包模块名。取值为长度不超过31字节的字符串。 | 字符串 | 该标签不可缺省。 |
| versionCode | 标识当前模块依赖的共享包的版本号。取值范围为0~2147483647。 | 数值 | 该标签可缺省，缺省值为空。 |

dependencies标签示例：

```cangjie
{
  "module": {
    // ...
    "dependencies": [
      {
        "bundleName":"com.share.library",
        "moduleName": "library",
        "versionCode": 10001
      }
    ],
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/myHapName/src/main/module.json5#L19-L165)

## proxyData标签

此标签标识模块提供的数据代理列表，仅限entry和feature配置。

**表21** proxyData标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| uri | 标识用于访问该数据代理的URI，不同的数据代理配置的URI不可重复，且需要满足datashareproxy://当前应用包名/xxx的格式。取值为长度不超过255字节的字符串。 | 字符串 | 该标签不可缺省。 |
| requiredReadPermission | [权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) | 字符串 | 该标签可缺省，缺省值为空。 |
| requiredWritePermission | [权限列表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-permissions) | 字符串 | 该标签可缺省，缺省值为空。 |
| [metadata](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#metadata标签) | 标识该数据代理的元信息，只支持配置name和resource标签。 | 对象 | 该标签可缺省，缺省值为空。 |

proxyData标签示例：

```cangjie
{
  "module": {
    // ...
    "proxyData": [
      {
        "uri":"datashareproxy://ohos.app.hap.myapplication/event/Meeting",
        "requiredReadPermission": "ohos.permission.SYSTEM_FLOAT_WINDOW",
        "requiredWritePermission": "ohos.permission.SYSTEM_FLOAT_WINDOW",
        "metadata": {
          "name": "datashare_metadata",
          "resource": "$profile:datashare"
        }
      }
    ],
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/myHapName/src/main/module.json5#L18-L166)

## routerMap标签

此标签标识模块配置的路由表的路径。

routerMap配置文件描述模块的路由表信息，routerMap标签的值为数组类型。

**表22** routerMap标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 标识跳转页面的名称。取值为长度不超过1023字节的字符串。 | 字符串 | 该标签不可缺省。 |
| pageSourceFile | 标识页面在模块内的路径。取值为长度不超过255字节的字符串。 | 字符串 | 该标签不可缺省。 |
| buildFunction | 标识被@Builder修饰的函数，该函数描述页面的UI。取值为长度不超过1023字节的字符串。 | 字符串 | 该标签不可缺省。 |
| [data](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#data标签) | [HapModuleInfo对象](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-bundlemanager-hapmoduleinfo) | 对象 | 该标签可缺省，缺省值为空。 |
| [customData](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#customdata标签) | [HapModuleInfo对象](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-bundlemanager-hapmoduleinfo) | 对象 | 该标签可缺省，缺省值为空。 |

示例如下：

1.  在开发视图的resources/base/profile下面定义配置文件，文件名可以自定义，例如：router\_map.json。
    
    ```json
    {
      "routerMap": [
        {
          "name": "DynamicPage1",
          "pageSourceFile": "src/main/ets/pages/pageOne.ets",
          "buildFunction": "myFunction",
          "customData": {
            "stringKey": "data1",
            "numberKey": 123,
            "booleanKey": true,
            "objectKey": {
              "name": "test"
            },
            "arrayKey": [
              {
                "id": 123
              }
            ]
          }
        },
        {
          "name": "DynamicPage2",
          "pageSourceFile": "src/main/ets/pages/pageTwo.ets",
          "buildFunction": "myBuilder",
          "data": {
            "key1": "data1",
            "key2": "data2"
          }
        }
      ]
    }
    ```
    
2.  在module.json5配置文件的module标签中定义routerMap标签，指向定义的路由表配置文件，例如："routerMap": "$profile:router\_map"。
    

### data标签

此标签用于支持在路由表中配置自定义的字符串数据。

data标签示例：

```json
{
  "routerMap": [
    {
      "name": "DynamicPage",
      "pageSourceFile": "src/main/ets/pages/pageOne.ets",
      "buildFunction": "myBuilder",
      "data": {
        "key1": "data1",
        "key2": "data2"
      }
    }
  ]
}
```

### customData标签

此标签用于支持在路由表中配置自定义数据。

customData对象内部，可以配置任意类型的自定义数据。

customData标签示例：

```json
{
  "routerMap": [
    {
      "name": "DynamicPage",
      "pageSourceFile": "src/main/ets/pages/pageOne.ets",
      "buildFunction": "myBuilder",
      "customData": {
        "stringKey": "data1",
        "numberKey": 123,
        "booleanKey": true,
        "objectKey": {
          "name": "test"
        },
        "arrayKey": [
          {
            "id": 123
          }
        ]
      }
    }
  ]
}
```

## appEnvironments标签

此标签标识模块配置的应用环境变量。

**表23** appEnvironments标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| name | 标识环境变量的变量名称。取值为长度不超过4096字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |
| value | 标识环境变量的值。取值为长度不超过4096字节的字符串。 | 字符串 | 该标签可缺省，缺省值为空。 |

appEnvironments标签示例：

```cangjie
{
  "module": {
    // ...
    "appEnvironments": [
      {
        "name": "name1",
        "value": "value1"
      }
    ],
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L21-L181)

## hnpPackages标签

该标签标识应用包含的Native软件包信息。

**表24** hnpPackages标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| package | 标识Native软件包名称。 | 字符串 | 该标签不可缺省。 |
| type | 标识Native软件包类型。支持的取值如下：- public：公有类型。- private：私有类型。 | 字符串 | 该标签不可缺省。 |

hnpPackages示例：

```cangjie
{
  "module": {
    // ...
    "hnpPackages": [
      {
        "package": "hnpsample.hnp",
        "type": "public"
      }
    ],
    // ...
  },
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile05/entry/src/main/module.json5#L16-L94)

## fileContextMenu标签

该标签标识当前HAP的右键菜单配置项，是一个profile文件资源，用于指定描述应用注册右键菜单配置文件。仅在PC/2in1设备上生效。仅允许在entry类型模块中配置。

fileContextMenu标签示例

```cangjie
{
  "module": {
    // ...
    "fileContextMenu": "$profile:menu", // 资源配置，指向profile下面定义的配置文件menu.json
    // ...
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L20-L182)

在开发视图的resources/base/profile下面定义配置文件menu.json，其中文件名“menu.json”可自定义，需要和fileContextMenu标签指定的信息对应。配置文件中描述了当前应用注册的右键菜单的项目和响应行为。

配置文件根节点名称为fileContextMenu，为对象数组，标识当前module注册右键菜单的数量。（单模块和单应用注册数量不能超过5个，配置超过数量当前只解析随机5个）

**表25** fileContextMenu标签配置说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| abilityName | 表示当前右键菜单对应的需要拉起的ability名称。 | 字符串 | 不可缺省。 |
| menuItem | 右键菜单显示的信息。命名建议：原则一：[动作]+[应用名]，中文示例：用{App}打开、用{App} ({Plugin}插件) 打开；英文示例：Open with {App}、Open with {App} ({Plugin})。原则二：[动作]+[目的]，示例：压缩为{文件名}、压缩至{路径}、用{App}转换为{格式}。 | 资源id | 不可缺省。 |
| menuHandler | 一个ability可以创建多个右键菜单， 该标签与右键菜单显示项一一对应，用于区分用户拉起的不同右键菜单项。开发者可自定义该标签取值，确保该标签在整个ability中唯一。在用户点击右键菜单拉起应用时，会作为参数传递给应用。 | 字符串 | 不可缺省。 |
| menuContext | 定义展示该菜单项需要的上下文，可以支持多种情况，类型为数组。 | 对象数组 | 不可缺省。 |

**表26** menuContext标签配置说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| menuKind | 表示单击如下类型时会触发右键菜单。取值范围如下：- 0：空白处- 1：文件- 2：文件夹- 3：文件和文件夹 | 数值 | 不可缺省。 |
| menuRule | 表示采用什么方式选择文件或文件夹时，会触发右键菜单。取值范围如下：- single：单选- multi：多选- both：单选或多选 | 字符串 | 仅当menuKind为1或2时，才会读取该标签，此时不可缺省。 |
| fileSupportType | 表示当选中的文件列表里包含指定的文件类型时，显示右键菜单。当该标签取值为["*"]时，将会读取fileNotSupportType标签。当该标签取值为[]时，将不做任何处理。 | 字符串数组 | 仅当menuKind为1时，才会读取该标签，此时不可缺省。 |
| fileNotSupportType | 表示当选中的文件列表里包含这些文件类型时，不显示该右键菜单。仅当menuKind为1、且fileSupportType为["*"]时，才会读取该标签。 | 字符串数组 | 可缺省，缺省值为空。 |

resources/base/profile路径下的menu.json资源文件示例如下：

```json
{
  "fileContextMenu": [
    {
      "abilityName": "EntryAbility",
      "menuItem": "$string:module_desc",
      "menuHandler": "openCompress",
      "menuContext": [
        {
          "menuKind": 0
        },
        {
          "menuKind": 1,
          "menuRule": "both",
          "fileSupportType": [
            ".rar",
            ".zip"
          ],
          "fileNotSupportType": [
            ""
          ]
        },
        {
          "menuKind": 2,
          "menuRule": "single"
        },
        {
          "menuKind": 3
        }
      ]
    }
  ]
}
```

**响应行为**

应用进行右键扩展菜单注册后，在文件管理器通过右键操作拉起菜单，该菜单中会有“更多”选项。单击“更多”选项后，会出现注册后的menuItem列表，单击任意一个选项后，文件管理器默认通过startAbility的方式拉起三方应用，除了指定三方应用的包名和ability名之外，want中的parameter中，也会传入如下标签：

**表27** want中parameter标签说明

| 参数名 | 值 | 类型 |
| --- | --- | --- |
| menuHandler | 对应注册配置文件中menuHandler的值。 | 字符串 |
| uriList | 用户在具体文件上触发右键的uri值，如果空白处响应，此值为空，单个文件响应，数组长度1，多个文件响应则传入对应所有文件的uri值。 | 字符串数组 |

## startWindow标签

该标签指向一个profile文件资源，用于指定UIAbility组件启动页面的配置文件，在开发视图的resources/base/profile下面定义配置文件start\_window.json，如果配置了该标签，startWindowIcon和startWindowBackground标签将不生效。

**说明：**

从API version 19开始，支持使用该字段配置增强启动页。

**表28** startWindow标签配置说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| startWindowType | [Ability管理服务（即StartOptions中hideStartWindow标签）](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-startoptions#startoptions) | 字符串 | 可缺省，缺省值为REQUIRED_SHOW。 |
| startWindowAppIcon | 标识当前UIAbility组件启动页面图标资源文件的索引，取值为长度不超过255字节的字符串。从API version 19开始支持该字段。 | 字符串 | 可缺省，缺省值为空。 |
| startWindowIllustration | 标识当前UIAbility组件启动页面插画资源文件的索引，取值为长度不超过255字节的字符串。从API version 19开始支持该字段。 | 字符串 | 可缺省，缺省值为空。 |
| startWindowBrandingImage | 标识当前UIAbility组件启动页面品牌标识资源文件的索引，取值为长度不超过255字节的字符串。从API version 19开始支持该字段。 | 字符串 | 可缺省，缺省值为空。 |
| startWindowBackgroundColor | 标识当前UIAbility组件启动页面背景颜色资源文件的索引，取值为长度不超过255字节的字符串。从API version 19开始支持该字段。 | 字符串 | 不可缺省。 |
| startWindowBackgroundImage | 标识当前UIAbility组件启动页面背景图片资源文件的索引，取值为长度不超过255字节的字符串。从API version 19开始支持该字段。 | 字符串 | 可缺省，缺省值为空。 |
| startWindowBackgroundImageFit | 标识当前UIAbility组件启动页面背景图像适应方式，支持的取值如下：- Contain：按照宽高比进行缩小或放大，图片完全显示在显示边界内。- Cover：按照宽高比进行缩小或放大，图片两边都大于或等于显示边界。- Auto：自适应显示。- Fill：不按照宽高比进行放大或缩小，图片充满显示边界。- ScaleDown：按照宽高比显示，图片缩小或保持不变。- None：保持原有尺寸显示。从API version 19开始支持该字段。 | 字符串 | 可缺省，缺省值为Cover。 |
| startWindowColorModeType | 标识当前UIAbility组件启动页深浅色模式，仅作用于同进程间拉起场景。不同取值含义如下：- "FOLLOW_SYSTEM"：启动页颜色模式跟随系统深浅色。- "FOLLOW_APPLICATION"：启动页颜色模式跟随应用深浅色。- 如未配置该字段，默认取值为"FOLLOW_SYSTEM"，即启动页颜色模式跟随系统深浅色。从API version 20开始支持该字段。 | 字符串 | 可缺省，缺省值为FOLLOW_SYSTEM。 |

resources/base/profile路径下的start\_window.json资源文件示例如下：

```json
{
  "startWindowType": "REQUIRED_SHOW",
  "startWindowColorModeType": "FOLLOW_SYSTEM",
  "startWindowAppIcon": "$media:start_window_app_icon",
  "startWindowIllustration": "$media:start_window_illustration",
  "startWindowBrandingImage": "$media:start_window_branding_image",
  "startWindowBackgroundColor": "$color:start_window_back_ground_color",
  "startWindowBackgroundImage": "$media:start_window_back_ground_image",
  "startWindowBackgroundImageFit": "Cover"
}
```

## systemTheme标签

该标签指向一个profile文件资源，用于指定当前应用使用的系统主题配置文件。从API version 20开始，支持该标签。

systemTheme标签示例：

```cangjie
{
  "module": {
    // ...
    "systemTheme": "$profile:theme_config", // 资源配置，指向profile下面定义的配置文件theme_config.json
  }
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/ModuleConfigurationFile01/entry/src/main/module.json5#L19-L183)

在开发视图的resources/base/profile下面定义配置文件theme\_config.json，其中文件名“theme\_config.json”可自定义为“theme\_config”开头文件名，例如"theme\_config"、"theme\_config\_1"。需要和systemTheme标签指定的信息对应。配置文件中标识当前应用使用的系统主题。

**表29** theme\_config.json配置说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| systemTheme | 标识当前应用使用的系统主题，取值为引用系统主题名称的枚举。枚举支持的取值如下：- $ohos:theme:ohos_theme 系统默认的主题 | 字符串 | 该标签不可缺省。 |

resources/base/profile路径下的theme\_config.json资源文件示例如下：

```json
{
  "systemTheme": "$ohos:theme:ohos_theme"
}
```

## requiredDeviceFeatures标签

**表30** requiredDeviceFeatures标签说明

| 属性名称 | 含义 | 数据类型 | 是否可缺省 |
| --- | --- | --- | --- |
| phone | [大屏横屏](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-multi-device-screen-layout#section6493354468) | 字符串数组 | 可缺省，缺省值为空。 |

requiredDeviceFeatures示例：

```json
{
  "module": {
    "requiredDeviceFeatures": {
      "phone": [
        "large_screen"
      ]
    },
  }
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file*