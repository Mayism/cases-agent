---
title: GetMin
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getmin
category: 指南
updated_at: 2026-03-13T02:24:19.114Z
---

# GetMin

## 函数功能

获取最小的T对象指针。

## 函数原型

```cpp
const T *GetMin() const;
T *GetMin();
```

## 参数说明

无

## 返回值

返回最小的T对象指针。

## 约束说明

无

## 调用示例

```cpp
int min = -1;
int max = 1024;
Range<int> range(&min,&max);
auto ret = range.GetMin(); // ret指针指向min
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getmin*