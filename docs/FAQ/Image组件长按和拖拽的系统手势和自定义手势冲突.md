---
title: Image组件长按和拖拽的系统手势和自定义手势冲突
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-365
category: FAQ
updated_at: 2026-03-13T04:11:16.886Z
---

# Image组件长按和拖拽的系统手势和自定义手势冲突

开发者可根据业务逻辑，使用parallelGesture或者priorityGesture绑定，解决自定义手势与系统手势之间的冲突。

系统默认手势效果保留，自定义的LongPressGesture和panGesture手势也能响应，使用parallelGesture绑定。

**参考代码****：**

```typescript
@Entry
@Component
struct Index {
  build() {
    Column() {
      Image($r('app.media.app_icon'))
        .width('80%')
        .parallelGesture(GestureGroup(GestureMode.Exclusive,
          TapGesture({ count: 2, fingers: 1 })
          // Double click
            .onAction(() => {
              console.log('TapGesture--double click');
            }),
          TapGesture({ count: 1, fingers: 1 })
          // TapGesture single
            .onAction(() => {
              console.log('TapGesture--single click');
            }),
          LongPressGesture({ repeat: true })
          // LongPressGesture Long
            .onAction(() => {
              console.log('LongPressGesture--Long press');
            }),
          PanGesture()
          // PanGesture drag
            .onActionStart((gestureEvent: GestureEvent | undefined) => {
              console.info('PanGesture--drag');
            })
        ))
    }
    .height('100%')
    .width('100%')
  }
}
```

[ImageComponentGestureConflict.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ImageComponentGestureConflict.ets#L21-L55)

**参考链接**

[绑定手势方法](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-gesture-events-binding)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-365*