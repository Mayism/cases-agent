---
title: SetDataType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setdatatype
category: 指南
updated_at: 2026-03-13T03:09:22.001Z
---

# SetDataType

## 函数功能

设置Tensor的Datatype。

## 函数原型

```cpp
graphStatus SetDataType(const ge::DataType &dtype);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| dtype | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | 设置成功返回GRAPH_SUCCESS，否则，返回GRAPH_FAILED。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setdatatype*