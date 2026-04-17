---
title: 设备连接Wi-Fi后，如何获取当前设备的IP地址
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-connectivity-4
category: FAQ
updated_at: 2026-03-13T05:03:41.893Z
---

# 设备连接Wi-Fi后，如何获取当前设备的IP地址

使用wifiManager模块获取ipInfo，然后转换为IP常用格式，注意wifiManager.getIpInfo()接口需要权限ohos.permission.GET\_WIFI\_INFO。

参考代码如下：

```typescript
import { wifiManager } from '@kit.ConnectivityKit';
let ipAddress = wifiManager.getIpInfo().ipAddress;
let ip = (ipAddress >>> 24) + "." + (ipAddress >> 16 & 0xFF) + "." + (ipAddress >> 8 & 0xFF) + "." + (ipAddress & 0xFF);
```

[GetIpInfo.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ConnectivityKit/entry/src/main/ets/pages/GetIpInfo.ets#L21-L25)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-connectivity-4*