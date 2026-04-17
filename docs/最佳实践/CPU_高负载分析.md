---
title: CPU 高负载分析
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-high-cpu-load-analysis
category: 最佳实践
updated_at: 2026-03-13T02:36:09.823Z
---

# CPU 高负载分析

## 日志获取

对于CPU高负载问题的分析，需要在Profiler工具中启动Energy模板分析任务，并重现问题场景。

IDE工具中集成了CPU高负载故障的异常检测功能，操作步骤如下：

1.  点击Profiler工具，选择要分析的应用进程，创建一个Energy Session，按照复现路径操作应用，捕获大约15秒的信息。
2.  观察Energy Anomaly泳道，若标注为红色的异常则表示已识别到CPU高负载异常。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/20/v3/twv-xoRjTLasOriboAbG7Q/zh-cn_image_0000002370405460.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=700AAABD038B3AB44DF7695870E762AF180DC5B058FEB2B36851527C280857F5 "点击放大")
    
    说明
    
    CPU负载是3秒内的平均负载值。如果线程连续在大核最高频率下运行3秒，负载值将达到100%。当线程在不同的核心、不同的频率下运行，且运行时间不同时，将根据芯片的计算能力和运行时间进行相应的比例折算。
    
3.  点击More中的箭头，可直接查看当前函数执行的总时间比较长的函数，可接着分析函数执行时间长的原因。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/76/v3/_oIY-qbISbSzvsw1f5vLxQ/zh-cn_image_0000002404045185.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=1977078FE4FF7629537C28597A389368A92494CFCF769C1B72332E375328AA68 "点击放大")
    

## 分析思路

CPU高负载问题通常涉及以下三种情况：

1.  GC线程负载高。需要通过Allocation和Snapshot模板来分析内存使用情况。
2.  UI线程负载高。应通过Trace泳道分析是否存在冗余绘制及组件未复用等问题，主要结合应用主进程、render\_service、RSUniRenderThre以及RSHardwareThread这些管线中的帧率、帧长和未送显情况进行详细分析。
3.  应用侧其他线程负载高。需要借助Callstack泳道分析函数栈，排查应用的业务逻辑是否存在异常，是否频繁执行了长耗时任务，或因异常业务逻辑导致了无限循环。

针对上述情况进行详细分析和定位，确认根本原因后进行修复，随后观察功耗和发热情况是否满足性能要求。如不满足，则需重复上述分析和定位过程。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e4/v3/y82kjS7MR1idrc0tQF_6ew/zh-cn_image_0000002416845134.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=D10B2548A42E5A8E1335AF9AB00F12D28C4D37140CAB5DB693FB81ABEDCF3A5F)

## 分析步骤

### 案例一：应用侧某线程负载过高

某应用使用过程中，边刷视频边查看评论或推荐时，手机发烫严重，关闭应用后逐渐恢复正常。

1.  在Profiler工具中开启Energy模板分析任务并复现问题场景。
2.  观察CPU Core泳道找到运行时长占比比较高的线程，详细分析方法可参考：[CPU活动分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-cpu)。
    
    选择CPU Core泳道，通过下方详情区可以看出应用进程占比时长较高。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/HbOQfakrTWaqCx8Cg6_Usg/zh-cn_image_0000002404125017.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=0C51657B8434FDD0F0D371DB4AE3CA2E9EBC28E4C7F808D8CE94C665DD6C2EBD "点击放大")
    
    查看CPU频点情况，通过查看Frequency泳道发现CPU核的频点都很高，CPU调度非常频繁。
    
    Frequency子泳道：表示CPU频率，鼠标悬浮在Frequency泳道上，可以看到CPU的运行频率。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/kTJJb3c_Qc2D669W2B20Hw/zh-cn_image_0000002370405468.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=FBDB802A3DA1D4709C1475855B31F70B20D4041F0E543EE27EE290D3C757878D "点击放大")
    
    当所有CPU核频点都较高时，选择CPU Core泳道，查看CPU负载来源。通过详情区，可以看到CPU负载主要来源于应用侧的子线程（线程号55523）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/96/v3/t-4XmUjuRR-TvaipkcDhfw/zh-cn_image_0000002404045189.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=3A1471D66A3F33F95BDB673BBCDBC0ACC4C73CD54158E1907FBFE35E3A61304B "点击放大")
    
3.  根据CPU高负载线程类型进行详细排查。本案例中，CPU负载主要来源于应用侧的子线程（线程号55523）。需要借助[点击完成时延分析](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-click-to-complete-delay-analysis)该线程执行的任务，结合函数栈排查业务逻辑是否存在异常。大多情况下都是由于该线程频繁执行长耗时任务或者无限循环逻辑导致的。

### 案例二：GC线程负载过高

某应用使用期间，屏幕发烫严重，壳温高达40摄氏度；结束应用后，温度自行恢复正常。

