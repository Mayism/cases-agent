---
title: 编译报错“CMake task execution failed”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-160
category: FAQ
updated_at: 2026-03-13T05:45:51.350Z
---

# 编译报错“CMake task execution failed”

**错误描述**

CMake任务执行时提示“CMake task execution failed”错误信息。

**可能原因**

需要手动删除 .cxx 目录，并在 build-profile.json5 文件的 arguments 字段中添加 “--version” 参数。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/38/v3/OM9y-MbcSBuvKEjvz5m5qQ/zh-cn_image_0000002229604133.png?HW-CC-KV=V1&HW-CC-Date=20260313T054546Z&HW-CC-Expire=86400&HW-CC-Sign=4AF8ED40FEDCA481BA574598B2B733FBCCA66305C207335300EF739405B383B2)

**解决措施**

移除arguments字段中的“--version”参数。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-160*