---
title: GetPlatformInfo
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getplatforminfo
category: 指南
updated_at: 2026-03-13T02:39:46.408Z
---

# GetPlatformInfo

## 函数功能

获取fe::PlatFormInfos指针。

## 函数原型

```cpp
fe::PlatFormInfos *GetPlatformInfo() const
```

## 参数说明

无

## 返回值

fe::PlatFormInfos指针。

## 约束说明

无

## 调用示例

```cpp
ge::graphStatus Tiling4XXX(TilingContext* context) {
  auto platform_info = context->GetPlatformInfo();
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getplatforminfo*