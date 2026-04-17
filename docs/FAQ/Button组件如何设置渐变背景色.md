---
title: Button组件如何设置渐变背景色
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-103
category: FAQ
updated_at: 2026-03-13T03:46:57.989Z
---

# Button组件如何设置渐变背景色

将Button的默认背景色设置为全透明，以确保渐变颜色正常显示。参考代码如下：

```typescript
@Entry
@Component
struct Index {
  build() {
    Button('test')
      .width(200)
      .height(50)
      .backgroundColor('#00000000')
      .linearGradient({
        angle: 90,
        colors: [[0xff0000, 0.0], [0x0000ff, 0.3], [0xffff00, 1.0]]
      })
  }
}
```

[ButtonSetGradientBackgroundColor.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ButtonSetGradientBackgroundColor.ets#L21-L34)

**参考链接**

[Button](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-103*