---
title: Sigmoid
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-activation-sigmoid
category: 指南
updated_at: 2026-03-13T02:00:42.087Z
---

# Sigmoid

## 功能说明

按元素做逻辑回归Sigmoid，计算公式如下，其中PAR表示矢量计算单元一个迭代能够处理的元素个数 ：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/JYhqFMdTS4KwM4cdVZEnAQ/zh-cn_image_0000002528648949.png?HW-CC-KV=V1&HW-CC-Date=20260313T020001Z&HW-CC-Expire=86400&HW-CC-Sign=142142D63B0A99A1F6274E3928B1BFF4DF60D70A554F9A47DFE5C229525B35DF)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/fmUmuz50TyWsf7_8kQwWzg/zh-cn_image_0000002528408975.png?HW-CC-KV=V1&HW-CC-Date=20260313T020001Z&HW-CC-Expire=86400&HW-CC-Sign=7FF1DE4855BD4D18AB09829A979B6AB50CB66B6DA9D65A322ABC972EE2BA02C0)

## 函数原型

```cpp
template <typename T, bool isReuseSource = false>
__aicore__ inline void Sigmoid(const LocalTensor<T>& dstTensor, const LocalTensor<T>& srcTensor, const uint32_t calCount)
```

## 参数说明

**表1** 模板参数说明

| 参数名 | 描述 |
| --- | --- |
| T | 操作数的数据类型。支持的数据类型为：half/float。 |
| isReuseSource | 是否允许修改源操作数。该参数预留，传入默认值false即可。 |

**表2** 接口参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| dstTensor | 输出 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| srcTensor | 输入 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| calCount | 输入 | 实际计算数据元素个数。 |

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 约束说明

-   操作数地址偏移对齐要求请参见[通用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-general-constraints)。
-   输入输出操作数参与计算的数据长度要求32B对齐。

## 调用示例

```cpp
AscendC::TPipe pipe;
// 其它处理省略
// 输入shape信息为1024Bytes, 算子输入的数据类型为half, 实际计算个数为512Bytes
AscendC::Sigmoid<T, false>(dstLocal, srcLocal, 512);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-activation-sigmoid*