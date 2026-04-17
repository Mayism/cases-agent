---
title: @typescript-eslint/no-extra-non-null-assertion
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-extra-non-null-assertion
category: 指南
updated_at: 2026-03-13T04:17:18.322Z
---

# @typescript-eslint/no-extra-non-null-assertion

不允许多余的非空断言。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-extra-non-null-assertion": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cangjie
interface BarType1 {
  bar: number;
}
function getFoo(): BarType1 | null {
  return null;
}
const foo: BarType1 | null = getFoo();
export const bar1: number | undefined = foo?.bar;
export function foo1(bar: number | undefined): void {
  const newBar: number = bar ?? Number.MAX_VALUE;
  console.info(`${newBar}`);
}
```

## 反例

```typescript
interface BarType1 {
  bar: number;
}
const foo1: BarType1 | null = null;
export const bar1 = foo1!!!.bar;
export function foo2(bar: number | undefined) {
  const newBar: number = bar!!!;
  console.info(`${newBar}`);
}
interface BarType2 {
  n: number;
}
export function foo(bar?: BarType2) {
  return bar!?.n;
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-extra-non-null-assertion*