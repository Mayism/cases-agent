---
title: @hw-stylistic/one-var-declaration-per-line
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_one-var-declaration-per-line
category: 指南
updated_at: 2026-03-13T04:44:30.701Z
---

# @hw-stylistic/one-var-declaration-per-line

变量声明时，要求一次仅声明一个变量。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/one-var-declaration-per-line": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cangjie
let a: string = 'hello';
let b: string = 'world';
a += 'my';
b += 'my';
const c: string = 'hello';
const d: string = 'world';
console.info(`a: ${a}, b: ${b}, c: ${c}, d: ${d}`);
```

## 反例

```cangjie
// Split 'const' declarations into multiple statements.
const a: string = 'hello', b: string = 'world';
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_one-var-declaration-per-line*