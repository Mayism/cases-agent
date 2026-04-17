---
title: @typescript-eslint/consistent-indexed-object-style
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_consistent-indexed-object-style
category: 指南
updated_at: 2026-03-13T04:13:39.191Z
---

# @typescript-eslint/consistent-indexed-object-style

允许或禁止使用“Record”类型。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/consistent-indexed-object-style": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/consistent-indexed-object-style选项](https://typescript-eslint.nodejs.cn/rules/consistent-indexed-object-style/#options)。

## 正例

```typescript
// 默认推荐使用Record 类型
export type Foo = Record<string, unknown>;
```

## 反例

```cangjie
export interface Foo1 {
  // 默认推荐使用Record 类型
  [key: string]: unknown;
}
export type Foo2 = {
  // 默认推荐使用Record 类型
  [key: string]: unknown;
};
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_consistent-indexed-object-style*