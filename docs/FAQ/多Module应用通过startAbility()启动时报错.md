---
title: 多Module应用通过startAbility()启动时报错
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-20
category: FAQ
updated_at: 2026-03-13T02:48:46.194Z
---

# 多Module应用通过startAbility()启动时报错

**原因**

在同一个工程和设备中存在多个模块，并且这些模块之间存在调用关系，但并非所有HAP包都已安装到设备中。

**解决措施**

单击Run > Edit Configurations，设置指定模块的HAP安装方式，勾选“Keep Application Data”，表示采用覆盖安装方式，保留应用和服务的缓存数据。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/da/v3/k_wgu-QvRAiVjGlKyUht8Q/zh-cn_image_0000002194318612.png?HW-CC-KV=V1&HW-CC-Date=20260313T024841Z&HW-CC-Expire=86400&HW-CC-Sign=15838A49B5C5B6C45ADB1BA75BEDAA5464CFA783840F50E1F33A321282B7297C "点击放大")

**参考链接**

[设置HAP安装方式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-run-debug-configurations#section531811771410)

[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-20*