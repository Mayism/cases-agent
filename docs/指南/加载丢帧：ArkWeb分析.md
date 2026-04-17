---
title: 加载丢帧：ArkWeb分析
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-arkweb
category: 指南
updated_at: 2026-03-13T05:17:30.670Z
---

# 加载丢帧：ArkWeb分析

应用开发过程中，会通过在APP中嵌入WebView以提高开发效率，可能面临ArkWeb加载和丢帧等问题。DevEco Profiler提供ArkWeb分析模板，可以结合ArkWeb执行流程的关键trace点来定位问题发生的阶段。如果问题发生在渲染阶段，可以结合H:RosenWeb数据，线程运行状态以及帧渲染流程打点数据，进一步分析丢帧问题。

## ArkWeb加载问题分析

1.  创建ArkWeb模板，完成一次录制，录制期间触发Web相关场景。
    
2.  定界Web问题发生的阶段，分析Web加载问题。
    
    根据Web页面加载过程中的关键trace点，划分了五个阶段，分别是：点击事件（Click Event）， 组件初始化（Component Initialization），主资源下载（Primary Resource Download），子资源下载（Sub-resource Download），渲染输出（Render And Output）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/Qz2_VEZ-QfmkJ30djyIYkA/zh-cn_image_0000002501070510.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=50008736587771E92A0883E223C0CE1D6481ED635C7C1D33C7EF08A9A886476F "点击放大")
    
3.  详情区可以跳转关键trace所在泳道，进一步分析加载问题。
    
    框选可以查看泳道的耗时阶段划分的关键trace点，并可以根据trace信息，关联到所在线程信息。
    

## ArkWeb丢帧问题分析

1.  ArkWeb子泳道聚合了Web相关线程的trace信息，通过分析Web渲染过程的关键函数的trace点，可以分析出每一帧的执行流程。聚合的Web线程信息如下：
    
    -   H:RosenWeb：用于记录准备提交给Render Service进行统一渲染的数据量。
    -   Compositor：合成线程，负责图层CPU指令合成，承载动态效果。
    -   CompositorGpuTh：用于从GPU获取渲染结果和将合成的buffer送至图形子系统执行渲染。
    -   Chrome\_InProcGpu：光栅化。
    -   VsyncGenerator：图形侧vsync信号，用于定时生成vsync信号，通知渲染线程或动画线程准备下一帧的渲染。
    -   VSync-webview：用于接收图形侧发送的vsync信号，并根据信号触发WebView页面的渲染或重绘。
    -   VizCompositorTh：绘制信号监听线程，向图形请求Web本身的vsync信号，触发系统Web相关绘制或执行。
    -   Web应用Render线程：以 :render 结尾的线程，主要用于图形渲染任务，包括html、css解析，进行分层布局绘制。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/26/v3/9FDXYWWhQL6_EGeCYhL5WQ/zh-cn_image_0000002500910676.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=F503CEFF0242C061F1A596ABB1AF279D348959DA449AB9DDE48373B67225AC95 "点击放大")
    
2.  一般结合H:RosenWeb泳道和Present Fence泳道来分析是否存在丢帧。H:RosenWeb上标识有待提交给渲染服务的数据量。正常情况下，每个数据量都会提交给硬件进行上屏，即Present Fence泳道上的H:Waiting for Present Fence trace点。如果某个数据量在Present Fence泳道上没有该trace点，那么很可能是存在丢帧问题。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a0/v3/A-HWiKZUSXu9M9yg7f760g/zh-cn_image_0000002532670585.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=7CD329CE1FD4050AE27F7A0A6C06AE7EA3E652D3260820F166DADB020648E99B "点击放大")
    

3.  在 ArkWeb 的子泳道中，Web应用Render线程提供了分析子资源加载各阶段具体耗时的能力。切换到 "Sub Resource" 页签，可查看详细信息。
    
    包括统一资源定位符、缓存类型、是否为本地资源替换、请求资源时间（ns）、队列时间（ns）、停滞时间（ms）、dns解析时间（ms）、连接耗时（ms）、ssl连接时间（ms）、服务器响应耗时（ms）、下载耗时（ms）、传输时间（ms）、请求方法、状态码、编码前资源大小、编码后资源大小以及HTTP版本。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/83/v3/rQ_nrj7JSmS4EErMeMt0QA/zh-cn_image_0000002501070514.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=A1BBF2F0983F04105D0FD45931C6107BC14C09E68A899B914F79B645E7A8456A "点击放大")
    
4.  点选某一行，可以查看该URL对应的缓存信息。包括缓存存在时长、最后修改时刻、过期时刻、缓存指令、资源的唯一标识符以及资源是否过期。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/YMAYnKzDRXO3zcdWmWIOvw/zh-cn_image_0000002532670587.png?HW-CC-KV=V1&HW-CC-Date=20260313T051652Z&HW-CC-Expire=86400&HW-CC-Sign=0ECF8CBC0B353F34C0F4C81F644B4CC736B1C9D97B7C7C5CFA1121A2C42BA1D1 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-profiler-arkweb*