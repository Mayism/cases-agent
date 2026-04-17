---
title: GetOpsTypeList
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getopstypelist
category: 指南
updated_at: 2026-03-13T02:49:54.467Z
---

# GetOpsTypeList

## 函数功能

获取系统支持的所有算子类型列表。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
static graphStatus GetOpsTypeList(std::vector<std::string> &all_ops);
static graphStatus GetOpsTypeList(std::vector<AscendString> &all_ops);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| all_ops | 输出 | 算子类型列表。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | SUCCESS：执行成功。FAILED：执行失败。 |

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getopstypelist*