---
title: MutableExpandDimsType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-mutableexpanddimstype
category: 指南
updated_at: 2026-03-13T02:29:26.421Z
---

# MutableExpandDimsType

## 函数功能

获取可写的补维规则。

## 函数原型

```cpp
ExpandDimsType &MutableExpandDimsType()
```

## 参数说明

无

## 返回值

补维规则引用。

## 约束说明

无

## 调用示例

```cpp
ExpandDimsType dim_type("1100");
StorageFormat format(ge::Format::FORMAT_NCHW, ge::Format::FORMAT_C1HWNC0, dim_type);
ExpandDimsType new_dim_type("1010");
format.SetExpandDimsType(new_dim_type);
auto &fmt_dim_type = format.MutableExpandDimsType();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-mutableexpanddimstype*