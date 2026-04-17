---
title: GetNodeName
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getnodename
category: 指南
updated_at: 2026-03-13T02:17:35.171Z
---

# GetNodeName

## 函数功能

获取算子的名称。

## 函数原型

```cpp
const char *GetNodeName() const
```

## 参数说明

无

## 返回值

算子的名称。

## 约束说明

无

## 调用示例

```cpp
// 假设已存在KernelContext *context
auto extend_context = reinterpret_cast<ExtendedKernelContext *>(context);
auto node_name = extend_context->GetNodeName();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getnodename*