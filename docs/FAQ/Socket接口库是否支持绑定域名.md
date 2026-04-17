---
title: Socket接口库是否支持绑定域名
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-23
category: FAQ
updated_at: 2026-03-13T04:57:08.958Z
---

# Socket接口库是否支持绑定域名

Socket不支持域名访问，只能使用IP地址。域名需要通过DNS解析为对应的IP地址。

参考代码如下：

```typescript
import { connection } from '@kit.NetworkKit'
import { BusinessError } from "@kit.BasicServicesKit"
connection.getAddressesByName("xxxx", (error: BusinessError, data: connection.NetAddress[]) => {
  console.log(JSON.stringify(error));
  console.log(JSON.stringify(data));
})
```

[AddressesByName.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/NetworkKit/entry/src/main/ets/pages/AddressesByName.ets#L21-L27)

**参考链接**

[connection.getAddressesByName](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-net-connection#connectiongetaddressesbyname)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-23*