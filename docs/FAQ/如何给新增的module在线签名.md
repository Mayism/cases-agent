---
title: 如何给新增的module在线签名
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-52
category: FAQ
updated_at: 2026-03-13T05:35:11.203Z
---

# 如何给新增的module在线签名

操作步骤：

1.  连接真机设备，确保[DevEco Studio与真机设备已连接](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-run-device)，真机连接成功后如下图所示：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d2/v3/dn_Kf3wkQwmEFRwu5LQ60g/zh-cn_image_0000002229604037.png?HW-CC-KV=V1&HW-CC-Date=20260313T053504Z&HW-CC-Expire=86400&HW-CC-Sign=772839F2D2D998226141451170BA85987497833CAB747ABFEEE8AC9E4A8E7418)
    
2.  进入 File > Project Structure... > Project > Signing Configs 界面，勾选“Automatically generate signature”。如果是 HarmonyOS 工程，还需勾选“Support HarmonyOS”。若未登录，请先单击 Sign In 进行登录，然后完成签名。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/8j34JSfIS2ufsaVDXDd4pg/zh-cn_image_0000002229758513.png?HW-CC-KV=V1&HW-CC-Date=20260313T053504Z&HW-CC-Expire=86400&HW-CC-Sign=73B8334F65B88B2321F214568F9C46758EFCBE463C7967BFA082AFC4BD405714 "点击放大")
    
    签名完成后，如下图所示：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b/v3/qlZOGhPHT4y6rUVKuhGd4Q/zh-cn_image_0000002194318264.png?HW-CC-KV=V1&HW-CC-Date=20260313T053504Z&HW-CC-Expire=86400&HW-CC-Sign=3C945F98BB9B3EFD99E9C137097CF962FD1326BF53C17637D443C86630C46FDB "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-52*