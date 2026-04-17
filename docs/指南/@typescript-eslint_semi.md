---
title: @typescript-eslint/semi
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_semi
category: 指南
updated_at: 2026-03-13T04:26:02.465Z
---

# @typescript-eslint/semi

要求或不允许使用分号。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/semi": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/semi选项](https://eslint.nodejs.cn/docs/rules/semi#选项)。

## 正例

```typescript
export const name = 'ESLint';
export class Foo {
  public bar = '1';
}
```

## 反例

```typescript
// 默认在语句末尾需要加分号
export const name = 'ESLint'
export class Foo {
  // 默认在语句末尾需要加分号
  public bar = '1'
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_semi*