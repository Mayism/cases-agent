---
title: RichEditor组件如何设置光标的起始位置位于左上角
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-14
category: FAQ
updated_at: 2026-03-13T03:40:10.362Z
---

# RichEditor组件如何设置光标的起始位置位于左上角

可以通过align属性传入参数Alignment.TopStart，来设置光标位置位于左上角。示例代码如下：

```typescript
// xxx.ets
@Entry
@Component
struct RichEditorExample {
  controller: RichEditorController = new RichEditorController();
  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .align(Alignment.TopStart) // Set the starting position of the cursor to the upper left corner
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
    }
  }
}
```

[SetStartingPositionOfTheCursor.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/SetStartingPositionOfTheCursor.ets#L21-L37)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-14*