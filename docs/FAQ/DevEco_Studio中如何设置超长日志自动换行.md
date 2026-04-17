---
title: DevEco Studio中如何设置超长日志自动换行
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-15
category: FAQ
updated_at: 2026-03-13T05:24:28.626Z
---

# DevEco Studio中如何设置超长日志自动换行

启用Soft-Wrap功能以实现日志消息的自动换行。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/77/v3/Q883buidT5OF-jnTnfziRw/zh-cn_image_0000002194158840.png?HW-CC-KV=V1&HW-CC-Date=20260313T052422Z&HW-CC-Expire=86400&HW-CC-Sign=B5099C47F91CE96F3E1FD7872D47BF812A7D491EE95F97D9EB3F9952598D89E8 "点击放大")

日志单条打印的最大长度为4096个字符。建议在应用的日志框架中，对日志长度进行判断，若超过该长度则分段打印，以避免日志丢失。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-15*