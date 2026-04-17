---
title: GetComputeNodeInfo
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getcomputenodeinfo
category: 指南
updated_at: 2026-03-13T02:17:56.381Z
---

# GetComputeNodeInfo

## 函数功能

获取本kernel对应的计算节点的信息。

图执行时本质上是执行图上的一个个结点的kernel在执行。本方法能够从KernelContext中获取保存的ComputeNodeInfo，而ComputeNodeInfo中包含InputDesc等信息。

## 函数原型

```cpp
const ComputeNodeInfo *GetComputeNodeInfo() const
```

## 参数说明

无

## 返回值

计算节点的信息。

关于ComputeNodeInfo的定义，请参见[ComputeNodeInfo](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-computenodeinfo-introduction)。

## 约束说明

无

## 调用示例

```cpp
// 假设已存在KernelContext *context
auto extend_context = reinterpret_cast<ExtendedKernelContext *>(context);
auto compute_node_info = extend_context->GetComputeNodeInfo();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getcomputenodeinfo*