---
title: GetIrOutputsNum
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getiroutputsnum
category: 指南
updated_at: 2026-03-13T02:10:12.762Z
---

# GetIrOutputsNum

## 函数功能

获取算子IR原型定义中的输出个数。

## 函数原型

```cpp
size_t GetIrOutputsNum() const
```

## 参数说明

无

## 返回值

IR原型中定义的输出个数，size\_t类型。

## 约束说明

无

## 调用示例

```cpp
size_t index = compute_node_info->GetIrOutputsNum();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getiroutputsnum*