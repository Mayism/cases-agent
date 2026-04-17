---
title: 编译报错“There are some dependency names that are inconsistent with the actual package names”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-144
category: FAQ
updated_at: 2026-03-13T05:44:13.044Z
---

# 编译报错“There are some dependency names that are inconsistent with the actual package names”

**错误描述**

依赖名称与包名称不匹配。

**可能原因**

依赖名称与依赖包中oh-package.json5文件的name字段不一致。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8c/v3/_kM357i0Rq-Fn9VIRiUN6A/zh-cn_image_0000002229758445.png?HW-CC-KV=V1&HW-CC-Date=20260313T054408Z&HW-CC-Expire=86400&HW-CC-Sign=3A687C4962C05C5300A05473679CB69B64A7DC896F9F1649D4BF9D0BD564C3BF)

**解决措施**

将依赖名修改为依赖包在oh-package.json5中定义的name。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-144*