---
title: prefer-const
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-const
category: 指南
updated_at: 2026-03-13T04:27:22.939Z
---

# prefer-const

推荐声明后未修改值的变量用const关键字来声明。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "prefer-const": "error"
  }
}
```

## 选项

详情请参考[eslint/prefer-const选项](https://eslint.nodejs.cn/docs/latest/rules/prefer-const#选项)。

## 正例

```javascript
const a = 'hello';
console.log(a);
```

## 反例

```javascript
// 变量a声明以后未重新赋值，建议用const关键字来声明
let a = 'hello';
console.log(a);
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-const*