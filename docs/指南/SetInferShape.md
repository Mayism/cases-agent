---
title: SetInferShape
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setinfershape
category: 指南
updated_at: 2026-03-13T02:01:48.946Z
---

# SetInferShape

## 函数功能

注册Shape推导函数。

## 函数原型

```cpp
OpDef &SetInferShape(gert::OpImplRegisterV2::InferShapeKernelFunc func);
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| func | 输入 | Shape推导函数。InferShapeKernelFunc类型定义如下。using InferShapeKernelFunc = UINT32 (*)(InferShapeContext *); |

## 返回值

[OpDef](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-opdef)算子定义。

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setinfershape*