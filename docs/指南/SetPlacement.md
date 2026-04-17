---
title: SetPlacement
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setplacement
category: 指南
updated_at: 2026-03-13T03:10:26.052Z
---

# SetPlacement

## 函数功能

设置Tensor的数据存放的位置。

## 函数原型

```cpp
graphStatus SetPlacement(const ge::Placement &placement);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| placement | 输入 | 需设置的数据地址的值。枚举值定义如下。enum Placement { kPlacementHost = 0, // host data addr kPlacementDevice = 1, // device data addr }; |

## 返回值

| 类型 | 描述 |
| --- | --- |
| graphStatus | 设置成功返回GRAPH_SUCCESS，否则，返回GRAPH_FAILED。 |

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-tensor-setplacement*