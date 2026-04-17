---
title: @typescript-eslint/prefer-function-type
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-function-type
category: 指南
updated_at: 2026-03-13T04:23:22.785Z
---

# @typescript-eslint/prefer-function-type

强制使用函数类型而不是带有签名的对象类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-function-type": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
export function foo(example: () => number): number {
  return example();
}
// returns the function itself, not the `this` argument.
export type ReturnsSelf = (arg: string) => ReturnsSelf;
export interface Foo {
  bar: string;
}
```

## 反例

```cangjie
interface GeneratedTypeLiteralInterface {
  (): number;
}
export function foo(example: GeneratedTypeLiteralInterface): number {
  return example();
}
export interface Foo {
  (bar: string): this;
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-function-type*