---
title: CreateCap
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-createcap
category: 指南
updated_at: 2026-03-13T02:40:51.712Z
---

# CreateCap

## 函数功能

根据指定的最大容量创建一个TilingData类实例。

## 函数原型

```cpp
static std::unique_ptr<uint8_t[]> CreateCap(const size_t cap_size);
```

## 参数说明

| 参数 | 输入/输出 | 说明 |
| --- | --- | --- |
| cap_size | 输入 | 最大容量，单位为字节。 |

## 返回值

TilingData的实例指针。

## 约束说明

无

## 调用示例

```cpp
auto td_buf = TilingData::CreateCap(100U);
auto td = reinterpret_cast<TilingData *>(td_buf.get());
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-createcap*