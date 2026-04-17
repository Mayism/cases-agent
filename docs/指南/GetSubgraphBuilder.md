---
title: GetSubgraphBuilder
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsubgraphbuilder
category: 指南
updated_at: 2026-03-13T02:53:12.076Z
---

# GetSubgraphBuilder

## 函数功能

根据子图名称获取算子对应的子图构建的函数对象。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
SubgraphBuilder GetSubgraphBuilder(const std::string &name) const;
SubgraphBuilder GetSubgraphBuilder(const char_t *name) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| name | 输入 | 子图名称。 |

## 返回值

SubgraphBuilder对象。

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsubgraphbuilder*