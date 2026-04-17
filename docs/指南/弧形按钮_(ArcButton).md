---
title: 弧形按钮 (ArcButton)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-advanced-components-arcbutton
category: 指南
updated_at: 2026-03-12T08:44:42.670Z
---

# 弧形按钮 (ArcButton)

从API version 18开始支持ArcButton。ArcButton是弧形按钮组件，用于圆形屏幕。为手表用户提供强调、普通、警告等样式按钮。具体用法请参考[ArcButton](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton)。

## 创建按钮

ArcButton通过调用以下接口来创建。

```TypeScript
ArcButton({
  options: new ArcButtonOptions({
    label: 'OK',
    position: ArcButtonPosition.TOP_EDGE,
    styleMode: ArcButtonStyleMode.EMPHASIZED_LIGHT,
  // ···
  })
})
```

[ButtonAlignTop.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonAlignTop.ets#L27-L43)

其中，[label](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)设置按钮文字，[position](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)设置按钮类型，[styleMode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)设置按钮样式。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f7/v3/MOau02MfSE2AD8IvVL8Mng/zh-cn_image_0000002558044959.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=8BFD88EB9942F1CC90DD5C6BDE30CBEC80CB0E4CD14325786F3543AA5DAED454)

## 设置按钮类型

ArcButton有上弧形按钮和下弧形按钮两种类型。使用[position](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)设置按钮类型。

