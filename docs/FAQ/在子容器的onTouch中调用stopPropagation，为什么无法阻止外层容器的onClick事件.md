---
title: 在子容器的onTouch中调用stopPropagation，为什么无法阻止外层容器的onClick事件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-471
category: FAQ
updated_at: 2026-03-13T04:22:52.239Z
---

# 在子容器的onTouch中调用stopPropagation，为什么无法阻止外层容器的onClick事件

在onTouch事件回调中调用stopPropagation只会影响触摸事件的冒泡传递，无法阻止点击事件的触发。在下面Demo中，子组件调用stopPropagation只会阻止父组件响应onTouch事件，无法阻止onClick事件的触发。

```typescript
// xxx.ets
@Entry
@Component
struct TouchExample {
  @State text: string = '';
  build() {
    Column() {
      Button('Touch')
        .height(40)
        .width(100)
        .onTouch((event?: TouchEvent) => {
          console.info("child onTouch");
          event?.stopPropagation();
        })
      // Used to display the event trigger status
      Text(this.text)
    }
    .onTouch((event?: TouchEvent) => {
      // Since the child component called the stopPropagation interface, the onTouch event of the parent component cannot be triggered
      console.info("father onTouch");
    })
    .onClick(() => {
      // The child component called the stopPropagation interface but was unable to prevent the onClick event from being triggered. The parent component's onClick event was triggered as expected
      console.info("father onClick");
    })
    .width('100%')
    .padding(30)
  }
}
```

[TouchExample.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/TouchExample.ets#L21-L51)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-471*