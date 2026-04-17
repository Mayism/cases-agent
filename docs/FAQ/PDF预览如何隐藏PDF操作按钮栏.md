---
title: PDF预览如何隐藏PDF操作按钮栏
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-54
category: FAQ
updated_at: 2026-03-13T04:43:15.391Z
---

# PDF预览如何隐藏PDF操作按钮栏

**解决措施**

在URL中加入#toolbar=0&navpanes=0参数即可隐藏PDF操作栏按钮。

**参考代码**

```typescript
import { webview } from '@kit.ArkWeb';
@Entry
@Component
struct HidePDFToolbar {
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    Column() {
      // Hide the toolbar (toolbar=0) and navigation pane (navpanes=0) through URL parameters
      Web({ src: 'resource://rawfile/test.pdf#toolbar=0&navpanes=0', controller: this.controller })
        .domStorageAccess(true)
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
```

[HidePdf.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/HidePdf.ets#L21-L39)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-54*