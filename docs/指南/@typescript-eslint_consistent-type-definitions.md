---
title: @typescript-eslint/consistent-type-definitions
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_consistent-type-definitions
category: 指南
updated_at: 2026-03-13T04:13:43.973Z
---

# @typescript-eslint/consistent-type-definitions

强制使用一致的类型声明样式，仅使用“interface”或者仅使用“type”。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/consistent-type-definitions": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/consistent-type-definitions选项](https://typescript-eslint.nodejs.cn/rules/consistent-type-definitions/#options)。

## 正例

```typescript
// 基本类型的定义可以使用type
export type T1 = string;
// 默认推荐使用interface 进行对象类型定义
export interface T2 {
  x: number;
}
export type Foo = string | T2;
```

## 反例

```typescript
// 默认推荐使用interface 进行对象类型定义
type T = { x: number };
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_consistent-type-definitions*