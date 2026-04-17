---
title: 如何解决编译报错“Error: cJSON_Parse failed, please check the JSON file.”的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-123
category: FAQ
updated_at: 2026-03-13T05:41:43.437Z
---

# 如何解决编译报错“Error: cJSON_Parse failed, please check the JSON file.”的问题

**问题现象**

编译错误：“Error: cJSON\\\_Parse failed”。请检查JSON文件。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/yfmqeha1SsGuZq0cIIButg/zh-cn_image_0000002194158800.png?HW-CC-KV=V1&HW-CC-Date=20260313T054136Z&HW-CC-Expire=86400&HW-CC-Sign=9B5323304AB7C713C084ADF7CD99417A1DFD86C80B58E0AD05ED6CF67EDD3E37 "点击放大")

**报错原因**

module.json 文件格式不正确。

**常见场景**

1\. JSON文件末尾有多余的逗号。

2\. 根标签不是大括号{}。

**解决方案**

检查报错指向的 JSON 文件格式，例如末尾是否有多余的逗号，根标签是否为大括号 {}。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-123*