---
title: @performance/hp-arkui-image-async-load
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-image-async-load
category: 指南
updated_at: 2026-03-13T04:32:10.876Z
---

# @performance/hp-arkui-image-async-load

建议大图片使用异步加载。

通用丢帧场景下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkui-image-async-load": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```less
@Entry
@Component
struct MyComponent {
  build() {
    Row() {
      // 本地图片4k.png
      Image($r('app.media.4k'))
        .border({ width: 1 })
        .borderStyle(BorderStyle.Dashed)
        .height(100)
        .width(100)
    }
  }
}
```

## 反例

```less
@Entry
@Component
struct MyComponent {
  build() {
    Row() {
      // 本地图片4k.png
      Image($r('app.media.4k'))
        .border({ width: 1 })
        .borderStyle(BorderStyle.Dashed)
        .height(100)
        .width(100)
        .syncLoad(true)
    }
  }
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-image-async-load*