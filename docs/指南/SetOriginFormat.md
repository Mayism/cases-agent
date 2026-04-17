---
title: SetOriginFormat
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setoriginformat1
category: 指南
updated_at: 2026-03-13T03:09:51.738Z
---

# SetOriginFormat

## 函数功能

设置Tensor的原始Format。

该Format是指原始网络模型的Format。

## 函数原型

```cpp
graphStatus SetOriginFormat(const ge::Format &format);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| format | 输入 | [Format](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-format) |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | 设置成功返回GRAPH_SUCCESS，否则，返回GRAPH_FAILED。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setoriginformat1*