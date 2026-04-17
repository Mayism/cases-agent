---
title: GetOpType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoptype
category: 指南
updated_at: 2026-03-13T02:53:36.423Z
---

# GetOpType

## 函数功能

获取算子类型。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
std::string GetOpType() const;
graphStatus GetOpType(AscendString &type) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| type | 输出 | 算子类型。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | GRAPH_FAILED：失败。GRAPH_SUCCESS：成功。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoptype*