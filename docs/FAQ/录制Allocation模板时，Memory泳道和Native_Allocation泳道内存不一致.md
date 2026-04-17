---
title: 录制Allocation模板时，Memory泳道和Native Allocation泳道内存不一致
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-16
category: FAQ
updated_at: 2026-03-13T06:02:02.574Z
---

# 录制Allocation模板时，Memory泳道和Native Allocation泳道内存不一致

**问题现象**

录制Allocation模板时，Memory泳道和Native Allocation泳道内存不一致。

**可能原因**

Memory泳道内是所选择应用的实际物理内存占用（Proportional Set Size, PSS），Native Allocation泳道展示的是应用在运行过程中动态向操作系统申请的虚拟内存，并不代表实际物理内存占用。

**解决措施**

开始录制前，单击工具控制栏中的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9/v3/qJqRoQTgRJWuSok5NvT1xQ/zh-cn_image_0000002513253146.png?HW-CC-KV=V1&HW-CC-Date=20260313T060157Z&HW-CC-Expire=86400&HW-CC-Sign=4595A81BA1C229763FB67D0A1E19125654A57CDD5EBEB958A82B2EE23E70B323)按钮，设置最小跟踪内存（Native Allocation Filter Size）为0或极小值，以采集更多甚至全量的虚拟内存分配事件，让Native Allocation泳道与Memory泳道的数据变化量接近。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/71/v3/7i5bphchQ8mSULaQBHlhBA/zh-cn_image_0000002544733119.png?HW-CC-KV=V1&HW-CC-Date=20260313T060157Z&HW-CC-Expire=86400&HW-CC-Sign=A9DABA75875641B3B8943196D67326AC269E34383722452182F2A2AD03D2734B "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-16*