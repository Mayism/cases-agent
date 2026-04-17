---
title: WebView如何设置mixcontent策略，用以解决http与https混合加载的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-67
category: FAQ
updated_at: 2026-03-13T04:44:18.883Z
---

# WebView如何设置mixcontent策略，用以解决http与https混合加载的问题

ArkWeb提供mixedMode(mixedMode: MixedMode)接口，用于设置是否允许加载HTTP和HTTPS混合内容。默认情况下，不允许加载混合内容。

在工程的module.json5配置文件中添加网络访问权限ohos.permission.INTERNET。

参考代码如下：

```typescript
// xxx.ets
import { webview } from '@kit.ArkWeb';
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  // MixedMode.All indicates that all mixed content is allowed to be loaded (HTTP/HTTPS)
  @State mixedMode: MixedMode = MixedMode.All;
  build() {
    Column() {
      Web({ src: 'www.example.com', controller: this.controller })
        .mixedMode(this.mixedMode)
    }
  }
}
```

[MixContent.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/MixContent.ets#L21-L36)

**参考链接**

[mixedMode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-basic-components-web-attributes#mixedmode)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-67*