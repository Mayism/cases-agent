---
title: MutableStorageShape
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-mutablestorageshape
category: 指南
updated_at: 2026-03-13T02:34:52.824Z
---

# MutableStorageShape

## 函数功能

获取运行时Tensor的shape，此shape对象是可变的。

## 函数原型

```cpp
Shape &MutableStorageShape()
```

## 参数说明

无

## 返回值

运行时shape的引用。

## 约束说明

无

## 调用示例

```cpp
StorageShape sh({1, 2, 3}, {2, 1, 3});
Tensor t = {sh, {}, {}, ge::DT_FLOAT, nullptr};
auto shape = t.MutableStorageShape(); // 2,1,3
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-mutablestorageshape*