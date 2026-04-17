---
title: GetSizeInBytes
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsizeinbytes
category: 指南
updated_at: 2026-03-13T03:14:00.720Z
---

# GetSizeInBytes

## 函数功能

根据传入的element\_count和data\_type，获取element\_count个该data\_type所占用的内存总大小。

## 函数原型

```cpp
int64_t GetSizeInBytes(int64_t element_count, DataType data_type)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| element_count | 输入 | 用于标识多少个data_type。 |
| data_type | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |

## 返回值

如果传入个数为非法值或传入不支持的数据类型，返回-1。

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsizeinbytes*