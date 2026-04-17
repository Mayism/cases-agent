---
title: AI框架算子适配概述
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-overview-of-ai-framework-operator
category: 指南
updated_at: 2026-03-13T01:37:53.057Z
---

# AI框架算子适配概述

本章节内容介绍AI框架调用自定义算子的方法。如下图所示，PyTorch和TensorFlow仅支持图模式。

AI框架调用时，除了需要提供DDK框架调用时需要的代码实现文件，还需要对插件进行适配开发。下文仅展示通过ONNX框架进行算子适配，TensorFlow框架开发流程与ONNX框架开发流程一致。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ed/v3/OIXYQMrbRU2TDAhHgxm2CQ/zh-cn_image_0000002496889134.png?HW-CC-KV=V1&HW-CC-Date=20260313T013711Z&HW-CC-Expire=86400&HW-CC-Sign=B105F24F2C3519991E0EAA852C7FE3E2375F78C83538D083227DC7D511307799 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cannkit-overview-of-ai-framework-operator*