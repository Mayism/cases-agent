---
title: @typescript-eslint/no-unnecessary-qualifier
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unnecessary-qualifier
category: 指南
updated_at: 2026-03-13T04:21:16.424Z
---

# @typescript-eslint/no-unnecessary-qualifier

禁止不必要的命名空间限定符。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-unnecessary-qualifier": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
export enum A {
  b = 'x',
  c = b
}
export namespace B {
  export type C = number;
  export const x: C = 3;
}
```

## 反例

```typescript
export enum A {
  b = 'x',
  c = A.b
}
export namespace B {
  export type C = number;
  export const x: B.C = 3;
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unnecessary-qualifier*