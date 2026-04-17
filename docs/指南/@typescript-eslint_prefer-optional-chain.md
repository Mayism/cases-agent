---
title: @typescript-eslint/prefer-optional-chain
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-optional-chain
category: 指南
updated_at: 2026-03-13T04:24:03.198Z
---

# @typescript-eslint/prefer-optional-chain

强制使用链式可选表达式，而不是链式逻辑与、否定逻辑或、或空对象。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-optional-chain": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/prefer-optional-chain选项](https://typescript-eslint.nodejs.cn/rules/prefer-optional-chain/#options)。

## 正例

```typescript
class Foo {
  public a?: Foo = new Foo();
  public b?: Foo = new Foo();
  public c?: Foo = new Foo();
  public method?(): void {
    console.info('method');
  }
}
const foo = new Foo();
export const c = foo.a?.b?.c;
foo.a?.b?.method?.();
```

## 反例

```typescript
class Foo {
  public a?: Foo = new Foo();
  public b?: Foo = new Foo();
  public c?: Foo = new Foo();
  public method?(): void {
    console.info('method');
  }
}
const foo = new Foo();
let c = foo.a;
c = c && c.b;
c = c && c.c;
export { c };
if (foo.a && foo.a.b && foo.a.b.method) {
  foo.a.b.method();
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-optional-chain*