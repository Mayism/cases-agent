---
title: Maxs
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocular-maxs
category: 指南
updated_at: 2026-03-13T01:45:40.496Z
---

# Maxs

## 功能说明

源操作数矢量内每个元素与标量相比，如果比标量大，则取源操作数值，比标量的值小，则取标量值。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2f/v3/pbojyVsfShuzL3vHMfoOAg/zh-cn_image_0000002528409051.png?HW-CC-KV=V1&HW-CC-Date=20260313T014459Z&HW-CC-Expire=86400&HW-CC-Sign=C75E0DCA7D65E0180B5240443C8C09D53F59CC4A5095D0A8ABBB70DADB105C9E "点击放大")

## 函数原型

tensor前n个数据计算：

```cpp
template <typename T, bool isSetMask = true>
__aicore__ inline void Maxs(const LocalTensor<T>& dstLocal, const LocalTensor<T>& srcLocal, const T& scalarValue, const int32_t& calCount)
```

## 参数说明

**表1** 模板参数说明

| 参数名 | 描述 |
| --- | --- |
| T | 操作数数据类型。 |
| U | scalarValue数据类型。 |
| isSetMask | 是否在接口内部设置mask模式和mask值。true，表示在接口内部设置。false，表示在接口外部设置。 |

**表2** 参数说明

| 参数名称 | 类型 | 说明 |
| --- | --- | --- |
| dstLocal | 输出 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| srcLocal | 输入 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| scalarValue | 输入 | 源操作数，数据类型需要与目的操作数Tensor中元素的数据类型保持一致Kirin9020系列处理器，支持的数据类型为：Tensor（int16_t/int32_t/half/float）。KirinX90系列处理器，支持的数据类型为：Tensor（int16_t/int32_t/half/float）。 |
| calCount | 输入 | 输入数据元素个数。 |

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

操作数地址偏移对齐要求请参见[通用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-general-constraints)。

## 调用示例

本样例中只展示Compute流程中的部分代码。如果开发者需要运行样例代码，请将该代码段拷贝并替换标量双目指令样例模板[更多样例](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocularinstructions)中的Compute函数即可。

tensor前n个数据计算样例：

```cpp
int16_t scalar = 2;
AscendC::Maxs(dstLocal, srcLocal, scalar, 512);
```

结果示例如下。

```plaintext
输入数据(src0Local): [1 2 3 ... 512]
输入数据 scalar = 2
输出数据(dstLocal): [2 2 3 ... 512]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocular-maxs*