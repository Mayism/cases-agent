---
title: @cross-device-app-dev/touch-target-size
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_touch-target-size
category: 指南
updated_at: 2026-03-13T04:42:31.162Z
---

# @cross-device-app-dev/touch-target-size

组件通用属性responseRegion点击热区需满足最小尺寸要求。

主要交互元素或控件的可点击热区至少为48vp×48vp（推荐），不得小于40vp×40vp。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@cross-device-app-dev/touch-target-size": "warn"
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
  build() {
    RelativeContainer() {
      Text('message').responseRegion({width: 60, height: 60})
    }
  }
}
```

## 反例

```less
@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      Text('message').responseRegion({width: 27, height: 40})
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

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_touch-target-size*