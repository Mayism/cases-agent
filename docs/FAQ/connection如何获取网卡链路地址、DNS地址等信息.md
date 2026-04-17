---
title: connection如何获取网卡链路地址、DNS地址等信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-70
category: FAQ
updated_at: 2026-03-13T05:01:19.111Z
---

# connection如何获取网卡链路地址、DNS地址等信息

使用[connection.getConnectionProperties](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-net-connection#connectiongetconnectionproperties)获取netHandle对应网络的连接信息，包括网卡链路地址和DNS地址。需要权限：ohos.permission.INTERNET、ohos.permission.GET\_NETWORK\_INFO。参考代码如下：

```typescript
import { connection } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct GetConnectionProperties {
  getConnectionProperties() {
    connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
      connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
        if (error) {
          console.error(`Failed to get connection properties. Code:${error.code}, message:${error.message}`);
          return;
        }
        console.info('Succeeded to get data: ' + JSON.stringify(data));
      })
    });
  }
  build() {
    Column({ space: 10 }) {
      Button('获取对应的网络连接信息')
        .onClick(() => {
          this.getConnectionProperties();
        })
    }
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}
```

[GetDns.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/NetworkKit/entry/src/main/ets/pages/GetDns.ets#L21-L50)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-70*