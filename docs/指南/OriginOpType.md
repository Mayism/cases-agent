---
title: OriginOpType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-originoptype
category: 指南
updated_at: 2026-03-13T02:57:18.153Z
---

# OriginOpType

## 函数功能

设置原始模型的算子类型或算子类型列表。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
OpRegistrationData &OriginOpType(const std::vector<ge::AscendString> &ori_op_type_list);
OpRegistrationData &OriginOpType(const char_t *ori_op_type);
OpRegistrationData &OriginOpType(const std::initializer_list<std::string> &ori_optype_list);
OpRegistrationData &OriginOpType(const std::string &ori_optype);
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| ori_op_type_list/ori_optype_list | 输入 | 原始模型算子类型列表 |
| ori_op_type/ori_optype | 输入 | 原始模型算子类型 |

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-originoptype*