---
title: INFER_FUNC_REG
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-infer-func-reg
category: 指南
updated_at: 2026-03-13T03:16:09.684Z
---

# INFER_FUNC_REG

## 函数功能

注册算子的InferShape函数。

## 函数原型

```cpp
INFER_FUNC_REG(op_name, x)
```

该函数内部会自动调用INFER\_VERIFY\_FUNC(op\_name, x)，INFER\_VERIFY\_FUNC函数中的op\_name为算子的类型，x为指向INFER\_FUNC\_REG（op\_name,x）中“x”的指针。

## 约束说明

无

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| op_name | 输入 | 算子类型。 |
| x | 输入 | [IMPLEMT_INFERFUNC](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-implemt-inferfunc) |

## 返回值

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-infer-func-reg*