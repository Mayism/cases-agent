---
title: operator!=
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-storageshape-operatorb
category: 指南
updated_at: 2026-03-13T02:31:15.772Z
---

# operator!=

## 函数功能

判断shape是否不相等。

## 函数原型

```cpp
bool operator!=(const StorageShape &other) const
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| other | 输入 | 另一个shape。 |

## 返回值

true：不相等。

false：相等。

## 约束说明

无

## 调用示例

```cpp
StorageShape shape0({3, 256, 256}, {256, 256, 3});
StorageShape shape1({3, 256, 256}, {3, 256, 256});
bool is_diff_shape = shape0 != shape1; // true
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-storageshape-operatorb*