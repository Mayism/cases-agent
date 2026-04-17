---
title: 添加Page
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-add-page
category: 指南
updated_at: 2026-03-13T04:00:34.739Z
---

# 添加Page

在ArkTS语言的工程中，支持添加Page。Page是表示应用/元服务的一个页面。应用/元服务可以设计为多个功能页面，每个页面进行单独的文件管理，并通过路由API实现页面的调度管理，以实现应用内功能的解耦。ArkTS语言的工程添加Page后，会在pages文件夹下生成一个新的ets文件。

1.  在Stage工程中选中ets文件夹下的pages，单击鼠标右键，选择**New > Page**，当前提供如下Page类型：
    
    -   Empty Page：创建一个普通页面，展示基础的Hello World功能；
    -   Map Page：创建一个地图页面，展示地图视图功能，当前仅支持在Phone设备中使用；
    -   Payment Page：创建一个支付页面，可以实现点击按钮唤起支付弹窗，当前仅支持在Phone设备中使用；
    -   Iap Page：IAP Kit场景化模板，支持快速创建应用内支付购买虚拟数字商品相关代码。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a0/v3/gyUc3FuTRVC3by81f3BRtA/zh-cn_image_0000002500910666.png?HW-CC-KV=V1&HW-CC-Date=20260313T035955Z&HW-CC-Expire=86400&HW-CC-Sign=4539C0B7396B3DC8B268441FD1EE3FE9B31A2D2F02C6D5F1DADA2BDC3EA7CCB0)
    
    说明
    
    API 10工程中仅支持创建Page，展示基础的Hello World功能；如需使用场景化Page模板，请将工程切换为API 11及以上后进行开发。
    
2.  输入Page name（由大小写字母、数字和下划线组成），单击**Finish**完成添加。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7e/v3/IGNOguIWSNm9Vi7NSduStw/zh-cn_image_0000002532750537.png?HW-CC-KV=V1&HW-CC-Date=20260313T035955Z&HW-CC-Expire=86400&HW-CC-Sign=73F944677534083E58FD058C7A98DFBE58239C132CF689484551EBD3B6F7DDE8 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-add-page*