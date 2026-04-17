---
title: @typescript-eslint/strict-boolean-expressions
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_strict-boolean-expressions
category: 指南
updated_at: 2026-03-13T04:26:12.268Z
---

# @typescript-eslint/strict-boolean-expressions

不允许在布尔表达式中使用非布尔类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/strict-boolean-expressions": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/strict-boolean-expressions选项](https://typescript-eslint.nodejs.cn/rules/strict-boolean-expressions/#options)。

## 正例

```typescript
// nullable values should be checked explicitly against null or undefined
function getNum(): number | undefined {
  return undefined;
}
const num: number | undefined = getNum();
if (num !== undefined) {
  console.log('num is defined');
}
function getStr(): string | null {
  return 'null';
}
const str: string | null = getStr();
if (str !== null) {
  console.log('str is not empty');
}
```

## 反例

```cangjie
// nullable values should be checked explicitly against null or undefined
function getNum(): number | undefined {
  return undefined;
}
const num: number | undefined = getNum();
if (num) {
  console.log('num is defined');
}
function getStr(): string | null {
  return 'null';
}
const str: string | null = getStr();
if (str) {
  console.log('str is not empty');
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_strict-boolean-expressions*