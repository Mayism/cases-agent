---
title: SetTiling
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-settiling
category: 指南
updated_at: 2026-03-13T02:03:23.895Z
---

# SetTiling

## 函数功能

注册Tiling函数。

## 函数原型

```cpp
OpAICoreDef &SetTiling(gert::OpImplRegisterV2::TilingKernelFunc func);
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| func | 输入 | Tiling函数。TilingKernelFunc类型定义如下。using TilingKernelFunc = UINT32 (*)(TilingContext *); |

## 返回值

[OpAICoreDef](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-opaicoredef)算子定义。

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-settiling*