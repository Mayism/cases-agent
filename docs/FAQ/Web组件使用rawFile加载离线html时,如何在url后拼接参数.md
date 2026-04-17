---
title: Web组件使用rawFile加载离线html时,如何在url后拼接参数
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-45
category: FAQ
updated_at: 2026-03-13T04:41:58.933Z
---

# Web组件使用rawFile加载离线html时,如何在url后拼接参数

使用Web组件加载时，可直接在URL中拼接参数。加载后，H5侧获取并使用这些参数。

**参考代码**

通过Web组件使用rawFile加载离线HTML，URL中包含参数。

```typescript
import { webview } from '@kit.ArkWeb'
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController()
  build() {
    Column() {
      Web({ src: 'resource://rawfile/LoadingURLTransferParameters.html?key=value', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
    .width('100%')
    .height('100%')
  }
}
```

[UrlAdd.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/UrlAdd.ets#L21-L37)

H5侧通过以下方式获取URL中的参数并使用。

```
<!DOCTYPE html>
<html>
<head>
    <title>Parameter-based HTML</title>
</head>
<body>
<h1>Welcome!</h1>
<h1 id="params"></h1>
<script>
    function getParams() {
        var params = {};
        window.location.search.substring(1).split('&').forEach(function(param) {
            var pair = param.split('=');
            params\[pair\[0\]\] = decodeURIComponent(pair\[1\]);
        });
        return params;
    }
    document.getElementById('params').innerHTML = JSON.stringify(getParams());
</script>
</body>
</html>
```

[LoadingURLTransferParameters.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/LoadingURLTransferParameters.html#L7-L28)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-45*