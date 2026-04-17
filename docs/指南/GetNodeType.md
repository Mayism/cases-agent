---
title: GetNodeType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getnodetype
category: 指南
updated_at: 2026-03-13T02:17:19.039Z
---

# GetNodeType

## 函数功能

获取算子的类型。

## 函数原型

```cpp
const char *GetNodeType() const
```

## 参数说明

无

## 返回值

算子的类型。

## 约束说明

无

## 调用示例

```cpp
// 假设已存在KernelContext *context
auto extend_context = reinterpret_cast<ExtendedKernelContext *>(context);
auto node_type = extend_context->GetNodeType();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getnodetype*