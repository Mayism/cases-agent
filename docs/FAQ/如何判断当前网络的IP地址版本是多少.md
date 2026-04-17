---
title: 如何判断当前网络的IP地址版本是多少
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-71
category: FAQ
updated_at: 2026-03-13T05:01:26.780Z
---

# 如何判断当前网络的IP地址版本是多少

使用[NetAddress](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-net-connection#netaddress)类获取当前网络的地址信息，NetAddress类的family属性用于指定IP地址的版本，family属性的值为1表示IPv4，为2表示IPv6 。

示例代码如下：

```typescript
import { connection } from '@kit.NetworkKit';
@Entry
@Component
struct Index {
  getNetworkFamily() {
    try {
      let netHandle = connection.getDefaultNetSync();
      let connectionProperties = connection.getConnectionPropertiesSync(netHandle);
      if (connectionProperties !== undefined) {
        let linkAddressesArray = connectionProperties.linkAddresses;
        if (linkAddressesArray !== undefined && linkAddressesArray instanceof Array && linkAddressesArray.length > 0) {
          for (let i = 0; i < linkAddressesArray.length; i++) {
            let address: connection.NetAddress = linkAddressesArray[i].address;
            if (address !== undefined) {
              console.info("Succeeded to get address: " + JSON.stringify(address))
              if (address.family === 1) {
                console.info('Current network IP address version is ipv4')
              } else if (address.family === 2) {
                console.info('Current network IP address version is ipv6')
              }
            }
          }
        }
      }
    } catch (e) {
      console.error(`Get exception: ${e}`);
    }
  }
  build() {
    Column({ space: 10 }) {
      Button('获取当前网络IP地址版本')
        .onClick(() => {
          this.getNetworkFamily();
        })
    }
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}
```

[GetNetworkFamily](https://gitcode.com/harmonyos_samples/faqsnippets/blob/9599520cea2cd471e1e3ed244c5fc384697af3e6/NetworkKit/entry/src/main/ets/pages/GetNetworkFamily#L21-L62)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-71*