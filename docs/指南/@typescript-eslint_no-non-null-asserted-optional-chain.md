---
title: @typescript-eslint/no-non-null-asserted-optional-chain
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-non-null-asserted-optional-chain
category: 指南
updated_at: 2026-03-13T04:19:29.647Z
---

# @typescript-eslint/no-non-null-asserted-optional-chain

禁止在可选链表达式之后使用非空断言。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-non-null-asserted-optional-chain": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
class CC {
  public bar = 'hello';
  public foo(): void {
    console.info('foo');
  }
}
function getInstance(): CC | undefined {
  return new CC();
}
const instance = getInstance();
console.info(`${instance?.bar}`);
instance?.foo();
```

## 反例

```typescript
class CC {
  public bar: string = 'hello';
  public foo() {
    console.info('foo');
  }
}
function getInstance(): CC | undefined {
  return new CC();
}
const instance = getInstance();
console.info(`${instance?.bar!}`);
instance?.foo()!;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-non-null-asserted-optional-chain*