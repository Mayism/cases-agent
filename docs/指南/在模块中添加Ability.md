---
title: 在模块中添加Ability
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-add-new-ability
category: 指南
updated_at: 2026-03-13T04:00:24.886Z
---

# 在模块中添加Ability

Ability是应用/元服务所具备的能力的抽象，应用的一个Module可以包含一个或多个Ability，元服务仅包含一个Ability。应用/元服务先后提供了两种应用模型：

-   FA（Feature Ability）模型： API 7开始支持的模型，已经不再主推。
-   Stage模型：HarmonyOS 3.1 Developer Preview版本开始新增的模型，是目前主推且会长期演进的模型。在该模型中，由于提供了AbilityStage、WindowStage等类作为应用组件和Windows窗口的“舞台”，因此称这种应用模型为Stage模型。
    
    Stage模型包含两种Ability组件类型：
    
    -   UIAbility组件：包含UI界面，提供展示UI的能力，主要用于和用户交互。详细介绍请参见[UIAbility组件概述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/uiability-overview)。
    -   ExtensionAbility组件：提供特定场景的扩展能力，满足更多的使用场景。详细介绍请参见[ExtensionAbility概述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/extensionability-overview)。元服务暂不支持使用ExtensionAbility组件。

## Stage模型添加Ability

### 在模块中添加UIAbility

1.  选中对应的模块，单击鼠标右键，选择**New > Ability**。
2.  设置Ability名称，选择是否在设备主屏幕上显示该功能的启动图标，单击**Finish**完成Ability创建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/kbMmAUFiQeOlVA9S1i5vhw/zh-cn_image_0000002532750429.png?HW-CC-KV=V1&HW-CC-Date=20260313T035945Z&HW-CC-Expire=86400&HW-CC-Sign=D97E2E1960D962464D65B2E71F509102AB73149D54A69B7891073E62DA5C2C06)
    

### 在模块中添加Extension Ability

1.  在工程中选中对应的模块，单击鼠标右键，选择**New > Extension Ability**，选择不同的场景类型 。当前仅Application工程支持创建Extension Ability。
    
    -   若创建的模块类型为entry或feature，支持创建以下五种Extension Ability：
        -   **EmbeddedUIExtensionAbility**：用于提供[跨进程界面嵌入](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/embeddeduiextensionability)的能力。
        -   **Backup****Ability**：用于提供[备份及恢复应用数据](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-file-backup-overview)的能力。
        -   **WorkScheduler**：用于提供[延迟任务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/work-scheduler)的相关能力。
        -   **RemoteNotificationAbility**：用于提供获取场景化消息数据和生命周期销毁的回调的通知能力。
        -   **Driver**：用于提供[驱动相关扩展框架](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/driverextensionability)。仅在当前工程的设备类型只含有2in1设备时，支持创建该类型。
    -   若创建的模块类型为HAR或HSP，支持创建以下两种Extension Ability：
        -   **EmbeddedUIExtensionAbility**：用于提供[跨进程界面嵌入](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/embeddeduiextensionability)的能力。
        -   **WorkScheduler**：用于提供[延迟任务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/work-scheduler)的相关能力。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f/v3/muPqUD8wSfyY6BcaAizWkA/zh-cn_image_0000002501070404.png?HW-CC-KV=V1&HW-CC-Date=20260313T035945Z&HW-CC-Expire=86400&HW-CC-Sign=5FCC2DBE14C386BD428C528163C63C50518FC296F026AF4024C303B0BF8FD515)
    
2.  设置Ability名称，单击Finish完成Extension Ability创建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ac/v3/hL-E_3eXQlKehSVsM5pdwg/zh-cn_image_0000002532670469.png?HW-CC-KV=V1&HW-CC-Date=20260313T035945Z&HW-CC-Expire=86400&HW-CC-Sign=A261D58DB64D824324EE2FD4DA6A7439D1CB1AC6814288F5838BCDED94534FB2)
    

## FA模型添加Ability

ArkTS工程与JS工程在FA模型中添加Ability的操作方式一致，本节内容以ArkTS工程为例介绍在模块中添加Ability。

### 创建Particle Ability

1.  选中对应的模块，单击鼠标右键，选择**New > Ability** ，然后选择对应的Data Ability/Service Ability模板。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/yIe_WcUWQJKCUAijIDibgA/zh-cn_image_0000002532670477.png?HW-CC-KV=V1&HW-CC-Date=20260313T035945Z&HW-CC-Expire=86400&HW-CC-Sign=51FE8BA3ECCC3FF9AE6B8B5296CCC8B622D5E8F2FBEA6408750D26E75FC3B8A8)
    
2.  根据选择的Ability模板，设置Ability的基本信息。
    
    -   **Ability name**：Ability类名称，由大小写字母、数字和下划线组成。
    -   **Language**：该Ability使用的开发语言。
    
3.  单击**Finish**完成Ability的创建，可以在工程目录对应的模块中查看和编辑Ability。

### 创建Feature Ability

1.  选中对应的模块，单击鼠标右键，选择**New > Ability** ，然后选择对应的Page Ability模板。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7e/v3/L_8s--irT_mLPtFq5Oxx3g/zh-cn_image_0000002501070398.png?HW-CC-KV=V1&HW-CC-Date=20260313T035945Z&HW-CC-Expire=86400&HW-CC-Sign=3251C4F5675D48F178095148924BA18D241B59ED8A01520FDDC61D85CC2929FC)
    
2.  根据选择的Ability模板，设置Ability的基本信息。
    
    -   **Ability name**：Ability类名称，由大小写字母、数字和下划线组成。
    -   **Launcher ability**：表示该Ability在终端桌面上是否有启动图标，一个HAP可以有多个启动图标，来启动不同的FA。
    -   **Language**：该Ability使用的开发语言。
    
3.  单击**Finish**完成Ability的创建，可以在工程目录对应的模块中查看和编辑Ability。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-add-new-ability*