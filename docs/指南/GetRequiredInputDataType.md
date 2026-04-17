---
title: GetRequiredInputDataType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getrequiredinputdatatype
category: 指南
updated_at: 2026-03-13T02:18:40.130Z
---

# GetRequiredInputDataType

## 函数功能

根据算子原型定义中的输入索引获取对应必选输入的数据类型。

## 函数原型

```cpp
ge::DataType GetRequiredInputDataType(const size_t ir_index) const;
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| ir_index | 输入 | 必选输入在算子IR原型定义中的索引，从0开始计数。 |

## 返回值

返回指定输入的数据类型，若输入的ir\_index非法，返回DT\_UNDEFINED。

## 约束说明

无

## 调用示例

```cpp
ge::graphStatus InferDataTypeForXXX(InferDataTypeContext *context) {
  auto data_type = context->GetRequiredInputDataType(1);
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getrequiredinputdatatype*