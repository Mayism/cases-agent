---
title: GetTilingCond
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettilingcond
category: 指南
updated_at: 2026-03-13T02:39:05.490Z
---

# GetTilingCond

## 函数功能

获取tiling cond。

## 函数原型

```cpp
int32_t GetTilingCond() const;
```

## 参数说明

无

## 返回值

tiling cond:

若返回值大于等于0，代表此tiling cond为有效的tiling cond。

若返回值为-1，代表此tiling cond为无效的tiling cond。

## 约束说明

无

## 调用示例

```cpp
ge::graphStatus Tiling4XXX(TilingContext* context) {
  auto tiling_cond = context->GetTilingCond();
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettilingcond*