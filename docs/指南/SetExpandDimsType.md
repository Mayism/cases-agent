---
title: SetExpandDimsType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setexpanddimstype
category: 指南
updated_at: 2026-03-13T02:36:17.032Z
---

# SetExpandDimsType

## 函数功能

设置shape的补维规则。

## 函数原型

```cpp
void SetExpandDimsType(const ExpandDimsType &expand_dims_type)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| expand_dims_type | 输入 | [ExpandDimsType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-expanddimstype-introduction) |

## 返回值

无

## 约束说明

无

## 调用示例

```cpp
Tensor tensor{{{8, 3, 224, 224}, {16, 3, 224, 224}},       // shape
              {ge::FORMAT_ND, ge::FORMAT_FRACTAL_NZ, {}},  // format
              kFollowing,                                  // placement
              ge::DT_FLOAT16,                              // dt
              nullptr};
ExpandDimsType type("1001");
tensor.SetExpandDimsType(type);
auto expand_dims_type = tensor.GetExpandDimsType();   // type
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setexpanddimstype*