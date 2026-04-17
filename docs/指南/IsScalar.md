---
title: IsScalar
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-isscalar
category: 指南
updated_at: 2026-03-13T02:27:22.104Z
---

# IsScalar

## 函数功能

判断本shape是否为标量，所谓标量，是指GetDimNum()为0的张量。

## 函数原型

```cpp
bool IsScalar() const
```

## 参数说明

无

## 返回值

true为标量，false为非标量。

## 约束说明

无

## 调用示例

```cpp
Shape shape0({3, 256, 256});
Shape shape2;
shape0.IsScalar(); // false
shape2.IsScalar(); // true
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-isscalar*