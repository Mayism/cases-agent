---
title: @typescript-eslint/no-empty-interface
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-empty-interface
category: 指南
updated_at: 2026-03-13T04:16:59.506Z
---

# @typescript-eslint/no-empty-interface

不允许声明空接口。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-empty-interface": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/no-empty-interface选项](https://typescript-eslint.nodejs.cn/rules/no-empty-interface/#options)。

## 正例

```kotlin
// an interface with any number of members
interface Foo {
  name: string;
}
interface Bar {
  age: number;
}
// an interface with more than one supertype
// in this case the interface can be used as a replacement of an intersection type.
export interface Baz extends Foo, Bar {}
```

## 反例

```kotlin
// an empty interface
interface Foo {}
// an interface with only one supertype (Bar === Foo)
export interface Bar extends Foo {}
// an interface with an empty list of supertypes
export interface Baz {}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-empty-interface*