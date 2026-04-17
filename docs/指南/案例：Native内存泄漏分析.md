---
title: 案例：Native内存泄漏分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-native-allocation-case
category: 指南
updated_at: 2026-03-13T05:16:58.862Z
---

# 案例：Native内存泄漏分析

本案例介绍如何判断应用存在Native内存泄漏，以及如何通过Native Allocation泳道找出Native内存泄漏的原因。

## 初步识别内存问题

1.  使用实时监控功能（详细使用方法请参考[性能问题定界：实时监控](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/realtime-monitor)）对应用的内存资源进行监控。正常操作应用，观察运行过程中的应用内存变化情况。当在一段时间内， 应用内存没有明显增加或者在内存上涨后又逐渐回落至正常水平，则基本可以排除应用存在内存问题；反之，在一段时间内不断上涨，且无回落或者内存占用明显增长超出预期，那么则可初步判断应用可能存在内存问题。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e2/v3/GjQrZ8T9SM-9gcbJ-dQMig/zh-cn_image_0000002532749749.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=B976374288224E1B022C4F7235DE542CD6550ADAAED3D46A1EA06ACE6BE03A38 "点击放大")
    
2.  当从实时监控页面初步判断应用可能存在内存问题后，可以使用Memory泳道来抓取应用内存的详细数据以及变化趋势，初步定界问题出现的位置。Memory泳道存在Allocation或Snapshot模板中，使用Allocation或Snapshot模板录制均可。
3.  创建模板后，将模板中的其余泳道去除勾选，仅录制Memory泳道的数据。
    
    说明
    
    其余泳道会开启对内存分配、内存对象等数据的抓取，这些功能会带来额外的开销，可能会对我们初步定界问题产生影响，建议先排除录制。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/46/v3/fjBotXnmTB6pIXEYi5b2Lw/zh-cn_image_0000002532669809.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=DE69BF576164CFB009A09E2F0F6D6DF6AFB8B20C602BD82888D5E52AB813548F)
    
4.  点击三角按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c3/v3/xaFriPyHQfq4dsnm4wfqmQ/zh-cn_image_0000002500909900.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=6A21525913B7BC8AD8A5545FC822FD97C44FDA6B50533170579DDF1E3321792A)即开始录制。
5.  录制过程中，不断在问题场景操作应用功能，放大问题便于快速定界问题点。
6.  点击下图中方块按钮或者左侧停止按钮结束录制。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/dGSV82txTY-zlplujNh6kw/zh-cn_image_0000002501069748.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=9039E2C7E83E15C8A999A46372BDED45399F3F8A9C4C60E5B10B637E6D265A7B "点击放大")
    
7.  录制完成后，展开Memory泳道，其中ArkTS Heap表示方舟虚拟机内存，这部分内存受到方舟虚拟机的管控。Native Heap表示Native内存，主要是应用使用到的一些涉及Native API所申请的内存以及开发者自己的Native代码所申请使用的堆内存（通常是C/C++），这部分内存需要开发者自行管理申请和释放。
    
    当ArkTS Heap有明显的上涨，说明在方舟虚拟机内的堆内存上可能存在内存泄漏，可以使用[Snapshot模板](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-snapshot-basic-operations)进行下一步分析；当Native Heap有明显的上涨，说明Native内存上可能存在内存泄漏，可以使用[Allocation模板](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-native-allocation-case#section776643810160)进行下一步分析。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/_7gtPyWxTfy0Todvn-vqoQ/zh-cn_image_0000002532669803.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=6DE542C1645AF1F805A92C4C1FBEBC3B54358FDE777840C1053B537D68595D7D "点击放大")
    

## 使用Allocation模板分析Native内存问题

### 录制Allocation模板数据

1.  连接设备后，点击应用选择框选择需要录制的应用，选择**Allocation**模板，点击Create Session或双击Allocation图标即可创建一个Allocation的录制模板。
2.  创建模板后，点击三角按钮即开始录制。
    
    说明
    
    如果要分析启动内存，单击Allocation任务后的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7c/v3/KRn-3-5gR62fPJ99IgqMIg/zh-cn_image_0000002500909894.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=D5CF1001B74DC5D7B1B604539CFB8EF89EFE0EB7AE2FAAA3F1D13DC55615C83F)按钮。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8f/v3/2D9vsKF5SAqkekgB5zPnJw/zh-cn_image_0000002501069742.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=CD61ECD3B10C8ED5BE70DC11766C42A40DFFE53450F51CCEFC3BA84CE7B99397 "点击放大")
    
3.  操作应用复现问题场景，并在问题复现完成后，点击下图中方块按钮或者左侧停止按钮结束录制。
    
    说明
    
    默认使用统计模式采集数据。该模式下工具的采集性能更好、负载更低。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/er2es7O-SOqi0Rv701wZ9A/zh-cn_image_0000002532749759.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=6F8387193F2A7D3F3D1543CD0C46F5574EB46DEC3CCBB18C1801B9C2C2124741 "点击放大")
    

### 分析Native数据

1.  框选Native Allocation泳道或子泳道。两个子泳道All Heap和All Anonymous VM分别代表使用malloc和mmap函数分配的内存情况。

2.  在下方详情区的“Statistics”页签中选择Created & Existing。
    
    -   All Allocations：框选的时间段的所有分配内存信息。
    -   Created & Existing：在框选范围的起点之后分配的，且在框选范围的终点之前没有释放的内存数据。
    -   Created & Released：在框选范围的起点之后分配的，且在框选范围的终点之前已经释放的内存数据。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/KanGx45gRWyRs1Cahji3nQ/zh-cn_image_0000002532749751.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=7F0ACACAC5FB0CABF762B83F20076EA6CE481BDBF5DCF88F530F6805CAF9ADB7 "点击放大")
    
3.  切换到“Call Trees”页签，该部分数据展示了详细的内存分配栈信息，同样需要选择Created & Existing。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/67/v3/F-Vwo_WxT0yq_xlw5GCPpg/zh-cn_image_0000002532749765.png?HW-CC-KV=V1&HW-CC-Date=20260313T051619Z&HW-CC-Expire=86400&HW-CC-Sign=3866D8F51844360938786099F6AF058F42EB709B41F7AB012BBD77E3AD34E5EE "点击放大")
    
4.  优先在内存分配栈信息中寻找与业务代码强相关的Symbol Name，即Category中为亮色。从上图中看，主要泄漏点在业务代码侧，需要结合业务代码进行分析。
    
    说明
    
    -   Category中亮色代表开发者调用栈，灰色代表系统调用栈。
    -   栈帧中主要为 Native 栈，除了应用本身编译的一些so及带有部分接口信息的so信息外，其他系统库部分仅展示so库与函数偏移信息，若需要查看这部分信息，需要导入相应版本的带符号的 so 库（具体参考[离线符号解析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-data#section11376118192614)）。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-native-allocation-case*