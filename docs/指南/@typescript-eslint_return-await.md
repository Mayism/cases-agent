---
title: @typescript-eslint/return-await
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_return-await
category: 指南
updated_at: 2026-03-13T04:25:52.828Z
---

# @typescript-eslint/return-await

要求异步函数返回“await”。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/return-await": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/return-await选项](https://typescript-eslint.nodejs.cn/rules/return-await/#options)。

## 正例

```javascript
export async function validInTryCatch1() {
  try {
    return await Promise.resolve('try');
  } catch (e) {
    return await Promise.resolve('catch');
  }
}
```

## 反例

```javascript
export async function validInTryCatch1() {
  try {
    return Promise.resolve('try');
  } catch (e) {
    return Promise.resolve('catch');
  }
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_return-await*