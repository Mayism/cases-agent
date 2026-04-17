---
title: GetShape
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensordesc-getshape
category: 指南
updated_at: 2026-03-13T03:04:34.503Z
---

# GetShape

## 函数功能

获取TensorDesc所描述Tensor的Shape。

## 函数原型

```cpp
Shape GetShape() const;
```

## 参数说明

无

## 返回值

| 类型 | 描述 |
| --- | --- |
| [Shape](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-shape) | TensorDesc描述的shape。 |

## 异常处理

无

## 约束说明

由于返回的Shape信息为值拷贝，因此修改返回的Shape信息，不影响TensorDesc中已有的Shape信息。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensordesc-getshape*