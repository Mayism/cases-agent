---
title: @cross-device-app-dev/font-size
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_font-size
category: 指南
updated_at: 2026-03-13T04:41:40.173Z
---

# @cross-device-app-dev/font-size

字体大小要求至少为8fp以便于阅读。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@cross-device-app-dev/font-size": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
const FONT_SIZE = 12;
@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      Text('message').fontSize(12)
      Text('message').fontSize('12fp')
    }
  }
}
```

## 反例

```typescript
const FONT_SIZE = 7;
@Entry
@Component
struct Index1 {
  build() {
    RelativeContainer() {
      Text('message').fontSize(FONT_SIZE)
      Text('message').fontSize('7fp')
    }
  }
}
```

## 规则集

```cangjie
plugin:@cross-device-app-dev/recommended
plugin:@cross-device-app-dev/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_font-size*