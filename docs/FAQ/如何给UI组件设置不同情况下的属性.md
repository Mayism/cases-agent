---
title: 如何给UI组件设置不同情况下的属性
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-8
category: FAQ
updated_at: 2026-03-13T03:39:54.943Z
---

# 如何给UI组件设置不同情况下的属性

使用if/else条件渲染设置组件属性值。具体可参考示例代码：

```typescript
@Entry
@Component
struct TestHeightPage {
  @State message: string = 'Hello World';
  @State myHeight1: number = 30;
  @State myHeight2: number = 60;
  @State flag: boolean = false
  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height(this.flag ? this.myHeight1 : this.myHeight2)
        .backgroundColor(Color.Orange)
      Button('Modify Text attribute height').onClick(() => {
        this.flag = !this.flag;
      }).margin({ top: 12 })
    }
    .height('100%')
  }
}
```

[SetDifferentAttributes.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/SetDifferentAttributes.ets#L21-L45)

**参考链接**

[if/else：条件渲染](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-ifelse)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-8*