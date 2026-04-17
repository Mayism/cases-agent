---
title: 如何解决mac启动DevEco Studio报错提示“devecostudio”意外退出问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-13
category: FAQ
updated_at: 2026-03-13T05:26:06.665Z
---

# 如何解决mac启动DevEco Studio报错提示“devecostudio”意外退出问题

**问题描述**

Mac启动DevEco Studio时，“devecostudio”意外退出。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b2/v3/YRNeESsfQ02Nid_Ohn4zbQ/zh-cn_image_0000002229758581.png?HW-CC-KV=V1&HW-CC-Date=20260313T052601Z&HW-CC-Expire=86400&HW-CC-Sign=DA7B956BB15C83C511EB98495F858A5E3CEA68A38F0F27EE30FBB24E367C8DD0)

**解决方案**

问题根因：异常修改了JetBrains启动脚本中的环境变量，导致Java虚拟机无法启动，DevEco Studio无法打开，弹窗显示错误。

规避措施：删除启动脚本 /Users/{USER\_NAME}/Library/LaunchAgents/jetbrains.vmoptions.plist，然后重启 Mac。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-13*