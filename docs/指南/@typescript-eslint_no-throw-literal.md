---
title: @typescript-eslint/no-throw-literal
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-throw-literal
category: 指南
updated_at: 2026-03-13T04:20:39.621Z
---

# @typescript-eslint/no-throw-literal

禁止将字面量作为异常抛出。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-throw-literal": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-throw-literal选项](https://typescript-eslint.nodejs.cn/rules/no-throw-literal#options)。

## 正例

```javascript
// 抛出Error对象
throw new Error();
const e = new Error('error');
throw e;
const err1 = new Error();
throw err1;
function err2() {
  return new Error();
}
throw err2();
class CustomError extends Error {
  // ...
}
throw new CustomError();
```

## 反例

```javascript
throw 'error';
throw 0;
throw undefined;
throw null;
const err1 = new Error();
throw 'an ' + err1;
const err2 = new Error();
throw `${err2}`;
const err3 = '';
throw err3;
function err() {
  return '';
}
throw err();
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-throw-literal*