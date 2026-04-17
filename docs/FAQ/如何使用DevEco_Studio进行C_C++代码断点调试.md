---
title: 如何使用DevEco Studio进行C/C++代码断点调试
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-26
category: FAQ
updated_at: 2026-03-13T05:57:34.200Z
---

# 如何使用DevEco Studio进行C/C++代码断点调试

**问题现象**

在DevEco Studio上的C/C++代码处打断点，调试运行时断点不生效。

**可能原因**

DevEco Studio进行ArkTS/JS + Native混合调试时需要配置DevEco Studio的调试模式。

**解决措施**

选择配置项：Run/Debug Configurations > Debugger > Dual(ArkTS/JS + Native)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3d/v3/ena3wftORh-pHVBkG2hWyg/zh-cn_image_0000002229604041.png?HW-CC-KV=V1&HW-CC-Date=20260313T055729Z&HW-CC-Expire=86400&HW-CC-Sign=19A2F2CC92B32876D8C463454C6A2F28B75F529A7ABC709E816349B87005418B "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-26*