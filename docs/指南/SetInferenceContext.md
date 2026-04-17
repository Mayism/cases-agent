---
title: SetInferenceContext
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setinferencecontext
category: 指南
updated_at: 2026-03-13T02:54:19.012Z
---

# SetInferenceContext

## 函数功能

向当前算子传递InferShape推导所需要的关联信息，比如前面算子的shape和DataType信息。

## 函数原型

```cpp
void SetInferenceContext(const InferenceContextPtr &inference_context);
```

## 参数说明

| 参数名 | 输入/输出 | 描述 |
| --- | --- | --- |
| inference_context | 输入 | 当前operator的推理上下文。InferenceContextPtr是指向InferenceContext类的指针的别名：using InferenceContextPtr = std::shared_ptr<InferenceContext>; |

## 返回值

无

## 异常处理

无

## 约束说明

无

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-setinferencecontext*