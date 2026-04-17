---
title: InferShapeFuncRegister
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-infershapefuncregister
category: 指南
updated_at: 2026-03-13T02:47:50.627Z
---

# InferShapeFuncRegister

## 函数功能

InferShapeFuncRegister构造函数和析构函数。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
InferShapeFuncRegister (const std::string &operator_type, const InferShapeFunc &infer_shape_func);
InferShapeFuncRegister(const char *const operator_type, const InferShapeFunc &infer_shape_func);
~ InferShapeFuncRegister()
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| operator_type | 输入 | 算子类型。 |
| infer_shape_func | 输入 | 算子InferShape函数。 |

## 返回值

InferShapeFuncRegister构造函数返回InferShapeFuncRegister类型的对象。

## 约束说明

算子InferShape函数注册接口，此接口被其他头文件引用，一般不用由算子开发者直接调用。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-infershapefuncregister*