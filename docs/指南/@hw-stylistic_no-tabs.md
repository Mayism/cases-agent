---
title: @hw-stylistic/no-tabs
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-tabs
category: 指南
updated_at: 2026-03-13T04:44:23.322Z
---

# @hw-stylistic/no-tabs

禁止使用tab作为缩进，推荐使用空格。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/no-tabs": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
export const message: string = 'Hello World';
```

## 反例

```typescript
export    const    message:    string = 'Hello World';
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-tabs*