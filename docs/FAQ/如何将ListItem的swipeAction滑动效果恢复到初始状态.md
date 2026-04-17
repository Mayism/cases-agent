---
title: 如何将ListItem的swipeAction滑动效果恢复到初始状态
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-277
category: FAQ
updated_at: 2026-03-13T04:03:31.743Z
---

# 如何将ListItem的swipeAction滑动效果恢复到初始状态

使用 ListScroller 提供的 closeAllSwipeActions() 方法恢复滑动效果，示例代码如下：

```typescript
@Component
export struct SwiperActionRecover {
  @State arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  private scrollerForList: ListScroller = new ListScroller();
  @Builder
  itemEnd() {
    Row() {
      Button('Delete')
      Button('Set')
        .onClick(() => {
          this.scrollerForList.closeAllSwipeActions(); // This is the key line of code
        })
    }
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    Column() {
      List({ space: 5, scroller: this.scrollerForList }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item' + item)
              .width('100%')
              .height(100)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition({
            type: TransitionType.Delete,
            opacity: 0
          })
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd();
              },
              onAction: () => {
                this.getUIContext().animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item);
                  this.arr.splice(index, 1);
                });
              },
              actionAreaDistance: 56
            }
          })
        }, (item: string) => item)
      }
    }
    .padding(20)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}
```

[SwipeActionToNotSlide.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/SwipeActionToNotSlide.ets#L21-L76)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-277*