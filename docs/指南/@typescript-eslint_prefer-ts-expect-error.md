---
title: @typescript-eslint/prefer-ts-expect-error
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-ts-expect-error
category: 指南
updated_at: 2026-03-13T04:24:48.421Z
---

# @typescript-eslint/prefer-ts-expect-error

强制使用“@ts-expect-error”而不是“@ts-ignore”。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-ts-expect-error": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
// @ts-expect-error: with description
export const str: string = 1;
/**
 * Explaining comment
 *
 * @ts-expect-error: with description */
export const multiLine: number = 'value';
/** @ts-expect-error: with description */
export const block: string = 1;
```

## 反例

```cangjie
// @ts-ignore
const str: string = 1;
/**
 * Explaining comment
 *
 * @ts-ignore */
const multiLine: number = 'value';
/** @ts-ignore */
const block: string = 1;
const isOptionEnabled = (key: string): boolean => {
  // @ts-ignore: if key isn't in globalOptions it'll be undefined which is false
  return !!globalOptions[key];
};
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-ts-expect-error*