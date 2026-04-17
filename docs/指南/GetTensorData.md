---
title: GetTensorData
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettensordata
category: 指南
updated_at: 2026-03-13T02:36:59.511Z
---

# GetTensorData

## 函数功能

获取tensor中的数据，返回只读的TensorData类型对象。

## 函数原型

```cpp
const TensorData &GetTensorData() const
```

## 参数说明

无

## 返回值

只读的tensor data引用。

关于TensorData类型的定义，请参见[TensorData](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensordata)。

## 约束说明

无

## 调用示例

```cpp
Tensor t = {{}, {}, {}, {}, nullptr};
const Tensor &ct = t;
std::vector<int> a = {10};
t.MutableTensorData() = TensorData{reinterpret_cast<void *>(a.data()), nullptr}; // 设置新tensordata
auto td = t.GetTensorData(); // TensorData{a, nullptr}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettensordata*