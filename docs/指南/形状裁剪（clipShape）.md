---
title: 形状裁剪（clipShape）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-clip-shape
category: 指南
updated_at: 2026-03-12T08:56:44.999Z
---

# 形状裁剪（clipShape）

可利用[clipShape](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-sharp-clipping#clipshape12)接口将组件裁剪为所需的形状。调用该接口后，可以保留该形状覆盖的组件部分，同时移除组件的其余部分。裁剪形状本身是不可见的。

说明

不同的形状支持的属性范围不同，路径是一种形状，除此之外还有椭圆、矩形等形状。

路径的形状不支持设置宽度和高度，具体形状支持的属性参考具体[形状](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-arkui-shape)的文档。

形状中的[fill](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-arkui-shape#fill)属性对clipShape接口不生效。

## 裁剪圆形

通过设置CircleShape，将图片裁剪为圆形。

```TypeScript
// xxx.ets
import { CircleShape } from '@kit.ArkUI';
@Entry
@Component
struct ClipShapeExample {
  build() {
    Column({ space: 15 }) {
      // 用一个280px直径的圆对图片进行裁剪
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new CircleShape({ width: '280px', height: '280px' }))
        .width('500px').height('280px')
      // 用一个350px直径的圆对图片进行裁剪
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new CircleShape({ width: '350px', height: '350px' }))
        .width('500px').height('370px')
    }
    .width('100%')
    .margin({ top: 15 })
  }
}
```

[ClipShapeExample1.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ClipShape/entry/src/main/ets/View/ClipShapeExample1.ets#L15-L38)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/tOIQEyJPR26EPo-qPOMLdw/zh-cn_image_0000002527045134.png?HW-CC-KV=V1&HW-CC-Date=20260312T085622Z&HW-CC-Expire=86400&HW-CC-Sign=44D597B064CDED91CBEE2DA6D8A1EAB11903967C6784AF9E6607A9FA7CBA19A2)

## 裁剪椭圆形

通过设置EllipseShape，将图片裁剪为椭圆形。

```TypeScript
// xxx.ets
import { EllipseShape } from '@kit.ArkUI';
@Entry
@Component
struct ClipShapeExample {
  build() {
    Column({ space: 15 }) {
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new EllipseShape({ width: '280px', height: '200px' }))
        .width('500px').height('400px')
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new EllipseShape({ width: '380px', height: '280px' }))
        .width('500px').height('400px')
    }
    .width('100%')
    .margin({ top: 15 })
  }
}
```

[ClipShapeExample2.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ClipShape/entry/src/main/ets/View/ClipShapeExample2.ets#L15-L36)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/LS1j7P8GTy2xpHLlbQwz9g/zh-cn_image_0000002558045015.png?HW-CC-KV=V1&HW-CC-Date=20260312T085622Z&HW-CC-Expire=86400&HW-CC-Sign=12C40A4966A976F67F0147B7AEDD970886B03BD789F735D08BB5CE140DC2B600)

## 裁剪矩形

通过设置RectShape，将图片裁剪为矩形。

```TypeScript
// xxx.ets
import { RectShape } from '@kit.ArkUI';
@Entry
@Component
struct ClipShapeExample {
  build() {
    Column({ space: 15 }) {
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new RectShape({ width: '200px', height: '200px' }))
        .width('500px').height('400px')
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new RectShape({ width: '380px', height: '280px' }))
        .width('500px').height('400px')
    }
    .width('100%')
    .margin({ top: 15 })
  }
}
```

[ClipShapeExample3.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ClipShape/entry/src/main/ets/View/ClipShapeExample3.ets#L15-L36)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/O20Y_QazR3aIBS24lXKsyw/zh-cn_image_0000002526885204.png?HW-CC-KV=V1&HW-CC-Date=20260312T085622Z&HW-CC-Expire=86400&HW-CC-Sign=B418DC40682E7F20A2B41141B4E2AF0DA0DB948BC70AC015D1F6F48796238F41)

## 裁剪不规则形状

通过设置PathShape，将图片裁剪为不规则形状。

```TypeScript
// xxx.ets
import { PathShape } from '@kit.ArkUI';
@Entry
@Component
struct ClipShapeExample {
  build() {
    Column({ space: 15 }) {
      Row() {
        // 请将$r('app.media.background')替换为实际资源文件
        Image($r('app.media.background'))
          .clipShape(new PathShape({ commands: 'M0 0 H400 V200 H0 Z' }))
          .width('500px').height('300px')
      }
      .clip(true)
      .borderRadius(20)
    }
    .width('100%')
    .margin({ top: 15 })
  }
}
```

[ClipShapeExample4.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ClipShape/entry/src/main/ets/View/ClipShapeExample4.ets#L15-L36)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/kT14WJ11TAWFIe1zTyccJQ/zh-cn_image_0000002557925051.png?HW-CC-KV=V1&HW-CC-Date=20260312T085622Z&HW-CC-Expire=86400&HW-CC-Sign=11901D685553902262405940D3015E5B7A8877E15C4B7077BEC1FECD0BA5AF1D)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-clip-shape*