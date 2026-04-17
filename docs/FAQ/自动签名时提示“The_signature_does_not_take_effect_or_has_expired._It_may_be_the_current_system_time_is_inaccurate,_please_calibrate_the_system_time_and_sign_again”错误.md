---
title: 自动签名时提示“The signature does not take effect or has expired. It may be the current system time is inaccurate, please calibrate the system time and sign again”错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-14
category: FAQ
updated_at: 2026-03-13T05:24:20.660Z
---

# 自动签名时提示“The signature does not take effect or has expired. It may be the current system time is inaccurate, please calibrate the system time and sign again”错误

**问题描述**

自动生成签名失败。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/51/v3/wo2rA8C7Qa-AsYqF3uVd8w/zh-cn_image_0000002229604309.png?HW-CC-KV=V1&HW-CC-Date=20260313T052414Z&HW-CC-Expire=86400&HW-CC-Sign=DF06ECC605ED44C4B197B88429282A6DE662DB17F85EA1FDF35D01686A39AB76)

**解决方案**

报错原因：本地PC和服务器时间不一致。请将本地PC时间与北京时间进行对比，精确到秒。

DevEco Studio签名提示系统时间不正确，请在设置中选择“时间和语言”>“日期和时间”，开启自动设置时间功能，确保时间精确到1-2秒。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-14*