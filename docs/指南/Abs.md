---
title: Abs
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-vector-calculation-abs
category: 指南
updated_at: 2026-03-13T01:42:50.998Z
---

# Abs

## 函数功能

按元素取绝对值，计算公式如下，其中PAR表示矢量计算单元一个迭代能够处理的元素个数：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/i6kg6eM5Q-2LuwygiwkLug/zh-cn_image_0000002528648957.png?HW-CC-KV=V1&HW-CC-Date=20260313T014208Z&HW-CC-Expire=86400&HW-CC-Sign=01C2D0DEB354D84BD904C8B97171A52BE3B345E43444C2B3914616E285F90278)

## 函数原型

tensor前n个数据计算：

```cpp
template <typename T>
 __aicore__ inline void Abs(const LocalTensor<T>& dstLocal, const LocalTensor<T>& srcLocal, const int32_t& calCount)
```

## 参数说明

**表1** 模板参数说明

| 参数名 | 描述 |
| --- | --- |
| T | 操作数数据类型。 |

**表2** 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| dstLocal | 输出 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| srcLocal | 输入 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| calCount | 输入 | 输入数据元素个数。 |

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 约束说明

操作数地址偏移对齐要求请参见[通用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-general-constraints)。

## 调用示例

本样例中只展示Compute流程中的部分代码。本样例的srcLocal和dstLocal均为half类型，占16位bit。

如果开发者需要运行样例代码，请将该代码段拷贝并替换[样例模板](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-vector-calculation-binocular-more#zh-cn_topic_0000002123589629_section11009mcpsimp)中Compute函数的部分代码即可。

tensor前n个数据计算接口样例：

```cpp
AscendC::Abs(dstLocal, srcLocal, 512);
```

结果示例如下。

```plaintext
输入数据(srcLocal): [0.0 -1.0 2.0 -3.0 ...]
输出数据(dstLocal):
[0.0 1.0 2.0 3.0 ...]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-vector-calculation-abs*