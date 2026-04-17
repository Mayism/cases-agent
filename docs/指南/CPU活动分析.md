---
title: CPU活动分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-cpu
category: 指南
updated_at: 2026-03-13T05:18:13.801Z
---

# CPU活动分析

开发者可使用DevEco Profiler的CPU场景调优分析，在应用或元服务运行时，实时显示CPU使用率和线程的运行状态，了解指定时间段内的CPU资源消耗情况，查看系统的关键打点（例如图形系统打点、应用服务框架打点等），进行更具针对性的优化。

## 查看各CPU使用情况

1.  创建CPU分析任务并录制相关数据，操作方法可参考[性能问题定位：深度录制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/deep-recording)，或在会话区选择**Open File**，导入历史数据。
    
    CPU分析任务支持在录制前单击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c3/v3/MbLyWDLhRFiB4MfYoBnlIw/zh-cn_image_0000002532750089.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=43A1AF5F1607CDCB04228FDA3102FB2C39FDD3ECFCC7D00CDAC848305EEAFA74)指定要录制的泳道。
    
2.  “CPU Core”泳道显示当前选择调优应用或元服务的CPU的使用率。
    
    可在“CPU Core”右侧的下拉列表中选择显示内容：
    
    -   Slice and Frequency：每个子泳道包含时间片和频率两部分，时间片显示占用该CPU核心的进程、线程。
    -   Usage and Frequency：每个子泳道包含CPU核心使用率和频率两部分。
    
    框选主泳道，可对所选时间段内的CPU使用情况进行汇总统计，可查询多时间片的进程维度统计信息、线程维度状态统计信息、线程状态统计信息，以及所有时间片的数据统计信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/JrhvOC_3QwuYP92aT1BU0g/zh-cn_image_0000002500910212.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=6AAE0A41EEBED0A2FB4E6DF4D989D92757684D3CCC7C32C1090364F1C0085EDF "点击放大")
    
3.  将其展开，子泳道显示各CPU核心调度信息、各CPU核心频率信息以及各CPU核心使用率信息。
    
    说明
    
    将鼠标悬浮在某时间片上时，能够置灰非同进程时间片，通过此方法可以确定时间片的关联性。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b2/v3/eps-y53CT3qkCvPAj20SXQ/zh-cn_image_0000002532750083.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=30319F502105466F70A2B2ED6E89D195B3D07CEBCF89D8EA2D9B00E16FAC1DDF "点击放大")
    
4.  指定时间片，查看统计信息。
    
    -   单击某个运行状态的时间片，可查询这个时间片的基本运行信息及调度时延信息。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/03/v3/2cFH34H9RHqCsgfHrO5e4g/zh-cn_image_0000002500910220.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=6B663D2AC4290C69767EEE2F730E046B38D7971AD106FA1FBF51D74BE97FFC38 "点击放大")
        
    -   框选多个时间片，则可查询多时间片的进程维度统计信息以及所有时间片的数据统计信息。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c4/v3/Kx49iJzeT9Wf26Pv9v9KXQ/zh-cn_image_0000002501070068.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=76D2C650AB20A1AD65692DDF4A94A957EAB39E427689C7A6068EC5AE90F46FA0 "点击放大")
        
    -   开启"View Integrated Scheduling Chain"后，点击CPU时间片泳道的节点可以查看某一个CPU运行线程的完整唤醒调度链。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/91/v3/4ks7bxoQQ9Oc1Y6TDtx03g/zh-cn_image_0000002532750091.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=A37E4502612029D2D2B17401B1BE5522EBD8FCF9E9F972CFF8B7999CD5C3674E "点击放大")
        
    

说明

-   在任务分析窗口，可以通过“Ctrl+鼠标滚轮”缩放时间轴，通过“Shift+鼠标滚轮”左右移动时间轴。或使用快捷键W/S放大或缩小时间轴，使用A键/D键可以左右移动时间轴。
-   将鼠标悬停在泳道任意位置，可以通过M键添加单点的时间标签。
-   鼠标框选要关注的时间段，可以通过“Shift+M”添加时间段的时间标签。
-   在任务分析窗口，可以通过“Ctrl+, ”向前选中单点的时间标签，通过“Ctrl+. ”向后选中单点的时间标签。
-   在任务分析窗口，可以通过“Ctrl+\[ ”向前选中时间段的时间标签，通过“Ctrl+\]”向后选中时间段的时间标签。
-   CPU分析支持能耗分析，请参见[能耗诊断：Energy分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-energy)。

