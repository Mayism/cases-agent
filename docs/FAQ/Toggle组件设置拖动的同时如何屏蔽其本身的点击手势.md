---
title: Toggle组件设置拖动的同时如何屏蔽其本身的点击手势
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-303
category: FAQ
updated_at: 2026-03-13T04:05:09.357Z
---

# Toggle组件设置拖动的同时如何屏蔽其本身的点击手势

通过isDragging状态变量区分拖动与点击操作，在拖动过程中屏蔽toggleIsOn的状态变更，示例代码如下：

```typescript
import { hilog } from '@kit.PerformanceAnalysisKit';
@Entry
@Component
struct ToggleDrag {
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State positionX: number = 0;
  @State positionY: number = 0;
  @State toggleIsOn: boolean = true;
  // Marks whether the current drag state is used to block click events
  private isDragging: boolean = false;
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Toggle({ type: ToggleType.Button, isOn: this.toggleIsOn }) {
        Text('Toggle')
      }
      .selectedColor(Color.Pink)
      // Onchange callback precedes onActionEnd
      .onChange((isOn: boolean) => {
        hilog.info(0x0000, 'TOGGLE_DRAG', 'xxx %{public}s', `onClick Toggle, isOn: ${isOn}`);
        console.info('isDragging======' + this.isDragging);
        if (isOn === this.toggleIsOn) {
          return;
        } else {
          this.toggleIsOn = isOn;
        }
        if (this.isDragging) {
          this.toggleIsOn = !this.toggleIsOn;
        }
      })
      .translate({ x: this.offsetX, y: this.offsetY })
      .gesture(
        PanGesture()
          .onActionStart(() => {
            this.isDragging = true;
          })
          .onActionUpdate((event: GestureEvent) => {
            this.offsetX = this.positionX + event.offsetX;
            this.offsetY = this.positionY + event.offsetY;
          })
          .onActionEnd(() => {
            this.positionX = this.offsetX;
            this.positionY = this.offsetY;
            this.isDragging = false;
          })
      )
    }
  }
}
```

[ToggleComponentBlocksClickGestures.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ToggleComponentBlocksClickGestures.ets#L21-L73)

效果图如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/vGggs3BZSZmRW1MarVBMIA/zh-cn_image_0000002229758509.png?HW-CC-KV=V1&HW-CC-Date=20260313T040502Z&HW-CC-Expire=86400&HW-CC-Sign=DB7D97776D4B7EA515464506F996FC862ED7113D558B10EB66BC8DCF3FE5CD7E)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-303*