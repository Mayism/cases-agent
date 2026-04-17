---
title: @hw-stylistic/curly
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_curly
category: 指南
updated_at: 2026-03-13T04:43:36.005Z
---

# @hw-stylistic/curly

条件语句和循环语句的逻辑代码必须写在大括号中。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/curly": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
export function test(a: number, b: number) {
  if (a > b) {
    console.info('doSomething');
  } else if (a === b) {
    console.info('doSomething');
  } else {
    console.info('doSomething');
  }
  while (a > b) {
    a--;
    console.info('doSomething');
  }
  console.info('doSomething');
}
```

## 反例

```typescript
export function test(a: number, b: number) {
  if (a > b)
  // Expected { after 'if' condition.
    console.info('doSomething');
  else if (a === b)
  // Expected { after 'if' condition.
    console.info('doSomething');
  else
  // Expected { after 'else'.
    console.info('doSomething');
  console.info('doSomething');
}
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_curly*