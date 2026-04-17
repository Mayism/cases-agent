---
title: rcp请求是否有数据大小限制
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-remote-communication-2
category: FAQ
updated_at: 2026-03-13T05:03:09.280Z
---

# rcp请求是否有数据大小限制

rcp请求默认情况下，[response](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp#section156381815599)响应中最大数据量为50MB，超过此限制建议通过[HttpEventsHandler](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp#section87603011401)的[onDataReceive](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp#section9264115918536)实现流式数据接收。

**参考链接**

[response](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp#section156381815599)

[HttpEventsHandler](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp#section87603011401)

[onDataReceive](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/remote-communication-rcp#section9264115918536)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-remote-communication-2*