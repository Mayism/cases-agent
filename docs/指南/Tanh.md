---
title: Tanh
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-math-tanh
category: 指南
updated_at: 2026-03-13T02:00:07.015Z
---

# Tanh

## 功能说明

按元素做逻辑回归Tanh，计算公式如下，其中PAR表示矢量计算单元一个迭代能够处理的元素个数 ：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/l6umDP_ASp-tzMujjLKrRA/zh-cn_image_0000002528409017.png?HW-CC-KV=V1&HW-CC-Date=20260313T015927Z&HW-CC-Expire=86400&HW-CC-Sign=590DA76BE02EB3D02773505D03348F7261A997D4ADDA194D6EA1DD2B4F377ACE)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/11/v3/dMkK1qiuRQqi9Dv7AjOpXg/zh-cn_image_0000002528648995.png?HW-CC-KV=V1&HW-CC-Date=20260313T015927Z&HW-CC-Expire=86400&HW-CC-Sign=A5473BD485388E2C452E874D39B53C6E6658F12D874D48FC7DFC45B3757E43E6)

## 函数原型

```cpp
template <typename T, bool isReuseSource = false>
__aicore__ inline void Tanh(const LocalTensor<T>& dstTensor, const LocalTensor<T>& srcTensor, const uint32_t calCount)
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
//calCount为实际计算数据元素个数
// 其它处理省略
AscendC::Tanh<T, false>(yLocal, xLocal, calCount);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-math-tanh*