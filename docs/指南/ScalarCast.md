---
title: ScalarCast
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalarcast
category: 指南
updated_at: 2026-03-13T01:42:04.608Z
---

# ScalarCast

## 功能说明

将一个scalar的类型转换为指定的类型。

## 函数原型

```cpp
template <typename srcT, typename dstT, RoundMode roundMode>
__aicore__ inline dstT ScalarCast(srcT valueIn)
```

## 参数说明

**表1** 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| valueIn | 输入 | 被转换数据类型的scalar。 |
| srcT | 输入 | valueIn的数据类型，支持float。 |
| dstT | 输入 | 转换后的数据类型，支持half、int32_t。 |
| roundMode | 输入 | [Cast函数功能](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-precision-conversion-instruction#zh-cn_topic_0000002140465961_section8236172313171) |

## 返回值

dstT类型的valueIn。

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 约束说明

无。

## 调用示例

```cpp
float valueIn = 2.5;
// 输出数据(valueOut): 3
int32_t valueOut = AscendC::ScalarCast<float, int32_t, AscendC::RoundMode::CAST_ROUND>(valueIn);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalarcast*