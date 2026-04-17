---
title: @security/no-commented-code
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-commented-code
category: 指南
updated_at: 2026-03-13T04:27:33.619Z
---

# @security/no-commented-code

不使用的代码段建议直接删除，不允许通过注释的方式保留。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-commented-code": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cpp
// this is a comment
```

## 反例

```lua
// console.log('info')
```

## 规则集

```cangjie
plugin:@security/recommended
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-commented-code*