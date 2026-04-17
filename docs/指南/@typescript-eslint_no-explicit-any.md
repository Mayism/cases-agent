---
title: @typescript-eslint/no-explicit-any
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-explicit-any
category: 指南
updated_at: 2026-03-13T04:17:09.389Z
---

# @typescript-eslint/no-explicit-any

不允许使用“any”类型。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-explicit-any": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-explicit-any选项](https://typescript-eslint.nodejs.cn/rules/no-explicit-any#options)。

## 正例

```typescript
export const age1 = 17;
export const age2 = [age1];
export const age3 = [age1];
export function greet1(): string {
  return 'greet';
}
export function greet2(): string[] {
  return ['greet'];
}
export function greet4(): string[][] {
  return [['greet']];
}
export function greet5(param: readonly string[]): string {
  return param[age1];
}
export function greet6(param: readonly string[]): string[] {
  return [...param];
}
```

## 反例

```typescript
export const age1: any = 17;
export const age2: any = [age1];
export const age3: any = [age1];
export function greet1(): any {
  return 'greet';
}
export function greet2(): any[] {
  return ['greet'];
}
export function greet4(): any[][] {
  return [['greet']];
}
export function greet5(param: readonly any[]): any {
  return param[age1];
}
export function greet6(param: readonly any[]): any[] {
  return [...param];
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/recommended
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-explicit-any*