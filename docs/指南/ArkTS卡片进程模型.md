---
title: ArkTS卡片进程模型
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-process
category: 指南
updated_at: 2026-03-12T11:54:57.930Z
---

# ArkTS卡片进程模型

本文主要介绍，卡片从创建到显示整个过程中各个进程的含义。具体请参考卡片进程模型。

**图1** 卡片进程模型

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/61/v3/Pvw9KgD2QoSRoT-1I8-C3w/zh-cn_image_0000002527376924.png?HW-CC-KV=V1&HW-CC-Date=20260312T115430Z&HW-CC-Expire=86400&HW-CC-Sign=F32455FAE94F08915EF066FBD08EE19B5C190D9E651EBF78BF08ED08EED859E8)

-   卡片使用方进程：显示卡片的宿主进程，例如桌面进程。
-   卡片渲染服务进程：系统内统一加载渲染卡片UI的进程，所有卡片渲染在同一个进程内，不同的应用卡片通过虚拟机隔离。
-   卡片管理服务进程：系统内统一卡片生命周期的系统[SA](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/serviceability-overview)服务。
-   卡片提供方进程：提供卡片的应用进程，包括应用自身UIAbility运行的主进程，以及卡片单独的[FormExtensionAbility](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-form-formextensionability)进程。两个进程之间内存隔离，但是共享相同的文件沙箱。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-process*