---
title: 禁用Tab组件边缘滑动回弹效果的方法
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-280
category: FAQ
updated_at: 2026-03-13T04:03:51.506Z
---

# 禁用Tab组件边缘滑动回弹效果的方法

为边缘的 tabContent 添加 PanGesture 手势，最左侧的 tabContent 添加向右滑动手势，最右侧的 tabContent 添加向左滑动手势。示例代码如下：

```typescript
@Component
export struct TabsNoRebound {
  @State currentIndex: number = 0;
  private fontColor: string = '#182431';
  private selectedFontColor: string = '#007DFF';
  private controller: TabsController = new TabsController();
  private panOptionR: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Right });
  private panOptionL: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left });
  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({
          top: 17,
          bottom: 7
        })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }
    .width('100%')
  }
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('#00CB87')
        }
        .tabBar(this.tabBuilder(0, 'green'))
        .gesture(
          // Dragging to the right triggers this gesture event
          PanGesture(this.panOptionR)
            .onActionStart((event?: GestureEvent) => {
              console.info('Pan start');
            })
            .onActionUpdate((event?: GestureEvent) => {
              console.info('Pan onActionUpdate');
            })
            .onActionEnd(() => {
              console.info('Pan end');
            })
        )
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('#007DFF')
        }
        .tabBar(this.tabBuilder(1, 'blue'))
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('#FFBF00')
        }
        .tabBar(this.tabBuilder(2, 'yellow'))
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('#E67C92')
        }
        .tabBar(this.tabBuilder(3, 'pink'))
        .gesture(
          // Dragging to the left triggers this gesture event
          PanGesture(this.panOptionL)
            .onActionStart((event?: GestureEvent) => {
              console.info('Pan start');
            })
            .onActionUpdate((event?: GestureEvent) => {
              console.info('Pan onActionUpdate');
            })
            .onActionEnd(() => {
              console.info('Pan end');
            })
        )
      }
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
      .width(360)
      .height(296)
      .margin({ top: 52 })
      .backgroundColor('#F1F3F5')
    }
    .width('100%')
  }
}
```

[TabEdgeSlidingEffectTurnedOff.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/TabEdgeSlidingEffectTurnedOff.ets#L21-L124)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-280*