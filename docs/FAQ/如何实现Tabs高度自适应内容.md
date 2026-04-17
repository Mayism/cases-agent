---
title: 如何实现Tabs高度自适应内容
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-475
category: FAQ
updated_at: 2026-03-13T04:23:17.424Z
---

# 如何实现Tabs高度自适应内容

可以给Tabs设置height('auto')。参考示例如下：

```typescript
@Entry
@Component
struct Index {
  build() {
    Column() {
      Tabs() {
        TabContent() {
          Row() {
            Text('hello')
          }
          .width('100%')
        }
      }
      .height('auto')
      .barBackgroundColor(Color.Orange)
      .barHeight(0)
    }
    .height('100%')
    .width('100%')
  }
}
```

[TabsHeightAdaptive.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/TabsHeightAdaptive.ets#L21-L42)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-475*