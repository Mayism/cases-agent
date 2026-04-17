---
title: 编译报错“Only one default card can be configured in the form_config.json file”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-39
category: FAQ
updated_at: 2026-03-13T05:33:28.413Z
---

# 编译报错“Only one default card can be configured in the form_config.json file”

**问题现象**

DevEco Studio编译失败。提示：Only one default card can be configured in the form\_config.json file。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/5e5MRWLmTkWEEld4egMURA/zh-cn_image_0000002229758657.png?HW-CC-KV=V1&HW-CC-Date=20260313T053323Z&HW-CC-Expire=86400&HW-CC-Sign=F2C66552A2C312769AD8A5DB3719EEC4DB4CFF92CE19E3C7E4C253B298F6D400 "点击放大")

**问题原因**

从DevEco Studio NEXT Developer Preview2版本开始，新增规则：卡片的配置文件中isDefault不可缺省。每个UIAbility有且只有一个默认卡片。

**解决措施**

进入对应module.json5文件，选择唯一默认卡片。将其他卡片的isDefault字段设置为false。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-39*