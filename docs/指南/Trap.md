---
title: Trap
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-trap
category: 指南
updated_at: 2026-03-13T01:56:54.709Z
---

# Trap

## 函数功能

当软件产生异常后，使用该指令使kernel中止运行。

## 函数原型

```cpp
__aicore__ inline void Trap()
```

## 参数说明

无

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

该接口在kernel需要调试时使用。

## 调用示例

```cpp
AscendC::Trap();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-trap*