---
title: GPU帧捕获工具：Graphics Profiler抓帧入口
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-graphics-profiler
category: 指南
updated_at: 2026-03-13T05:18:21.060Z
---

# GPU帧捕获工具：Graphics Profiler抓帧入口

Graphics Profiler（图形性能调优）是专为GPU分析和优化提供的一种调试分析解决方案，可帮助OpenGL ES游戏或Vulkan游戏提升性能，分析绘制和计算问题。从DevEco Studio 6.0.0 Beta1版本开始，提供Graphics Profiler工具的抓帧入口，该工具用于对HarmonyOS手机设备进行调试，需使用调试证书。

## 操作步骤

1.  将需要分析的使用OpenGL ES或Vulkan API接口开发的应用推送到设备，并确认应用完成安装。
2.  在DevEco Studio顶部菜单栏中点击View > Tool Windows > Graphics Profiler进入帧捕获页面。
3.  在帧捕获页面，可配置Ref All Resources和Verify Buffer Access两个参数，配置完成后点击Launch APP拉起应用。
    
    -   Ref All Resources：默认关闭，在打开此选项后，抓帧时捕获所有活动资源，无论抓取的这一帧是否使用活动资源，都保存在Trace中。
    -   Verify Buffer Access：默认关闭，设置校验Buffer是否可以访问。
    
    此处为可选配置，不配置也可直接点击Launch APP拉起应用。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/cD1uAwoDQHan5usHYwZsUw/zh-cn_image_0000002532670427.png?HW-CC-KV=V1&HW-CC-Date=20260313T051740Z&HW-CC-Expire=86400&HW-CC-Sign=0B82F9205B40A70D7DB4008CDDE265B2A9666A8092ABEF8F3D4B31B442F91472)
    
4.  在帧捕获界面拉起应用，成功建立连接后，Capture按钮点亮。设置抓帧数量，点击Capture按钮，等待帧捕获完成。
    
    -   Scope：不可修改，默认为Frame。
    -   Count：抓帧数量设置，范围为1-10帧。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7a/v3/g7k7ErPnSeGsZnk-zgpVEQ/zh-cn_image_0000002500910508.png?HW-CC-KV=V1&HW-CC-Date=20260313T051740Z&HW-CC-Expire=86400&HW-CC-Sign=CE5C05224D58A82699DA20B82E3ED7C1807F891CA1E20F83681419D9FC08AE92)
    
5.  当抓帧完成，在下方显示界面中选择一条捕获帧，点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/33/v3/7BgfQk_JQeGnm2pu9Mblfg/zh-cn_image_0000002532670421.png?HW-CC-KV=V1&HW-CC-Date=20260313T051740Z&HW-CC-Expire=86400&HW-CC-Sign=13D88AE0B3A6EC96E94A56921D41593AA9BBA9256AC85CE9BA6EE4D3C00CEC4D)按钮，可自动打开Graphics Profiler工具解析捕获帧信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7b/v3/ONJgO4mFQHqIkoTJGq7EQQ/zh-cn_image_0000002532750383.png?HW-CC-KV=V1&HW-CC-Date=20260313T051740Z&HW-CC-Expire=86400&HW-CC-Sign=439A45B5E43E814FF9F98891E1C135F1B674D5A833655340A49022E7D0C04916 "点击放大")
    
    说明
    
    -   抓帧文件名格式为：\[应用包名\] \_ \[抓帧时间\] \_frame \[帧号\].rdc。
    -   Graphics Profiler工具一次只能解析一个rdc文件。
    
6.  若首次使用，需根据界面提示下载Graphics Profiler执行工具，并在菜单栏**File > Settings**（macOS为**DevEco Studio > Preferences/Settings**） **> Tools > Graphics Profiler**中配置工具路径。默认路径为：工具安装路径/frame\_profiler/FrameProfiler.exe（macOS中为工具安装路径/Contents/macOS/FrameProfiler）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/iXcTbDxGREqU1sbofq-xQg/zh-cn_image_0000002532670425.png?HW-CC-KV=V1&HW-CC-Date=20260313T051740Z&HW-CC-Expire=86400&HW-CC-Sign=05A2465220CEA01CC31D43DF3C2787F0899E24067912E911B091C357182E6FC6)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-graphics-profiler*