---
title: HarmonyOS编译构建时如何指定编译架构信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-57
category: FAQ
updated_at: 2026-03-24T11:13:54.435Z
---

# HarmonyOS编译构建时如何指定编译架构信息

**问题现象**

webrtc gn里面通过binary\_prefix来区分不同架构下的编译工具。HarmonyOS系统如何设置target指定架构信息？

**解决措施**

HarmonyOS通过–target 来设置架构。--target aarch64-linux-ohos 和--target arm-linux-ohos 分别对应64位和32位的架构。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-57*