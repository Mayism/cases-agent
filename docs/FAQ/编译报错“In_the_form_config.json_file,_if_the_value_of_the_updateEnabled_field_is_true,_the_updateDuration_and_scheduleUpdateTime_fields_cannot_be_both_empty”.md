---
title: 编译报错“In the form_config.json file, if the value of the updateEnabled field is true, the updateDuration and scheduleUpdateTime fields cannot be both empty”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-40
category: FAQ
updated_at: 2026-03-13T05:33:34.170Z
---

# 编译报错“In the form_config.json file, if the value of the updateEnabled field is true, the updateDuration and scheduleUpdateTime fields cannot be both empty”

**问题现象**

在form\_config.json文件中，如果updateEnabled字段的值为true，则updateDuration和scheduleUpdateTime字段不能同时为空。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/46/v3/-8xmCbMdRiewGteGnO8pxw/zh-cn_image_0000002229758573.png?HW-CC-KV=V1&HW-CC-Date=20260313T053329Z&HW-CC-Expire=86400&HW-CC-Sign=1383CDD30EAC30D0426574BB949E641B87621003B842EE2D2E9A68AAED147574 "点击放大")

**问题原因**

从 DevEco Studio NEXT Developer Preview 2 版本开始，新增规则：卡片的配置文件中必须包含updateEnabled，设置为true时，可以选择定时刷新（updateDuration）或定点刷新（scheduledUpdateTime）。如果同时配置了两种刷新方式，定时刷新将优先生效。

**解决措施**

进入 module.json5 文件，根据需求选择配置 updateEnabled 为 false，或配置定时刷新（updateDuration）和定点刷新（scheduledUpdateTime）。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-40*