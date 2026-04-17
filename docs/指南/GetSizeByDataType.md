---
title: GetSizeByDataType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsizebydatatype
category: 指南
updated_at: 2026-03-13T03:13:54.171Z
---

# GetSizeByDataType

## 函数功能

根据传入的data\_type，获取该data\_type所占用的内存大小。

## 函数原型

```cpp
inline int GetSizeByDataType(DataType data_type)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| data_type | 输入 | [DataType](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-datatype) |

## 返回值

该data\_type所占用的内存大小（单位为bytes），如果传入非法值或不支持的数据类型，返回-1。

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsizebydatatype*