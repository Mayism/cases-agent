---
title: C/C++项目三方依赖库未打包到HAP
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-22
category: FAQ
updated_at: 2026-03-13T05:32:02.203Z
---

# C/C++项目三方依赖库未打包到HAP

**问题现象**

C/C++项目依赖三方so时，在打包生成HAP后，发现三方so未打包到HAP中。

**解决措施**

当前DevEco Studio对C/C++项目中第三方so文件的寻址方式存在限制。如果第三方so文件未打包到HAP中，请尝试修改so文件的引入方式。

1.  定义一个别名，例如jsbind\_shared\_lib\_tracing，代表将要引入的三方so。
2.  使用SHARED IMPORT将三方so动态引入。
3.  使用IMPORTED\_LOCATION定义引入的so文件位置。
4.  将定义的三方so声明给目标。![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f9/v3/zn7vwibUTOuIlJSpOjBE8Q/zh-cn_image_0000002194318404.png?HW-CC-KV=V1&HW-CC-Date=20260313T053157Z&HW-CC-Expire=86400&HW-CC-Sign=4AC99E1CAAA6ACA5294247D6E36A1052B35D2D8649B7CAE948B147C52DE567DE)
5.  再次打包生成HAP，确认三方so已打包到HAP中。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-22*