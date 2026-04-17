---
title: 编译报错“The required attribute module-srcPath is missing”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-137
category: FAQ
updated_at: 2026-03-13T05:43:15.875Z
---

# 编译报错“The required attribute module-srcPath is missing”

**错误描述**

缺少必需属性：module-srcPath。

**可能原因**

build-profile.json5文件中缺少模块的相对路径，具体表现为module-srcPath字段缺失。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c8/v3/YI-mGkH9QvqXIzdBZb9l4A/zh-cn_image_0000002229758669.png?HW-CC-KV=V1&HW-CC-Date=20260313T054309Z&HW-CC-Expire=86400&HW-CC-Sign=EFA598D8F60570DA7D8FB08341A60151773ACB9DB56A4642CCAAA3A41E699E33)

**解决措施**

进入项目根目录下的build-profile.json5文件，确保module下srcPath字段存在且非空。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-137*