---
title: LeakyRelu
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocular-leakyrelu
category: 指南
updated_at: 2026-03-13T01:46:19.585Z
---

# LeakyRelu

## 功能说明

按元素做带泄露线性整流Leaky ReLU：![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3c/v3/98BCchR3QeWABWXXiwBhxg/zh-cn_image_0000002528409047.png?HW-CC-KV=V1&HW-CC-Date=20260313T014538Z&HW-CC-Expire=86400&HW-CC-Sign=A88C5DE70D775461B91E5651EBF4BEBF951E0BCF39B86271264AF8CCD646DB4C)

带泄露线性整流函数（Leaky Rectified Linear Unit, Leaky ReLU激活函数），是一种人工神经网络中常用的激活函数，其数学表达式为：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/87/v3/cFPFhwXDRkyWLy_ruRra1A/zh-cn_image_0000002496569042.png?HW-CC-KV=V1&HW-CC-Date=20260313T014538Z&HW-CC-Expire=86400&HW-CC-Sign=66451B0600DCD884DB2CB1271A0A536E76F7337BA89D3071193AF64819D8CD3C)

和ReLU的区别是：ReLU是将所有的负值都设为零，而Leaky Relu 是给所有负值赋予一个斜率。下图表示了Relu和Leaky Relu的区别：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/cJPxkZkvST-oxrWkc2Y7bA/zh-cn_image_0000002528649025.png?HW-CC-KV=V1&HW-CC-Date=20260313T014538Z&HW-CC-Expire=86400&HW-CC-Sign=43E17DB035D208691FAF28E8A1A4D0A45D905C0C509407B274C9CA3B90B49156 "点击放大") ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/19/v3/oD68XWxjTTWBmlL_JyOv3Q/zh-cn_image_0000002496889058.png?HW-CC-KV=V1&HW-CC-Date=20260313T014538Z&HW-CC-Expire=86400&HW-CC-Sign=60090100FC0466E699531ABD2647177137351F640EE82D67ADC4CE20BB7694CD)

对于Leaky ReLU函数，如果src的值小于零，dst的值等于src的值乘以scalar的值。如果src大于等于零，则dst的值等于src的值。

## 函数原型

tensor前n个数据计算：

```cpp
template <typename T, bool isSetMask = true>
__aicore__ inline void LeakyRelu(const LocalTensor<T>& dstLocal, const LocalTensor<T>& srcLocal, const T& scalarValue, const int32_t& calCount)
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
| scalarValue | 输入 | 源操作数，数据类型需要与目的操作数Tensor中的元素保持一致。Kirin9020训练系列产品，支持的数据类型为：half/floatKirinX90系列处理器，支持的数据类型为：Tensor（half/float） |
| calCount | 输入 | 输入数据元素个数。 |

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

操作数地址偏移对齐要求请参见[通用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-general-constraints)。

## 调用示例

tensor前n个数据计算样例（本样例中只展示Compute流程中的部分代码，如果开发者需要运行样例代码，请将该代码段拷贝并替换上方样例的Compute函数中粗体部分即可）。

```cpp
half scalar = 2;
AscendC::LeakyRelu(dstLocal, srcLocal, scalar, 512);
```

结果示例如下。

```plaintext
输入数据(srcLocal): [-1. -2. 3. ... 512.]
输入数据 scalar = 2.
输出数据(dstLocal): [-2. -4. 3. ... 512.]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-scalar-binocular-leakyrelu*