-   下弧形按钮（默认类型）。
    
    通过将[position](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)属性设置为ArcButtonPosition.BOTTOM\_EDGE，可以将按钮设置为下弧形按钮。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
        position: ArcButtonPosition.BOTTOM_EDGE,
        styleMode: ArcButtonStyleMode.EMPHASIZED_LIGHT,
      // ···
      })
    })
    ```
    
    [ButtonAlignBottom.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonAlignBottom.ets#L27-L45)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/WnLx9hMjS_u5sTad6JBQxA/zh-cn_image_0000002526885148.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=14E257783242264DC7509DE1D85D7DA6D4D901ACAEF91C264A385C9F5BAFE822)
    
-   上弧形按钮。
    
    通过将[position](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)属性设置为ArcButtonPosition.TOP\_EDGE，可以将按钮设置为上弧形按钮。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
        position: ArcButtonPosition.TOP_EDGE,
        styleMode: ArcButtonStyleMode.EMPHASIZED_LIGHT,
      // ···
      })
    })
    ```
    
    [ButtonAlignTop.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonAlignTop.ets#L27-L43)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/37/v3/TUBmG8nOTuSSaMgxdMKlFw/zh-cn_image_0000002557924995.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=A6EFBE5AF7E4738539B9341913A4C1D62E1AF1AAC6C515E030D49B1C8FAA1013)
    

## 自定义样式

-   设置背景色。
    
    使用[backgroundColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)属性设置按钮的背景色。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
        styleMode: ArcButtonStyleMode.CUSTOM,
        backgroundColor: ColorMetrics.resourceColor('#707070')
      })
    })
    ```
    
    [ButtonBcgColor.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonBcgColor.ets#L23-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4c/v3/8JJRZ99MRxO3b7fq4syoGg/zh-cn_image_0000002527045080.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=2191A818828EB1DB3C8E3F22DB070D394AA095E5B494BCA6DAC4AB1DAABC3BAE)
    
-   设置文本颜色。
    
    使用[fontColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)属性设置按钮的文本颜色。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
        styleMode: ArcButtonStyleMode.CUSTOM,
        backgroundColor: ColorMetrics.resourceColor('#E84026'),
        fontColor: ColorMetrics.resourceColor('#707070')
      })
    })
    ```
    
    [ButtonFontColor.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonFontColor.ets#L23-L32)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fa/v3/hfy7RGUqR-qUXkx0vIzZ7g/zh-cn_image_0000002558044961.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=7D9541D8F50B74259F1AC67CB62F418CBA3BFBD63D3CB6A7D8BAE8F63A6DAFD6)
    
-   设置阴影颜色。
    
    使用[shadowEnabled](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)属性启用按钮阴影，并通过[shadowColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-arcbutton#arcbuttonoptions)属性设置按钮的阴影颜色。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
        shadowEnabled: true,
        shadowColor: ColorMetrics.resourceColor('#ffec1022')
      })
    })
    ```
    
    [ButtonShadow.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonShadow.ets#L23-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ae/v3/qGQKt7d_RK-DwHTvW3iMZw/zh-cn_image_0000002526885150.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=EF6E95C852B0FD7DC3025EC86ECF133BE502FB4D48468DD9D3D88A533128C4FA)
    

## 添加事件

-   绑定onClick事件来响应点击操作后的自定义行为。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
      // ···
        onClick: () => {
          hilog.info(DOMAIN, TAG, 'ArcButton onClick');
        },
      })
    })
    ```
    
    [ButtonAlignTop.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonAlignTop.ets#L28-L44)
    
-   绑定onTouch事件来响应触摸操作后的自定义行为。
    
    ```TypeScript
    ArcButton({
      options: new ArcButtonOptions({
        label: 'OK',
      // ···
        onTouch: (event: TouchEvent) => {
          hilog.info(DOMAIN, TAG, 'ArcButton onTouch');
        }
      })
    })
    ```
    
    [ButtonAlignBottom.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonAlignBottom.ets#L28-L44)
    

## 场景示例

在亮度设置界面，进度条显示当前亮度为30%。点击重置后，亮度值将被重置为默认的50%。

运行该示例需要Wearable设备的支持。在src/main目录下的工程配置文件[module.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)中[deviceTypes标签](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file#devicetypes标签)内配置wearable。

```cangjie
"module": {
  // ···
  "deviceTypes": [
    "wearable"
  ],
  // ···
}
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/module.json5#L17-L70)

```TypeScript
import { LengthMetrics, LengthUnit, ArcButton, ArcButtonOptions, ArcButtonStyleMode } from '@kit.ArkUI';
const BRIGHT_NESS_VALUE = 30;
const BRIGHT_NESS_VALUE_DEFAULT = 50;
@Entry
@ComponentV2
struct BrightnessPage {
  @Local brightnessValue: number = BRIGHT_NESS_VALUE;
  private defaultBrightnessValue: number = BRIGHT_NESS_VALUE_DEFAULT;
  build() {
    RelativeContainer() {
      // 请将$r('app.string.Brightness')替换为实际资源文件，在本示例中该资源文件的value值为"设置亮度"
      Text($r('app.string.Brightness'))
        .fontColor(Color.White)
        .id('id_brightness_set_text')
        .fontSize(24)
        .margin({ top: 16 })
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Text(`${this.brightnessValue} %`)
        .fontColor(Color.White)
        .id('id_brightness_min_text')
        .margin({ left: 16 })
        .alignRules({
          start: { anchor: '__container__', align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
      Slider({
        value: this.brightnessValue,
        min: 0,
        max: 100,
        style: SliderStyle.InSet
      })
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .width(150)
        .id('id_brightness_slider')
        .margin({ left: 16, right: 16 })
        .onChange((value: number, mode: SliderChangeMode) => {
          this.brightnessValue = value;
        })
        .alignRules({
          center: { anchor: 'id_brightness_min_text', align: VerticalAlign.Center },
          start: { anchor: 'id_brightness_min_text', align: HorizontalAlign.End }
        })
      ArcButton({
        options: new ArcButtonOptions({
          // 请将$r('app.string.Reset')替换为实际资源文件，在本示例中该资源文件的value值为"重置"
          label: $r('app.string.Reset'),
          styleMode: ArcButtonStyleMode.EMPHASIZED_LIGHT,
          fontSize: new LengthMetrics(19, LengthUnit.FP),
          onClick: () => {
            this.brightnessValue = this.defaultBrightnessValue;
          }
        })
      })
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Black)
  }
}
```

[ButtonBrightness.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ButtonComponent/entry/src/main/ets/pages/ButtonBrightness.ets#L16-L90)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1f/v3/yryJvDeoQA-ftAvDey2nNw/zh-cn_image_0000002557924997.png?HW-CC-KV=V1&HW-CC-Date=20260312T084219Z&HW-CC-Expire=86400&HW-CC-Sign=24569AC2CB22237A882351A4F058D314F1B846E55EEE535B65FD72861F1278CF)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-advanced-components-arcbutton*