---
title: 如何解决两层Tabs出现滑动冲突的情况
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-19
category: FAQ
updated_at: 2026-03-13T03:40:38.454Z
---

# 如何解决两层Tabs出现滑动冲突的情况

通过给外层Tabs设置scrollable(false)实现两层Tabs嵌套底部导航+顶部导航的组合，参考代码如下：

```typescript
@Entry
@Component
struct TwoLayerTabNestedSliding {
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Column() {
            Tabs() {
              TabContent() {
                Text('Focus on content')
              }
              .tabBar('follow with interest')
              TabContent() {
                Text('The content of the game')
              }
              .tabBar('game')
            }
          }
          .backgroundColor('#f08a34')
          .width('100%')
        }
        .tabBar('home page')
        TabContent() {
          Column() {
            Tabs() {
              TabContent() {
                Text('The content of technology')
              }
              .tabBar('science and technology')
              TabContent() {
                Text('The content of the video')
              }
              .tabBar('video')
            }
          }
          .backgroundColor('#f08a34')
          .width('100%')
        }
        .tabBar('find')
      }
      .scrollable(false)
    }
    .width('100%')
    .height('100%')
  }
}
```

[ResolveTwoLayersOfTabs.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ResolveTwoLayersOfTabs.ets#L21-L67)

[限制导航栏的滑动切换](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-navigation-tabs#限制导航栏的滑动切换)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-19*