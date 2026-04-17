---
title: 如何解决mac启动DevEco Studio报错提示“DevEco Studio”意外退出问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-13
category: FAQ
updated_at: 2026-03-24T11:24:14.361Z
---

# 如何解决mac启动DevEco Studio报错提示“DevEco Studio”意外退出问题

**问题描述**

Mac启动DevEco Studio时，“DevEco Studio”意外退出。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5d/v3/2QA1A61_TNO8V5zduNf2Mg/zh-cn_image_0000002229758581.png?HW-CC-KV=V1&HW-CC-Date=20260324T112414Z&HW-CC-Expire=86400&HW-CC-Sign=BF191A296FAF5C3B03A43802E11AC5002466ED505C8D61A323B4AFA87AFDAB42)

**解决方案**

问题根因：异常修改了JetBrains启动脚本中的环境变量，导致Java虚拟机无法启动，DevEco Studio无法打开，弹窗显示错误。

规避措施：删除启动脚本 /Users/{USER\_NAME}/Library/LaunchAgents/jetbrains.vmoptions.plist，然后重启 Mac。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-13*