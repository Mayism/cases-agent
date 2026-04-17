---
title: 编译报错“Invalid tag 'xxx' at 'xxx/xxx.json5'.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-148
category: FAQ
updated_at: 2026-03-13T05:44:41.927Z
---

# 编译报错“Invalid tag 'xxx' at 'xxx/xxx.json5'.”

**错误描述**

在xxx/xxx.json5文件中存在无效的tag标签“xxx”。

**可能原因**

在项目根目录的oh-package.json5文件中定义parameterFile参数配置文件的配置版本号时，使用的tag标签包含不符合要求的字符。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/72/v3/kKAe7vtbSYm9Zy9aQIzH_A/zh-cn_image_0000002229758505.png?HW-CC-KV=V1&HW-CC-Date=20260313T054435Z&HW-CC-Expire=86400&HW-CC-Sign=061254DFA4CF41DA426AF46D6AA2C6DE3E562982C6C693D9CC2EEBEFE7F85236)

**解决措施**

确保parameterFile中定义的tag标签仅由字母、数字、“.”、“-”或“\_”组成，必须以字母或数字开头，长度不超过 60 个字符，且不能配置为latest。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-148*