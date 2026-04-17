---
title: @typescript-eslint/naming-convention
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_naming-convention
category: 指南
updated_at: 2026-03-13T04:15:45.379Z
---

# @typescript-eslint/naming-convention

强制标识符使用一致的命名风格。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/naming-convention": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/naming-convention选项](https://typescript-eslint.nodejs.cn/rules/naming-convention/#options)。

## 正例

```javascript
// 默认类名为大驼峰的命名风格，函数名为小驼峰的命名风格
export class Bar {
  public meth() {
    console.info('method');
  }
}
export function foo() {
  console.info('function');
}
```

## 反例

```javascript
// 默认类名为大驼峰的命名风格，函数名为小驼峰的命名风格
export class bar {
  public Meth() {
    console.info('method');
  }
}
export function Foo() {
  console.info('function');
}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_naming-convention*