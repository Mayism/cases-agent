---
title: 如何实现List内拖拽交换子组件位置
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-276
category: FAQ
updated_at: 2026-03-13T04:03:25.688Z
---

# 如何实现List内拖拽交换子组件位置

1.  在onItemDragStart回调中设置拖拽过程中显示的内容。
2.  在onItemDrop中通过itemIndex获取拖拽起始位置，insertIndex获取目标位置，并在onItemDrop中调用changeListItemIndex函数完成交换数组位置。

参考如下示例：

```typescript
@Entry
@Component
struct Index {
  @State listArr: string[] = [];
  @Builder
  textItemBuilder(text: string) {
    Column() {
      Text(text)
        .fontSize(16)
        .backgroundColor(0xDCDCDC)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }
  aboutToAppear() {
    for (let i = 0; i < 16; i++) {
      this.listArr.push(i + '');
    }
  }
  // Swap the position of listItem in the listArr array
  changeListItemIndex(index1: number, index2: number) {
    let tempItem = this.listArr[index1];
    this.listArr[index1] = this.listArr[index2];
    this.listArr[index2] = tempItem;
  }
  build() {
    Column() {
      List() {
        ForEach(this.listArr, (item: string) => {
          ListItem() {
            Text(item)
          }
          .width(80)
          .height(80)
          .backgroundColor(Color.White)
          .borderRadius(4)
          .margin({ top: 10 })
        }, (item: string) => item)
      }
      .width('100%')
      .height(500)
      .lanes({ minLength: 80, maxLength: 80 })
      .alignListItem(ListItemAlign.Center)
      .onItemDragStart((event: ItemDragInfo, index: number) => {
        return this.textItemBuilder(this.listArr[index]);
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        if (!isSuccess || insertIndex < 0 || insertIndex >= this.listArr.length) {
          return;
        }
        this.changeListItemIndex(itemIndex, insertIndex);
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}
```

[ListExchangeSubcomponentPositions.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ListExchangeSubcomponentPositions.ets#L21-L84)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-276*