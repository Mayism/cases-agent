---
title: Input
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-input
category: 指南
updated_at: 2026-03-13T02:01:23.793Z
---

# Input

## 函数功能

注册算子输入，调用该接口后会返回一个OpParamDef结构，后续可通过该结构配置算子输入信息。

## 函数原型

```cpp
OpParamDef &Input(const char *name);
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| name | 输入 | 算子输入名称。 |

## 返回值

[OpParamDef](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-opparamdef)算子参数定义。

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-input*