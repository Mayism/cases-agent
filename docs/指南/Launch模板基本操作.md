---
title: Launch模板基本操作
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-launch
category: 指南
updated_at: 2026-03-13T05:15:39.917Z
---

# Launch模板基本操作

开发应用或元服务过程中，启动速度是很重要的一个指标。如果开发者需要分析启动过程的耗时瓶颈，优化应用或元服务的冷启动速度，可使用DevEco Profiler提供的Launch场景分析能力，录制启动过程中的关键数据进行分析，从而识别出导致启动缓慢的原因所在。此外，Launch任务窗口还集成了Time、CPU、Frame、Network场景分析任务的功能，方便开发者在分析启动耗时的过程中同步对比同一时段的其他资源占用情况。

此处仅介绍“Launch”泳道相关内容，集成的Time、CPU、Frame、Network场景分析任务的功能请参考对应任务的章节。

说明

-   不支持命令拉起的Release应用不能进行Launch分析。
-   锁屏状态下可进行Launch录制。

## 启动模式

启动模式分为![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/81/v3/OvUWyleHT_2QTjO5pgtOGQ/zh-cn_image_0000002532749931.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=46D91B80B48D3830837F16BCF43915E6A2D49B37A15DD2C19B2743EB8466390C)自动启动和![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fd/v3/vL1mX_-BR22SuxenXnL9hg/zh-cn_image_0000002500910060.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=CCDCDB79F8E2F653C9C9129708E829EE7B3028B43EA6A03E49D4E85D23DE34A7)手动启动，可点击图标切换两种不同模式：

-   若选择自动启动模式，当用户使用Launch模板并开始录制时，将主动重启所选应用；
-   手动启动模式在开始录制时，只会主动终止所选应用，等待界面出现弹窗提示启动应用后，开发者需要手动启动应用。

## 查看启动过程中各阶段的耗时情况

1.  创建Launch场景调优分析任务并录制相关数据，操作方法可参考[性能问题定位：深度录制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/deep-recording)，或在会话区选择**Open File**，导入历史数据。
    
    说明
    
    -   在任务分析窗口，可以通过“Ctrl+鼠标滚轮”缩放时间轴，通过“Shift+鼠标滚轮”左右移动时间轴。或使用快捷键W/S放大或缩小时间轴，使用A键/D键可以左右移动时间轴。
    -   将鼠标悬停在泳道任意位置，可以通过M键添加单点的时间标签。
    -   鼠标框选要关注的时间段，可以通过“Shift+M”添加时间段的时间标签。
    -   在任务分析窗口，可以通过“Ctrl+, ”向前选中单点的时间标签，通过“Ctrl+. ”向后选中单点的时间标签。
    -   在任务分析窗口，可以通过“Ctrl+\[ ”向前选中时间段的时间标签，通过“Ctrl+\]”向后选中时间段的时间标签。
    -   Launch分析支持离线符号解析能力，请参见[离线符号解析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-time#section186881175012)。
    -   Launch分析支持动效场景调优，请参见[支持动效场景调优](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-frame#section258014238619)。
    
    Launch分析任务支持在录制前单击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a5/v3/BEt6UHY1Q9m0E2Fyy8_bIQ/zh-cn_image_0000002532749927.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=7A842E4D3D125B8B21FB4080B84807A5E727DE3BDB6893B7018BC4CF37864E72)指定要录制的泳道。“Launch”泳道显示启动生命周期各阶段的耗时分布情况。
    
2.  单击“Launch”泳道上的单个阶段，或框选多个阶段，在下方的“Details”页签中，可查看到所选阶段的耗时统计情况。
    
    展开各阶段的统计信息折叠表，可以看到各个任务的具体耗时信息。单击跳转按钮，可直接跳转至相关线程打点任务中。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0c/v3/Jpweg2GfSAaeRoCR1k2kJg/zh-cn_image_0000002500910052.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=C90212B049F58CB699F43AD66E0BA5410EB0A3BE52D0BF7F1A4FCF8BF1B884D5 "点击放大")
    
