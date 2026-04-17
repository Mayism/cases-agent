---
title: Destroy
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-destroy
category: 指南
updated_at: 2026-03-13T01:49:41.479Z
---

# Destroy

## 功能说明

释放资源。

## 函数原型

```cpp
__aicore__ inline void Destroy()
```

## 支持的型号

Kirin9020系列处理器

KirinX90系列处理器

## 注意事项

用于重复申请释放TPipe，创建Tpipe对象后，可调用Destroy手动释放资源。

## 返回值

无

## 调用示例

```cpp
AscendC::TPipe pipe; // Pipe内存管理对象
AscendC::TQue<AscendC::TPosition::VECOUT, 2> que; //输出数据Queue队列管理对象，QuePosition为VECOUT
uint8_t num = 2;
uint32_t len = 128;
pipe.InitBuffer(que, num, len);
pipe.Destroy();
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-destroy*