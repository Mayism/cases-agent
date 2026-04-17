---
title: GetExpandDimsRule
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-getexpanddimsrule
category: 指南
updated_at: 2026-03-13T03:07:53.697Z
---

# GetExpandDimsRule

## 函数功能

获取Tensor的补维规则。

## 函数原型

```cpp
graphStatus GetExpandDimsRule(AscendString &expand_dims_rule) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| expand_dims_rule | 输入 | 函数待返回的expand_dims_rule补维规则，采用字符串形式表示补维。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | 设置成功返回GRAPH_SUCCESS，否则，返回GRAPH_FAILED。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-getexpanddimsrule*