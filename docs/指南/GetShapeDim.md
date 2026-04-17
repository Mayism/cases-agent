---
title: GetShapeDim
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getshapedim
category: 指南
updated_at: 2026-03-13T03:09:02.697Z
---

# GetShapeDim

## 函数功能

获取shape第idx维度。

## 函数原型

```cpp
int64_t GetShapeDim(const size_t idx) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| idx | 输入 | 维度的索引，索引从0开始。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| int64_t | 返回shape第idx位置的值，默认值为0。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getshapedim*