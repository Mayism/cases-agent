---
title: GetOutputDesc
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-operator-getoutputdesc
category: 指南
updated_at: 2026-03-13T02:53:41.762Z
---

# GetOutputDesc

## 函数功能

根据算子Output名称或Output索引获取算子Output的TensorDesc。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
TensorDesc GetOutputDesc(const std::string &name) const;
TensorDesc GetOutputDescByName(const char_t *name) const;
TensorDesc GetOutputDesc(uint32_t index) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| name | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |
| index | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |

## 返回值

| 类型 | 描述 |
| --- | --- |
| [TensorDesc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensordesc) | 算子Output的TensorDesc。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-operator-getoutputdesc*