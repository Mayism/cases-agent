---
title: GPU活动分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-gpu
category: 指南
updated_at: 2026-03-13T05:17:39.801Z
---

# GPU活动分析

从DevEco Studio 6.0.0 Beta3版本开始，DevEco Profiler提供GPU模板展示不同GPU硬件模块利用率的详细信息，这些信息可用于识别GPU利用率低、执行图形和计算工作负载性能瓶颈的根本原因。

## 约束与限制

-   该功能仅支持中国境内（香港特别行政区、澳门特别行政区、中国台湾除外）。
-   仅支持Phone设备。

## 操作步骤

1.  创建GPU分析任务并录制相关数据，操作方法可参考[性能问题定位：深度录制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/deep-recording)。
    
    GPU分析任务支持在录制前单击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6f/v3/88bQN9pHQyGoscRTucUHMg/zh-cn_image_0000002532750075.png?HW-CC-KV=V1&HW-CC-Date=20260313T051659Z&HW-CC-Expire=86400&HW-CC-Sign=4F35D9CB9DE4F66BA083517A5281B9E503843E7996D5231BDC59036AE2E658B5)指定要录制的泳道。单击工具控制栏中的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/jntXpxn2TkaSZ_tVHZK21g/zh-cn_image_0000002500910208.png?HW-CC-KV=V1&HW-CC-Date=20260313T051659Z&HW-CC-Expire=86400&HW-CC-Sign=6744F4398842B90691DC259957642E3DAE4EB9170581ACE62CB7F5DEDE5BB76D)按钮，可以设置采样时间间隔（Sampling Interval），可设置范围为1ms~1000ms，默认为10ms。
    
2.  “Counters”泳道显示当前设备GPU的使用率，“ArkTS Callstack”、“Callstack”、“CPU Core”等泳道信息请参考[基础耗时：Time分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-time)和[CPU活动分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-cpu)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4e/v3/MBcbj0b8St6z3XOYodAxig/zh-cn_image_0000002500910206.png?HW-CC-KV=V1&HW-CC-Date=20260313T051659Z&HW-CC-Expire=86400&HW-CC-Sign=B7BD54CE1EA3D838B9D98372F9143132ECD5EC8566374FDECEB05675F77CBACE "点击放大")
    
3.  将“Counters”泳道展开，子泳道显示GPU各项活动信息，包括counters\_gather、GPU执行命令的频率、GPU执行命令的持续时间等。除counters\_gather外，其他子泳道信息可参考[GPU Counters](https://developer.huawei.com/consumer/cn/doc/Tools-Guides/gpu-counters-0000001886127538)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7d/v3/eFG-uvCwS5eusCNwq8YiXw/zh-cn_image_0000002532750079.png?HW-CC-KV=V1&HW-CC-Date=20260313T051659Z&HW-CC-Expire=86400&HW-CC-Sign=99C208C3FF50729C6913D95A74B816746CF8B21EF21C8892BA8BF3858ADD96D8 "点击放大")
    
4.  counters\_gather泳道显示线程对各CPU核心的占用情况。单击运行状态的时间片段，显示线程在该时间片段的起始时间、持续时长、运行状态、频率、线程优先级、所属进程、所属线程、上一运行状态、下一运行状态，并且支持跳转到上个或者下个线程运行状态。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2b/v3/xd8yHTYySuCKyUNbvqpcgQ/zh-cn_image_0000002532750077.png?HW-CC-KV=V1&HW-CC-Date=20260313T051659Z&HW-CC-Expire=86400&HW-CC-Sign=1BE56AD9724FF88BBEF98E38435B5EBB435E7494BD138E0206CC34FE7D4D0FA9 "点击放大")
    
5.  框选counters\_gather泳道，可查看此时间段内的统计信息，包括线程状态统计信息、CPU单线程使用情况、线程中的中载重载数据统计。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1a/v3/avYqOvm7TAGcfCH06TsVJw/zh-cn_image_0000002532670129.png?HW-CC-KV=V1&HW-CC-Date=20260313T051659Z&HW-CC-Expire=86400&HW-CC-Sign=50A5B283C1A1410DBF754C777DF363BD786AA16746B2A82E7EB36B09F6A1BF5E "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-gpu*