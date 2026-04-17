---
title: DevEco Studio上使用ArcList组件时编辑器提示“The default system capabilities of devices wearable do not include SystemCapability.ArkUI.ArkUI.Circle”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-coding-18
category: FAQ
updated_at: 2026-03-13T05:28:43.885Z
---

# DevEco Studio上使用ArcList组件时编辑器提示“The default system capabilities of devices wearable do not include SystemCapability.ArkUI.ArkUI.Circle”

**问题现象**

使用ArcList组件时，编辑器报错，错误信息如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4f/v3/3tS8tukhS1i9H8W8L4B4_Q/zh-cn_image_0000002459313966.png?HW-CC-KV=V1&HW-CC-Date=20260313T052837Z&HW-CC-Expire=86400&HW-CC-Sign=6020C77731249538500F9D9661CB4DD4C0F9D8F7B40A161EC3C75BF20042FD4C)

**解决措施**

1.  请前往[下载中心](https://developer.huawei.com/consumer/cn/download/)将DevEco Studio更新至6.0.1 Release及以上版本。
2.  若仍需使用当前版本，可在src/main目录下添加syscap.json配置文件。可参考[SysCap开发指导](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/syscap#syscap开发指导)。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/78/v3/fNa8iJibT6CgMCiOQpCUeQ/zh-cn_image_0000002460277990.png?HW-CC-KV=V1&HW-CC-Date=20260313T052837Z&HW-CC-Expire=86400&HW-CC-Sign=81560BF1712F3AA5F53537E3827A73E602EB3C5EAB7E6CAFC2D655FD8793D881)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-coding-18*