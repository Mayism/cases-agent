---
title: 如何控制只在Web组件第一次加载url的时候触发onPageBegin，onPageEnd
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-34
category: FAQ
updated_at: 2026-03-13T04:41:14.005Z
---

# 如何控制只在Web组件第一次加载url的时候触发onPageBegin，onPageEnd

使用onAppear事件控制仅在首次加载URL时触发onPageBegin和onPageEnd，参考代码如下：

```typescript
import { webview } from '@kit.ArkWeb';
@Entry
@Component
struct OnlyOnTheFirstTrigger {
  controller: webview.WebviewController = new webview.WebviewController();
  isFirst: boolean = false;
  build() {
    Column() {
      Web({
        src: 'www.example.com', controller: this.controller
      })
        .onAppear(() => {
          this.isFirst = true;
        })
        .onPageBegin(() => {
          if (this.isFirst) {
            this.isFirst = false;
            console.info('First page loading triggered');
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
```

[OnlyOnTheFirstTrigger.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/OnlyOnTheFirstTrigger.ets#L21-L47)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-34*