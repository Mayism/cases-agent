---
title: @typescript-eslint/no-extraneous-class
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-extraneous-class
category: 指南
updated_at: 2026-03-13T04:17:12.360Z
---

# @typescript-eslint/no-extraneous-class

不允许将类用作命名空间，更多规则详情可参考[no-extraneous-class](https://typescript-eslint.nodejs.cn/rules/no-extraneous-class)。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-extraneous-class": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-extraneous-class选项](https://typescript-eslint.nodejs.cn/rules/no-extraneous-class/#options)。

## 正例

```javascript
export const version = 42;
export function isProduction() {
  return version === 'production'.length;
}
export function logHelloWorld() {
  console.log('Hello, world!');
}
```

## 反例

```typescript
export class StaticConstants {
  public static readonly version = 'development'.length;
  public static isProduction() {
    return StaticConstants.version === 'production'.length;
  }
}
export class HelloWorldLogger {
  public constructor() {
    console.log('Hello, world!');
  }
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-extraneous-class*