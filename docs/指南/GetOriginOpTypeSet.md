---
title: GetOriginOpTypeSet
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoriginoptypeset
category: 指南
updated_at: 2026-03-13T02:59:01.061Z
---

# GetOriginOpTypeSet

## 函数功能

获取原始模型的算子类型集合。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
std::set<std::string> GetOriginOpTypeSet () const;
Status GetOriginOpTypeSet(std::set<ge::AscendString> &ori_op_type) const;
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| ori_op_type | 输出 | 原始模型的算子类型集合。 |

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getoriginoptypeset*