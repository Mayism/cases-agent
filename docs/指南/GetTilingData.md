---
title: GetTilingData
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettilingdata
category: 指南
updated_at: 2026-03-13T02:39:07.182Z
---

# GetTilingData

## 函数功能

获取有类型的tiling data指针。

## 函数原型

```cpp
template<typename T>  T *GetTilingData();
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| T | 输出 | tiling data类型，sizeof(T)不可以大于编译结果中指定的最大tiling data长度。 |

## 返回值

tiling data指针，失败时返回空指针。

## 约束说明

sizeof(T)不可以大于编译结果中指定的最大tiling data长度。

## 调用示例

```cpp
ge::graphStatus Tiling4XXX(TilingContext* context) {
  auto tiling_data = context->GetTilingData<int64_t>();
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-gettilingdata*