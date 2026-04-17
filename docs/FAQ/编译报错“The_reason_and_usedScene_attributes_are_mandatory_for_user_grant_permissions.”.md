---
title: 编译报错“The reason and usedScene attributes are mandatory for user_grant permissions.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-158
category: FAQ
updated_at: 2026-03-13T05:45:38.941Z
---

# 编译报错“The reason and usedScene attributes are mandatory for user_grant permissions.”

**错误描述**

针对Hap模块，配置user\_grant权限时必须包含reason和usedScene属性。

**可能原因**

在module.json5文件中配置user\_grant类型的权限时，必须包含reason和usedScene属性。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d6/v3/lPPlroRYTaWVfXOVbf3cng/zh-cn_image_0000002194158708.png?HW-CC-KV=V1&HW-CC-Date=20260313T054532Z&HW-CC-Expire=86400&HW-CC-Sign=561235A7C925D9A6FE36E51AA9971F7E9A121D999E52D21E4FA415F4B412B96A)

**解决措施**

对于Hap模块，在module.json5文件的requestPermissions中添加reason和usedScene字段。

对于Har/Hsp模块，在module.json5文件的requestPermissions中添加reason字段。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-158*