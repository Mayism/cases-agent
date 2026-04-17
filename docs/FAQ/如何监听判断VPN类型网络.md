---
title: 如何监听判断VPN类型网络
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-67
category: FAQ
updated_at: 2026-03-13T05:01:13.072Z
---

# 如何监听判断VPN类型网络

VPN类型可使用getNetCapabilities方法获取到bearerTypes，当[bearerTypes](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-net-connection#netbeartype)的值是4时表示使用了VPN。需要权限：ohos.permission.INTERNET、ohos.permission.GET\_NETWORK\_INFO。

参考代码如下：

```typescript
import { connection } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
export struct JudeNetType {
  getNetType() {
    connection.getAllNets((error: BusinessError, allNets: connection.NetHandle[]) => {
      if (error) {
        console.error(`Failed to get getAllNets. Code: ${error.code}, message: ${error.message}`);
        return;
      }
      for (let netHandle of allNets) {
        connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
          if (error) {
            console.error(`Failed to get capabilities. Code: ${error.code}, message: ${error.message}`);
            return;
          }
          if (data.bearerTypes[0] == connection.NetBearType.BEARER_VPN) {
            console.info('The VPN network is connected');
          }
        })
      }
    });
  }
  build() {
    Column({ space: 10 }) {
      Button('Obtain the type of network connection').onClick(() => {
        this.getNetType()
      })
    }.alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}
```

[OnNetVpn.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/NetworkKit/entry/src/main/ets/pages/OnNetVpn.ets#L21-L57)

参考文档：[网络连接管理](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-net-connection#netbeartype)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-network-67*