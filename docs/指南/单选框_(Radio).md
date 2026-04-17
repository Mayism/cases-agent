---
title: 单选框 (Radio)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-radio-button
category: 指南
updated_at: 2026-03-12T08:45:05.968Z
---

# 单选框 (Radio)

Radio是单选框组件，通常用于提供相应的用户交互选择项，同一组的Radio中只有一个可以被选中。具体用法请参考[Radio](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-radio)。

## 创建单选框

Radio通过调用[RadioOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-radio#radiooptions对象说明)来创建，以RadioOptions中的value和group为例：

```typescript
Radio(options: {value: string, group: string})
```

其中，value是单选框的名称，group是单选框的所属群组名称。checked属性可以设置单选框的状态，状态分别为false和true，设置为true时表示单选框被选中。

Radio支持设置选中状态和非选中状态的样式。

```TypeScript
Radio({ value: 'Radio1', group: 'radioGroup' })
  .checked(false)
Radio({ value: 'Radio2', group: 'radioGroup' })
  .checked(true)
```

[RadioButton.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/radio/RadioButton.ets#L34-L39)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/95/v3/dvSuiQeSSZGR0lK5Xf1aBw/zh-cn_image_0000002527045082.png?HW-CC-KV=V1&HW-CC-Date=20260312T084444Z&HW-CC-Expire=86400&HW-CC-Sign=6CD419C057A868C3AE03D9DE1147B1897C89437A2F5E8AB814E7CD27DCBAF11A)

## 添加事件

除支持[通用事件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-component-general-events)外，Radio还用于选中后触发某些操作，可以绑定onChange事件来响应选中操作后的自定义行为。

```TypeScript
Radio({ value: 'Radio1', group: 'radioGroup' })
  .onChange((isChecked: boolean) => {
    if(isChecked) {
      //需要执行的操作
      // ···
    }
  })
Radio({ value: 'Radio2', group: 'radioGroup' })
  .onChange((isChecked: boolean) => {
    if(isChecked) {
      //需要执行的操作
      // ···
    }
  })
```

[RadioButton.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/radio/RadioButton.ets#L47-L66)

## 场景示例

通过点击Radio切换声音模式。

```TypeScript
// xxx.ets
import { promptAction } from '@kit.ArkUI';
@Entry
@Component
export struct RadioExample {
  @State rst: promptAction.ShowToastOptions = { 'message': 'Ringing mode.' };
  @State vst: promptAction.ShowToastOptions = { 'message': 'Vibration mode.' };
  @State sst: promptAction.ShowToastOptions = { 'message': 'Silent mode.' };
  build() {
    // ···
      Row() {
        Column() {
          Radio({ value: 'Ringing', group: 'radioGroup' }).checked(true)
            .height(50)
            .width(50)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                // 切换为响铃模式
                this.getUIContext().getPromptAction().openToast(this.rst);
              }
            })
          Text('Ringing')
        }
        Column() {
          Radio({ value: 'Vibration', group: 'radioGroup' })
            .height(50)
            .width(50)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                // 切换为振动模式
                this.getUIContext().getPromptAction().openToast(this.vst);
              }
            })
          Text('Vibration')
        }
        Column() {
          Radio({ value: 'Silent', group: 'radioGroup' })
            .height(50)
            .width(50)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                // 切换为静音模式
                this.getUIContext().getPromptAction().openToast(this.sst);
              }
            })
          Text('Silent')
        }
      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
    // ···
  }
}
```

[RadioSample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/radio/RadioSample.ets#L16-L76)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b2/v3/7Q7WB_jPT7WshYYrd07oiQ/zh-cn_image_0000002558044963.gif?HW-CC-KV=V1&HW-CC-Date=20260312T084444Z&HW-CC-Expire=86400&HW-CC-Sign=24C88190381EA83F867020DD4F4498B478546CEC8E73F0904CE3248DDC17C464)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-radio-button*