---
title: @typescript-eslint/prefer-for-of
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-for-of
category: 指南
updated_at: 2026-03-13T04:23:20.371Z
---

# @typescript-eslint/prefer-for-of

强制使用“for-of”循环而不是标准“for”循环。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-for-of": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
declare const array: string[];
for (const x of array) {
  console.log(x);
}
for (let i = 0; i < array.length; i++) {
  // i is used, so for-of could not be used.
  console.log(`${i}-${array[i]}`);
}
```

## 反例

```php
declare const array: string[];
for (const x of array) {
  console.log(x);
}
for (let i = 0; i < array.length; i++) {
  console.log(array[i]);
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-for-of*