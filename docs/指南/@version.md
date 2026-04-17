---
title: @version
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-version
category: 指南
updated_at: 2026-03-13T04:48:43.192Z
---

# @version

@version标签用于记录项目的版本。

## 语法

@version <version>

## 示例

使用 @version 标签：

```typescript
/**
 * Calculates the square root of a number.
 * @version 1.2.3
 */
export function sqrt(x: number): number {
  return Math.sqrt(x);
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arktsdoc-version*