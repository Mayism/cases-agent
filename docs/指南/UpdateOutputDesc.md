---
title: UpdateOutputDesc
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-updateoutputdesc
category: 指南
updated_at: 2026-03-13T02:55:11.218Z
---

# UpdateOutputDesc

## 函数功能

根据算子Output名称更新Output的TensorDesc。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
graphStatus UpdateOutputDesc(const std::string &name, const TensorDesc &tensor_desc);
graphStatus UpdateOutputDesc(const char_t *name, const TensorDesc &tensor_desc);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| name | 输入 | 算子Output名称。 |
| tensor_desc | 输入 | TensorDesc对象。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | 更新TensorDesc成功，返回GRAPH_SUCCESS， 否则，返回GRAPH_FAILED。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-updateoutputdesc*