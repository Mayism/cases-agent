---
title: debug包功能正常，release包开启混淆后应用功能运行异常，页面白屏，崩溃
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-187
category: FAQ
updated_at: 2026-03-13T05:47:37.886Z
---

# debug包功能正常，release包开启混淆后应用功能运行异常，页面白屏，崩溃

**解决措施**

在主模块下的obfuscation-rules.txt文件中配置-disable-obfuscation选项关闭混淆，确认问题是否由混淆引起。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d/v3/U5-1DONzQS-sjLc1N9V5QA/zh-cn_image_0000002372892821.png?HW-CC-KV=V1&HW-CC-Date=20260313T054733Z&HW-CC-Expire=86400&HW-CC-Sign=C3AADB96061F820B82ECB6C4F46C6B6B3593027AEB21E4E7DBEE2ECD4E1C55AC)

如果关闭混淆后，功能恢复正常，可以使用DevEco Studio的混淆助手来辅助配置混淆白名单。

**参考链接**

[通过混淆助手配置保留选项](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-build-obfuscation#section19439175917123)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-187*