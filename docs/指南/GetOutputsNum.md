---
title: GetOutputsNum
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoutputsnum
category: 指南
updated_at: 2026-03-13T02:09:45.041Z
---

# GetOutputsNum

## 函数功能

获取算子在网络中的实际输出个数。

## 函数原型

```cpp
size_t GetOutputsNum() const
```

## 参数说明

无

## 返回值

算子的实际输出个数。

## 约束说明

无

## 调用示例

```cpp
size_t index = compute_node_info->GetOutputsNum();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoutputsnum*