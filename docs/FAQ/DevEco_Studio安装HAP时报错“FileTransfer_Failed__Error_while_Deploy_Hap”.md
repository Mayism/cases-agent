---
title: DevEco Studio安装HAP时报错“FileTransfer Failed: Error while Deploy Hap”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-35
category: FAQ
updated_at: 2026-03-13T05:58:26.521Z
---

# DevEco Studio安装HAP时报错“FileTransfer Failed: Error while Deploy Hap”

**问题现象**

DevEco Studio安装HAP时报错“FileTransfer Failed: Error while Deploy Hap”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ec/v3/Duh_L__gRK28d4fk3jqKMQ/zh-cn_image_0000002215508376.png?HW-CC-KV=V1&HW-CC-Date=20260313T055821Z&HW-CC-Expire=86400&HW-CC-Sign=19F63D54CC0FF7E226F24B87613682B6BC9CC80A208E3CD084FB8AB4195636B5)

**解决措施**

使用真机场景：请更换数据线或PC侧USB接口后尝试。

使用模拟器场景：

-   在Local Emulator的设备列表窗口，点击“Wipe User Data”清除数据，启动模拟器并重新运行工程。
-   打开命令行工具，并进入DevEco Studio安装目录下的sdk\\default\\openharmony\\toolchains路径，执行 hdc kill -r 命令，启动模拟器，重新运行工程。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-35*