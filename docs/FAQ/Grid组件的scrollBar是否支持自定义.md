---
title: Grid组件的scrollBar是否支持自定义
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-136
category: FAQ
updated_at: 2026-03-13T03:49:57.030Z
---

# Grid组件的scrollBar是否支持自定义

Grid组件的默认滑动条scrollBar不支持自定义样式。

可以通过隐藏默认滑动条并绑定ScrollBar组件来满足该场景。参考代码如下：

```typescript
@Entry
@Component
struct Index {
  private scroller: Scroller = new Scroller()
  private arr: number[] = [];
  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Grid(this.scroller) {
          ForEach(this.arr, (item: number) => {
            GridItem() {
              Text(item.toString())
                .width(100)
                .height(50)
                .backgroundColor('#3366CC')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
            }
          })
        }
        .width('100%')
        .columnsTemplate("1fr 1fr 1fr")
        .columnsGap(5)
        .rowsGap(5)
        // Hide native scrollBar
        .scrollBar(BarState.Off)
        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto }) {
          Text("A")
            .width(20)
            .height(50)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
        .width(20)
        .backgroundColor('#ededed')
      }
    }
  }
  aboutToAppear() {
    for (let i = 0; i < 100; i++) {
      this.arr.push(i)
    }
  }
}
```

[DoesGridSupportCustomization.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/DoesGridSupportCustomization.ets#L21-L68)

**参考链接**

[Grid](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-grid)，[ScrollBar](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-scrollbar)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-136*