---
title: @cross-device-app-dev/size-unit
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_size-unit
category: 指南
updated_at: 2026-03-13T04:42:21.915Z
---

# @cross-device-app-dev/size-unit

组件通用属性width、height和size，应当使用vp作为单位，以适配不同设备屏幕宽度。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@cross-device-app-dev/size-unit": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```cangjie
const WIDTH_SIZE = 100;
@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Button('btn').size({ width: 40, height: '20vp' })
      }.width(WIDTH_SIZE)
      .height('100vp')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
```

## 反例

```less
@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Button('btn').size({ width: '40px', height: '20px' })
      }.width('100px')
      .height('100px')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
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

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_size-unit*