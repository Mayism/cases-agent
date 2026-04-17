---
title: GetInputDesc
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-operator-getinputdesc
category: 指南
updated_at: 2026-03-13T02:52:43.034Z
---

# GetInputDesc

## 函数功能

根据算子Input名称或Input索引获取算子Input的TensorDesc。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
TensorDesc GetInputDesc(const std::string &name) const;
TensorDesc GetInputDescByName(const char_t *name) const;
TensorDesc GetInputDesc(uint32_t index) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| name | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |
| index | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |

## 返回值

| 类型 | 描述 |
| --- | --- |
| [TensorDesc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensordesc) | 算子Input的TensorDesc。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-operator-getinputdesc*