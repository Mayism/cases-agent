---
title: @typescript-eslint/lines-between-class-members
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_lines-between-class-members
category: 指南
updated_at: 2026-03-13T04:15:03.971Z
---

# @typescript-eslint/lines-between-class-members

禁止或者要求类成员之间有空行分隔。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/lines-between-class-members": "error"
  }
}
```

## 选项

该规则有两个选项配置，第一个选项可以是字符串或者对象，第二个选项是对象。详情请参考[eslint/lines-between-class-members选项](https://eslint.nodejs.cn/docs/latest/rules/lines-between-class-members#选项)。

此外，第二个选项支持配置exceptAfterOverload属性，表示是否需要跳过重载类成员后空行的检查。exceptAfterOverload的值为布尔类型，配置为true时表示跳过不检查，配置为false时表示不跳过检查。默认为true。

示例：

```cangjie
"@typescript-eslint/lines-between-class-members": [
  "error",
  "always",
  {
    "exceptAfterOverload": true
  },
]
```

## 正例

```typescript
// 默认要求类成员之间有空行分隔
export class Foo {
  public baz() {
    console.info('baz');
  }
  public qux() {
    console.info('qux');
  }
}
```

## 反例

```typescript
// 默认要求类成员之间有空行分隔
export class Foo {
  public baz() {
    console.info('baz');
  }
  public qux() {
    console.info('qux');
  }
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_lines-between-class-members*