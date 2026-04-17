---
title: 如何处理OMG离线模型输出算子类型错误？
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-faqs-4
category: 指南
updated_at: 2026-03-13T03:19:41.557Z
---

# 如何处理OMG离线模型输出算子类型错误？

Caffe网络中具有相同类型名但计算功能不同的层。比如DetectionOutput层，需要使用算子映射指明为FSRDetectionOutput、SSDDetectionOutput等检测算子类型，否则OMG生成离线模型会执行失败。为了避免出现错误，以下两种方案二选一即可。

-   方案1：可以在OMG命令中加入--op\_name\_map参数，参考[OMG参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-overall-parameter)中op\_name\_map参数设置。
-   方案2：可以在原始网络proto模型文件中将输出算子类型指定为SSDDetectionOutput等算子类型，如下图所示。

**图1** 输出算子类型修改前（左）和修改后（右）  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5f/v3/hmN2XS_7TeKcsoOAsGwTvQ/zh-cn_image_0000002528408567.png?HW-CC-KV=V1&HW-CC-Date=20260313T031900Z&HW-CC-Expire=86400&HW-CC-Sign=D88F970FE87462387F3D4D16745A8B254EE08B81B0FE3B2B7A47C8D22D12CAFB "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-faqs-4*