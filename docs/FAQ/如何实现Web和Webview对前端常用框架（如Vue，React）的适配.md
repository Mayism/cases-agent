---
title: 如何实现Web和Webview对前端常用框架（如Vue，React）的适配
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-35
category: FAQ
updated_at: 2026-03-13T04:41:19.934Z
---

# 如何实现Web和Webview对前端常用框架（如Vue，React）的适配

以Vue工程为例，使用runJavaScript API和javaScriptProxy API实现与Vue工程的交互。

-   runJavaScript API异步执行JavaScript脚本并返回结果。
-   javaScriptProxy API注入JavaScript对象到window对象并调用方法。
-   可以将Vue中的方法绑定到document对象上，实现Vue与JavaScript脚本的交互。

**参考链接**

[runJavaScript](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-webview-webviewcontroller#runjavascript)

[javaScriptProxy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-basic-components-web-attributes#javascriptproxy)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-35*