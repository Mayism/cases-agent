---
title: GetOmOptype
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getomoptype
category: 指南
updated_at: 2026-03-13T02:58:52.584Z
---

# GetOmOptype

## 函数功能

获取模型的算子类型。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
std::string GetOmOptype () const;
Status GetOmOptype(ge::AscendString &om_op_type) const;
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| om_op_type | 输出 | 模型的算子类型。 |

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getomoptype*