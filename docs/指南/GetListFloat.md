---
title: GetListFloat
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getlistfloat
category: 指南
updated_at: 2026-03-13T02:26:21.095Z
---

# GetListFloat

## 函数功能

获取list\_float32类型的属性值。

## 函数原型

```cpp
const TypedContinuousVector<float> *GetListFloat(const size_t index) const
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| index | 输入 | 属性在IR原型定义中以及在OP_IMPL注册中的索引。 |

## 返回值

指向属性值的指针。

## 约束说明

无

## 调用示例

```cpp
const RuntimeAttrs * runtime_attrs = kernel_context->GetAttrs();
const TypedContinuousVector<float> *attr0 = runtime_attrs->GetListFloat(0);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getlistfloat*