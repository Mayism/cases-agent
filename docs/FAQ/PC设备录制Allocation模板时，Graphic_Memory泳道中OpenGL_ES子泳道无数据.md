---
title: PC设备录制Allocation模板时，Graphic Memory泳道中OpenGL ES子泳道无数据
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-14
category: FAQ
updated_at: 2026-03-13T06:01:49.187Z
---

# PC设备录制Allocation模板时，Graphic Memory泳道中OpenGL ES子泳道无数据

**问题现象**

在使用PC设备时，通过FP回栈模式录制Allocation模板，Graphic Memory泳道中的OpenGL ES子泳道无数据。

**可能原因**

GPU底层库不支持FP回栈模式。

**解决措施**

开始录制前，单击工具控制栏中的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/57dVm8JKSdCrFEqkxXv7kg/zh-cn_image_0000002538356035.png?HW-CC-KV=V1&HW-CC-Date=20260313T060144Z&HW-CC-Expire=86400&HW-CC-Sign=03A74EA37A051FD0A14CCCEC682E8DD26B2C3B6C9619EFB68579B2A3602380B2)按钮，设置内存分配栈回栈模式为DWARF。使用DWARF回栈模式采集数据时，性能开销较大，因此在录制Graphic Memory泳道时，建议不同时录制Native Allocation泳道。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/twoxk2KDQwWTGwzl-XGofw/zh-cn_image_0000002506636162.png?HW-CC-KV=V1&HW-CC-Date=20260313T060144Z&HW-CC-Expire=86400&HW-CC-Sign=DE9F1593EDDA26BB9CF52A8C331D60BA64DD798536B6C1D5B376484F36C1C1CC "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-14*