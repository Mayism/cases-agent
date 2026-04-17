---
title: Reset
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-reset
category: 指南
updated_at: 2026-03-13T01:51:09.437Z
---

# Reset

## 功能说明

完成TbufPool资源的释放与eventId等变量的初始化操作。

## 函数原型

```cpp
__aicore__ inline void Reset()
```

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

切换TBufPool资源池时调用该接口，调用后对应资源池及资源池分配的Buffer不能继续使用。

## 返回值

无

## 调用示例

参考[InitBufPool](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-initbufpool)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-reset*