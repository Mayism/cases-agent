---
title: 如何解决子组件全屏后margin不会生效的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-32
category: FAQ
updated_at: 2026-03-13T03:41:57.800Z
---

# 如何解决子组件全屏后margin不会生效的问题

父组件全屏显示，子组件默认撑满。设置左右margin值后，子组件可能会超出屏幕范围。可以使用\`constraintSize\`属性限制子组件的最大宽高。参考代码如下：

```typescript
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .width('100%')
          .constraintSize({ maxWidth: '100%' })
          .backgroundColor(Color.Blue)
          .margin({ left: 50, right: 50 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[ResolveFullScreenNonEffectiveness.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ResolveFullScreenNonEffectiveness.ets#L21-L42)

**参考链接**

[尺寸设置](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-size)中的constraintSize

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-32*