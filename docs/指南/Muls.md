---
title: Muls
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocular-muls
category: 指南
updated_at: 2026-03-13T01:45:37.963Z
---

# Muls

## 功能说明

矢量内每个元素与标量求积，计算公式如下，其中PAR表示矢量计算单元一个迭代能够处理的元素个数：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a5/v3/WGZBbStqQkymfOYmUiO_qA/zh-cn_image_0000002528409009.png?HW-CC-KV=V1&HW-CC-Date=20260313T014457Z&HW-CC-Expire=86400&HW-CC-Sign=E4E662835918EFBAD940298BE65D582D61924B0A2C0CF031B5F735281374907E "点击放大")

## 函数原型

tensor前n个数据计算：

```cpp
template <typename T, bool isSetMask = true>
__aicore__ inline void Muls(const LocalTensor<T>& dstLocal, const LocalTensor<T>& srcLocal, const T& scalarValue, const int32_t& calCount)
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
| scalarValue | 输入 | 源操作数，数据类型需要与目的操作数Tensor中的元素类型保持一致Kirin9020系列处理器，支持的数据类型为：前n个tensor：int16_t、int32_t、half、float32_tKirinX90系列处理器，支持的数据类型为：前n个tensor：int16_t、int32_t、half、float32_t |
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
AscendC::Muls(dstLocal, srcLocal, scalar, 512);
```

结果示例如下。

```plaintext
输入数据(src0Local): [1 2 3 ... 512]
输入数据 scalar = 2
输出数据(dstLocal): [2 4 6 ... 1024]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocular-muls*