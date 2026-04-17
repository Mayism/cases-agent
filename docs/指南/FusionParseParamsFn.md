---
title: FusionParseParamsFn
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-fusionparseparamsfn
category: 指南
updated_at: 2026-03-13T02:57:46.791Z
---

# FusionParseParamsFn

## 函数功能

注册解析融合算子属性的函数。

## 函数原型

```cpp
OpRegistrationData &FusionParseParamsFn(const FusionParseParamFunc &fusionParseParamFn)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| fusionParseParamFn | 输入 | [回调函数FusionParseParamFunc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-fusionparseparamsfn#zh-cn_topic_0000002083776582_section102876mcpsimp) |

## 约束说明

对于融合算子插件，FusionParseParamsFn接口后续版本将会废弃，请使用[FusionParseParamsFn（Overload）](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-fusionparseparamsfn-overload)接口进行融合算子属性的解析。

## 回调函数FusionParseParamFunc

开发者自定义并实现FusionParseParamFunc类函数，完成原始模型中属性到适配AI处理器的模型中属性的映射，将结果填入Operator类中。

```cpp
Status FusionParseParamFunc(const  vector<const google::protobuf::Message *> &v_op_origin, ge::Operator  &op_dest)
```

**表1** 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| v_op_origin | 输入 | 一组scope内的protobuf格式的数据结构（来源于原始模型的prototxt文件），包含算子属性信息。 |
| op_dest | 输出 | [Operator](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-operator) |

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-fusionparseparamsfn*