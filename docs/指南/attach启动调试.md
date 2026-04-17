---
title: attach启动调试
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-attach
category: 指南
updated_at: 2026-03-13T04:54:38.178Z
---

# attach启动调试

开发者也可以通过将调试程序attach到已运行的应用进行调试。

Attach Debugger和Debug的区别在于，Attach Debugger to Process可以先运行应用/元服务，然后再启动调试，或者直接启动设备上已安装的应用/元服务进行调试；而Debug是直接运行应用/元服务后立即启动调试。

## 前提条件

当前设备上被attach的应用代码和本地代码一致，且已提前进行构建生成必要的sourceMap文件。

## 使用约束

attach不支持的场景：

-   本地无源码。
-   bundleName不匹配，将出现提示“The selected process does not match the bundlename of the current project!”，但不阻塞调试过程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/gP3SmHkeQxOWen7cHncDCA/zh-cn_image_0000002500910360.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=B284D6AC025548B3D3FDA798F6772FE351838D7EF3BB8766F843637CCDE865C5)
    

## 操作步骤

1.  在工具栏中，选择调试的设备，并单击**Attach Debugger to Process**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/bfz4R7dyS9e1D6GeR1J1ag/zh-cn_image_0000002500910364.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=0C3F80EFD01236C0FFF9460D85B7A6CB8C237B23BE09983B6D9DD4ACB6E98B98)启动调试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/OTkQHePATr2ksJD8c3YX8A/zh-cn_image_0000002500910362.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=A3A2E2EB6E6B677B275A500CCD676AFBDBCF8FDFBA48442E34D842D27B4EEBAD)
    
2.  选择要调试的应用进程，若应用bundleName与当前工程不一致，则需勾选Show all process。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7f/v3/4GI4jtOgRHaohmHYkhHCDQ/zh-cn_image_0000002500910366.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=8C9F7CDDCBA05A39363756AD768F88206EA87369EFD61C3BFFF5FE602F245461)
    
    说明
    
    正常情况下，attach调试仅支持debug签名的应用，从DevEco Studio 6.0.2 Beta1版本开始，PC/2in1上的应用，如果使用了release签名并且配置了ohos.permission.kernel.ALLOW\_DEBUG权限，也支持被attach调试。
    
3.  选择需要使用的调试配置，或者使用默认配置。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5e/v3/mnb_Zs5wS3W7MOY3uRASgA/zh-cn_image_0000002500910354.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=33F485500A0A8F6D7D0336A0D46796A4CCA6D29B2A2E023C22A664DD06C84A74)
    
4.  选择需要调试的Debug type，若选择已创建的Run/Debug configuration进行attach调试，此时Debug type不可改变，只可在Run/Debug configuration界面修改。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/TgCcPf0eTPSlXQrgFdCV4g/zh-cn_image_0000002532670271.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=82AABA4EC0B2064426323B294A768709B6E0C440B399F71F9CD4EFD0350D5079)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/57/v3/mzvCq9LTTG-v7OozPkXs9Q/zh-cn_image_0000002532670275.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=85A5CDA41B6ED701D30F1B7798D29057E49115E964987210E2C6CECF22AEEBBF)
    
5.  点击**OK**开始attach调试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/51/v3/K4tO5K9oTvC1tdbQyJHVdw/zh-cn_image_0000002500910358.png?HW-CC-KV=V1&HW-CC-Date=20260313T045357Z&HW-CC-Expire=86400&HW-CC-Sign=3A66DEA7251779534B1505A1BF6BC90C808E0AF72FD8C2ECB2E3489163245F37)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-attach*