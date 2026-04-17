---
title: ParseParamsFn
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-parseparamsfn
category: 指南
updated_at: 2026-03-13T02:57:34.298Z
---

# ParseParamsFn

## 函数功能

注册解析算子属性的函数。

## 函数原型

```cpp
OpRegistrationData &ParseParamsFn(const ParseParamFunc &parseParamFn)
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| parseParamFn | 输入 | [回调函数ParseParamFunc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-parseparamsfn#zh-cn_topic_0000002083617286_section102729mcpsimp) |

## 约束说明

对于自定义算子插件，ParseParamsFn后续版本将会废弃，请使用[ParseParamsByOperatorFn](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-parseparamsbyoperatorfn)接口进行算子属性的解析。

若开发者已使用ParseParamsFn接口进行了算子插件的开发，请执行如下操作进行新接口适配：

1.  请重新使用[ParseParamsByOperatorFn](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-parseparamsbyoperatorfn)接口进行算子插件的开发。
2.  请基于新版本自定义算子样例工程的编译脚本重新进行自定义算子工程的编译。

## 回调函数ParseParamFunc

开发者自定义并实现FusionParseParamFunc类函数，完成原始模型中算子属性到适配AI处理器的模型中算子属性映射，将结果填入Operator类中。

```cpp
Status ParseParamFunc(const Message *op_origin, ge::Operator &op_dest)
```

**表1** 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| op_origin | 输入 | protobuf格式的数据结构（来源于原始模型的prototxt文件），包含算子属性信息。 |
| op_dest | 输出 | [Operator](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-ge-operator) |

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-parseparamsfn*