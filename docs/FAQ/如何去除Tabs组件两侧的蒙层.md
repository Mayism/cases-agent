---
title: 如何去除Tabs组件两侧的蒙层
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-56
category: FAQ
updated_at: 2026-03-13T03:43:37.143Z
---

# 如何去除Tabs组件两侧的蒙层

Tabs组件的fadingEdge属性表示页签超过容器宽度时是否渐隐消失，默认值为true，设置为false时则直接截断显示，不产生任何渐变效果。

```typescript
// xxx.ets
@Entry
@Component
struct TabsOpaque {
  @State message: string = 'Hello World';
  private controller: TabsController = new TabsController();
  @State selfFadingFade: boolean = false; // Does the tab gradually disappear when it exceeds the width of the container? The default value is true.
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Scrollable)
      .barHeight(80)
      .animationDuration(400)
      .onChange((index: number) => {
        console.info(index.toString());
      })
      .fadingEdge(this.selfFadingFade)
      .height('30%')
      .width('100%')
    }
    .padding({ top: '24vp', left: '24vp', right: '24vp' })
  }
}
```

[RemoveTabsComponentMask.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/RemoveTabsComponentMask.ets#L21-L86)

**参考链接**

[属性](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-tabs#属性)

[示例5（设置TabBar渐隐）](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-tabs#示例5设置tabbar渐隐)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-56*