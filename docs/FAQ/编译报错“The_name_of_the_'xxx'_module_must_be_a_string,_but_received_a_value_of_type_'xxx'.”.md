---
title: 编译报错“The name of the 'xxx' module must be a string, but received a value of type 'xxx'.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-151
category: FAQ
updated_at: 2026-03-13T05:45:01.021Z
---

# 编译报错“The name of the 'xxx' module must be a string, but received a value of type 'xxx'.”

**错误描述**

模块名称必须是字符串类型。

**可能原因**

模块下oh-package.json5中配置的模块名name字段，配置值不是字符串类型。

**解决措施**

在模块的oh-package.json5文件中，将name字段的值修改为字符串类型。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-151*