---
title: Subpass Shading
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/xengine-kit-subpass-shading
category: 指南
updated_at: 2026-03-12T19:54:16.042Z
---

# Subpass Shading

随着游戏场景的复杂化，越来越多的光照效果被应用到游戏场景中，随之也带来大量的光照计算以及带宽消耗。目前通过Tile-Based Deferred Rendering（TBDR）和Forward+等方法可以解决大量光照的渲染时间消耗，但是大量带宽的占用问题还是没有解决，Subpass Shading能力主要减少计算过程中的读写从而减少带宽的占用。

下图说明Subpass Shading节省渲染通道1和Compute Pass从Device memory上面的一次读写带宽。

**图1** Forward+读取过程

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3a/v3/0yVD-bDjTOKtmzwpmEfNyw/zh-cn_image_0000002498060740.png?HW-CC-KV=V1&HW-CC-Date=20260312T195334Z&HW-CC-Expire=86400&HW-CC-Sign=C9617A10FCA8F5ED3002FAC4CE7F5A93BDEF16BA441792620E17BACFE291ABE5 "点击放大")

**图2** Subpass Shading读取过程

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3f/v3/RBXs3TwhREW-HIKdWpoxZw/zh-cn_image_0000002529808459.png?HW-CC-KV=V1&HW-CC-Date=20260312T195334Z&HW-CC-Expire=86400&HW-CC-Sign=A1BA0FBA1148BAC93426B168052E0DC4C7EC8D974D6C91F7FB89E0FF6E92FA0A "点击放大")

## 约束与限制

支持的设备类型：Phone，从5.0.2(14)版本开始，新增支持Tablet、PC/2in1设备，从5.1.0(18)版本开始新增支持TV设备。

## 接口说明

通过Vulkan扩展接口[VK\_HUAWEI\_subpass\_shading](https://registry.khronos.org/vulkan/specs/latest/man/html/VK_HUAWEI_subpass_shading.html)提供Subpass Shading API，该扩展支持在Subpass中使用Compute Shader，并在Compute Shader中使用SubpassLoad从Tile buffer中直接读取数据，可用于降低DDR带宽，适用于TBDR和Forward+管线。

Subpass Shading能力具体使用请参见[Demo（GPU加速引擎-Subpass Shading）](https://gitcode.com/harmonyos_samples/xengine-samplecode-subpass-shading-demo-cpp)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/xengine-kit-subpass-shading*