---
title: macOS上活动监视器中显示模拟器内存偏高
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-23
category: FAQ
updated_at: 2026-03-13T05:52:37.024Z
---

# macOS上活动监视器中显示模拟器内存偏高

配置模拟器内存为4GB并使用一段时间后，在活动监视器中可能发现模拟器进程占用的内存超过6GB（如下图所示）。请注意，图中的6.49GB不代表模拟器进程实际使用的物理内存（即Dirty内存），而是指其占用的phys\_footprint内存。在Mac系统中，针对虚拟化平台（如模拟器），phys\_footprint内存通常远高于Dirty内存。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/1FbnYxQbSGuzs_vA6_nbOg/zh-cn_image_0000002229758733.png?HW-CC-KV=V1&HW-CC-Date=20260313T055231Z&HW-CC-Expire=86400&HW-CC-Sign=6B53E3BE6C476D38CC9C99CA62D9A49804A1C94893F020D9F525214159431488 "点击放大")

想要查看模拟器的Dirty内存，首先打开活动监视器，查看Emulator的进程号（PID）。然后通过 \`footprint -vmObjectDirty 进程号\` 命令可以查看Dirty内存大小。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-23*