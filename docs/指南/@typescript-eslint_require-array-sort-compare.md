---
title: @typescript-eslint/require-array-sort-compare
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_require-array-sort-compare
category: 指南
updated_at: 2026-03-13T04:25:23.418Z
---

# @typescript-eslint/require-array-sort-compare

要求调用“Array#sort”时，始终提供“compareFunction”。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/require-array-sort-compare": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/require-array-sort-compare选项](https://typescript-eslint.nodejs.cn/rules/require-array-sort-compare/#options)。

## 正例

```typescript
declare const array: string[];
array.sort((a, b) => a.length - b.length);
array.sort((a, b) => a.localeCompare(b));
```

## 反例

```php
declare const array: number[];
declare const stringArray: object[];
array.sort();
// String arrays should be sorted using `String#localeCompare`.
stringArray.sort();
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_require-array-sort-compare*