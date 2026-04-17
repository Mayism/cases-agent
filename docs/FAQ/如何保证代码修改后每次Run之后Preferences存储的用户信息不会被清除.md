---
title: 如何保证代码修改后每次Run之后Preferences存储的用户信息不会被清除
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-58
category: FAQ
updated_at: 2026-03-13T05:59:32.292Z
---

# 如何保证代码修改后每次Run之后Preferences存储的用户信息不会被清除

如果需要在运行后保留存储在Preferences中的用户信息，可以在DevEco Studio中进行如下设置：点击“Run”->“Edit Configurations...”，进入“Debug Configurations”->“General”->“Installation Options”，勾选“Keep Application Data”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c6/v3/3xir-QdMR8SPBwEYVkKgyg/zh-cn_image_0000002229758741.png?HW-CC-KV=V1&HW-CC-Date=20260313T055927Z&HW-CC-Expire=86400&HW-CC-Sign=4D03EB3E3628129BB4B656B13977D3BB9ACA8EFD9CD3CEAE4EA5EFC64F35980F)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-58*