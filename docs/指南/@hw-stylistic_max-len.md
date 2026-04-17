---
title: @hw-stylistic/max-len
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_max-len
category: 指南
updated_at: 2026-03-13T04:44:04.248Z
---

# @hw-stylistic/max-len

强制代码行最大长度为120个字符。该规则仅检查.ets文件类型。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@hw-stylistic/max-len": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```less
@Entry
@Component
struct Index {
  message: string = 'hello';
  build() {
    Text(this.message)
  }
}
```

## 反例

```cpp
// This line has a length of 135. Maximum allowed is 120.
export const longLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongLongName = 10;
```

## 规则集

```perl
"plugin:@hw-stylistic/recommended"
"plugin:@hw-stylistic/all"
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_max-len*