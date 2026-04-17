---
title: @performance/typed-array-check
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-typed-array-check
category: 指南
updated_at: 2026-03-13T04:39:41.575Z
---

# @performance/typed-array-check

数值数组推荐使用TypedArray。

根据[ArkTS高性能编程实践](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-high-performance-programming)，建议修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/typed-array-check": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
const typedArray1 = new Int8Array([1, 2, 3]);
const typedArray2 = new Int8Array([4, 5, 6]);
let res = new Int8Array(3);
for (let i = 0; i < 3; i++) {
     res[i] = typedArray1[i] + typedArray2[i];
}
```

## 反例

```typescript
const typedArray1: number[] = new Array(1, 2, 3);
const typedArray2: number[] = new Array(4, 5, 6);
let res: number[] = new Array(3);
for (let i = 0; i < 3; i++) {
     res[i] = typedArray1[i] + typedArray2[i];
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-typed-array-check*