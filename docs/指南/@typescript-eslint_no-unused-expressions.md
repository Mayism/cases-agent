---
title: @typescript-eslint/no-unused-expressions
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unused-expressions
category: 指南
updated_at: 2026-03-13T04:22:26.616Z
---

# @typescript-eslint/no-unused-expressions

代码中禁止包含未使用的表达式。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-unused-expressions": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-unused-expressions选项](https://eslint.nodejs.cn/docs/rules/no-unused-expressions#选项)。

## 正例

```javascript
export const v1 = Number.MAX_VALUE;
if ('hello'.length === v1) {
  console.info('hello');
}
{
  const v2 = '0';
  console.info(v2);
}
```

## 反例

```javascript
Number.MAX_VALUE;
if ('0') '0';
{'0';}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-unused-expressions*