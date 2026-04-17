---
title: SubgraphCountRegister
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-subgraphcountregister
category: 指南
updated_at: 2026-03-13T02:56:08.999Z
---

# SubgraphCountRegister

## 函数功能

子图注册。

## 函数原型

```cpp
void SubgraphCountRegister(const char_t *ir_name, uint32_t count);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| ir_name | 输入 | 子图名称。 |
| count | 输入 | 动态个数子图场景（子图数量不固定），注册count个数的子图，子图名称是ir_name_0 ~ ir_name_n， n < count。 |

## 返回值

无

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-subgraphcountregister*