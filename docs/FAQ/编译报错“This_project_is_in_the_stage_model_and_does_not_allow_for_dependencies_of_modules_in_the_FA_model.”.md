---
title: 编译报错“This project is in the stage model and does not allow for dependencies of modules in the FA model.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-154
category: FAQ
updated_at: 2026-03-13T05:45:17.740Z
---

# 编译报错“This project is in the stage model and does not allow for dependencies of modules in the FA model.”

**错误描述**

Stage模型项目不得依赖FA模型模块。

**可能原因**

Stage模型的项目根目录下的build-profile.json5文件中，srcPath字段指定了 FA 模型的工程模块。

**解决措施**

在项目根目录下的build-profile.json5文件中，移除对FA模型工程模块的引用。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-154*