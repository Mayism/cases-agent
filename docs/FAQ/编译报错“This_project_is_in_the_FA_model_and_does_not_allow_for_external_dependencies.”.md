---
title: 编译报错“This project is in the FA model and does not allow for external dependencies.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-153
category: FAQ
updated_at: 2026-03-13T05:45:12.196Z
---

# 编译报错“This project is in the FA model and does not allow for external dependencies.”

**错误描述**

FA模型项目不得依赖外部项目模块。

**可能原因**

在FA模型项目中，build-profile.json5文件的srcPath字段引用了外部项目模块。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5c/v3/W4x_fHcASSuyIRbqkcMggQ/zh-cn_image_0000002194318412.png?HW-CC-KV=V1&HW-CC-Date=20260313T054507Z&HW-CC-Expire=86400&HW-CC-Sign=2EDB3073A77B941DB98C15175EF97F6899C82232976DF60A3D9328E11DFB19B2)

**解决措施**

在项目根目录的build-profile.json5文件中，移除srcPath字段依赖的外部项目模块。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-153*