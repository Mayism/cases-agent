---
title: Get
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-get
category: 指南
updated_at: 2026-03-13T02:12:34.851Z
---

# Get

## 函数功能

获取第index个元素的首地址。

## 函数原型

```cpp
const ContinuousVector *Get(const size_t index) const
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| index | 输入 | 元素index。 |

## 返回值

第index个元素的首地址。

## 约束说明

无

## 调用示例

```cpp
// 创建ContinuousVectorVector对象cvv
// ...
// 增加元素
// ...
auto cv = cvv->add(inner_vector_capacity);
// ...
// 获取第0个元素的首地址
auto cv1 = cvv->Get(0U);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-get*