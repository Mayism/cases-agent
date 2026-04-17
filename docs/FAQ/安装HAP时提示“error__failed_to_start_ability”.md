---
title: 安装HAP时提示“error: failed to start ability”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-23
category: FAQ
updated_at: 2026-03-13T05:56:32.359Z
---

# 安装HAP时提示“error: failed to start ability”

**问题现象**

启动调试或运行应用/服务时，如果安装HAP出错，提示“error: failed to start ability. error: ability visible false deny request”，请检查应用的可见性设置。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f4/v3/PDkMMMF8Td696aBHwNWTsg/zh-cn_image_0000002229758621.png?HW-CC-KV=V1&HW-CC-Date=20260313T055627Z&HW-CC-Expire=86400&HW-CC-Sign=A91F10DC7ABD7BABB96A785C952F84632BC807CE4DD6714FC1F0518940EE3EF0)

**解决措施**

-   在Stage模型工程的module.json5文件中，将abilities字段内的exported设置为true。
-   FA模型工程：在config.json文件的abilities字段中，将visible设置为true。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-23*