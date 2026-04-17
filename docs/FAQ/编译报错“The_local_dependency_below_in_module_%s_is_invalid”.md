---
title: 编译报错“The local dependency below in module %s is invalid”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-143
category: FAQ
updated_at: 2026-03-13T05:44:07.337Z
---

# 编译报错“The local dependency below in module %s is invalid”

**错误描述**

模块内添加本地依赖项无效。

**可能原因**

当设置"harLocalDependencyCheck": true时，若har模块添加模块外依赖，将触发该编译报错。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0a/v3/XknKgOgQQ1a7j9JSi_L4eA/zh-cn_image_0000002194158324.png?HW-CC-KV=V1&HW-CC-Date=20260313T054402Z&HW-CC-Expire=86400&HW-CC-Sign=C7D360122A67822719D68B2A2E3A2ACB9883C6654F1F80D839A99238261FE5F6)

**解决措施**

设置"harLocalDependencyCheck": true时，确保模块的oh-package.json5文件中，在dependencies和dynamicDependencies下指定的本地依赖都在当前模块目录下。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-143*