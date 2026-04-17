---
title: Share Kit简介
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/share-introduction
category: 指南
updated_at: 2026-03-13T01:08:24.450Z
---

# Share Kit简介

Share Kit（分享服务）为应用提供文本、图片、视频等内容跨应用、跨端分享能力。

应用把需要分享的内容和预览样式配置给Share Kit，Share Kit将根据不同的场景进行使用：

-   针对应用间分享的场景，根据分享的数据类型、数量等信息构建分享面板，为用户提供内容预览、推荐分享联系人、关联应用及操作界面，便于用户快速选择分享应用或操作，将内容分发到目标应用。
-   针对跨端分享的场景，根据分享的数据类型、数量等信息构建预览界面，用于跨端分享。

如果应用需要显示在分享面板，则需要构建数据处理能力并按照配置要求在应用配置文件中声明，社交类应用可以通过[意图框架](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-introduction)接口捐献联系人信息，可以让用户一步分享到应用内的指定用户。

Share Kit（分享服务）提供的[SampleCode示例工程](https://gitcode.com/harmonyos_samples/share-kit_-sample-code_-clientdemo_-arkts)体现了系统分享接入模式、文本/图片等分享示例、碰一碰分享示例及卡片模板，可参考该工程进行应用的相关内容开发。

**图1** 手机分享面板效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/8T05abm7Qf6VEoWqZoGh8g/zh-cn_image_0000002513409515.png?HW-CC-KV=V1&HW-CC-Date=20260313T010747Z&HW-CC-Expire=86400&HW-CC-Sign=4301452197C14FF5428A03963FC74305E1E9B7E22B3BFF4D8CBC8DF2C40DD59F "点击放大")

**图2** 手机碰一碰跨端发起华为分享效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c/v3/rtHkUU0sQwK3VpeGqOn41g/zh-cn_image_0000002481169682.gif?HW-CC-KV=V1&HW-CC-Date=20260313T010747Z&HW-CC-Expire=86400&HW-CC-Sign=64EA9CE63F1FAF58EC0BBDE7C65C5ED6D9A1667A294BC8948EF88E893FA56072 "点击放大")

**图3** 手机与PC/2in1设备碰一碰分享效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f5/v3/19GN83sFSkC7jlKStBXvAw/zh-cn_image_0000002481329646.gif?HW-CC-KV=V1&HW-CC-Date=20260313T010747Z&HW-CC-Expire=86400&HW-CC-Sign=A2D0C1BF182BCDFADB10C1BC6921C456862B289A85429380553468AB3D331191 "点击放大")

## 基本概念

-   宿主应用
    
    分享行为的发起者。通过调用分享接口，配置分享的内容、预览样式等信息后展示分享面板。
    
-   目标应用
    
    分享内容的接收者。需要在应用中构建数据处理能力并按照目标应用接入指南进行能力声明，使得包管理服务可以识别应用支持的能力。
    
-   内容区
    
    负责显示分享内容标题、预览、选择等信息，供用户选择。
    
-   推荐区
    
    对接华为分享和[意图框架](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-introduction)，通过算法高效、精准推荐能够处理内容的设备和目标应用用户。
    
-   分享方式区
    
    通过HarmonyOS的包管理服务获取支持分享内容的目标应用。支持2种跳转方式：
    
    1、跳转目标应用内UIAbility组件。
    
    2、跳转目标应用提供的ExtensionAbility组件（以下称为“分享详情页”）。
    
    应用组件需通过在[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)中配置UIAbility组件和ExtensionAbility组件的描述信息，以声明支持分享的能力。
    
-   操作区
    
    内容相关的操作，由系统提供的复制、保存、另存为、打印等能力。
    

## 运行机制

**图4** 分享运行机制

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/aa/v3/iWF_XwuwSleHUiqv5OXmCA/zh-cn_image_0000002513409517.png?HW-CC-KV=V1&HW-CC-Date=20260313T010747Z&HW-CC-Expire=86400&HW-CC-Sign=DC7F3ED525C45E914DF5DFF095DE4426B06631B4ABE906E4D0523BB5F5A69B83 "点击放大")

| 应用类型 | 相关逻辑 |
| --- | --- |
| 宿主应用 | [通过分享面板发起分享](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/share-mobilephone-app-share) |
| 目标应用 | [应用内处理分享内容](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/share-interface-description) |

## 约束与限制

-   设备限制
    
    | 能力 | 支持的设备类型 |
    | --- | --- |
    | 手机 | 平板 | PC/2in1 | TV |
    | 系统分享 | 支持 | 支持 | 支持 | 部分支持（仅支持分享到周边设备，不支持系统操作及分享给其他应用） |
    | 碰一碰分享 | 支持 | 不支持 | 支持 | 不支持 |
    | 隔空传送 | 支持 | 支持 | 支持 | 不支持 |
    
-   使用限制
    -   宿主应用和目标应用定义数据类型须遵照[UDMF](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/unified-data-definition-overview)（统一数据管理框架）定义的[UTD](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/uniform-data-type-descriptors)（统一类型描述符）规范。目标应用需要在应用配置文件中，配置支持的类型。如支持全部图片类型，可声明为：general.image。
    -   宿主应用单次分享可配置[分享数据描述信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/share-system-share#section816451553012)总量不能超过200KB，且分享条目总量不能超过500条。

## 模拟器支持范围

Share Kit支持模拟器开发，但与真机存在部分能力差异。详情请参见：[模拟器与真机的差异](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-emulator-specification#section38231424133213)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/share-introduction*