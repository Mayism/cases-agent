---
title: @hw-stylistic/quotes
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-quotes-stylistic
category: 指南
updated_at: 2026-03-13T04:44:54.598Z
---

# @hw-stylistic/quotes

强制字符串使用单引号。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/quotes": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
export {a, b};
const a = 'hello';
const b = `hello`;
```

## 反例

```cpp
// Strings must use single quotes.
export const a = "hello";
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-quotes-stylistic*