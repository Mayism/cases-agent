---
title: 如何结合trace，分析卡顿率指标异常问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-scenario-based-performance-test-12
category: FAQ
updated_at: 2026-03-13T06:11:10.757Z
---

# 如何结合trace，分析卡顿率指标异常问题

下载并打开trace后，通过上报的Present ID字段搜索，可快速定位问题点。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/HsXjPmErRf-4XRo6-eEocA/zh-cn_image_0000002229758405.png?HW-CC-KV=V1&HW-CC-Date=20260313T061104Z&HW-CC-Expire=86400&HW-CC-Sign=CF8DBCDF602AE842A78322DAE99DAB4FA07E925C5E7E84EB5844B27AFF596CF8 "点击放大")

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5c/v3/XZpD3NsXTT6ES7DVPzhvhQ/zh-cn_image_0000002194318144.png?HW-CC-KV=V1&HW-CC-Date=20260313T061104Z&HW-CC-Expire=86400&HW-CC-Sign=F3CF19830E8DF2BE65819CF03A1D42A08FD0A19E4C04CB45B7F9755533B2DDA0 "点击放大")

上图中，99009这一帧在屏幕上持续了33ms，超出应持续的16.6ms，被统计为丢1帧。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-scenario-based-performance-test-12*