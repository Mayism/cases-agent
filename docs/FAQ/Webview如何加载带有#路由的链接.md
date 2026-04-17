---
title: Webview如何加载带有#路由的链接
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-86
category: FAQ
updated_at: 2026-03-13T04:46:11.570Z
---

# Webview如何加载带有#路由的链接

Web组件的src使用'resource://rawfile/LoadWebLink.html#AAA'这种格式进行加载，具体可参考如下代码：

```typescript
import { webview } from '@kit.ArkWeb';
@Entry
@Component
struct LoadWebLink {
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    RelativeContainer() {
      Web({ src: 'resource://rawfile/LoadWebLink.html#AAA', controller: this.controller })
    }
    .height('100%')
    .width('100%')
  }
}
```

[RouteLink.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/RouteLink.ets#L21-L35)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-86*