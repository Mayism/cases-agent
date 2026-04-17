---
title: 安装VPN软件astrill后hdc访问不了设备
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-68
category: FAQ
updated_at: 2026-03-13T02:37:56.830Z
---

# 安装VPN软件astrill后hdc访问不了设备

**问题现象**

hdc访问不了设备。hdc list targets -v出现unknown状态。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/44/v3/xsMKp4EKQqSDyVr5XgHh6w/zh-cn_image_0000002474863621.png?HW-CC-KV=V1&HW-CC-Date=20260313T023752Z&HW-CC-Expire=86400&HW-CC-Sign=6684676D49B1E9AB815763B5DEA90779A68FCD85ACABD6A5AEC95CA19E1A7538)

查看hdc.log日志

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/toyJ3ZgoReuTFBYOR_rPHg/zh-cn_image_0000002474943789.png?HW-CC-KV=V1&HW-CC-Date=20260313T023752Z&HW-CC-Expire=86400&HW-CC-Sign=E14848E13176623C7D3D77AD88D73D705C3EFA1E1D1079ABF0FCB8C2B6CD97A7)

**可能原因**

系统兼容问题。在win10上安装vpn工具astrill后，会导致出现这样问题。

**解决措施**

-   当前版本hdc建议卸载掉vpn软件，注意不是停掉vpn，而是卸载vpn。
-   参考[hdc版本配套表](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hdc#hdc版本配套表)升级最新版本后重试。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-68*