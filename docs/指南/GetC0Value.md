---
title: GetC0Value
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getc0value
category: 指南
updated_at: 2026-03-13T03:13:11.453Z
---

# GetC0Value

## 函数功能

从实际format中解析出c0 format信息。

## 函数原型

```cpp
inline int64_t GetC0Value(int32_t format)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| format | 输入 | 实际format（4字节大小，第1个字节的高四位为预留字段，低四位为c0 format，第2-3字节为子format信息，第4字节为主format信息）。 |

## 返回值

-   如果包含c0 format，返回实际format中包含的c0 format。
-   如果不包含c0 format，返回-1。

## 异常处理

无

## 约束说明

设置实际format格式时，第一个字节低四位的c0 format的范围只支持x=(0001~1111)，实际获取的c0 value为2^x-1。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getc0value*