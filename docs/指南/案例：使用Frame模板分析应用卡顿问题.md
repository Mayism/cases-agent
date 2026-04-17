---
title: 案例：使用Frame模板分析应用卡顿问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-frame-case
category: 指南
updated_at: 2026-03-13T05:15:39.334Z
---

# 案例：使用Frame模板分析应用卡顿问题

本案例介绍如何判断应用存在卡顿帧，再通过调用栈和trace信息分析应用运行逻辑，找出应用卡顿的原因。

应用卡顿分析基础功能请参考[Frame分析](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-insight-session-frame)。

## 分析步骤

分析应用卡顿类问题步骤如下：

1.  确认是否存在卡顿帧。
2.  若存在卡顿帧，根据调用栈和trace等信息进一步确定问题点。

## 分析Frame数据

### 分析应用是否存在卡顿

1.  框选Frame泳道，窗口下方的“Statistics”区域中会以进程维度对选定时间段内的Frame信息进行统计，当Jank Count大于0时，说明存在卡顿帧。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dc/v3/XQ6toHrvS-qbzUW0gS5p5w/zh-cn_image_0000002500910372.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=987214DC303D7FD65EF9AB91152025CD0D44491B8CFDA1C69F8E9C18F52E83A9 "点击放大")
    
2.  找到“Statistics”页签中存在卡顿帧的进程，点击进程名称后方跳转按钮，跳转到“Frame List”页签。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/ieMFZ9tyRqKSQbI0gA2tyg/zh-cn_image_0000002500910376.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=CC6E9F17CA8255BC2B2363C55BD8BEC3E749DE49AAEF99822B49B979A381E62C "点击放大")
    
3.  “Frame List”页签会展现该进程对应的Frame列表。在“Frame List”页签中对卡顿丢帧类型（Jank Type）进行升序排序，单击“Frame List”页签中任意一卡顿帧，直接跳转到该帧且泳道上该帧被反选。
    
    说明
    
    -   在“RS Frame”和“App Frame”标签的泳道中，正常完成渲染的帧显示为绿色，出现卡顿的帧显示为红色。
    -   AppDeadlineMissed：App侧的卡顿。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/87/v3/tkh-XfdtRAy9W_YSdEzM9A/zh-cn_image_0000002532750243.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=3081A3566CF1D6DB51390C77DBDE38DA03B44FA2844B4857B89BC41FA4D169A2 "点击放大")
    
4.  点选该卡顿帧，窗口下方的“Details”区域中显示卡顿帧的关键信息。右侧应用进程前方跳转按钮可以跳转到应用进程Trace。
    
    -   Expected Duration：一帧绘制的期望耗时。与fps的大小有关，如fps为120，对应的Vsync周期为8.3ms，即App侧/Render Service侧的帧耗时，一般需要在8.3ms以内。
    -   Actual Duration：一帧绘制的实际耗时。
    
    如下图，可以看到该帧的期望耗时为8ms 330μs，实际耗时为44ms54μs，远远超过了期望耗时，因此被识别为卡顿帧。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/55/v3/ZMhaSj6nQNCgBHO-CnIBPA/zh-cn_image_0000002500910378.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=5033CE86C26A1742E7356BD38BAC4AA00A8ECB65E1DE85951FEEBD6D5725748D "点击放大")
    
5.  框选该异常帧时间范围，结合ArkTS Callstack泳道、Callstack泳道和Trace等信息进一步分析异常点。

### 案例：分析应用卡顿原因

1.  找到并框选要分析的异常帧，查看ArkTS Callstack泳道分析ArkTS侧耗时函数。优先查看主线程调用栈，即线程号与进程号一致的ArkVM子泳道。可以看到ArkTS侧一些方法的耗时。
2.  查看下图调用栈，除(program)外，其他调用栈耗时小于一帧绘制的期望耗时8.3ms（被调优的设备fps为120），因此该卡顿帧主要分析调用栈(program)的耗时。
    
    (program)代表程序执行进入纯Native代码阶段，该阶段无ArkTS代码执行，也无ArkTS调用Native或者Native调用ArkTS情况，一般很难通过这里分析出有效的信息，需要切换到Callstack泳道看具体的调用栈信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/_n--fehuT-e46HbgiskmBA/zh-cn_image_0000002500910374.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=85EAE1FC1A9BB3FCD13CB93D45F9AC8B7E96EFC7C5C6C6A875964472B4EA781A "点击放大")
    
3.  切换到Callstack泳道，查看Callstack泳道的主线程（线程号与进程号一致）子泳道，滑动观察下方Heaviest Stack区域“%”列中占比最大的函数调用栈，Category中亮色代表开发者调用栈，灰色代表系统调用栈，可以看出下图中耗时主要在系统侧的so，无法识别具体异常原因，接下来进一步分析应用进程Trace。
    
    说明
    
    也可通过底部的“Call Trees”选择框来隐藏系统调用栈，减少干扰信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/hSbJaH9aTZOHYNmRwkDfcg/zh-cn_image_0000002532750245.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=184F5F1268E80048BECF104D070864ECF31723490F26A6452A090F9B7730608F "点击放大")
    
4.  切换到应用进程Process泳道，查看主线程（线程号与进程号一致）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8f/v3/v9sbax3ETBSeLhmIdxYSsA/zh-cn_image_0000002557362621.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=DF44C8AC19F748A4C1502227E5EF46BD9184B9854F2522833161E4DF843EC29A "点击放大")
    
5.  窗口下方详情区可查看到Trace统计信息列表，逐层展开耗时最长的Trace，定位到主要耗时是在3次H:CreateImagePixelMap。接下来进一步分析这3次H:CreateImagePixelMap耗时的原因。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fd/v3/ypfn4uIVRYCsQuTHOwJjHA/zh-cn_image_0000002501070224.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=BB31DA83F312B9D4639314A43D5AFFFAF288866FC5408DA78938CC6E7751AD30 "点击放大")
    
6.  H:CreateImagePixelMap和图片加载相关，再结合业务代码查看，可以看到是因为同步加载网络图片，建议修改为异步加载。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/43/v3/a2fx_hDZQ1Sl6i0m7eIsqQ/zh-cn_image_0000002532750251.png?HW-CC-KV=V1&HW-CC-Date=20260313T051458Z&HW-CC-Expire=86400&HW-CC-Sign=607FEFD148B6B8DF30843B8131E780D6F8BA279557E01C19560CE371DBBFF510 "点击放大")
    
    说明
    
    一般情况下，图片加载流程会异步进行，以避免阻塞主线程，影响UI交互。不建议图片加载较长时间时使用同步加载。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-frame-case*