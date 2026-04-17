---
title: GetResourceContext
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getresourcecontext
category: 指南
updated_at: 2026-03-13T02:46:43.422Z
---

# GetResourceContext

## 函数功能

通过资源标识key来获取对应的资源上下文对象。

## 函数原型

```cangjie
ResourceContext *GetResourceContext(const ge::AscendString &key)
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| key | 输入 | [InferShape](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-infershape) |

## 返回值

| 类型 | 描述 |
| --- | --- |
| ResourceContext * | 资源上下文对象。基础定义如下，资源类算子可以基于此扩展。struct ResourceContext { virtual ~ResourceContext() {}};用于保存资源相关信息，如shape、datatype等。 |

## 约束说明

若使用[Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-create)接口创建InferenceContext时未传入resource context管理器指针，则该接口返回空指针，因此使用其返回值之前需要判空。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-getresourcecontext*