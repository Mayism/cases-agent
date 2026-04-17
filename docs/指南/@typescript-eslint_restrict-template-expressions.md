---
title: @typescript-eslint/restrict-template-expressions
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_restrict-template-expressions
category: 指南
updated_at: 2026-03-13T04:25:30.875Z
---

# @typescript-eslint/restrict-template-expressions

要求模板表达式中的变量为“string”类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/restrict-template-expressions": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/restrict-template-expressions选项](https://typescript-eslint.nodejs.cn/rules/restrict-template-expressions/#options)。

## 正例

```typescript
const arg: string | undefined = 'foo';
export const msg1 = `arg = ${arg}`;
export const msg2 = `arg = ${arg || 'default'}`;
```

## 反例

```typescript
const arg1 = ['1', '2'];
export const msg1 = `arg1 = ${arg1}`;
interface GeneratedObjectLiteralInterface {
  name: string;
}
const arg2: GeneratedObjectLiteralInterface = { name: 'Foo' };
export const msg2 = `arg2 = ${arg2 || null}`;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_restrict-template-expressions*