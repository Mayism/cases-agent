---
title: 并行并发：Concurrency分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-parallel-concurrency-analysis
category: 指南
updated_at: 2026-03-13T05:17:37.190Z
---

# 并行并发：Concurrency分析

任务池（TaskPool）（详细信息请参考[@ohos.taskpool（启动任务池）](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-taskpool)）是为应用程序提供一个多线程的运行环境，降低整体资源的消耗、提高系统的整体性能，且您无需关心线程实例的生命周期。您可以使用任务池API创建后台任务（Task），并对所创建的任务进行如任务执行、任务取消的操作。

DevEco Profiler提供的Concurrency场景分析能力，帮助开发者针对并行并发场景，录制并行并发关键数据，分析Task的生命周期、吞吐量、耗时等性能问题。Concurrency模板支持展示ArkTS异步接口、NAPI异步接口、TaskPool、FFRT并发模型相关信息，并集成ArkTS Callstack、Callstack、Process信息，支持用户从Task生命周期关联到具体调用栈信息，方便用户定位并行并发性能问题。

## 查看Task统计信息

1.  选择展开某个泳道，可以用options下拉框筛选不同进程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7b/v3/fhfnR98GQYmy4QBAJJzFBA/zh-cn_image_0000002500910470.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=7F3C5C3BDCCEFD16F07980E5EE8EFD5606B5B50AC84BEDE0208F60F7727B4741 "点击放大")
    
2.  框选子泳道中某段时间范围，详情区会出现该时段内，泳道对应执行状态下，并行并发任务的统计信息。
3.  点击Task Name的跳转按钮可跳转到对应的Task泳道。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9a/v3/1N3bgJLaQiOaDhX_5X7GsA/zh-cn_image_0000002532750333.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=CACF69DB04BF9976D80AC4CB3912708D8D66009F563D5202AA5EB22E3FE10EF3 "点击放大")
    

## 查看某一个Task的所有状态

1.  选择展开某个泳道，可以用options下拉框筛选不同进程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/LaHXZDxoSU2aTsZ5z-2XvQ/zh-cn_image_0000002532670377.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=E5570578DE2AC2329DE6AE50271AAC3467A1A5B852B73B1F293DC327F868540A)
    
2.  框选子泳道中某段时间范围，可以看到该Task在框选时间范围内的任务状态。
3.  点击Task Name的跳转按钮可跳转到对应线程的泳道，可查看在该Task执行时间范围内，trace文件的打点信息，反映的是线程该时段内的函数执行情况。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ea/v3/5CgASNkJSOGuwlvFyqsu2Q/zh-cn_image_0000002500910462.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=33017EC71D2F78693C4FDA5BCADEBC9035648FC05F12F9E4E6959886A3FDB6D8 "点击放大")
    
4.  展开Async ArkTS泳道，可单独查看ArkTS异步调用任务详情。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3c/v3/yAPZa6ZzTxamiJslFVXk_g/zh-cn_image_0000002500910468.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=971D1AAB4F4CD2A42FA6E258A12AE8AFA6E10947D1726B95EE337105EA174116 "点击放大")
    
5.  展开Async NAPI泳道，单独查看NAPI异步调用任务详情。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/gNlRKQu4TieTuD_9jwykyA/zh-cn_image_0000002500910466.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=40A9204D0F064279F10F19FB0F86B74A1009D4F77302936F4EE4F787392BF0D8 "点击放大")
    

## 查看Task的某个状态

点击Task子泳道的某个执行节点，Details详情区里会出现task在该状态下的详细信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3f/v3/FJTv6l0ASCOy1LtYfEKTGw/zh-cn_image_0000002501070306.png?HW-CC-KV=V1&HW-CC-Date=20260313T051657Z&HW-CC-Expire=86400&HW-CC-Sign=187936697A60A22FE98A3C99E76B2A9B10424B81786B8D7F7BDFC6BBAD1E22D8 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-parallel-concurrency-analysis*