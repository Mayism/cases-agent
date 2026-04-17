---
title: GetRawTilingData
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getrawtilingdata
category: 指南
updated_at: 2026-03-13T02:39:10.151Z
---

# GetRawTilingData

## 函数功能

获取无类型的tiling data指针。

## 函数原型

```cpp
TilingData *GetRawTilingData();
```

## 参数说明

无

## 返回值

tiling data指针，失败时返回空指针。

## 约束说明

无

## 调用示例

```cpp
ge::graphStatus Tiling4XXX(TilingContext* context) {
  auto tiling_data = context->GetRawTilingData();
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getrawtilingdata*