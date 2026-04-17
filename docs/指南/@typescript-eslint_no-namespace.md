---
title: @typescript-eslint/no-namespace
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-namespace
category: 指南
updated_at: 2026-03-13T04:19:19.006Z
---

# @typescript-eslint/no-namespace

禁止使用 TypeScript语法中的命名空间。

命名空间是一种过时的语法，推荐使用import/export。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-namespace": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-namespace选项](https://typescript-eslint.nodejs.cn/rules/no-namespace/#options)。

## 正例

```typescript
// foo为模块名
declare module 'foo' {}
// anything inside a d.ts file
```

## 反例

```typescript
module foo {}
namespace foo {}
declare module foo {}
declare namespace foo {}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-namespace*