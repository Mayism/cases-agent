---
title: 如何扫描Wi-Fi列表
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-connectivity-2
category: FAQ
updated_at: 2026-03-13T05:03:26.995Z
---

# 如何扫描Wi-Fi列表

使用wifiManager.getScanInfoList方法获取扫描Wi-Fi结果，需要权限：ohos.permission.GET\_WIFI\_INFO。参考代码如下：

```typescript
import { wifiManager } from '@kit.ConnectivityKit';
try {
  let scanInfoList = wifiManager.getScanInfoList();
  console.info('scanInfoList:' + JSON.stringify(scanInfoList));
  let len = scanInfoList.length;
  console.log('wifi received scan info: ' + len);
  if (len > 0) {
    for (let i = 0; i < len; ++i) {
      console.info('ssid: ' + scanInfoList[i].ssid);
      console.info('bssid: ' + scanInfoList[i].bssid);
      console.info('capabilities: ' + scanInfoList[i].capabilities);
      console.info('securityType: ' + scanInfoList[i].securityType);
      console.info('rssi: ' + scanInfoList[i].rssi);
      console.info('band: ' + scanInfoList[i].band);
      console.info('frequency: ' + scanInfoList[i].frequency);
      console.info('channelWidth: ' + scanInfoList[i].channelWidth);
      console.info('timestamp: ' + scanInfoList[i].timestamp);
    }
  }
} catch (error) {
  console.error('failed:' + JSON.stringify(error));
}
```

[ScanWifiList.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ConnectivityKit/entry/src/main/ets/pages/ScanWifiList.ets#L21-L44)

**参考链接**

[wifiManager.getScanInfoList](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-wifimanager#wifimanagergetscaninfolist10)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-connectivity-2*