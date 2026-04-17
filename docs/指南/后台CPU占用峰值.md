---
title: 后台CPU占用峰值
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-peak-background-cpu-usage-0420
category: 指南
updated_at: 2026-03-13T05:04:24.595Z
---

# 后台CPU占用峰值

## 规则详情

应用/元服务后台CPU占用峰值：应用/元服务切换到后台等待3min后，开始采集3min内CPU Load < 5%。

## 检测逻辑

1.  执行hdc shell。
2.  执行hidumper --cpuusage <进程pid>命令，获取总的cpu使用率。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/12/v3/R1u6gDPQS9a189TYoWfFWg/zh-cn_image_0000002501070154.png?HW-CC-KV=V1&HW-CC-Date=20260313T050345Z&HW-CC-Expire=86400&HW-CC-Sign=AE3FBFF8648435E0318D54C52434F994696031A747CA2460F69B9904AAE47C16)

## 计算逻辑

执行多轮测试，取最大值为cpu占用峰值，cpu占用率须小于5%。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-peak-background-cpu-usage-0420*