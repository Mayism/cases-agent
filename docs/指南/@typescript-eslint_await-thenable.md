---
title: @typescript-eslint/await-thenable
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_await-thenable
category: 指南
updated_at: 2026-03-13T04:12:25.126Z
---

# @typescript-eslint/await-thenable

不允许对不是“Thenable”对象的值使用await关键字（“Thenable”表示某个对象拥有“then”方法，比如Promise）。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/await-thenable": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
async function test() {
  await Promise.resolve('value');
}
export { test };
```

## 反例

```javascript
async function test() {
  await 'value';
}
export { test };
```

## 规则集

```cangjie
plugin:@typescript-eslint/recommended
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_await-thenable*