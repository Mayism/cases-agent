---
title: 如何禁用Refresh组件的下拉刷新
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-386
category: FAQ
updated_at: 2026-03-13T04:14:28.754Z
---

# 如何禁用Refresh组件的下拉刷新

**问题现象**

在使用Refresh组件时，开发者诉求控制Refresh组件的下拉刷新，实现临时禁用或者开启下拉刷新等功能。

**解决措施**

可以通过[pullDownRatio](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-refresh#pulldownratio12)设置跟手系数，当设置为0时，表示不跟随手势下拉，即可禁用下拉刷新。

禁用Refresh组件下拉刷新的示例如下：

```typescript
@Entry
@Component
struct Index {
  @State isRefreshing: boolean = false;
  @State arr: String[] = ['0', '1', '2', '3', '4', '5'];
  @State downRatio: number = 1;
  build() {
    Column() {
      Refresh({ refreshing: $$this.isRefreshing }) {
        Column() {
          Row({ space: 10 }) {
            Button('不允许下拉刷新')
              .onClick(() => {
                this.downRatio = 0;
              })
            Button('允许下拉刷新')
              .onClick(() => {
                this.downRatio = 1;
              })
          }
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('70%')
                  .height(80)
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .onScrollIndex((first: number) => {
            console.info(first.toString());
          })
          .width('100%')
          .height('100%')
          .alignListItem(ListItemAlign.Center)
          .scrollBar(BarState.Off)
        }
      }
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false;
        }, 2000)
        console.info('onRefreshing test');
      })
      .pullDownRatio(this.downRatio)
      .backgroundColor(0x89CFF0)
      .refreshOffset(64)
      .pullToRefresh(true)
    }
  }
}
```

[DisablePullDownRefresh.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/abce1db5a4cf676fd100dbd3a0acd02f5bb30358/ArkUI/entry/src/main/ets/pages/DisablePullDownRefresh.ets#L6-L64)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-386*