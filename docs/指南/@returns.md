---
title: @returns
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-returns
category: 指南
updated_at: 2026-03-13T04:48:19.614Z
---

# @returns

@returns标签用于记录函数返回值。

## 语法

@returns \[description\]

## 示例

```typescript
/**
 * Returns the sum of a and b
 * @param a
 * @param b
 * @returns Sum of a and b
 */
export function sum(a: number, b: number): number{
  return a + b;
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-returns*