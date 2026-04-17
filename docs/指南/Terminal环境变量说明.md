---
title: Terminal环境变量说明
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-environment-variable
category: 指南
updated_at: 2026-03-13T05:05:11.296Z
---

# Terminal环境变量说明

在DevEco Studio的Terminal中执行hvigor、ohpm等命令时，默认使用内置的环境变量，无需额外配置。

DevEco Studio内置环境变量的设置方式如下：

点击菜单栏**File > Settings**（macOS为**DevEco Studio > Preferences/Settings** ） **> Tools > Terminal**，勾选以下选项表示开启内置环境变量。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f2/v3/YCJZANcBTruWXFOVyB-y5w/zh-cn_image_0000002532750131.png?HW-CC-KV=V1&HW-CC-Date=20260313T050429Z&HW-CC-Expire=86400&HW-CC-Sign=3E9943D718D00131AEBDC1962849991759F0517E34E83468B1F36D6903F8EE5B)

除了内置的环境变量外，开发者也可以在本地系统中配置PATH环境变量。如果同时配置了内置环境变量和本地系统环境变量，两者存在优先级关系，实际生效的环境变量如下。

-   Windows：内置环境变量生效。
-   macOS：根据使用的shell决定实际生效的环境变量。
    -   如果是bash，内置环境变量生效。
    -   如果是zsh，本地系统环境变量生效。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-environment-variable*