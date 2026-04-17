---
title: @hw-stylistic/brace-style
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-brace-style-stylistic
category: 指南
updated_at: 2026-03-13T04:43:10.809Z
---

# @hw-stylistic/brace-style

强制大括号和语句位于同一行。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/brace-style": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```csharp
try {
  // doSomething
} catch (e) {
  // doSomething
} finally {
  // doSomething
}
```

## 反例

```csharp
try
// Opening curly brace does not appear on the same line as statement before.
{
// Closing curly brace does not appear on the same line as statement after.
}
catch (e)
// Opening curly brace does not appear on the same line as statement before.
{
// Closing curly brace does not appear on the same line as statement after.
}
finally
// Opening curly brace does not appear on the same line as statement before.
{
}
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-brace-style-stylistic*