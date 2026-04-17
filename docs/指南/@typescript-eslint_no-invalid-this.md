---
title: @typescript-eslint/no-invalid-this
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-invalid-this
category: 指南
updated_at: 2026-03-13T04:18:31.127Z
---

# @typescript-eslint/no-invalid-this

禁止在this值为undefined的上下文中使用this。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-invalid-this": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-invalid-this选项](https://eslint.nodejs.cn/docs/rules/no-invalid-this#选项)。

## 正例

```typescript
// ts代码文件中需要添加"use strict"
function baz(arg0: () => object) {
  return arg0;
}
export class Bar {
  public a: number;
  public constructor() {
    this.a = 0;
    baz(() => this);
  }
}
```

## 反例

```javascript
// ts代码文件中需要添加"use strict"
function baz(arg0: () => object) {
  return arg0;
}
export function foo1() {
  this.a = 0;
  baz(() => this);
}
export const foo2 = () => {
  this.a = 0;
  baz(() => this);
};
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-invalid-this*