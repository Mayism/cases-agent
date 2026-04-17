---
title: ArkTS是否支持类似Java的共享内存模型进行多线程开发
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-37
category: FAQ
updated_at: 2026-03-13T03:13:05.247Z
---

# ArkTS是否支持类似Java的共享内存模型进行多线程开发

无法通过加锁的方式实现多个线程同时对同一个内存对象进行操作。

ArkTS采用Actor并发模型，线程间内存隔离，目前仅支持SharedArrayBuffer和Native层对象的共享。

**参考链接**

[多线程并发概述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/multi-thread-concurrency-overview)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-37*