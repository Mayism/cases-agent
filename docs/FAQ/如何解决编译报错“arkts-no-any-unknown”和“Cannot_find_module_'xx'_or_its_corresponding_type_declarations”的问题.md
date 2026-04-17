---
title: 如何解决编译报错“arkts-no-any-unknown”和“Cannot find module 'xx' or its corresponding type declarations”的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-129
category: FAQ
updated_at: 2026-03-13T05:42:26.580Z
---

# 如何解决编译报错“arkts-no-any-unknown”和“Cannot find module 'xx' or its corresponding type declarations”的问题

**问题现象**

编译报错“arkts-no-any-unknown”和“Cannot find module 'xx' or its corresponding type declarations”。

**问题****原因**

大小写敏感导致模块无法找到。常见于图片中两种错误同时出现，且仅在Linux系统中出现，Windows和Mac系统不会报错。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f5/v3/dkx-50WuS9a1CK8c8AeYwQ/zh-cn_image_0000002194158772.png?HW-CC-KV=V1&HW-CC-Date=20260313T054221Z&HW-CC-Expire=86400&HW-CC-Sign=752BB82A6045C83F9050656761B5E86A8A8DEC034C5E385F10FDE6F62B2781A4)

**解决方案**

解决引用中的大小写问题。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-129*