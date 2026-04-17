---
title: @typescript-eslint/prefer-includes
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-includes
category: 指南
updated_at: 2026-03-13T04:23:30.735Z
---

# @typescript-eslint/prefer-includes

强制使用“includes”方法而不是“indexOf”方法。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-includes": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cangjie
const str: string = 'hello';
const array: string[] = ['hello'];
const readonlyArray: readonly string[] = ['hello'];
str.includes('h');
array.includes('h');
readonlyArray.includes('h');
```

## 反例

```cangjie
const str: string = 'hello';
const array: string[] = ['hello'];
const readonlyArray: readonly string[] = ['hello'];
const num = -1;
let vv = str.indexOf('h') !== num;
vv = vv && array.indexOf('h') !== num;
vv = vv && readonlyArray.indexOf('h') !== num;
export { vv };
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-includes*