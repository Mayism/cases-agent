---
title: 查看ArkTS/JS预览效果
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-arkts-js
category: 指南
updated_at: 2026-03-13T04:49:40.034Z
---

# 查看ArkTS/JS预览效果

预览器支持ArkTS/JS应用/元服务“实时预览”和“动态预览”。

说明

-   预览支持Phone、Tablet、2in1、Car、Wearable、TV设备的ArkTS工程，支持LiteWearable和Wearable设备的JS工程。
-   预览器功能依赖于电脑显卡的OpenGL版本，OpenGL版本要求为3.2及以上。
-   预览时将不会运行Ability生命周期。
-   从DevEco Studio 6.0.0 Beta3版本开始，HAP/HSP引用HSP时支持预览，HAR模块引用HSP不支持预览，请直接在HSP内预览或为该HSP[设置Mock实现](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-mock)。
-   预览场景下，不支持通过相对路径及绝对路径的方式访问resources目录下的文件。
-   预览不支持组件拖拽。
-   部分API不支持预览，如Ability、App、MultiMedia等模块。
-   Richtext、Web、Video、XComponent组件不支持预览。
-   不支持调用C++库的预览。
-   har在被应用/元服务使用时真机效果有区别，真机上实际效果应用不显示menubar，元服务显示menubar，但预览器都以不显示menubar为准。若开发har模块时，请注意被元服务使用时预览器效果与真机效果的不同。

-   **实时预览**：在开发界面UI代码过程中，如果添加或删除了UI组件，您只需**Ctrl+S**进行保存，然后预览器就会立即刷新预览结果。如果修改了组件的属性，则预览器会实时（亚秒级）刷新预览结果，达到极速预览的效果（当前版本极速预览仅支持ArkTS组件。支持部分数据绑定场景，如@State装饰的变量）。实时预览默认开启，如果不需要实时预览，请单击预览器右上角![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/92/v3/mTVMPIQGRNSLQ-2zMibiNw/zh-cn_image_0000002501070040.png?HW-CC-KV=V1&HW-CC-Date=20260313T044900Z&HW-CC-Expire=86400&HW-CC-Sign=7219BEC8D4CF59230C4CF7D64C27C5C6FA3C4EEDAA7FEA7A0F568E99351713E1)按钮，关闭实时预览功能。
    
    说明
    
    开发者修改resources/base/profile目录下的配置文件（如main\_pages.json/form\_config.json），不支持触发实时预览，开发者需要点击重新加载![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5c/v3/inAOEkz_T2mrlGyNCiaMXQ/zh-cn_image_0000002532750065.png?HW-CC-KV=V1&HW-CC-Date=20260313T044900Z&HW-CC-Expire=86400&HW-CC-Sign=21C89DAF19AC4157F3C72D6A1986991CC8F08F7AF3D7975D6B1103CC8A8B4E4A)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/64/v3/0yfSfqwXR4-Gjd4E8C_BTA/zh-cn_image_0000002500910196.gif?HW-CC-KV=V1&HW-CC-Date=20260313T044900Z&HW-CC-Expire=86400&HW-CC-Sign=059AAA0436BB34DB9559F87118B46E398C9E1B8E53F1443B6B772E64EAE70BAF "点击放大")
    
-   **动态预览**：在预览器界面，可以在预览器中操作应用/元服务的界面交互动作，如单击、跳转、滑动等，与应用/元服务运行在真机设备上的界面交互体验一致。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/05Chj6A2R1GKG50uSom6ow/zh-cn_image_0000002501070044.gif?HW-CC-KV=V1&HW-CC-Date=20260313T044900Z&HW-CC-Expire=86400&HW-CC-Sign=998661092637BC57F2E69FE06C6BF53D23CF9E62987817ECE45060793E320B0A "点击放大")
    

以ArkTS为例，使用预览器的方法如下：

1.  创建或打开一个ArkTS应用/元服务工程。本示例以打开一个本地ArkTS Demo工程为例。
2.  在工程目录下，打开任意一个.ets文件（JS工程请打开.hml/.css/.js页面）。
3.  可以通过如下任意一种方式打开预览器，启动预览。
    
    -   通过菜单栏，单击**View > Tool Windows > Previewer**打开预览器。
    -   在编辑窗口右上角的侧边工具栏，单击**Previewer**，打开预览器。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/56/v3/iwh9WBaeSpaEtIZU0o5NrQ/zh-cn_image_0000002532750067.png?HW-CC-KV=V1&HW-CC-Date=20260313T044900Z&HW-CC-Expire=86400&HW-CC-Sign=6CDA2DC78CD570BBF85E74BEC013816DF5DA5068051CD71DA981271C3386FD2D "点击放大")
    
4.  点击按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4d/v3/bdTjUt9mS1mxgjI3DuIfyw/zh-cn_image_0000002500910200.png?HW-CC-KV=V1&HW-CC-Date=20260313T044900Z&HW-CC-Expire=86400&HW-CC-Sign=5BA3BBCF613A257B14F6921FD4BD3E7C9B40DAACF0B46A7E22538EE83E4BF57C)，停止预览。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-arkts-js*