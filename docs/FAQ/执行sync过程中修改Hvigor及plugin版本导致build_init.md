---
title: 执行sync过程中修改Hvigor及plugin版本导致build init
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-34
category: FAQ
updated_at: 2026-03-13T05:32:54.393Z
---

# 执行sync过程中修改Hvigor及plugin版本导致build init

**问题现象**

在配置Hvigor和hvigor-ohos-plugin的版本号后，点击Sync。如果之后再次修改了版本号，会导致重复下载引发版本冲突，表现为build init报错及日志刷屏。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/4Kxva3qwTcCsqIYQlkHTxQ/zh-cn_image_0000002194158832.png?HW-CC-KV=V1&HW-CC-Date=20260313T053249Z&HW-CC-Expire=86400&HW-CC-Sign=59C6B258E54E18DA34E7EFD84F27ED07FDD4511789B75E107D5D71CF54E127B0)

**解决措施**

该问题源于在执行build init下载Hvigor时修改了Hvigor版本。随后在执行Hvigor.js时，由于依赖发生变化，导致第二次下载新版本，从而引发不兼容问题。建议在执行 Sync 并下载Hvigor时不要修改Hvigor版本。

点击**File > Sync and Refresh Project**，重新执行Sync。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-34*