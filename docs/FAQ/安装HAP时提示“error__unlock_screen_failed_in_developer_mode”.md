---
title: 安装HAP时提示“error: unlock screen failed in developer mode”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-39
category: FAQ
updated_at: 2026-03-13T05:56:39.941Z
---

# 安装HAP时提示“error: unlock screen failed in developer mode”

**问题现象**

在启动调试或运行应用/服务时，如果安装HAP失败并显示“error: failed to start ability. error: unlock screen failed in developer mode”错误信息，表示在开发者模式下未能成功解锁屏幕。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e7/v3/ouEZvsyDQc-Os4QYrVs7Hg/zh-cn_image_0000002194317996.png?HW-CC-KV=V1&HW-CC-Date=20260313T055633Z&HW-CC-Expire=86400&HW-CC-Sign=4E406239346F374D7515D1D90D4DB4EEE19A12A2D101D8F0DDA7A660A20E47BC "点击放大")

**解决措施**

该问题的原因是在锁屏状态下，设备设置了锁屏密码，导致应用无法正常启动。

-   方法一：通过设置显示和亮度中的屏幕休眠选项，延长自动休眠时间。
-   方法二：应用开发时，可不设置锁屏密码。应用启动时，设备将自动亮屏并启动应用。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-39*