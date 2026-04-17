---
title: @typescript-eslint/no-restricted-syntax
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-restricted-syntax
category: 指南
updated_at: 2026-03-13T04:20:08.843Z
---

# @typescript-eslint/no-restricted-syntax

不允许使用指定的（即用户在规则中定义的）语法。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
      "@typescript-eslint/no-restricted-syntax": [
         "error",
         {
             "selector": "FunctionExpression",
             "message": "Function expressions are not allowed."
         },
         {
             "selector": "CallExpression[callee.name='setTimeout'][arguments.length!=2]",
             "message": "setTimeout must always be invoked with two arguments."
         }
     ]
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-restricted-syntax选项](https://eslint.nodejs.cn/docs/latest/rules/no-restricted-syntax#选项)。

## 正例

```javascript
/* eslint no-restricted-syntax: ["error", "ClassDeclaration"] */
export function doSomething() {
  console.info('doSomething');
}
```

## 反例

```typescript
/* eslint no-restricted-syntax: ["error", "ClassDeclaration"] */
export class CC {
  public name: string;
  public constructor(name: string) {
    this.name = name;
  }
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-restricted-syntax*