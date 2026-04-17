---
title: MutableOutputTdInfo
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-mutableoutputtdinfo
category: 指南
updated_at: 2026-03-13T02:11:08.555Z
---

# MutableOutputTdInfo

## 函数功能

获取算子的输出Tensor描述，注意，编译时无法确定的shape信息不在Tensor描述中（由于编译时无法确定shape，因此该Tensor描述里不包含shape信息）。

## 函数原型

```cpp
CompileTimeTensorDesc *MutableOutputTdInfo(const size_t index)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| index | 输入 | 算子输出对应的索引，从0开始计数。 |

## 返回值

Tensor描述，返回对象为非const。

## 约束说明

无

## 调用示例

```cpp
for (size_t i = 0; i < node->GetAllOutDataAnchorsSize(); ++i) {
    auto td = compute_node_info.MutableOutputTdInfo(i);
    // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-mutableoutputtdinfo*