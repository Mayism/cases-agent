---
title: 编译报错“File 'string.json' is missing the required property 'string'.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-147
category: FAQ
updated_at: 2026-03-13T05:44:34.174Z
---

# 编译报错“File 'string.json' is missing the required property 'string'.”

**错误描述**

资源文件“string.json”缺少必需属性“string”。

**可能原因**

hap模块依赖的hsp或har包中的资源文件string.json缺少必需的属性“string”。

**解决措施**

确保hsp或har文件中的“string.json”包含“string”属性。

示例：

```json
{
  "string": [
    {
      "name": "shared_desc",
      "value": "description"
    }
  ]
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-147*