---
title: Stack布局设置Alignment.Bottom没有生效
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-160
category: FAQ
updated_at: 2026-03-13T03:52:00.504Z
---

# Stack布局设置Alignment.Bottom没有生效

**问题现象**

在build()中使用Stack作为容器，设置alignContent为Alignment.Bottom，同时设置align为Alignment.Center。但alignContent为Alignment.Bottom未生效。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/51/v3/D3LnBR3IT4Sh8WDJ90DBfQ/zh-cn_image_0000002229604149.png?HW-CC-KV=V1&HW-CC-Date=20260313T035153Z&HW-CC-Expire=86400&HW-CC-Sign=54EB4486B58E7F78B8E55F152D844194D6EA219B82FC7504013537DE318B2CB3)

**解决措施**

由于Stack布局默认采用单一对齐策略，当同时设置alignContent与align属性时，后设置的值将生效。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-160*