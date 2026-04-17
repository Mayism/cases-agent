---
title: HasSubFormat
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-hassubformat
category: 指南
updated_at: 2026-03-13T03:14:34.926Z
---

# HasSubFormat

## 函数功能

判断实际format中是否包含子format。

## 函数原型

```cpp
inline bool HasSubFormat(int32_t format)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| format | 输入 | 实际format（4字节大小，第1个字节的高四位为预留字段，低四位为c0 format，第2-3字节为子format信息，第4字节为主format信息）。 |

## 返回值

-   true：实际format中包含子format。
-   false：实际format中不包含子format。

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-hassubformat*