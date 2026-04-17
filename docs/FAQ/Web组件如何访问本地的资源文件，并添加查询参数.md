---
title: Web组件如何访问本地的资源文件，并添加查询参数
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-39
category: FAQ
updated_at: 2026-03-13T04:41:40.080Z
---

# Web组件如何访问本地的资源文件，并添加查询参数

本地资源文件应存放在模块的“src/main/resources/rawfile”文件夹下，可通过 $rawfile('文件名') 访问。

目前不支持直接添加查询参数。但可以通过Web组件加载HTML文件，使用\`window.location.href\`跳转到带有参数的本地HTML页面。具体示例代码请参考文档。

```typescript
import { webview } from '@kit.ArkWeb';
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
    }
  }
}
```

[GetRawfileHtml.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/ets/pages/GetRawfileHtml.ets#L21-L34)

在“src\\\\main\\\\resources\\\\rawfile”文件夹下创建index.html和details.html文件。

index.html：

```xml
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript"> window.onload = function() { window.location.href = "details.html"; }
    </script>
</head>
<body></body>
</html>
```

[index.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/index.html#L7-L14)

details.html：

```xml
<!DOCTYPE html>
<html>
<head><title>详情页</title></head>
<body><h1>欢迎来到详情页！</h1>
<p>您已成功从首页跳转到此页，并在URL中添加了参数。</p></body>
</html>
```

[details.html](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkWebKit/entry/src/main/resources/rawfile/details.html#L8-L13)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkweb-39*