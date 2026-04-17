---
title: 如何获取设备的CPU信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-22
category: FAQ
updated_at: 2026-03-13T02:33:32.333Z
---

# 如何获取设备的CPU信息

可以通过以下命令来查看CPU信息：

```csharp
// 查看CPU信息
hdc shell param get const.product.cpu.abilist
```

返回结果如下图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6b/v3/kpfWHUDqT7y6nFq_QdftSg/zh-cn_image_0000002229758737.png?HW-CC-KV=V1&HW-CC-Date=20260313T023326Z&HW-CC-Expire=86400&HW-CC-Sign=04CC3B52877CA0B64356E81F90BDE91A26FF7726EECD08F9A5B0805373B121D1 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-22*