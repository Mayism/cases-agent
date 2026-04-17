---
title: @typescript-eslint/space-infix-ops
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_space-infix-ops
category: 指南
updated_at: 2026-03-13T04:26:07.476Z
---

# @typescript-eslint/space-infix-ops

运算符前后要求有空格。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/space-infix-ops": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/space-infix-ops选项](https://eslint.nodejs.cn/docs/rules/space-infix-ops#选项)。

## 正例

```typescript
declare const a: number;
declare const b: number;
export const c = a + b;
```

## 反例

```typescript
declare const a: number;
declare const b: number;
export const c = a+b;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_space-infix-ops*