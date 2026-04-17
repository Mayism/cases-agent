---
title: 指标检测值无法点击拉起profiler
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-17
category: FAQ
updated_at: 2026-03-13T06:02:08.579Z
---

# 指标检测值无法点击拉起profiler

**问题现象**

报告详情页，指标检测值无法点击，如下图：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7a/v3/y-yzEw03QxCWWB9lYe_dkQ/zh-cn_image_0000002527522192.png?HW-CC-KV=V1&HW-CC-Date=20260313T060203Z&HW-CC-Expire=86400&HW-CC-Sign=1698B886DA5CCD6D47D1057F376F513804EF2E852372405FA2E46EBE0B78ABEE)

预期是可以点击指标检测值并拉起profiler，如下图：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7b/v3/RK6pSolgTeKpEaquidZwTw/zh-cn_image_0000002558681913.png?HW-CC-KV=V1&HW-CC-Date=20260313T060203Z&HW-CC-Expire=86400&HW-CC-Sign=EC47B5EBCE315458DFC758E627A1CE62B82388788775D395F1B0E3510C684176)

**问题原因**

体检卡片勾选冷启动场景，但在录制开始时未重启应用，导致堆栈抓取失败。

**解决措施**

1、建议冷启动场景，使用“手动性能冷启动体检”卡片进行检测。

2、如果是自定义卡片场景勾选“冷启动”场景，需要在录制开始时，强制重启应用，之后再进行体检。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-17*