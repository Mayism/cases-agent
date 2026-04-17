---
title: GetSubgraphNames
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsubgraphnames
category: 指南
updated_at: 2026-03-13T02:53:25.633Z
---

# GetSubgraphNames

## 函数功能

获取一个算子的子图名称列表。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
std::vector<std::string> GetSubgraphNames() const;
graphStatus GetSubgraphNames(std::vector<AscendString> &names) const;
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| names | 输出 | 获取一个算子的子图名称列表。 |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | GRAPH_FAILED：失败。GRAPH_SUCCESS：成功。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getsubgraphnames*