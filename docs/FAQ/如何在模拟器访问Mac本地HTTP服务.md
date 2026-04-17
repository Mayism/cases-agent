---
title: 如何在模拟器访问Mac本地HTTP服务
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-15
category: FAQ
updated_at: 2026-03-13T05:51:32.302Z
---

# 如何在模拟器访问Mac本地HTTP服务

可以通过hdc shell ip -r查看映射到PC的IP地址，该地址为 10.0.2.2。

在请求HTTP的URL中，将IP地址替换为10.0.2.2。例如，Mac上的HTTP URL为http://127.0.0.1:8088/api/userinfo，替换后的URL为http://10.0.2.2:8088/api/userinfo。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-15*