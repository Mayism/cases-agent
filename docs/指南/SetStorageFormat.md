---
title: SetStorageFormat
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setsorageformat
category: 指南
updated_at: 2026-03-13T02:35:35.793Z
---

# SetStorageFormat

## 函数功能

设置运行时Tensor的format。

## 函数原型

```cpp
void SetStorageFormat(const ge::Format storage_format)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| storage_format | 输入 | [Format](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-format) |

## 返回值

无

## 约束说明

无

## 调用示例

```cpp
Tensor t = {{}, {}, {}, {}, nullptr};
t.SetOriginFormat(ge::FORMAT_NHWC);
t.SetStorageFormat(ge::FORMAT_NC1HWC0);
auto fmt = t.GetStorageFormat(); // ge::FORMAT_NC1HWC0
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setsorageformat*