---
title: 编译报错“Property 'XX' does not exist on type 'typeof BuildProfile'”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-42
category: FAQ
updated_at: 2026-03-13T05:34:02.760Z
---

# 编译报错“Property 'XX' does not exist on type 'typeof BuildProfile'”

**问题现象**

本地HSP模块对外提供的接口中使用了未在HAP中定义的自定义参数BuildProfileFields。HAP引用了HSP中的该接口，导致编译失败，提示“Property 'XX' does not exist on type 'typeof BuildProfile'”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d8/v3/whOdQzanSlaY3mzJGRyu-g/zh-cn_image_0000002194158808.png?HW-CC-KV=V1&HW-CC-Date=20260313T053358Z&HW-CC-Expire=86400&HW-CC-Sign=D8D981E14480F16AB8315327AB3EB3E85EDB1BF34E1E6CF51557CF62135742B8)

**解决措施**

采用以下两种方式解决该问题：

-   在HAP中配置与HSP相同的自定义参数BuildProfileFields。
-   将与HSP相同的自定义参数BuildProfileFileds配置到工程级build-profile.json5中。这种方法会使HSP中的自定义参数在全局生效。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-42*