3.  切换到“Load ETS Files”页签，从DevEco Studio 6.0.0 Beta1版本开始，支持查看冷启动过程中ETS文件的加载情况。各字段含义如下：
    
    -   Category：该ETS文件在应用启动过程中是否被使用。
    -   Weight**：**该ETS文件加载子节点文件（不包括自身）的总耗时。
    -   Self：该ETS文件自身加载的耗时。
    -   Import Count：该ETS文件被其他文件导入的次数。
    -   File Name：该ETS文件的名称。
    -   Path：该ETS文件构建产物的路径。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5b/v3/79cXciQnR_SztW2srNnaMg/zh-cn_image_0000002532749929.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=ED160A6B36048BF1CFEFD3AD0F05E4443BDA3F0709CFA8B9D366947412A342B6 "点击放大")
    
4.  切换到“TOP Redundant”页签，可查看冷启动过程中TOP 100冗余ETS加载文件信息。若File Name字段显示为蓝色，双击可快速跳转至对应工程源文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/W16tLwl5QqqtqbIsB4UKeg/zh-cn_image_0000002532669977.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=ECB7A905BEAA3459392842CFC3E90767580919FBF3B0A02F15EDA7C5539E05E5 "点击放大")
    

说明

已上架应用市场的应用，不支持使用Load ETS Files或TOP Redundant页签查看冷启动过程中ETS文件的加载情况。

## 分析静态资源库加载耗时

1.  展开“Launch”泳道，其中的“Static Initialization”子泳道展示启动过程中各静态资源库的加载耗时。
2.  单击单个静态资源库色块，或框选多个静态资源库，下方的“Details”区域展示所选对象的耗时统计信息。
    
    针对耗时超过预期的加载任务，可单击跳转按钮，跳转至相关线程打点任务中进行深度分析。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cd/v3/rjnJ3j8AQcWLAyL7EbVnwQ/zh-cn_image_0000002501069902.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=4128F80B867443411CCACE08C6E2A91A5746931C1FCB242D7C2151C87B52BD9B "点击放大")
    

## 查看核心线程在CPU Core的运行情况

1.  展开“Launch”泳道，其中的“Running CPU Cores”子泳道展示启动过程中的关键线程具体运行在哪个CPU核心。
2.  单击单个进程色块，或框选多个进程，下方的“Details”区域展示所选对象的运行情况统计信息。
    
    单击对应CPU的跳转按钮，可进一步跳转到CPU Core泳道查看详细的调度信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/83/v3/VWGlQ9YRQY-kYAnq7UlbPg/zh-cn_image_0000002532749933.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=2F1DB16876A296D5ED8155338EC3B24BCF7BE18B4D9D2EC1EA4AB227E94D6F22 "点击放大")
    

## 查看启动过程相关的线程Trace数据

1.  展开“Launch”泳道，除“Static Initialization”、“Running CPU Cores”外，还包含启动过程的关键线程的状态和Trace数据。
2.  单击单个切片色块，或框选多个切片，可查看所选对象的详情。
    
    -   “Details”区域对所选对象进行树状统计，显示任务的名称、起始时间以及耗时信息。
    -   “Thread States”区域展示线程的状态统计信息。
    -   “Thread Usage”区域展示线程的使用情况。
    -   “Slice List”区域展示所选对象的切片统计信息。
    -   “Load Statistics”区域展示所选对象的中载重载信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/anYvgncdQ6yfn-SB6nwgzA/zh-cn_image_0000002500910056.png?HW-CC-KV=V1&HW-CC-Date=20260313T051459Z&HW-CC-Expire=86400&HW-CC-Sign=784DFAA1CBD75CC47A1D1195BDCEBF21FD8EF49661A2EA6D137B47CD8436158E "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-launch*