---
title: 如何在Web请求时添加header头
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-37
category: FAQ
updated_at: 2026-03-13T04:41:26.199Z
---

# 如何在Web请求时添加header头

可以通过loadUrl方法设置headers。该方法接收两个参数：url表示需要加载的URL，headers为数组类型表示附加的HTTP请求头。

```typescript
// With parameter headers
this.controller.loadUrl('www.example.com', [{ headerKey: "headerKey", headerValue: "headerValue" }]);
```

[AddHeader.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/AddHeader.ets#L34-L35)

**参考链接**

[loadUrl](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-webview-webviewcontroller#loadurl)

[WebHeader](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-webview-i#webheader)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-37*