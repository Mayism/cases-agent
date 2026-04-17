---
title: GetTilingKey
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettilingkey
category: 指南
updated_at: 2026-03-13T02:38:26.190Z
---

# GetTilingKey

## 函数功能

获取tiling key。

## 函数原型

```cpp
uint64_t GetTilingKey() const;
```

## 参数说明

无

## 返回值

返回tiling key。

## 约束说明

无

## 调用示例

```cpp
ge::graphStatus Tiling4XXX(TilingContext* context) {
  auto tiling_key = context->GetTilingKey();
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettilingkey*