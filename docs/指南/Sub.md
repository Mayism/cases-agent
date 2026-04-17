---
title: Sub
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-cannkit-sub
category: 指南
updated_at: 2026-03-13T01:44:12.576Z
---

# Sub

## 功能说明

按元素求差，计算公式如下，其中PAR表示矢量计算单元一个迭代能够处理的元素个数：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/zUK0SE5AQ42DvacEPoL7kQ/zh-cn_image_0000002496569034.png?HW-CC-KV=V1&HW-CC-Date=20260313T014332Z&HW-CC-Expire=86400&HW-CC-Sign=D46C4D99295D84E78BD17944F5EA4F07398FA9B38E5ACF47B93E1B14A5A33DB8 "点击放大")

## 函数原型

tensor前n个数据计算：

```cpp
template <typename T>
__aicore__ inline void Sub(const LocalTensor<T>& dstLocal, const LocalTensor<T>& src0Local, const LocalTensor<T>& src1Local, const int32_t& calCount)
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
| src0Local、src1Local | 输入 | [LocalTensor](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-localtensor) |
| calCount | 输入 | 输入数据元素个数。 |

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

操作数地址偏移对齐要求请参见[通用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-general-constraints)。

## 调用示例

本样例中只展示Compute流程中的部分代码。如果开发者需要运行样例代码，请将该代码段拷贝并替换双目指令样例模板[更多样例](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkitvectorcalculation-binocularinstructions)中的Compute函数即可。

tensor前n个数据计算样例：

```cpp
AscendC::Sub(dstLocal, src0Local, src1Local, 512);
```

结果示例如下。

```plaintext
输入数据(src0Local): [1 2 3 ... 512]
输入数据(src1Local): [513 514 515 ... 1024]
输出数据(dstLocal): [-512 -512 -512 ... -512]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-cannkit-sub*