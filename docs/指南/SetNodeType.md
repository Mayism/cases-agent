---
title: SetNodeType
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setnodetype
category: 指南
updated_at: 2026-03-13T02:11:37.708Z
---

# SetNodeType

## 函数功能

设置算子的类型。

## 函数原型

```cpp
void SetNodeType(const ge::char_t *node_type)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| node_type | 输入 | 算子的类型。 |

## 返回值

无

## 约束说明

无

## 调用示例

```cpp
compute_node_info.SetNodeType("Const");
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setnodetype*