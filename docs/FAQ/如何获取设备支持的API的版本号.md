---
title: 如何获取设备支持的API的版本号
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faq-basics-service-kit-17
category: FAQ
updated_at: 2026-03-13T05:06:00.907Z
---

# 如何获取设备支持的API的版本号

可以通过设备信息模块deviceInfo查询，常见的版本号获取方式如下：

-   系统软件API版本：deviceInfo.sdkApiVersion。
-   首个版本系统软件API版本：deviceInfo.firstApiVersion。
-   发行版系统API版本：deviceInfo.distributionOSApiVersion。

**参考链接**

[@ohos.deviceInfo (设备信息)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-device-info)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faq-basics-service-kit-17*