---
title: stateStyles：多态样式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-statestyles
category: 指南
updated_at: 2026-03-12T08:00:32.549Z
---

# stateStyles：多态样式

@Styles仅应用于静态页面的样式复用，stateStyles可以依据组件的内部状态的不同，快速设置不同样式。这就是我们本章要介绍的内容stateStyles（又称为：多态样式）。

说明

多态样式仅支持通用属性。如果多态样式不生效，则该属性可能为组件的私有属性，例如：[fontColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button#fontcolor)、[TextInput](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput)组件的[backgroundColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-background)等。此时，可以通过[attributeModifier](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-attribute-modifier#attributemodifier)动态设置组件属性来解决此问题。

## 概述

stateStyles是属性方法，可以根据UI内部状态来设置样式，类似于css伪类，但语法不同。ArkUI提供以下六种状态：

-   focused：获焦态。
    
-   normal：正常态。
    
-   pressed：按压态。
    
-   disabled：不可用态。
    
-   clicked：点击态。
    
-   selected10+：选中态。
    

说明

获焦态目前仅支持通过外接键盘的Tab键或方向键触发，不支持在嵌套滚动组件场景下通过按键触发。

## 使用场景

### 基础场景

下面的示例展示了stateStyles最基本的使用场景。Button1处于第一个组件，Button2处于第二个组件。按压时显示为pressed态指定的黑色。使用Tab键走焦，Button1获焦并显示为focused态指定的粉色。当Button2获焦的时候，Button2显示为focused态指定的粉色，Button1失焦显示normal态指定的蓝色。

```TypeScript
@Entry
@Component
struct StateStylesSample {
  build() {
    Column() {
      Button('Button1')
        .stateStyles({
          focused: {
            .backgroundColor('#ffffeef0')
          },
          pressed: {
            .backgroundColor('#ff707070')
          },
          normal: {
            .backgroundColor('#ff2787d9')
          }
        })
        .margin(20)
      Button('Button2')
        .stateStyles({
          focused: {
            .backgroundColor('#ffffeef0')
          },
          pressed: {
            .backgroundColor('#ff707070')
          },
          normal: {
            .backgroundColor('#ff2787d9')
          }
        })
    }.margin('30%')
  }
}
```

[StateStylesSample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/StateStyle/entry/src/main/ets/pages/StateStyle/StateStylesSample.ets#L16-L50)

**图1** 获焦态和按压态

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b0/v3/pa_YFW_STLqhJDfD4xybeQ/zh-cn_image_0000002557924713.gif?HW-CC-KV=V1&HW-CC-Date=20260312T080009Z&HW-CC-Expire=86400&HW-CC-Sign=FDDE23D0525462FF383CBA2E7FF6CD7473BBC4B80887975248891231773A2875)

### @Styles和stateStyles联合使用

以下示例通过@Styles指定stateStyles的不同状态。

```TypeScript
@Entry
@Component
struct MyComponent {
  @Styles normalStyle() {
    .backgroundColor(Color.Gray)
  }
  @Styles pressedStyle() {
    .backgroundColor(Color.Red)
  }
  build() {
    Column() {
      Text('Text1')
        .fontSize(50)
        .fontColor(Color.White)
        .stateStyles({
          normal: this.normalStyle,
          pressed: this.pressedStyle,
        })
    }
  }
}
```

[MyComponent.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/StateStyle/entry/src/main/ets/pages/NormalStyle/MyComponent.ets#L16-L39)

**图2** 正常态和按压态

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/eb/v3/VC-ulkZnRIKARFEqprs4dw/zh-cn_image_0000002527044798.gif?HW-CC-KV=V1&HW-CC-Date=20260312T080009Z&HW-CC-Expire=86400&HW-CC-Sign=B5B905C96E3BDCA5AF0BE601B5B5F03E4F2158E89C13CB18B793D9F081F63D52)

### 在stateStyles里使用常规变量和状态变量

stateStyles可以通过this绑定组件内的常规变量和状态变量。

```TypeScript
@Entry
@Component
struct CompWithInlineStateStyles {
  @State focusedColor: Color = 0xD5D5D5;
  normalColor: Color = 0x004AAF;
  build() {
    Column() {
      Button('clickMe')
        .height(100)
        .width(100)
        .stateStyles({
          normal: {
            .backgroundColor(this.normalColor)
          },
          focused: {
            .backgroundColor(this.focusedColor)
          }
        })
        .onClick(() => {
          this.focusedColor = 0x707070;
        })
        .margin('30%')
    }
  }
}
```

[CompWithInlineStateStyles.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/StateStyle/entry/src/main/ets/pages/FocusStyle/CompWithInlineStateStyles.ets#L15-L42)

Button默认normal态显示蓝色，第一次按下Tab键让Button获焦显示为focus态的浅灰色，点击事件触发后，再次按下Tab键让Button获焦，focus态变为深灰色。

**图3** 点击改变获焦态样式

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b2/v3/2WGcmi5YSq6SP_Kcy0SQmg/zh-cn_image_0000002558044679.gif?HW-CC-KV=V1&HW-CC-Date=20260312T080009Z&HW-CC-Expire=86400&HW-CC-Sign=11D6F7829945BCE7C96C09203111B7A29139F0215B4D2B2721DA214E1FCC55CF)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-statestyles*