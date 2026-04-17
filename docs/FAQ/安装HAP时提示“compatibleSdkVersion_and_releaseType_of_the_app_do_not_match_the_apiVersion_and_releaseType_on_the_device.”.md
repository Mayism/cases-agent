---
title: 安装HAP时提示“compatibleSdkVersion and releaseType of the app do not match the apiVersion and releaseType on the device.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-22
category: FAQ
updated_at: 2026-03-13T05:56:26.208Z
---

# 安装HAP时提示“compatibleSdkVersion and releaseType of the app do not match the apiVersion and releaseType on the device.”

**问题现象**

在启动调试或运行应用/服务时，安装HAP出现错误，提示“compatibleSdkVersion和releaseType与设备上的apiVersion和releaseType不匹配。”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5d/v3/uPx1xY-DQxOGruJYeclmvw/zh-cn_image_0000002247307937.png?HW-CC-KV=V1&HW-CC-Date=20260313T055619Z&HW-CC-Expire=86400&HW-CC-Sign=6A4514E8F7222E8A5C89919C020F9CEE594E8C0EA48D27B0AF77E5C375E3C722)

**解决措施**

出现该问题是因为当前工程配置的最低兼容版本高于设备镜像版本。

使用命令hdc shell param get const.ohos.apiversion查询当前设备的 API 版本，并对比工程级build-profile.json5配置文件中的compatibleSdkVersion字段。如果版本不匹配，可以使用以下解决办法：

方法一：请升级设备镜像版本以匹配当前工程版本。在系统设置界面升级设备系统。

方法二：降低工程的API版本，点击DevEco Studio右上角的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/27/v3/7Q0hm_U8QACmAEdylFm8YA/zh-cn_image_0000002489396138.png?HW-CC-KV=V1&HW-CC-Date=20260313T055619Z&HW-CC-Expire=86400&HW-CC-Sign=0C1E7C135C541B51005C255AE4A1DB88FA4D4456B701B6ACE3C1F1E8B739C758)，Compatible SDK选择更低的版本号，以兼容设备的API版本。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d0/v3/ALrgDW_kR6ue3NFDQFNxbg/zh-cn_image_0000002521676021.png?HW-CC-KV=V1&HW-CC-Date=20260313T055619Z&HW-CC-Expire=86400&HW-CC-Sign=2A84A3B7CB4E805861E1168A45EDF07916BDF5637A5D1D0B27059D351CB1B1E8)

说明

-   如果执行命令后返回“\[Fail\]ExecuteCommand need connect-key? please confirm a device by help info”，可能是连接了多台调试设备，或者模拟器和真机同时使用。
    -   如果同时连接了模拟器和真机，请断开模拟器。
    -   如果连接了多台设备，每次执行命令时需要使用-t参数指定目标设备的标识符。您可先执行**hdc list targets命令**查询连接的设备，再通过**hdc -t _connect-key_ shell param get const.ohos.apiversion**命令指定要连接的目标设备，其中connect-key为设备标识符，即**hdc list targets**返回的信息。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-22*