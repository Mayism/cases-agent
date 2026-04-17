---
title: GetExpandDimsType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-getexpanddimstype
category: 指南
updated_at: 2026-03-13T02:36:17.303Z
---

# GetExpandDimsType

## 函数功能

获取shape的补维规则。

## 函数原型

```cpp
ExpandDimsType GetExpandDimsType() const
```

## 参数说明

无

## 返回值

返回shape的补维规则。

关于ExpandDimsType类型的定义，请参见[ExpandDimsType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-expanddimstype-introduction)。

## 约束说明

无

## 调用示例

```cpp
Tensor tensor{{{8, 3, 224, 224}, {16, 3, 224, 224}},       // shape
              {ge::FORMAT_ND, ge::FORMAT_FRACTAL_NZ, {}},  // format
              kFollowing,                                  // placement
              ge::DT_FLOAT16,                              // dt
              nullptr};
auto expand_dims_type = tensor.GetExpandDimsType();   // ExpandDimsType{}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-getexpanddimstype*