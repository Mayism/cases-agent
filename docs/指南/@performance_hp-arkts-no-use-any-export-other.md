---
title: @performance/hp-arkts-no-use-any-export-other
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hp-arkts-no-use-any-export-other
category: 指南
updated_at: 2026-03-13T04:33:26.707Z
---

# @performance/hp-arkts-no-use-any-export-other

避免使用export \* 导出其他模块中定义的类型和数据。

冷启动完成时延场景下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkts-no-use-any-export-other": "warn",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
// 当前文件 User.ets
// 从 Product.ets 文件中导出Product成员
export { Product } from './Product';
class User {
  id?: number;
  name?: string;
}
```

## 反例

```typescript
// 当前文件 User.ets
// 从 Product.ets 文件中导出所有可导出的成员
export * from './Product';
// 从 Product.ets 文件中导出所有可导出的成员
export * as XX from './Product';
class User {
  id?: number;
  name?: string;
}
```

## 规则集

```cangjie
plugin:@performance/recommended
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hp-arkts-no-use-any-export-other*