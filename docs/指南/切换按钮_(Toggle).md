---
title: 切换按钮 (Toggle)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-switch
category: 指南
updated_at: 2026-03-12T08:45:30.915Z
---

# 切换按钮 (Toggle)

Toggle组件提供状态按钮样式、勾选框样式和开关样式，一般用于两种状态之间的切换。具体用法请参考[Toggle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-toggle)。

## 创建切换按钮

Toggle通过调用[ToggleOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-toggle#toggleoptions18对象说明)来创建，具体调用形式如下：

```typescript
Toggle(options: { type: ToggleType, isOn?: boolean })
```

其中，ToggleType为开关类型，包括Button、Checkbox和Switch，isOn为切换按钮的状态。

API version 11开始，Checkbox默认样式由圆角方形变为圆形。

接口调用有以下两种形式：

-   创建不包含子组件的Toggle。
    
    当ToggleType为Checkbox或者Switch时，用于创建不包含子组件的Toggle：
    
    ```TypeScript
    Toggle({ type: ToggleType.Checkbox, isOn: false }).id('toggle1') // 请开发者替换为实际的id
    Toggle({ type: ToggleType.Checkbox, isOn: true }).id('toggle2') // 请开发者替换为实际的id
    ```
    
    [CreateToggle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/CreateToggle.ets#L30-L33)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/38/v3/AVzIn60HTS-JU0R0FaN3BA/zh-cn_image_0000002526885152.png?HW-CC-KV=V1&HW-CC-Date=20260312T084507Z&HW-CC-Expire=86400&HW-CC-Sign=880DC2A5BC540A6C48F5A0F437AB2685AA6FE12642FCB43553AEDCCAF78EB2FC)
    
    ```TypeScript
    Toggle({ type: ToggleType.Switch, isOn: false }).id('toggle3') // 请开发者替换为实际的id
    Toggle({ type: ToggleType.Switch, isOn: true }).id('toggle4') // 请开发者替换为实际的id
    ```
    
    [CreateToggle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/CreateToggle.ets#L39-L42)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c9/v3/NsRTmezqTYCJ2AUGZmUfEg/zh-cn_image_0000002557924999.png?HW-CC-KV=V1&HW-CC-Date=20260312T084507Z&HW-CC-Expire=86400&HW-CC-Sign=3A40E6D92606E10F3DCA57E5E0D2BE97735F765A423C4610403FB6263D773085)
    
-   创建包含子组件的Toggle。
    
    当ToggleType为Button时，只能包含一个子组件，如果子组件有文本设置，则相应的文本内容会显示在按钮上。
    
    ```TypeScript
    Toggle({ type: ToggleType.Button, isOn: false }) {
      Text('status button')
        .fontColor('#182431')
        .fontSize(12)
    }.width(100).id('toggle5') // 请开发者替换为实际的id
    Toggle({ type: ToggleType.Button, isOn: true }) {
      Text('status button')
        .fontColor('#182431')
        .fontSize(12)
    }.width(100).id('toggle6') // 请开发者替换为实际的id
    ```
    
    [CreateToggle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/CreateToggle.ets#L61-L73)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ef/v3/ZaR3ZTUVQJGTEfluxsXHFw/zh-cn_image_0000002527045084.png?HW-CC-KV=V1&HW-CC-Date=20260312T084507Z&HW-CC-Expire=86400&HW-CC-Sign=46A929097EF0CAA53EBE502958DB5DCE4A88794566CC34318C6ED27D241E6762)
    

## 自定义样式

-   通过selectedColor属性设置Toggle打开选中后的背景颜色。
    
    ```TypeScript
      Toggle({ type: ToggleType.Button, isOn: true }) {
        Text('status button')
          .fontColor('#182431')
          .fontSize(12)
      }.width(100)
      .selectedColor(Color.Pink)
    // ···
      Toggle({ type: ToggleType.Checkbox, isOn: true })
        .selectedColor(Color.Pink)
        // ···
      Toggle({ type: ToggleType.Switch, isOn: true })
        .selectedColor(Color.Pink)
        // ···
    ```
    
    [ToggleCustomStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/ToggleCustomStyle.ets#L31-L52)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/76/v3/u6jj-q-aTZ6PLzneQxmjcw/zh-cn_image_0000002558044965.png?HW-CC-KV=V1&HW-CC-Date=20260312T084507Z&HW-CC-Expire=86400&HW-CC-Sign=8A0329B057B5C97A16AABD274AD04A6444BF429B6BB3DE883EC75C43FDB3042D)
    
-   通过switchPointColor属性设置Switch类型的圆形滑块颜色，仅对type为ToggleType.Switch生效。
    
    ```TypeScript
    Toggle({ type: ToggleType.Switch, isOn: false })
      .switchPointColor(Color.Pink)
      // ···
    Toggle({ type: ToggleType.Switch, isOn: true })
      .switchPointColor(Color.Pink)
      // ···
    ```
    
    [ToggleCustomStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/ToggleCustomStyle.ets#L60-L71)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/21/v3/XXYthCtoSy-BvinDsd-0YQ/zh-cn_image_0000002526885154.png?HW-CC-KV=V1&HW-CC-Date=20260312T084507Z&HW-CC-Expire=86400&HW-CC-Sign=4166497CC68324AFE358D94D3745EFE6DEFED215F58EBA9C9D0B8047008EFA45)
    

## 添加事件

除支持[通用事件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-component-general-events)外，Toggle还用于选中和取消选中后触发某些操作，可以绑定onChange事件来响应操作后的自定义行为。

```TypeScript
Toggle({ type: ToggleType.Switch, isOn: false })
  .onChange((isOn: boolean) => {
    if(isOn) {
      // 需要执行的操作
      // ···
    }
  })
```

[CreateToggle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/CreateToggle.ets#L44-L54)

## 场景示例

Toggle用于切换蓝牙开关状态。

```TypeScript
// xxx.ets
import { promptAction } from '@kit.ArkUI';
@Entry
@Component
export struct ToggleSample {
  @State message: string = 'off';
  pathStack: NavPathStack = new NavPathStack();
  build() {
    // ···
      Column({ space: 8 }) {
        Column({ space: 8 }) {
          Text('Bluetooth Mode: ' + this.message)
            .id('message')
          Row() {
            Text('Bluetooth')
            Blank()
            Toggle({ type: ToggleType.Switch })
              .id('toggle') // 请开发者替换为实际的id
              .onChange((isOn: boolean) => {
                if (isOn) {
                  this.message = 'on';
                  promptAction.openToast({ 'message': 'Bluetooth is on.' });
                } else {
                  this.message = 'off';
                  promptAction.openToast({ 'message': 'Bluetooth is off.' });
                }
              })
          }.width('100%')
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor('#fff')
        .borderRadius(12)
        .padding(12)
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    // ···
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.ToggleCaseExample_title')替换为实际资源文件，在本示例中该资源文件的value值为"toggle蓝牙示例"
    .title($r('app.string.ToggleCaseExample_title'))
  }
}
```

[ToggleCaseExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/toggle/ToggleCaseExample.ets#L16-L69)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/46/v3/wQcK-FMmT0Cjg3ZCQrGLzg/zh-cn_image_0000002557925001.gif?HW-CC-KV=V1&HW-CC-Date=20260312T084507Z&HW-CC-Expire=86400&HW-CC-Sign=B44C19140E81398A3AFC8E4C1DE6C430073E68075910003B6F78F7B8F4DB3F57)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-switch*