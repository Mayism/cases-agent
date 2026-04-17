---
title: @typescript-eslint/restrict-plus-operands
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_restrict-plus-operands
category: 指南
updated_at: 2026-03-13T04:25:28.988Z
---

# @typescript-eslint/restrict-plus-operands

要求加法的两个操作数都是相同的类型，并且是“bigint”、“number”或“string”。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/restrict-plus-operands": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/restrict-plus-operands选项](https://typescript-eslint.nodejs.cn/rules/restrict-plus-operands/#options)。

## 正例

```javascript
const num = 10;
const bigIntNum = 1n;
export const foo1 = parseInt('5.5', num) + num;
export const foo2 = bigIntNum + bigIntNum;
```

## 反例

```cpp
const num = 10;
const bigIntNum = 1n;
export const foo2 = bigIntNum + num;
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_restrict-plus-operands*