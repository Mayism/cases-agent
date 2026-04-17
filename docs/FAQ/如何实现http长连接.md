---
title: 如何实现http长连接
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-48
category: FAQ
updated_at: 2026-03-13T04:59:35.344Z
---

# 如何实现http长连接

可使用定时HTTP请求模拟长连接。参考代码如下：

```typescript
import { http } from '@kit.NetworkKit';
let httpRequest = http.createHttp();
// 设置5秒轮询一次
setTimeout(() => {
  httpRequest.request("EXAMPLE\_URL", {
    method: http.RequestMethod.GET,
    connectTimeout: 60000,
    readTimeout: 60000
  }, (err, data) => {
    if (!err) {
      console.info('Received data:', JSON.stringify(data.result));
    } else {
      console.info('Polling error:', JSON.stringify(err));
    }
  })
}, 5000)
```

[SetLongConnect.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/NetworkKit/entry/src/main/ets/pages/SetLongConnect.ets#L21-L37)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-48*