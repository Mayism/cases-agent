---
title: @typescript-eslint/unified-signatures
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_unified-signatures
category: 指南
updated_at: 2026-03-13T04:27:18.013Z
---

# @typescript-eslint/unified-signatures

如果两个重载函数可以用联合类型参数（|）、可选参数（?）或者剩余参数（...）来重构为一个函数，不允许使用重载。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/unified-signatures": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/unified-signatures选项](https://typescript-eslint.nodejs.cn/rules/unified-signatures/#options)。

## 正例

```typescript
export declare function x(a: number | string): void;
export declare function y(...a: readonly number[]): void;
```

## 反例

```typescript
export declare function x(a: number): void;
export declare function x(a: string): void;
export declare function y(): void;
export declare function y(...a: readonly number[]): void;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_unified-signatures*