---
title: 三方应用如何获取蓝牙mac地址
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-connectivity-1
category: FAQ
updated_at: 2026-03-13T05:03:20.991Z
---

# 三方应用如何获取蓝牙mac地址

调用connection.startBluetoothDiscovery()接口，使用蓝牙扫描功能，在扫描结果中即可获取蓝牙mac地址。需要权限：ohos.permission.ACCESS\_BLUETOOTH。参考代码如下：

```javascript
import { connection } from '@kit.ConnectivityKit';
import { BusinessError } from '@kit.BasicServicesKit';
function onReceiveEvent(data: Array<string>) { // data is a collection of Bluetooth device addresses
  console.info('bluetooth device find = '+ JSON.stringify(data));
}
try {
  connection.on('bluetoothDeviceFind', onReceiveEvent);
  connection.startBluetoothDiscovery();
} catch (err) {
  console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
}
```

[GetBtMac.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ConnectivityKit/entry/src/main/ets/pages/GetBtMac.ets#L21-L34)

**参考链接**

[发现蓝牙设备](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-bluetooth-connection#connectiononbluetoothdevicefind)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-connectivity-1*