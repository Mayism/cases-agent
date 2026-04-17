---
title: Ln
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-vector-calculation-lnln
category: 指南
updated_at: 2026-03-13T01:42:48.043Z
---

# Ln

## 函数功能

按元素取自然对数，计算公式如下，其中PAR表示矢量计算单元一个迭代能够处理的元素个数：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/88/v3/vMQd16H0Tzyp14TasTcIDA/zh-cn_image_0000002496568972.png?HW-CC-KV=V1&HW-CC-Date=20260313T014207Z&HW-CC-Expire=86400&HW-CC-Sign=41240E3F300EA6B448D1E470D2C8FA9774C5091EA179BCC04BEE50760A77AB73)

## 函数原型

tensor前n个数据计算：

```cpp
template <typename T>
 __aicore__ inline void Ln(const LocalTensor<T>& dstLocal, const LocalTensor<T>& srcLocal, const int32_t& calCount)
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

tensor前n个数据计算样例：

```cpp
AscendC::Ln(dstLocal, srcLocal, 512);
```

结果示例如下。

```plaintext
输入数据(srcLocal): [1 2 3 4 ...]
输出数据(dstLocal):
[0 0.6931 1.0986 1.3863 ...]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-vector-calculation-lnln*