## 查询进程详情

单击工具控制栏中的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/37/v3/kRBcnEgqTOuDL0REcyd0vA/zh-cn_image_0000002532750087.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=D6D5C4DB2264D5F1800CBD3D92BBF85AADD0BE3A567C9D0ECB6E9177FA56AD27)按钮，可以设置是否为精简模式。精简模式下，trace数据量将大幅减少，主要采集当前进程、大桌面进程和render\_service进程的trace数据。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/3UjqsJ1pRu-8doHHZgGa6A/zh-cn_image_0000002500910222.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=B6F5688FDAE156374365F57274BF1B777EAEDD5515D6B3A6E506C44EF3F5B4E9 "点击放大")

进程泳道显示进程对各CPU核心的占用情况。展开进程泳道，显示进程下的线程列表以及线程的运行状态。

-   单击运行状态的时间片，显示线程在该片段的运行详情，包括起始时间、持续时长、运行状态、频率、线程优先级、所属进程、所属线程、上一运行状态、下一运行状态、唤醒线程，支持跳转到上个或者下个线程运行状态，支持跳转到唤醒线程状态等。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b9/v3/2xnlfjtNRvOItwToxDDT2Q/zh-cn_image_0000002532670137.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=21CB4C015025F44262CDE251522314A289E57AF1AB0F2F3A515E27900171F48B "点击放大")
    
-   框选Thread泳道中多个运行状态的时间片，可查看此时间段内的不同运行状态的线程的统计信息，包括总耗时时长、最大耗时、最小耗时、平均耗时、处于当前状态的线程数量以及线程中的中载和重载数据统计。
    
    说明
    
    中载、重载数据每100ms做一次统计，24ms < Running时长 ≤ 48ms 记为中载，Running时长大于48ms记为重载。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/55/v3/TkX6qx6YSaCKKLRLIBqrfQ/zh-cn_image_0000002532750085.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=968870AF84EFABA85F6AF9AE4ADA2C93E5708F582355B807D6322E19639FE8DD "点击放大")
    
-   框选应用进程Process主泳道，可查看此时间段内该进程下的线程并行度统计信息。并行度数据每100ms做一次统计，可以查看100ms内运行的总线程数量、各线程并行的总时间和并行度。点选某一行，可以查看对应线程编号和运行时间段。
    
    说明
    
    并行度（Parallelism）取值范围是\[1, CPU核数\]，数值越小代表并行度越低。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/58/v3/X8Gu-K2WRIqF59xYUhpCQA/zh-cn_image_0000002500910216.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=65A548093E895CEB5EC3B34D2A89834A135EAFEDF5D86231306E4916FAA83D31 "点击放大")
    

## 查看Trace详情

当存在Trace任务时，可在对应的线程泳道查看到当前线程已触发的Trace任务层叠图。选择待查询的Trace。

-   点选泳道中的Trace片段，可查看单个Trace详情，包括名称、所属进程、所属线程、起始时间、持续时长、深度等。
    
    说明
    
    -   如果用户对线程进行了自定义打点，在此处亦可查看到对应的User Trace打点信息。
    -   从所在线程名称可分辨当前Trace的类型，系统Trace对应的线程名称为“线程名+线程号”，User Trace对应的线程名称为“打点任务名”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/57/v3/LCAVvCcdT1e3OIZHwa7vfg/zh-cn_image_0000002500910218.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=E49C65600ECAC31A07D8169EB707383F8BF3AE74C0D74AE163FBF29ADF84CE15 "点击放大")
    
-   框选多个Trace片段，可查看到Trace统计信息列表，包括Trace名称、此类Trace的总耗时、单个Trace的平均耗时、以及该时间段内该类Trace的触发次数等。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ce/v3/wUI4RPjuQ_WW2j8Bw67aNQ/zh-cn_image_0000002501070070.png?HW-CC-KV=V1&HW-CC-Date=20260313T051731Z&HW-CC-Expire=86400&HW-CC-Sign=2A6FF6E9CB03AD88FCDF41317DB7628944C5C8E2E9CC673460ED922641425628 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-cpu*