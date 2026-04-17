---
title: @hw-stylistic/array-bracket-spacing
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_array-bracket-spacing
category: 指南
updated_at: 2026-03-13T04:43:00.754Z
---

# @hw-stylistic/array-bracket-spacing

强制数组“\[”之后和“\]”之前不加空格。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/array-bracket-spacing": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cpp
export const arr = ['a', 'b'];
```

## 反例

```cpp
// There should be no space after '['.
// There should be no space before ']'.
export const arr = [ 'a', 'b' ];
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_array-bracket-spacing*