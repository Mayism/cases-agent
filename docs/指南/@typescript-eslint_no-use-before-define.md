---
title: @typescript-eslint/no-use-before-define
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-use-before-define
category: 指南
updated_at: 2026-03-13T04:22:41.612Z
---

# @typescript-eslint/no-use-before-define

禁止在变量声明之前使用变量。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-use-before-define": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-use-before-define选项](https://eslint.nodejs.cn/docs/rules/no-use-before-define#选项)。

## 正例

```javascript
const a = '10';
console.info(a);
function ff(): void {
  console.info('function');
}
ff();
const foo = '1';
export { foo };
```

## 反例

```javascript
console.info(a);
const a = '10';
ff();
function ff(): void {
  console.info('function');
}
export { foo };
const foo = '1';
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-use-before-define*