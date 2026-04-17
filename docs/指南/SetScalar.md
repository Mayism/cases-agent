---
title: SetScalar
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setscalar
category: 指南
updated_at: 2026-03-13T02:27:44.193Z
---

# SetScalar

## 函数功能

设置shape为标量。

## 函数原型

```cpp
void SetScalar()
```

## 参数说明

无

## 返回值

无

## 约束说明

无

## 调用示例

```cpp
Shape shape0({3, 256, 256});
shape0.IsScalar(); // false
shape0.SetScalar();
shape0.IsScalar(); // true
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setscalar*