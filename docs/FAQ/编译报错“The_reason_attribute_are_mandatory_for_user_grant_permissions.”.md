---
title: 编译报错“The reason attribute are mandatory for user_grant permissions.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-159
category: FAQ
updated_at: 2026-03-13T05:45:45.708Z
---

# 编译报错“The reason attribute are mandatory for user_grant permissions.”

**错误描述**

针对Har和Hsp模块，配置user\_grant权限时必须包含reason属性。

**可能原因**

在module.json5文件中配置user\_grant类型的权限时，必须包含reason属性。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1d/v3/hfUW1thVS9OASJlVStq4bQ/zh-cn_image_0000002229758313.png?HW-CC-KV=V1&HW-CC-Date=20260313T054539Z&HW-CC-Expire=86400&HW-CC-Sign=644D9A182CAF0186726D5BA6D9711953B75E84DC430B01F495B513310F654997)

**解决措施**

hap模块的module.json5文件中添加reason和usedScene字段。

在module.json5文件的requestPermissions中添加reason字段，用于har/hsp模块。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-159*