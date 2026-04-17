---
title: 如何动态控制键盘绑定在不同的TextInput上
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-215
category: FAQ
updated_at: 2026-03-13T03:57:28.518Z
---

# 如何动态控制键盘绑定在不同的TextInput上

软键盘的收起和弹出与输入框的获焦和失焦相关。可以通过 focusControl 动态控制输入框焦点的转移，从而控制软键盘的显示和隐藏。将焦点转移到目标输入框可以实现键盘的动态切换。参考代码如下：

```typescript
@Entry
@Component
struct DynamicControlKeyboard {
  // Whether focus is on "key1" TextInput
  private flag: boolean = true;
  @Builder
  customKeyboardBuilder() {
    Row() {
      Text('Customize keyboard')
    }
    .justifyContent(FlexAlign.Center)
    .width('1260px')
    .height('1161px')
    .backgroundColor(Color.Brown)
  }
  build() {
    Column({space: 10}) {
      TextInput()
        .key('key1')
        .onAppear(() => {
          focusControl.requestFocus('key1');
        })
        .defaultFocus(true)
      TextInput()
        .key('key2')
        .customKeyboard(this.customKeyboardBuilder())
      Button('Switch TextInput')
        .onClick(() => {
          if (this.flag) {
            console.info('TextInput2 ==> ' + focusControl.requestFocus('key2'));
          } else {
            console.info('TextInput1 ==> ' + focusControl.requestFocus('key1'));
          }
          this.flag = !this.flag;
        })
      Button()
        .width(0)
        .height(0)
        .key('key3')
    }
    .padding({ top: 20 })
    .width('100%')
    .height('100%')
    .onClick(() => {
      focusControl.requestFocus('key3');
    })
  }
}
```

[DynamicallyControlKeyboardBinding.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/DynamicallyControlKeyboardBinding.ets#L21-L68)

效果如图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/79/v3/9DfvViI_SZepvd8yrXPpYg/zh-cn_image_0000002426207326.png?HW-CC-KV=V1&HW-CC-Date=20260313T035721Z&HW-CC-Expire=86400&HW-CC-Sign=A91FFB9467091510B4B3057700EFA71D39D4B9BAA51B0145DE116E5D5FA80BC4)![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/48/v3/-Hvi8xZLQ_albHBG5cyayg/zh-cn_image_0000002426218940.png?HW-CC-KV=V1&HW-CC-Date=20260313T035721Z&HW-CC-Expire=86400&HW-CC-Sign=4AAA8189995C07BE189324C5F9D050FFE5EE5A2009110847F4BC0F1573DFC18D)

**参考链接**

[focusControl](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-focus#focuscontrol9)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-215*