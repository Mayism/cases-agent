---
title: 编译报错“The srcPath is not a relative path：xxx”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-138
category: FAQ
updated_at: 2026-03-13T05:43:23.532Z
---

# 编译报错“The srcPath is not a relative path：xxx”

**错误描述**

srcPath字段配置值必须为相对路径。

**可能原因**

开发者在hvigorconfig.ts文件中使用includeNode方法时，srcPath必须是相对路径。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/95/v3/sN-cvtC5TqmlXljtYJ9vkw/zh-cn_image_0000002229604333.png?HW-CC-KV=V1&HW-CC-Date=20260313T054316Z&HW-CC-Expire=86400&HW-CC-Sign=5199ECC9B014D71579728899BDF1212E1C33FE4935C992C9EC37B70EE9F751C0)

**解决措施**

确保项目的hvigorconfig.ts文件中使用includeNode时的传参srcPath为相对路径。

**参考链接**

[Hvigor脚本文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-life-cycle#section810245135914)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-138*