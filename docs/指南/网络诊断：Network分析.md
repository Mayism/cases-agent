---
title: 网络诊断：Network分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-network
category: 指南
updated_at: 2026-03-13T05:17:34.966Z
---

# 网络诊断：Network分析

DevEco Profiler提供Network模板，帮助用户在应用运行过程中查看http协议栈网络信息和网络流量信息，http协议栈包括请求分段耗时以及请求具体内容，方便对网络问题进行调优。请求耗时按照以下五种阶段进行划分：DNS 解析、TCP连接、TLS连接、请求等待、接收响应，分别展示在各阶段的耗时，可以针对性的优化时延问题。同时，详情信息将展示每个请求中携带的信息，包含request、response侧及其携带的header、body、cookie信息，方便网络问题定位。

说明

-   当前Network模板任务仅支持对Network kit接口中request 类型接口进行录制和调优。
-   由于隐私安全政策，已上架应用市场的应用不支持录制Network分析模板。

## 查看网络流量消耗信息

1.  点击Network Traffic泳道，可在下方数据区查看录制过程中发生的网络流量消耗情况。Summary区域可以查看按照网络接口(Network Interfaces)维度统计每个类型的流量消耗，展示信息包含平均下行流量、下行总流量、下行数据包数、平均上行流量、上行总流量、上行数据包数。![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3f/v3/ydAhL7_jSMaZ3ydWCVOEoQ/zh-cn_image_0000002532749843.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=9A0F45408241BBA40E8BE822CD21BA422ABC2997AEA96C8D4EC7ED5DDEBB872B "点击放大")
2.  Details区域将展示按时间戳排序的周期上报的网络数据，每个网络数据包含上报时间戳、持续时间、下行流量、下行流量包数、网络数据类型、上行流量、上行流量包数。![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/11/v3/eA_Msmm5SReorpqHMRs95Q/zh-cn_image_0000002500909982.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=C1ABF9806F209EDAA6126B71DF700E4527C9A8AD76620E80AEED9235FF96EF26 "点击放大")

## 查看网络请求各阶段耗时

1.  创建Network模板任务并录制相关数据，操作方法可参考[性能问题定位：深度录制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/deep-recording)，或在会话区选择**Open File**，导入历史数据。
2.  录制结束等待处理数据完成。点击Network Request泳道，可在下方数据区查看录制过程中发生的网络请求数量变化。Summary区域可查看按照域名(Domain)维度统计展示网络请求耗时，展示信息包含Domain、线程名称、数量、平均耗时、最大耗时、DNS解析/TCP连接/TLS连接/等待响应/接收数据平均耗时、DNS解析/TCP连接/TLS连接/等待响应/接收数据最大耗时。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c9/v3/0f7jfoT2QjSSseB1lfWSNw/zh-cn_image_0000002500909980.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=532D55787C35F6AA83C0F44AF64B5828E384294EFBC018387EEF97E66877DFEA "点击放大")
    
3.  选择任意Domain，Details区域将展示请求该Domain的所有网络请求耗时，展示信息包含请求ID、线程名称、请求url、重定向url、IP地址、总耗时、DNS 解析耗时、TCP连接耗时、TLS连接耗时、请求等待耗时、接收响应耗时、请求类型、状态码、使用的版本。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/15/v3/EGnkjKG-QFuN7PEwMkMMIA/zh-cn_image_0000002501069820.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=510E17F0F812A3019039D8D5713178725522ED80F72E2A4737392F8BE19D2400 "点击放大")
    
4.  选择Details中某条数据，泳道区域将以虚线框选展示其耗时方块。同时，右侧More区域展示该请求的Request Headers、Response Headers、Response Body。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ae/v3/noysPmBRTaqzoPOaN8hrHQ/zh-cn_image_0000002500909976.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=98195732C276470EEB1E0409499F279B3DD649088B5B0B9C3E1C62C3CD6A52B1 "点击放大")
    
5.  定位到可能造成网络卡顿的网络请求，点选其耗时方块，可以看见该请求各阶段耗时。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/djSM5ZUcQduyzOzDFKyehA/zh-cn_image_0000002501069826.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=5B43778D72909B6578EF41A0F4A5F7A889459257D40697AF2D645D891F52C833 "点击放大")
    

## 分析启动过程网络问题

DevEco Profiler的Network分析任务，提供了启动过程网络问题分析能力，协助开发者解决启动过程的网络问题。

针对调测应用的当前运行情况，DevEco Profiler对其做如下处理：

-   如选择的是已安装但未启动的应用，在启动该分析任务时，会自动拉起应用，进行数据录制，结束录制后可正常进入解析阶段。
-   如选择的是正在运行的应用，在启动该分析任务时，会先将应用关停，再自动拉起应用，进行数据录制，结束录制后可正常进入解析阶段。

具体操作方法为：在任务列表中单击Network任务后的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/26/v3/P9UqY6QiQqGAffgylO0L6w/zh-cn_image_0000002532669903.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=523AA316F6F11C3B8F0810BC7A06D54A63DD2ED6B5BD23D09DAD9C51A493B9D3)按钮。

在分析结束后，呈现出的数据类型以及相应的处理方法，与非启动过程的分析相同。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-network*