---
title: GetOverHeadLength
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoverheadlength
category: 指南
updated_at: 2026-03-13T02:13:04.621Z
---

# GetOverHeadLength

## 函数功能

获取数据描述信息的长度。

## 函数原型

```cpp
static size_t GetOverHeadLength(const size_t capacity)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| capacity | 输入 | 实例的最大容量。 |

## 返回值

数据描述信息的长度。

## 约束说明

无

## 调用示例

```cpp
size_t capacity = 100U;
auto length = ContinuousVectorVector::GetOverHeadLength(capacity);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoverheadlength*