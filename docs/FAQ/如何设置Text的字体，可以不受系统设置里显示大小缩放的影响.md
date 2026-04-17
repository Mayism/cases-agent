---
title: 如何设置Text的字体，可以不受系统设置里显示大小缩放的影响
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-248
category: FAQ
updated_at: 2026-03-13T04:00:43.593Z
---

# 如何设置Text的字体，可以不受系统设置里显示大小缩放的影响

目前，px2fp()和px2vp()等方法在修改系统显示大小后不会实时更新。字体的默认单位是 fp，界面像素单位是 px，可以使用像素单位来设置字体大小。参考如下：

```less
@Entry
@Component
struct CustomFontSetting {
  @State message: string = 'hello world';
  build() {
    Column() {
      Text(this.message)
        .fontSize(53) // Default unit is fp, which changes with system display size.
      Text(this.message)
        .fontSize(this.getUIContext().fp2px(160) + 'px') // Use pixel units, unaffected by system display size.
      Blank()
        .color(0xff0000)
        .height(30)
        .width(226)
        .margin({ bottom: 20 }) // Default unit vp changes with system display size.
      Blank()
        .color(0xff0000)
        .height(30 + 'px')
        .width(this.getUIContext().vp2px(672) + 'px') // Use pixel units, unaffected by system display size.
    }
  }
}
```

[FontSetting.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/FontSetting.ets#L21-L44)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-248*