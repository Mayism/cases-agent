---
title: 编译报错“ERROR: Failed :entry:default@CompileResource”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-5
category: FAQ
updated_at: 2026-03-13T05:30:30.243Z
---

# 编译报错“ERROR: Failed :entry:default@CompileResource”

**问题现象**

在构建依赖HSP的HAP模块时，如果出现“ERROR: Failed :entry:default@CompileResource”错误，提示某资源文件不存在，但该资源文件实际存在于HSP内，请检查以下几点：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/21/v3/ByUMXrYcTuO-0sb4QpmpyQ/zh-cn_image_0000002194318592.png?HW-CC-KV=V1&HW-CC-Date=20260313T053023Z&HW-CC-Expire=86400&HW-CC-Sign=F8D671A138679C99C15640CD7668CD1FA53892FA65CED0DACFA4A3BC472A5DF3)

**问题原因**

出现该问题的原因是HSP的module.json5中声明了权限申请等配置项时，引用了HSP自身的资源文件。构建时会将HSP的资源配置合并到HAP中，但运行时HAP无法直接访问HSP的资源文件。

**解决措施**

-   在各引用的HSP的module.json5中搜索对应资源，确认引入该资源的来源；
-   可以在引用方HAP内或appScope中添加相应资源以规避问题；
-   在引用方HAP的module.json5中声明相同的内容，可以在合并冲突时优先使用引用方HAP中的内容。例如，上图中的报错是由于HSP申请权限引起的，可以通过在引用方HAP中申请相同的权限来避免合并HSP中的这部分内容。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/R69GyBh1S3Kcyo8P0NltTw/zh-cn_image_0000002229758857.png?HW-CC-KV=V1&HW-CC-Date=20260313T053023Z&HW-CC-Expire=86400&HW-CC-Sign=399D64F6550A4D9562BE9CC2C53A9D3E7683558683462BB6141ECDF511A4BD71)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-5*