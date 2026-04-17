---
title: 如何解决编译报错“ The inferred type of 'xxx' cannot be named without a reference to 'xxx'. This is likely not portable. A type annotation is necessary.”的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-128
category: FAQ
updated_at: 2026-03-13T05:42:13.961Z
---

# 如何解决编译报错“ The inferred type of 'xxx' cannot be named without a reference to 'xxx'. This is likely not portable. A type annotation is necessary.”的问题

**问题现象**

编译报错“The inferred type of 'xxx' cannot be named without a reference to 'xxx'. This is likely not portable. A type annotation is necessary”。

**问题原因**

HSP生成的.d.ts声明文件缺少类型注解，因为原始文件中未注明类型。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/53/v3/spmuFNyAR1Sc8KmC24gLRQ/zh-cn_image_0000002229758869.png?HW-CC-KV=V1&HW-CC-Date=20260313T054209Z&HW-CC-Expire=86400&HW-CC-Sign=6CD0E536ECB11114EE3765245A8D0574F26D15089413DB795C99D6ACB96D9FFB "点击放大")

**解决方案**

在报错位置添加类型注解。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-128*