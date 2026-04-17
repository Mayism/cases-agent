---
title: @typescript-eslint/ban-ts-comment
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_ban-ts-comment
category: 指南
updated_at: 2026-03-13T04:12:29.347Z
---

# @typescript-eslint/ban-ts-comment

不允许使用\`@ts-<directional>\`格式的注释，或要求在注释后进行补充说明。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/ban-ts-comment": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/ban-ts-comment选项](https://typescript-eslint.nodejs.cn/rules/ban-ts-comment/#options)。

## 正例

```javascript
console.log('hello');
```

## 反例

```javascript
// @ts-expect-error
console.log('hello');
/* @ts-expect-error */
console.log('hello');
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_ban-ts-comment*