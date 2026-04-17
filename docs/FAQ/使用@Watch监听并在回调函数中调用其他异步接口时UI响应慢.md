---
title: 使用@Watch监听并在回调函数中调用其他异步接口时UI响应慢
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-185
category: FAQ
updated_at: 2026-03-13T03:54:42.775Z
---

# 使用@Watch监听并在回调函数中调用其他异步接口时UI响应慢

@Watch用于快速计算，在UI重新渲染之前执行。不建议在@Watch函数中调用async和await，因为异步行为会延迟组件的重新渲染，可能导致性能问题。

**参考链接**

[@Watch装饰器：状态变量更改通知](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-watch)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-185*