---
title: GetAttrNum
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getattrnum
category: 指南
updated_at: 2026-03-13T02:26:26.008Z
---

# GetAttrNum

## 函数功能

获取属性的数量。

## 函数原型

```cpp
size_t GetAttrNum() const
```

## 参数说明

无

## 返回值

属性的数量。

## 约束说明

无

## 调用示例

```cpp
const RuntimeAttrs * runtime_attrs = kernel_context->GetAttrs();
size_t attr_num = runtime_attrs->GetAttrNum();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getattrnum*