1.  在Profiler工具中开启Energy模板分析任务并复现问题场景。
2.  观察CPU Core泳道找到运行时长占比比较高的线程，详细分析方法可参考：[CPU活动分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-cpu)。
    
    选择CPU Core泳道，通过下方详情区可以看出，应用进程占比时长较高。不同应用的应用进程名称不同，一般与应用包名一致。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7d/v3/EOHTMLHVRSKfxJegX2nOxg/zh-cn_image_0000002370565356.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=6ABF4CE6289BE78B10754934E18A610746795A56A77DBAA75F94A97BAF27D05D "点击放大")
    
    查看CPU频点情况，通过查看Frequency泳道的CPU频率可以看出CPU部分核上频点很高，基本保持在最高频状态运行。即下图中的CPU10、CPU11，其对应的Frequency子泳道基本被填满。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1c/v3/gggfcoJSSEGrzUqSTENaGQ/zh-cn_image_0000002404125021.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=F92B98DC8E445AB5691A492A58806C84F1CBFA12D140C8F39C5A40FC384D3439 "点击放大")
    
    当部分核频点较高时，选择CPU频点比较高的核对应的Slice子泳道，查看CPU负载来源。即CPU10与CPU11对应的Slice子泳道，通过详情区可以看到CPU负载主要来源于应用进程的OS\_GC\_Thread线程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a8/v3/IaZJErtmSUuQB1mRTf7VjA/zh-cn_image_0000002370405472.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=009B4D6052C5B0878D9B907F940652B544140B6D0F91BA96FA5A23DA1A72B49F "点击放大")
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/90/v3/Dn67uOkGRJ-24_ocM-GLCQ/zh-cn_image_0000002404045193.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=F3B5AC9AC361CE0D3F082DC0620BA73C3024D5C72B6B641D40FC45D4B4F47CA8 "点击放大")
    
3.  根据CPU高负载线程类型进行详细排查。本案例中，CPU负载主要来源于应用进程的OS\_GC\_Thread线程。针对GC线程负载高的情况，需要借助Allocation和Snapshot模板具体分析内存使用情况。详细分析方法参考：[Allocation分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-allocations)和[Snapshot分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-snapshot)。

### 案例三：UI主线程负载过高

在某应用上进入直播页面进行观看，功耗超100mA，手机温度持续升高。

1.  在Profiler工具中开启Energy模板分析任务并复现问题场景。
2.  观察CPU Core泳道找到运行时长占比比较高的线程，详细分析方法可参考：[CPU活动分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-cpu)。
    
    选择CPU Core泳道，通过下方详情区可以看出，应用进程占比时长较高。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/wCet4ypKSPKPZGYSlk-6JA/zh-cn_image_0000002370565360.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=1F938F5E4128237D278E2368CE0C8B7C977C9B0C04931DFA61482988CA2EC066 "点击放大")
    
    查看CPU频点情况，通过查看Frequency泳道发现CPU部分核（CPU10、CPU11）的频点很高，且每个CPU核调度都非常频繁。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/92/v3/2DFYW3bbT1uhoSp91takZA/zh-cn_image_0000002404125025.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=11B2CB9F8802F013360E4508506FC917AB99A8D39D75BC5F944AFA30633E3D01 "点击放大")
    
    选择CPU Core泳道，查看CPU负载来源。通过详情区，可以看到CPU负载主要来源于应用UI主线程（线程号43436，与应用进程号一致为主线程）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2b/v3/MnVuK2zNTwykxNnv85HKdA/zh-cn_image_0000002370405476.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=D8CB793E7CF5FC41BA2E4C776B5AEA6D77533B11EA2B9719B12C8BAF65EFABEC "点击放大")
    
3.  根据CPU高负载线程类型进行详细排查。本案例中，CPU负载主要来源于应用UI主线程。需要分析UI主线程的Trace泳道判断是否存在冗余绘制及组件未复用等情况。
    
    找到UI主线程对应的Trace泳道（可以根据应用包名或上一步中的线程号查找）。选择对应的线程泳道，可以看到详情区包含了线程运行状态，选择Thread States，可以看出Running状态占比非常高。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d0/v3/rGd7IBLzRJGPyOVSOKPS3A/zh-cn_image_0000002404045197.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=24FAA309D9DA4783AFBF2F7826FCD71003D0982DA233F4941DE6D0E3D54DB4D4 "点击放大")
    
    查看Slice List，检查是否存在冗余绘制及组件未复用等情况。选择Slice List，发现id为-1的Image一直在执行绘制任务，Occurrences达到了4万多次。然后借助ArkUI Inspector工具进行排查确认组件是否存在冗余绘制情况。关于ArkUI Inspector的使用可参考：[布局分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arkui-inspector)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/59/v3/lSkF91IIRIiKTAUo0Az21g/zh-cn_image_0000002370565364.png?HW-CC-KV=V1&HW-CC-Date=20260313T023602Z&HW-CC-Expire=86400&HW-CC-Sign=0F164DAE366CDC1D408753E6AA9427541E172CF2193E28A123BC734525073510 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-high-cpu-load-analysis*