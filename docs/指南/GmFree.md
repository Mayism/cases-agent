---
title: GmFree
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gmfree
category: 指南
updated_at: 2026-03-13T02:05:31.516Z
---

# GmFree

## 函数功能

进行核函数的CPU侧运行验证时，用于释放通过[GmAlloc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gmalloc)申请的共享内存。

## 函数原型

```cpp
void GmFree(void *ptr)
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| ptr | 输入 | 需要释放的共享内存的指针。 |

## 返回值

无

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 约束说明

传入的指针必须是之前通过GmAlloc申请过的共享内存的指针。

## 调用示例

```cpp
AscendC::GmFree((void*)x);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gmfree*