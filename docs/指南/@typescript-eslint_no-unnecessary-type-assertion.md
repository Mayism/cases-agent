---
title: @typescript-eslint/no-unnecessary-type-assertion
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unnecessary-type-assertion
category: 指南
updated_at: 2026-03-13T04:21:20.817Z
---

# @typescript-eslint/no-unnecessary-type-assertion

禁止不必要的类型断言。

如果类型断言没有更改表达式的类型，也就没有必要使用。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-unnecessary-type-assertion": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-unnecessary-type-assertion选项](https://typescript-eslint.nodejs.cn/rules/no-unnecessary-type-assertion/#options)。

## 正例

```typescript
const num = 3;
export const foo2 = num as number;
export const foo3 = 'foo' as string;
```

## 反例

```cpp
const num = 3;
export const foo = num;
export const bar = foo!;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unnecessary-type-assertion*