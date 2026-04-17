---
title: COMMON_INFER_FUNC_REG
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-common-infer-func-reg
category: 指南
updated_at: 2026-03-13T03:15:16.892Z
---

# COMMON_INFER_FUNC_REG

## 函数功能

注册算子的InferShape函数。

与[INFER\_FUNC\_REG](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-infer-func-reg)的区别是，此函数注册的InferShape函数入参为operator基类而非子类，此接口支持多算子共用同一个InferShape函数。

## 函数原型

```cpp
COMMON_INFER_FUNC_REG(op_name, x)
```

该函数内部会自动调用COMMON\_INFER\_VERIFY\_FUNC(x)，COMMON\_INFER\_VERIFY\_FUNC(x)函数中的x为指向COMMON\_INFER\_FUNC\_REG(op\_name, x)中“x”的指针。

## 约束说明

无

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| op_name | 输入 | 算子类型。 |
| x | 输入 | [IMPLEMT_COMMON_INFERFUNC](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-implemt-common-inferfunc) |

## 返回值

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-common-infer-func-reg*