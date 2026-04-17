---
title: @typescript-eslint/prefer-as-const
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-as-const
category: 指南
updated_at: 2026-03-13T04:22:51.754Z
---

# @typescript-eslint/prefer-as-const

对于字面量类型，强制使用“as const”。

将字面量类型的值转换为对应的字面量类型，有两种方式，一种是“as const”，另一种是“as 字面量类型”，推荐使用“as const”。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-as-const": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
export const foo1 = 'bar';
export const foo2 = 'bar' as const;
export const foo3: 'bar' = 'bar' as const;
export const bar4 = 'bar' as string;
export const foo6 = { bar: 'baz' };
```

## 反例

```javascript
export const bar: 1 = 1;
export const foo1 = <'bar'>'bar';
export const foo2 = { bar: 'baz' as 'baz' };
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-as-const*