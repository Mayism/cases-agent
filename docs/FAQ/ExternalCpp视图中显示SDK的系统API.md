---
title: ExternalCpp视图中显示SDK的系统API
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-25
category: FAQ
updated_at: 2026-03-13T05:26:57.222Z
---

# ExternalCpp视图中显示SDK的系统API

**问题现象**

ExternalCpp视图中显示SDK的系统API。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a6/v3/m5uhmHgZSBKSWRyyB6tjPQ/zh-cn_image_0000002194158908.png?HW-CC-KV=V1&HW-CC-Date=20260313T052652Z&HW-CC-Expire=86400&HW-CC-Sign=9C75B340F3D828355654DF4C5C3C061AFEF0BA46C864811AA18A0FF048607F1C)

**可能原因**

在本地存在多个DevEco Studio（包括Command Line Tools）打开同一个工程，并且使用daemon模式构建该工程。

**解决措施**

关闭多余的DevEco Studio（包括Command Line Tools）或者使用--no-daemon模式构建工程。

**参考链接**

[守护进程](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-daemon)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-25*