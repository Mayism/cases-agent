---
title: 如何修改bindPopup绑定的弹窗圆角大小和箭头颜色
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-349
category: FAQ
updated_at: 2026-03-13T04:09:42.561Z
---

# 如何修改bindPopup绑定的弹窗圆角大小和箭头颜色

通过radius参数调整圆角大小，但箭头颜色需通过popupColor间接设置。示例代码如下：

```typescript
@Entry
@Component
struct BindPopupDemo {
  @State handlePopup: boolean = false;
  @State customPopup: boolean = false;
  // Popup constructor defines the content of the popup box
  @Builder
  popupBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.startIcon'))
        .width(24)
        .height(24)
        .margin({ left: -5 })
      Text('Custom Popup')
        .fontSize(10)
    }
    .width(100)
    .height(50)
    .padding(5)
  }
  build() {
    RelativeContainer() {
      Button('CustomPopupOptions')
        .onClick(() => {
          this.customPopup = !this.customPopup;
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          radius: 30,
          popupColor: Color.Yellow,
          enableArrow: true,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        })
    }
  }
}
```

[ModifyTheCornerSizeAndArrowColorOfBindPopup.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ModifyTheCornerSizeAndArrowColorOfBindPopup.ets#L21-L64)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-349*