---
title: @typescript-eslint/prefer-namespace-keyword
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-namespace-keyword
category: 指南
updated_at: 2026-03-13T04:23:48.971Z
---

# @typescript-eslint/prefer-namespace-keyword

推荐使用“namespace”关键字而不是“module”关键字来声明一个自定义的 TypeScript 模块。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/prefer-namespace-keyword": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cpp
export namespace Example {}
```

## 反例

```cpp
export module Example {}
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_prefer-namespace-keyword*