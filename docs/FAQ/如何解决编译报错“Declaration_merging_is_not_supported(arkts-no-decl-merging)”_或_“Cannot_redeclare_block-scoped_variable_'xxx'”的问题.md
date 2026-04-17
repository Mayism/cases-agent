---
title: 如何解决编译报错“Declaration merging is not supported(arkts-no-decl-merging)” 或 “Cannot redeclare block-scoped variable 'xxx'”的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-127
category: FAQ
updated_at: 2026-03-13T05:42:08.374Z
---

# 如何解决编译报错“Declaration merging is not supported(arkts-no-decl-merging)” 或 “Cannot redeclare block-scoped variable 'xxx'”的问题

**问题现象**

在不同的文件中声明相同变量、interface、enum等类型，DevEco Studio不报错，但编译时会报错。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/PsPZc7iGQVyz2gHbajnLfQ/zh-cn_image_0000002229604153.png?HW-CC-KV=V1&HW-CC-Date=20260313T054203Z&HW-CC-Expire=86400&HW-CC-Sign=762BB895432125F11B166C16425AE87BA17293F60AB42A3A3D0900E3533AEAEC)

**解决方案**

如果文件中不包含export关键字，该文件将视为全局命名空间的一部分。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-127*