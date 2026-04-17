---
title: @typescript-eslint/typedef
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_typedef
category: 指南
updated_at: 2026-03-13T04:26:47.907Z
---

# @typescript-eslint/typedef

在某些位置需要类型注释。

支持检查的范围从选项中查看。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/typedef": "error"
  }
}
```

## 选项

详情请参考[@typescript-eslint/typedef选项](https://typescript-eslint.nodejs.cn/rules/typedef#options)。

## 正例

```javascript
export const text = 'text';
```

## 反例

```cpp
// 默认配置下，规则不会告警
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_typedef*