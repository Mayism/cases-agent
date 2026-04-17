---
title: GetTensorDesc
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettensordesc
category: 指南
updated_at: 2026-03-13T03:09:09.367Z
---

# GetTensorDesc

## 函数功能

获取Tensor的描述符。

## 函数原型

```cpp
TensorDesc GetTensorDesc() const;
```

## 参数说明

无

## 返回值

| 类型 | 描述 |
| --- | --- |
| [TensorDesc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensordesc) | 返回当前Tensor的描述符。 |

## 异常处理

无

## 约束说明

修改返回的TensorDesc信息，不影响Tensor对象中已有的TensorDesc信息。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettensordesc*