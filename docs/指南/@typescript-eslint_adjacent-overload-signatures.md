---
title: @typescript-eslint/adjacent-overload-signatures
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_adjacent-overload-signatures
category: 指南
updated_at: 2026-03-13T04:12:16.187Z
---

# @typescript-eslint/adjacent-overload-signatures

建议函数重载的签名保持连续。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/adjacent-overload-signatures": "error",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
export declare function bar(): void;
export declare function foo(a: string): void;
export declare function foo(a: number, b: number): void;
export declare function foo(a: number, b: string, c?: string): void;
```

## 反例

```typescript
export declare function foo(a: string): void;
export declare function bar(): void;
export declare function foo(a: number, b: number): void;
export declare function foo(a: number, b: string, c?: string): void;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_adjacent-overload-signatures*