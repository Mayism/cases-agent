---
title: SetMarks
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setmarks
category: 指南
updated_at: 2026-03-13T02:46:27.364Z
---

# SetMarks

## 函数功能

在资源类算子推理的上下文中，设置成对资源算子的标记。

## 函数原型

注意

数据类型为string的接口后续版本会废弃，建议使用数据类型为非string的接口。

```cpp
void SetMarks(const std::vector<std::string> &marks)
void SetMarks(const std::vector<AscendString> &marks)
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| marks | 输入 | 资源类算子的标记。 |

## 返回值

无

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setmarks*