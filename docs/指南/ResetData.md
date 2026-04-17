---
title: ResetData
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-resetdata
category: 指南
updated_at: 2026-03-13T03:10:47.407Z
---

# ResetData

## 函数功能

释放Tensor中数据内存。

## 函数原型

```cpp
std::unique_ptr<uint8_t[], Tensor::DeleteFunc> ResetData();
```

## 参数说明

无

## 返回值

返回释放后的内存地址和删除器。

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-resetdata*