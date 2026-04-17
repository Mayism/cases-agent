---
title: @Styles装饰器：定义组件重用样式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-style
category: 指南
updated_at: 2026-03-12T07:59:41.733Z
---

# @Styles装饰器：定义组件重用样式

如果每个组件的样式都需要单独设置，在开发过程中会出现大量代码在进行重复样式设置，虽然可以复制粘贴，但为了代码简洁性和后续方便维护，我们推出了可以提炼公共样式进行复用的装饰器@Styles。

@Styles装饰器可以将多条样式设置提炼成一个方法，直接在组件声明的位置调用。通过@Styles装饰器可以快速定义并复用自定义样式。

说明

从API version 9开始支持。

从API version 9开始，该装饰器支持在ArkTS卡片中使用。

从API version 11开始，该装饰器支持在元服务中使用。

## 装饰器使用说明

-   当前@Styles仅支持[通用属性](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-component-general-attributes)和[通用事件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-component-general-events)。
    
-   @Styles可以定义在组件内或全局，在全局定义时需在方法名前面添加function关键字，组件内定义时则不需要添加function关键字。请参考用例[组件内styles和全局styles的用法](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-style#组件内styles和全局styles的用法)。
    
-   组件内@Styles的优先级高于全局@Styles。框架优先找当前组件内的@Styles，如果找不到，则会全局查找。
    

说明

只能在当前文件内使用@Styles，不支持export。

若需要实现样式导出，推荐使用[AttributeModifier](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-user-defined-extension-attributemodifier)。

定义在组件内的@Styles可以通过this访问组件的常量和状态变量，并可以在@Styles里通过事件来改变状态变量的值，示例如下：

```TypeScript
@Entry
@Component
struct FancyUse {
  @State heightValue: number = 50;
  @Styles
  fancy() {
    .height(this.heightValue)
    .backgroundColor(Color.Blue)
    .onClick(() => {
      this.heightValue = 100;
    })
  }
  build() {
    Column() {
      Button('change height')
        .fancy()
    }
    .height('100%')
    .width('100%')
  }
}
```

[StylesDecorator2.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ComponentExtension/entry/src/main/ets/pages/StylesDecorator/StylesDecorator2.ets#L30-L54)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e5/v3/VjlgDqwISxSdg4hbuU6fmw/zh-cn_image_0000002557924711.gif?HW-CC-KV=V1&HW-CC-Date=20260312T075919Z&HW-CC-Expire=86400&HW-CC-Sign=B1BD8B7ACB1A4C76D095CB435F14D8C5B3BCDAE5518B14118896D17828BC5888)

## 限制条件

-   @Styles方法不能有参数，编译期会报错，表明@Styles方法不支持参数。

```TypeScript
  // 错误写法： @Styles不支持参数，编译期报错
  @Styles
  function globalFancy (value: number) {
    .width(value)
  }
```

```TypeScript
// 正确写法
  @Styles
  function globalFancy () {
    .width(100)
  }
```

[StylesDecorator2.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ComponentExtension/entry/src/main/ets/pages/StylesDecorator/StylesDecorator2.ets#L16-L22)

-   不支持在@Styles方法内使用逻辑组件，逻辑组件内的属性不生效。

```TypeScript
// 错误写法
  @Styles
  function backgroundColorStyle() {
    if (true) {
      .backgroundColor(Color.Red)
    }
  }
```

```TypeScript
// 正确写法
  @Styles
  function backgroundColorStyle() {
    .backgroundColor(Color.Red)
  }
```

[StylesDecorator2.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ComponentExtension/entry/src/main/ets/pages/StylesDecorator/StylesDecorator2.ets#L23-L29)

## 使用场景

### 组件内@Styles和全局@Styles的用法

```TypeScript
// 定义在全局的@Styles封装的样式
@Styles
function globalFancy1() {
  .width(150)
  .height(100)
  .backgroundColor(Color.Pink)
}
@Entry
@Component
struct GlobalFancy {
  @State heightValue: number = 100;
  // 定义在组件内的@Styles封装的样式
  @Styles
  fancy() {
    .width(200)
    .height(this.heightValue)
    .backgroundColor(Color.Gray)
    .onClick(() => {
      this.heightValue = 200;
    })
  }
  build() {
    Column({ space: 10 }) {
      // 使用全局的@Styles封装的样式
      Text('FancyA')
        .globalFancy1()
        .fontSize(30)
      // 使用组件内的@Styles封装的样式
      Text('FancyB')
        .fancy()
        .fontSize(30)
    }
    .width('100%')
  }
}
```

[StylesDecorator1.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ComponentExtension/entry/src/main/ets/pages/StylesDecorator/StylesDecorator1.ets#L16-L52)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/aa/v3/Stfbg9SxTtWWpysNjAGsBQ/zh-cn_image_0000002527044796.gif?HW-CC-KV=V1&HW-CC-Date=20260312T075919Z&HW-CC-Expire=86400&HW-CC-Sign=192A55CA615FACBDF57C9AEE69DE6966A1B603CB4C0A8736B0A6DE7378AE9ED1)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-style*