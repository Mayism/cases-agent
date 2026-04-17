---
title: SetOutputHandleShapesAndTypes
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setoutputhandleshapesandtypes
category: 指南
updated_at: 2026-03-13T02:45:59.942Z
---

# SetOutputHandleShapesAndTypes

## 函数功能

在推理上下文中，设置算子输出句柄的[ShapeAndType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-shapeandtype)。

## 函数原型

```cpp
void SetOutputHandleShapesAndTypes(const std::vector<std::vector<ShapeAndType>> &shapes_and_types)
void SetOutputHandleShapesAndTypes(std::vector<std::vector<ShapeAndType>> &&shapes_and_types)
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| shapes_and_types | 输入 | [ShapeAndType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-shapeandtype) |

## 返回值

无

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setoutputhandleshapesandtypes*