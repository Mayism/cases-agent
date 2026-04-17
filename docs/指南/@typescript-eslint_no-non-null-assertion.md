---
title: @typescript-eslint/no-non-null-assertion
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-non-null-assertion
category: 指南
updated_at: 2026-03-13T04:19:43.740Z
---

# @typescript-eslint/no-non-null-assertion

禁止以感叹号作为后缀的方式使用非空断言。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-non-null-assertion": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
interface Example {
  property?: string;
}
declare const example: Example;
export const includesBaz = example.property?.includes('baz') ?? false;
```

## 反例

```cangjie
interface Example {
  property?: string;
}
declare const example: Example;
// 禁止使用"example.property!"的方式来进行非空断言
export const includesBaz = example.property!.includes('baz');
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-non-null-assertion*