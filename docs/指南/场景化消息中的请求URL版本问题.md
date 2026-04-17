---
title: 场景化消息中的请求URL版本问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/push-faq-8
category: 指南
updated_at: 2026-03-13T00:53:45.248Z
---

# 场景化消息中的请求URL版本问题

场景化消息[请求体结构](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/push-scenariozed-api-request-struct)中，请求URL版本为V3（https://push-api.cloud.huawei.com/v3/\[projectId\]/messages:send）时，仅支持给HarmonyOS Next/5.x及之后的系统版本推送通知；版本为V2（https://push-api.cloud.huawei.com/v2/\[projectId\]/messages:send）时，仅支持给HarmonyOS 3.x/4.x的系统版本推送通知。

**请使用V3版本**的请求URL（https://push-api.cloud.huawei.com/v3/\[projectId\]/messages:send）进行消息推送。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/push-faq-8*