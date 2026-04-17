---
title: @typescript-eslint/require-await
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_require-await
category: 指南
updated_at: 2026-03-13T04:25:21.535Z
---

# @typescript-eslint/require-await

异步函数必须包含“await”。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/require-await": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
async function doSomething(): Promise<void> {
  return Promise.resolve();
}
export async function foo() {
  await doSomething();
}
export function baz() {
  doSomething().catch(() => {
    console.info('error');
  });
}
```

## 反例

```javascript
async function doSomething(): Promise<void> {
  return Promise.resolve();
}
export async function foo() {
  doSomething();
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_require-await*