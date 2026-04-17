---
title: GetFullSize
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getfullsize
category: 指南
updated_at: 2026-03-13T02:15:14.268Z
---

# GetFullSize

## 函数功能

获取补维后的dim数。

## 函数原型

```cpp
AxisIndex GetFullSize() const
```

## 参数说明

无

## 返回值

返回补维规则的长度，或者说是补维规则描述的维度。

## 约束说明

无

## 调用示例

```cpp
ExpandDimsType type1("1001");
auto dim_num = type1.GetFullSize(); // dim_num=4
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getfullsize*