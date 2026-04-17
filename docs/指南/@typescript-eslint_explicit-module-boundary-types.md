---
title: @typescript-eslint/explicit-module-boundary-types
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_explicit-module-boundary-types
category: 指南
updated_at: 2026-03-13T04:14:30.657Z
---

# @typescript-eslint/explicit-module-boundary-types

导出到外部的函数和公共类方法，需要显式的定义返回类型和参数类型。

该规则仅支持对.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/explicit-module-boundary-types": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/explicit-module-boundary-types选项](https://typescript-eslint.nodejs.cn/rules/explicit-module-boundary-types/#options)。

## 正例

```javascript
// A function with no return value (void)
export function test1(): void {
  return;
}
// A return value of type string
export const arrowFn1 = (): string => 'test';
// All arguments should be typed
export const arrowFn2 = (arg: string): string => `test ${arg}`;
export class Test {
  // A class method with no return value (void)
  public method(): void {
    return;
  }
}
// The function does not apply because it is not an exported function.
function test2() {
  return;
}
test2();
```

## 反例

```typescript
// Should indicate that no value is returned (void)
export function test() {
  return;
}
// Should indicate that a string is returned
export const arrowFn1 = () => 'test';
// All arguments should be typed
export const arrowFn2 = (arg): string => `test ${arg}`;
export const arrowFn3 = (arg: any): string => `test ${arg}`;
export class Test {
  // Should indicate that no value is returned (void)
  public method() {
    return;
  }
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/recommended
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_explicit-module-boundary-types*