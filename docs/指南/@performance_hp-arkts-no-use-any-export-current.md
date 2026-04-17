---
title: @performance/hp-arkts-no-use-any-export-current
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hp-arkts-no-use-any-export-current
category: 指南
updated_at: 2026-03-13T04:33:06.114Z
---

# @performance/hp-arkts-no-use-any-export-current

避免使用export \* 导出当前module中定义的类型和数据。

冷启动完成时延场景下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkts-no-use-any-export-current": "warn",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cangjie
export class User {
  id?: number;
  name?: string;
}
```

## 反例

```typescript
class User {
  id?: number;
  name?: string;
}
// 当前文件 User.ets
export * from './User';
// 当前文件 User.ets
export * as XX from './User';
```

## 规则集

```cangjie
plugin:@performance/recommended
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hp-arkts-no-use-any-export-current*