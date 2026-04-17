---
title: @typescript-eslint/array-type
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_array-type
category: 指南
updated_at: 2026-03-13T04:12:17.231Z
---

# @typescript-eslint/array-type

定义数组类型时，建议使用相同的样式。比如都使用T\[\]或者都使用Array<T>。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/array-type": "error"
  }
}
```

## 选项

详情请参考[typescript/array-type 选项](https://typescript-eslint.nodejs.cn/rules/array-type#options)。

## 正例

```cangjie
const x: string[] = ['a', 'b'];
const y: readonly string[] = ['a', 'b'];
export { x, y };
```

## 反例

```cangjie
const x: Array<string> = ['a', 'b'];
const y: ReadonlyArray<string> = ['a', 'b'];
export { x, y };
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_array-type*