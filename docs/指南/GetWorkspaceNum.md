---
title: GetWorkspaceNum
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getworkspacenum
category: 指南
updated_at: 2026-03-13T02:39:31.940Z
---

# GetWorkspaceNum

## 函数功能

获取workspace个数。

## 函数原型

```cpp
size_t GetWorkspaceNum() const;
```

## 参数说明

无

## 返回值

workspace的个数。

## 约束说明

无

## 调用示例

```cpp
ge::graphStatus Tiling4XXX(TilingContext* context) {
  auto ws_num = context->GetWorkspaceNum();
  // ...
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getworkspacenum*