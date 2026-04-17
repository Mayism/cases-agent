---
title: DevEco Profiler调优工具简介
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler
category: 指南
updated_at: 2026-03-13T05:14:07.853Z
---

# DevEco Profiler调优工具简介

为了帮助开发者更高效地进行性能问题的分析，DevEco Studio提供了场景化调优工具DevEco Profiler，希望为开发者带来高效、直通代码行的调优体验。

开发者可以使用DevEco Profiler完成不同应用模型和场景下的完整性能数据采集，通过简单的工具操作即可完成数据采集，这些数据将帮助开发者洞悉应用在相应场景下的运行细节。

工具的整体设计也遵循了Top-Down的设计理念和数据展示范式。被采集的数据经由工具分析，会由浅到深的以一条条泳道的形式直观地呈现到界面上，DevEco Profiler提供深入具体函数运行热点、CPU调度细节的分析能力，帮助用户搭建HarmonyOS应用性能模型。

DevEco Profiler聚焦性能分析靶心，围绕着Top-Down的思路深入展开分析；各个局部功能具备高度的整体一致性，方便开发者快速上手其他场景下的类似功能。

注意

-   DevEco Profiler工具支持通过USB连接的真机设备进行调优分析，不支持模拟器调优。
-   macOS 12及以上系统版本支持使用DevEco Profiler工具。
-   DevEco Profiler界面中可使用“/”快捷键展示全量快捷键说明信息。

您可以通过如下三种方式打开Profiler：

-   在DevEco Studio顶部菜单栏中选择“View -> Tool Windows -> Profiler”。
-   在DevEco Studio底部工具栏中单击“Profiler”。
-   使用“Ctrl+Shift+A”（macOS中为双击“Shift”）打开搜索功能，搜索“Profiler”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/aPzCNQedQP-d3qYv50U2mA/zh-cn_image_0000002532750257.png?HW-CC-KV=V1&HW-CC-Date=20260313T051327Z&HW-CC-Expire=86400&HW-CC-Sign=70C37B13203994B4C3704EEA86CAB4B5CDD9461018B473F630AB91C3849A84D8)
    

-   **[整体界面布局及概念](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-layout)**  
    
-   **[会话区](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-session)**  
    
-   **[数据区](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-data)**

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler*