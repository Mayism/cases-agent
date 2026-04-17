---
title: 编译报错“The metadata field in FormExtensionAbility cannot be left blank or as an empty array”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-164
category: FAQ
updated_at: 2026-03-13T05:46:14.213Z
---

# 编译报错“The metadata field in FormExtensionAbility cannot be left blank or as an empty array”

**错误描述**

FormExtensionAbility中的metadata字段必须非空且不为数组。

**可能原因**

在module.json5文件中，当ExtensionAbility的type为form时，metadata字段可以是空对象或空数组。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/IkEnbT9NSWuTn1OM6iU1kg/zh-cn_image_0000002194158712.png?HW-CC-KV=V1&HW-CC-Date=20260313T054609Z&HW-CC-Expire=86400&HW-CC-Sign=386D3D56FFC5C23B209B8B5DE6AB8F37F0FEE6233833BA8137F23CDB139B4770)

**解决措施**

在module.json5中type为form的ExtensionAbility中配置metadata字段，具体配置方式参考[配置ArkTS卡片的配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-configuration)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-164*