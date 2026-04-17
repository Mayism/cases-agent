---
title: 是否支持#include <memory_resource>和std::pmr::vector
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-149
category: FAQ
updated_at: 2026-03-13T03:16:09.157Z
---

# 是否支持#include <memory_resource>和std::pmr::vector

暂时不支持。

C++从C++17标准开始正式支持 <memory\_resource> 和std::pmr::vector等“多态内存资源”容器，开发者可以直接在sdk下查询到当前llvm版本是15.0.4，暂时不支持部分C++17高级特性。

Windows：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/55/v3/TITVqu-IRS2zFFLb9ZRc4A/zh-cn_image_0000002335841501.png?HW-CC-KV=V1&HW-CC-Date=20260313T031604Z&HW-CC-Expire=86400&HW-CC-Sign=CD23F7710ADC4B80F4EDE995ECA80C8C5D616DD0033EF879646063FE962FAAFE)

Mac：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ee/v3/rFLwULQ2RX-knvW6TFqQMg/zh-cn_image_0000002301915320.png?HW-CC-KV=V1&HW-CC-Date=20260313T031604Z&HW-CC-Expire=86400&HW-CC-Sign=697C40A44BDBF9E3C2AFFDC5D8F082AE37F60CC084FDA90A4D6B8C7D47788E24 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-149*