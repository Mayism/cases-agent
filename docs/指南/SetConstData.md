---
title: SetConstData
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setconstdata
category: 指南
updated_at: 2026-03-13T03:04:58.477Z
---

# SetConstData

## 函数功能

如果TensorDesc是常量节点的描述，向TensorDesc中设置权重值。

## 函数原型

```cpp
void SetConstData(std::unique_ptr<uint8_t[]> const_data_buffer, const size_t &const_data_len);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| const_data_buffer | 输入 | 权重地址。 |
| const_data_len | 输入 | 权重长度。 |

## 返回值

无

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setconstdata*