---
title: SetTensorDesc
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-settensordesc
category: 指南
updated_at: 2026-03-13T03:10:40.472Z
---

# SetTensorDesc

## 函数功能

设置Tensor的描述符（TensorDesc）。

## 函数原型

```cpp
graphStatus SetTensorDesc(const TensorDesc &tensor_desc);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| tensor_desc | 输入 | 需设置的Tensor描述符。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | 设置成功返回GRAPH_SUCCESS，否则，返回GRAPH_FAILED。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-settensordesc*