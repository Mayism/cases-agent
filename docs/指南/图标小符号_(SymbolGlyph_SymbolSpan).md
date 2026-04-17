---
title: 图标小符号 (SymbolGlyph/SymbolSpan)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-symbol
category: 指南
updated_at: 2026-03-12T08:39:54.085Z
---

# 图标小符号 (SymbolGlyph/SymbolSpan)

SymbolGlyph是图标小符号组件，便于使用精美的图标，如渲染多色图标和使用动效图标。SymbolSpan作为Text组件的子组件，可在文本中穿插显示图标小符号。具体用法请参考[SymbolGlyph](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph)和[SymbolSpan](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan)组件的文档。

## 创建图标

SymbolGlyph通过$r引用Resource资源来创建，目前仅支持系统预置的Symbol资源名。

相关资源可参考[系统图标](https://developer.huawei.com/consumer/cn/doc/design-guides/system-icons-0000001929854962)。

```TypeScript
SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
  .fontSize(96)
  .renderingStrategy(SymbolRenderingStrategy.SINGLE)
  .fontColor([Color.Black, Color.Green, Color.White])
```

[CreatSymbolGlyph.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/CreatSymbolGlyph.ets#L25-L30)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7e/v3/WQR_idr5Sx6dsEGi3puzQA/zh-cn_image_0000002558044913.png?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=3360086C4CBB3E185AD1BECB4C66A8C13E52DD7EBA851E0A9D3C6D2DA7CAC172)

## 添加到文本中

[SymbolSpan](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan)可作为[Text](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text)的子组件用于显示图标小符号。可以在一个Text组件内添加多个SymbolSpan，从而展示一串连续的图标。

-   创建SymbolSpan。
    
    SymbolSpan组件需嵌入在Text组件中才能显示，单独使用不会呈现任何内容。
    
    ```TypeScript
    Text() {
      SymbolSpan($r('sys.symbol.ohos_trash'))
        .fontWeight(FontWeight.Normal)
        .fontSize(96)
    }
    ```
    
    [SymbolAddToText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddToText.ets#L29-L35)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4/v3/g8NM6NkJQ1-uSVfNFgEeXA/zh-cn_image_0000002526885102.png?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=AF0F5826F14CF0F74D8D021282534DE3DE5E9C228B8EB287730A30318A7620DB)
    
-   通过[fontSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan#fontsize)属性设置SymbolSpan的大小。
    
    ```TypeScript
    Row() {
      Column() {
        Text('48')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(48)
            .renderingStrategy(SymbolRenderingStrategy.SINGLE)
            .fontColor([Color.Black, Color.Green, Color.White])
        }
      }
      Column() {
        Text('72')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(72)
            .renderingStrategy(SymbolRenderingStrategy.SINGLE)
            .fontColor([Color.Black, Color.Green, Color.White])
        }
      }
      Column() {
        Text('96')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .renderingStrategy(SymbolRenderingStrategy.SINGLE)
            .fontColor([Color.Black, Color.Green, Color.White])
        }
      }
    }
    ```
    
    [SymbolAddToText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddToText.ets#L39-L71)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d2/v3/3CP4e50wRgKySOtaRv0-7Q/zh-cn_image_0000002557924949.png?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=D8E54244C10C4FF76E699311904C316079A0C3439DEF28B74EBD0ECD5C3505A3)
    
-   通过[fontWeight](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan#fontweight)属性设置SymbolSpan组件的粗细。
    
    ```TypeScript
    Row() {
      Column() {
        Text('Light')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Lighter)
            .fontSize(96)
        }
      }
      Column() {
        Text('Normal')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Normal)
            .fontSize(96)
        }
      }
      Column() {
        Text('Bold')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Bold)
            .fontSize(96)
        }
      }
    }
    ```
    
    [SymbolAddToText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddToText.ets#L75-L104)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/67/v3/Grpi107mSJuGeahyo1Ye7A/zh-cn_image_0000002527045034.png?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=C341DD8CA6B142E2E4EE0AC07EF3FBDBECB76B0149045907C8F086713F6F68AF)
    
-   通过[fontColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan#fontcolor)属性设置SymbolSpan的颜色。
    
    ```TypeScript
    Row() {
      Column() {
        Text('Black')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .fontColor([Color.Black])
        }
      }
      Column() {
        Text('Green')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .fontColor([Color.Green])
        }
      }
      Column() {
        Text('Pink')
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .fontColor([Color.Pink])
        }
      }
    }
    ```
    
    [SymbolAddToText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddToText.ets#L108-L137)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3b/v3/FfmaZdAxSLKmInDNWx7xWQ/zh-cn_image_0000002558044915.png?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=40D69706B974D9B97357DF95C88EE9DB84E6355A00D87C595601C6AA3B99431E)
    
-   通过[renderingStrategy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan#renderingstrategy)属性设置SymbolSpan的渲染策略。
    
    ```TypeScript
    Row() {
      Column() {
        // 请将$r('app.string.single_color')替换为实际资源文件，在本示例中该资源文件的value值为"单色"
        Text($r('app.string.single_color'));
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .renderingStrategy(SymbolRenderingStrategy.SINGLE)
            .fontColor([Color.Black, Color.Green, Color.White])
        }
      }
      Column() {
        // 请将$r('app.string.multi_color')替换为实际资源文件，在本示例中该资源文件的value值为"多色"
        Text($r('app.string.multi_color'));
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
            .fontColor([Color.Black, Color.Green, Color.White])
        }
      }
      Column() {
        // 请将$r('app.string.hierarchical')替换为实际资源文件，在本示例中该资源文件的value值为"分层"
        Text($r('app.string.hierarchical'));
        Text() {
          SymbolSpan($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY)
            .fontColor([Color.Black, Color.Green, Color.White])
        }
      }
    }
    ```
    
    [SymbolAddToText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddToText.ets#L141-L176)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d8/v3/gvyAB4tIReW7Wf849bQdGg/zh-cn_image_0000002526885104.png?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=616DE9C8EAB24CF6441A66244C8510551A986ADD0F590B6AEC6E7EF0B3BDC51F)
    
-   通过[effectStrategy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolspan#effectstrategy)属性设置SymbolSpan的动效策略。
    
    ```TypeScript
    Row() {
      Column() {
        // 请将$r('app.string.no_action')替换为实际资源文件，在本示例中该资源文件的value值为"无动效"
        Text($r('app.string.no_action'));
        Text() {
          SymbolSpan($r('sys.symbol.ohos_wifi'))
            .fontSize(96)
            .effectStrategy(SymbolEffectStrategy.NONE)
        }
      }
      Column() {
        // 请将$r('app.string.overall_scaling_animation_effect')替换为实际资源文件，在本示例中该资源文件的value值为"整体缩放动效"
        Text($r('app.string.overall_scaling_animation_effect'));
        Text() {
          SymbolSpan($r('sys.symbol.ohos_wifi'))
            .fontSize(96)
            .effectStrategy(SymbolEffectStrategy.SCALE)
        }
      }
      Column() {
        // 请将$r('app.string.hierarchical_animation')替换为实际资源文件，在本示例中该资源文件的value值为"层级动效"
        Text($r('app.string.hierarchical_animation'));
        Text() {
          SymbolSpan($r('sys.symbol.ohos_wifi'))
            .fontSize(96)
            .effectStrategy(SymbolEffectStrategy.HIERARCHICAL)
        }
      }
    }
    ```
    
    [SymbolAddToText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddToText.ets#L181-L213)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/u9LgZstzRser1SEfaERABg/zh-cn_image_0000002557924951.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=0A7D758E4D7AF91C3B6FCDAB2ACDE4DCFCD3F5B784ED8969E37C5362F67ED727)
    
-   SymbolSpan不支持通用事件。
    

## 自定义图标动效

相较于effectStrategy属性在启动时即触发动效，可以通过以下两种方式来控制动效的播放状态，以及选择更多样化的动效策略。

关于effectStrategy属性与symbolEffect属性的多种动态属性使用及生效原则，详情请参阅[SymbolGlyph.symbolEffect](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#symboleffect12-1)属性的说明。

-   通过设置SymbolEffect属性，可以同时配置SymbolGlyph的动效策略和播放状态。
    
    ```TypeScript
    @State isActive: boolean = true;
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L22-L24)
    
    ```TypeScript
    Column() {
      // 请将$r('app.string.variable_color_animation')替换为实际资源文件，在本示例中该资源文件的value值为"可变颜色动效"
      Text($r('app.string.variable_color_animation'));
      SymbolGlyph($r('sys.symbol.ohos_wifi'))
        .fontSize(96)
        .symbolEffect(new HierarchicalSymbolEffect(EffectFillStyle.ITERATIVE), this.isActive)
      // 请将$r('app.string.off')替换为实际资源文件，在本示例中该资源文件的value值为"关闭"
      // 请将$r('app.string.on')替换为实际资源文件，在本示例中该资源文件的value值为"播放"
      Button(this.isActive ? $r('app.string.off') : $r('app.string.on')).onClick(() => {
        this.isActive = !this.isActive;
      })
    }
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L40-L53)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3d/v3/5pw4x30WT8W-UcoNJHFpcw/zh-cn_image_0000002527045036.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=4122E5732766D354271544522339FEF84B7510EBB8C60DBF7981F008712E35F2)
    
-   通过设置SymbolEffect属性，可以同时指定SymbolGlyph的动画效果策略及其播放触发条件。
    
    ```TypeScript
    @State triggerValueReplace: number = 0;
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L25-L29)
    
    ```TypeScript
    Column() {
      // 请将$r('app.string.bounce_animation')替换为实际资源文件，在本示例中该资源文件的value值为"弹跳动效"
      Text($r('app.string.bounce_animation'));
      SymbolGlyph($r('sys.symbol.ellipsis_message_1'))
        .fontSize(96)
        .fontColor([Color.Gray])
        .symbolEffect(new BounceSymbolEffect(EffectScope.WHOLE, EffectDirection.UP),
                      this.triggerValueReplace)
      Button('trigger').onClick(() => {
        this.triggerValueReplace = this.triggerValueReplace + 1;
      })
    }
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L56-L69)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/37/v3/gIgTg3WNQz2B4EKkncrmFQ/zh-cn_image_0000002558044917.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=A1FEC2CF1AEDA96844EEBE0FA7B8A20FB0F0E14821543A05F02B444E1AA148D5)
    
-   从API version 20开始，支持通过设置SymbolEffect属性为[ReplaceSymbolEffect](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#replacesymboleffect12)，设置[ReplaceEffectType](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#replaceeffecttype20枚举说明)为ReplaceEffectType.SLASH\_OVERLAY，可以指定SymbolGlyph的禁用动画效果及其播放触发条件。
    
    ```TypeScript
    @State triggerValueReplace: number = 0;
    replaceFlag: boolean = true;
    @State renderMode: number = 1;
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L26-L33)
    
    ```TypeScript
    Column() {
      // 请将$r('app.string.disable_animation')替换为实际资源文件，在本示例中该资源文件的value值为"禁用动效"
      Text($r('app.string.disable_animation'));
      SymbolGlyph(this.replaceFlag ? $r('sys.symbol.eye_slash') : $r('sys.symbol.eye'))
        .fontSize(96)
        .renderingStrategy(this.renderMode)
        .symbolEffect(new ReplaceSymbolEffect(EffectScope.LAYER, ReplaceEffectType.SLASH_OVERLAY),
                      this.triggerValueReplace)
      Button('trigger').onClick(() => {
        this.replaceFlag = !this.replaceFlag;
        this.triggerValueReplace = this.triggerValueReplace + 1;
      })
    }
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L72-L86)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d1/v3/06LRjWLkR1md2a9nMLg7qA/zh-cn_image_0000002526885106.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=7AB2EE65575E390527D0778DF9C51A6AE7BEA11AA6A67A0BEA1694443EB00F10)
    
-   从API version 20开始，支持通过设置SymbolEffect属性为[ReplaceSymbolEffect](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#replacesymboleffect12)，设置[ReplaceEffectType](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#replaceeffecttype20枚举说明)为ReplaceEffectType.CROSS\_FADE，可以指定SymbolGlyph的快速替换动画效果及其播放触发条件。
    
    ```TypeScript
    @State triggerValueReplace: number = 0;
    replaceFlag: boolean = true;
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L27-L31)
    
    ```TypeScript
    Column() {
      // 请将$r('app.string.quick_replacement_animation')替换为实际资源文件，在本示例中该资源文件的value值为"快速替换动效"
      Text($r('app.string.quick_replacement_animation'));
      SymbolGlyph(this.replaceFlag ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
        .fontSize(96)
        .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE, ReplaceEffectType.CROSS_FADE),
                      this.triggerValueReplace)
      Button('trigger').onClick(() => {
        this.replaceFlag = !this.replaceFlag;
        this.triggerValueReplace = this.triggerValueReplace + 1;
      })
    }
    ```
    
    [SymbolCustomIconAnimation.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolCustomIconAnimation.ets#L89-L102)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/32/v3/tSgtITPRQG2jmxL8VCC_Lw/zh-cn_image_0000002557924953.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=6E04A0D577A11176F4E21DF7736ADD20076457D418A745AF7E5245C51EBB40D5)
    

## 设置阴影和渐变色

-   从API version 20开始，支持通过[symbolShadow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#symbolshadow20)接口实现了symbolGlyph组件显示阴影效果。
    
    ```TypeScript
    @State isActive: boolean = true;
    options: ShadowOptions = {
      radius: 10.0,
      color: Color.Blue,
      offsetX: 10,
      offsetY: 10,
    };
    ```
    
    [SymbolShadowAndColor.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolShadowAndColor.ets#L22-L31)
    
    ```TypeScript
    Column() {
      // 请将$r('app.string.shadow_ability')替换为实际资源文件，在本示例中该资源文件的value值为"阴影能力"
      Text($r('app.string.shadow_ability'));
      SymbolGlyph($r('sys.symbol.ohos_wifi'))
        .fontSize(96)
        .symbolEffect(new HierarchicalSymbolEffect(EffectFillStyle.ITERATIVE), !this.isActive)
        .symbolShadow(this.options)
      // 请将$r('app.string.off')替换为实际资源文件，在本示例中该资源文件的value值为"关闭"
      // 请将$r('app.string.on')替换为实际资源文件，在本示例中该资源文件的value值为"播放"
      Button(!this.isActive ? $r('app.string.off') : $r('app.string.on')).onClick(() => {
        this.isActive = !this.isActive;
      })
    }
    ```
    
    [SymbolShadowAndColor.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolShadowAndColor.ets#L47-L61)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/0OSXmNmVQNONqzNBdLkGcA/zh-cn_image_0000002527045038.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=EE37FDCEC5A5277602840EA6987ECAAA5C779FF57E599135E13897CDA6CC5BEF)
    
-   从API version 20开始，支持通过[shaderStyle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-symbolglyph#shaderstyle20)接口实现了symbolGlyph组件显示渐变色效果。
    
    ```TypeScript
    radialGradientOptions: RadialGradientOptions = {
      center: ['50%', '50%'],
      radius: '20%',
      colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
      repeating: true,
    };
    ```
    
    [SymbolShadowAndColor.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolShadowAndColor.ets#L33-L40)
    
    ```TypeScript
    Column() {
      // 请将$r('app.string.radial_gradient')替换为实际资源文件，在本示例中该资源文件的value值为"径向渐变"
      Text($r('app.string.radial_gradient'))
        .fontSize(18)
        .fontColor(0xCCCCCC)
        .textAlign(TextAlign.Center)
      SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
        .fontSize(96)
        .shaderStyle([new RadialGradientStyle(this.radialGradientOptions)])
    }
    ```
    
    [SymbolShadowAndColor.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolShadowAndColor.ets#L64-L75)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d8/v3/Kha4L0BgTGCp3xJJRj3KwA/zh-cn_image_0000002558044919.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=7C58B3FE2B5C5D134D49F9353A52D300A7B4E9CA4F59CC4CF4B64CCE58135C19)
    

## 添加事件

SymbolGlyph组件可以添加通用事件，例如绑定[onClick](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-events-click#onclick)、[onTouch](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-events-touch#ontouch)等事件来响应操作。

```TypeScript
@State wifiColor: ResourceColor = Color.Black;
```

[SymbolAddEvent.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddEvent.ets#L21-L23)

```TypeScript
SymbolGlyph($r('sys.symbol.ohos_wifi'))
  .fontSize(96)
  .fontColor([this.wifiColor])
  .onClick(() => {
    this.wifiColor = Color.Gray;
  })
```

[SymbolAddEvent.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolAddEvent.ets#L29-L36)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9/v3/npjhruchTl6ajI0yAwMlpQ/zh-cn_image_0000002526885108.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=9F8B0773D6323223D8FDB50B78235CDBCBE6101ABE03150A0517E4EBD1375709)

## 场景示例

该示例通过symbolEffect、fontSize、fontColor属性展示了播放列表的效果。

```TypeScript
// resourceGetString封装工具，从资源中获取字符串
import resourceGetString from '../../common/resource';
@Entry
@Component
struct SymbolMusicDemo {
  @State triggerValueReplace: number = 0;
  @State symbolSources: Resource[] =
    [$r('sys.symbol.repeat'), $r('sys.symbol.repeat_1'), $r('sys.symbol.arrow_left_arrow_right')];
  @State symbolSourcesIndex: number = 0;
  @State symbolText: string[] = [
    // 请将$r('app.string.play_in_order')替换为实际资源文件，在本示例中该资源文件的value值为"顺序播放"
    this.getUIContext()
      .getHostContext()!.resourceManager.getStringSync($r('app.string.play_in_order').id),
    // 请将$r('app.string.play_in_single_repeat')替换为实际资源文件，在本示例中该资源文件的value值为"单曲循环"
    this.getUIContext()
      .getHostContext()!.resourceManager.getStringSync($r('app.string.play_in_single_repeat').id),
    // 请将$r('app.string.shuffle_play')替换为实际资源文件，在本示例中该资源文件的value值为"随机播放"
    this.getUIContext()
      .getHostContext()!.resourceManager.getStringSync($r('app.string.shuffle_play').id),
  ];
  @State symbolTextIndex: number = 0;
  @State fontColorValue: ResourceColor = Color.Grey;
  @State fontColorValue1: ResourceColor = '#E8E8E8';
  build() {
    Column({ space: 10 }) {
      Row() {
        Text() {
          // 请将$r('app.string.current_playlist')替换为实际资源文件，在本示例中该资源文件的value值为"当前播放列表"
          Span(this.getUIContext()
            .getHostContext()!.resourceManager.getStringSync($r('app.string.current_playlist').id))
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
          Span('（101）')
        }
      }
      Row() {
        Row({ space: 5 }) {
          SymbolGlyph(this.symbolSources[this.symbolSourcesIndex])
            .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE), this.triggerValueReplace)
            .fontSize(20)
            .fontColor([this.fontColorValue])
          Text(this.symbolText[this.symbolTextIndex])
            .fontColor(this.fontColorValue)
        }
        .onClick(() => {
          this.symbolTextIndex++;
          this.symbolSourcesIndex++;
          this.triggerValueReplace++;
          if (this.symbolSourcesIndex > (this.symbolSources.length - 1)) {
            this.symbolSourcesIndex = 0;
            this.triggerValueReplace = 0;
          }
          if (this.symbolTextIndex > (this.symbolText.length - 1)) {
            this.symbolTextIndex = 0;
          }
        })
        .width('75%')
        Row({ space: 5 }) {
          Text() {
            SymbolSpan($r('sys.symbol.arrow_down_circle_badge_vip_circle_filled'))
              .fontColor([this.fontColorValue])
              .fontSize(20)
          }
          Text() {
            SymbolSpan($r('sys.symbol.heart_badge_plus'))
              .fontColor([this.fontColorValue])
              .fontSize(20)
          }
          Text() {
            SymbolSpan($r('sys.symbol.ohos_trash'))
              .fontColor([this.fontColorValue])
              .fontSize(20)
          }
        }
        .width('25%')
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.song')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲一"
          Text($r('app.string.song'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.song_again')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲二"
          Text($r('app.string.song_again'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.again_song')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲三"
          Text($r('app.string.again_song'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.song_repeat')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲四"
          Text($r('app.string.song_repeat'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.repeat_song')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲五"
          Text($r('app.string.repeat_song'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.song_play')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲六"
          Text($r('app.string.song_play'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Row() {
        Row() {
          // 请将$r('app.string.play_song')替换为实际资源文件，在本示例中该资源文件的value值为"歌曲七"
          Text($r('app.string.play_song'))
        }.width('82%')
        Row({ space: 5 }) {
          SymbolGlyph($r('sys.symbol.play_arrow_triangle_2_circlepath'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
          SymbolGlyph($r('sys.symbol.trash'))
            .fontColor([this.fontColorValue])
            .fontSize(20)
        }
      }
      Divider().width(5).color(this.fontColorValue1).width('98%')
      Column() {
        // 请将$r('app.string.off')替换为实际资源文件，在本示例中该资源文件的value值为"关闭"
        Text($r('app.string.off'))
      }
      .alignItems(HorizontalAlign.Center)
      .width('98%')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height(400)
    .padding({
      left: 10,
      top: 10
    })
  }
}
```

[SymbolSceneExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/symbol/SymbolSceneExample.ets#L18-L234)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c3/v3/aqf1me2CQIqLU6RT8g8n3w/zh-cn_image_0000002557924955.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083928Z&HW-CC-Expire=86400&HW-CC-Sign=71D35259FDB681A5D82D059FAFA93AC57BED93F7105B6170E110848EDCD341DC)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-symbol*