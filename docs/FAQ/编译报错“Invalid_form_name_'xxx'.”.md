---
title: 编译报错“Invalid form name 'xxx'.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-146
category: FAQ
updated_at: 2026-03-13T05:44:26.240Z
---

# 编译报错“Invalid form name 'xxx'.”

**错误描述**

卡片名称无效。

**可能原因**

在insight\_intent.json中配置意图框架时，formName必须是form\_config.json中已配置的forms之一。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d9/v3/o7fzwvyXSjKWF2uMqPF-Ew/zh-cn_image_0000002194158436.png?HW-CC-KV=V1&HW-CC-Date=20260313T054419Z&HW-CC-Expire=86400&HW-CC-Sign=103B62F5A2A35E22CD95F63EF7A526FA51B3F0BFA4F3842017E6252B4BDEAE18 "点击放大")

**解决措施**

修改insight\_intent.json中的 form 配置，确保formName已在form\_config.json文件的 forms 中配置。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-146*