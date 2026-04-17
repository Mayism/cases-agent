---
title: GetDataTypeLength
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getdatatypelength
category: 指南
updated_at: 2026-03-13T03:12:30.558Z
---

# GetDataTypeLength

## 函数功能

获取数据类型所占内存大小。

使用该接口需要包含type\_utils.h头文件。

```cpp
#include "graph/utils/type_utils.h"
```

## 函数原型

```cpp
bool GetDataTypeLength(const ge::DataType data_type, uint32_t &length);
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| data_type | 输入 | 数据类型。 |
| length | 输出 | 数据类型所占内存大小，单位：字节。 |

## 返回值

获取成功时返回true；data\_type不支持时返回false。

## 约束说明

无

## 调用示例

```cpp
uint32_t type_length;
ge::DataType data_type = ge::DT_INT8;
const bool ret = ge::TypeUtils::GetDataTypeLength(data_type, type_length); // type_length 1
if (!ret) {
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getdatatypelength*