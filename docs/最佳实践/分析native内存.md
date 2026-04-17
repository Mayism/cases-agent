---
title: 分析native内存
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-native-memory-analysis
category: 最佳实践
updated_at: 2026-03-13T02:33:08.946Z
---

# 分析native内存

本文Native内存指的主要是代码中通过malloc、new、realloc、calloc函数申请的堆内存和通过mmap映射内存地址空间，Native内存是进程内存中占比较高，也是容易出泄漏问题的一种内存。分析Native内存分布与占用问题需要借助工具，以及一些测试，分析技巧。DevEco Studio Profiler插件的Allocation模板，通过对基础库的malloc，free等函数进行插桩记录，可以抓取Native内存分配释放记录，包括大小和堆栈等数据，用以分析native内存的占用问题。

## 日志获取

**DevEco堆内存分配/释放抓栈说明**

DevEco Studio Profiler插件的Allocation模板可以帮助用户分析堆内存分配、释放的信息，memory mapping信息，调用栈信息。这些信息中包括已释放内存和未释放内存。具体使用步骤如下：

1.  打开IDE后，选择Profiler;
2.  点击Allocation选项;
3.  点击Create Session创建录制频道;
4.  配置过滤选项, 选择Native Allocation;
5.  配置抓栈属性;
6.  点击录制按钮，开启调优。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/hE0juUhPTUm-xr2_8TEldA/zh-cn_image_0000002404045161.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=8D7B81D560C01F2C398C0D0CFDD7C180D6B2BE945B7E3C87E3A414B79F47E4BA "点击放大")

注意

1.  **谨慎同时录制ArkTS Allocation****：**由于Native Allocation和ArkTS Allocation同时录制会出现性能问题，建议在录制Native Allocation之前在第四步过滤选项中设置过滤ArkTS Allocation。
2.  **无法录制非[debug版本应用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/performance-analysis-kit-terminology#debug版本应用)：**当前规格仅支持抓取debug版本应用的native栈。如果抓取非debug版本应用，则获取不到栈信息。
3.  **留意录制按钮旁边的小火箭：**选中后，调优时进程会重启。如果需要录制进程从启动开始分配native内存情况，可以在点击录制按钮前选中小火箭。

**DevEco Studio Profiler插件Allocation模板抓栈功能配置属性说明**

针对上节操作中第五步配置属性，对各属性进行介绍

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/11/v3/WOIa-FoXSTieODx1OWy0LA/zh-cn_image_0000002370565332.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=3975392772B2EA406A4893EC20D85F28DF93B72741C14830D39CBBBB4A65E3ED)

-   Statistics Mode：开启统计模式， 此处表示10秒之内相同的调用栈会被累计在一起，在IDE上只显示一个栈，及出现次数，还有该栈总共未释放的内存。不会记录单次调用栈。关闭统计模式时，会详细记录每次内存分配栈出现的时间。对性能要求比较高的场景，可以选择开启统计模式。
-   Sampling Intervals：开启统计模式按钮才使用的参数，表示统计模式的统计间隔。
-   Filter Size：此处表示小于1024 byte的分配内存操作会被过滤，不被记录。
-   Backtrace Mode：表示回栈方式。开启FP回栈时，回栈效率高，性能较好。开启DWARF回栈时，在寄存器复用及编译优化等场景无法使用fp回栈时能够精确入栈、出栈。
-   Record JS Stack：开启JS回栈。可以抓到从JS层走到Native层分配堆内存的调用链。
-   Backtrace Depth：回栈深度，DWARF回栈时表示栈的总大小，FP回栈时表示native栈大小。

## 分析思路

在分析DevEco Studio Profiler插件的Allocation分析模板的数据时，通常框选All Heap一栏来分析堆内存数据。All Anonymous VM一栏展示的是匿名内存分配，通常是mmap、 munmap函数申请和释放的内存，这些大都是进程自动进行的，开发人员难以控制。

**内存分配统计信息**

选中Statistics这一栏后，可以看到抓栈期间进程分配Native内存的大小。可以在Total一栏中看到进程分配的总内存。

在Persistent一栏看到进程分配但未释放的总内存。除此之外，还可以看到内存分配size聚类的信息，并根据需要进行排序查看。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cd/v3/5V8WJqHdQeysJoD_x6HhIg/zh-cn_image_0000002404124993.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=D4688583CA1BD22648482986A8F9C272A0C9DDD22345B8BBA214D7002D0623A5 "点击放大")

**调用栈信息**

选中Call Trees这一栏后，可以展开需要分析的栈，栈从上到下即调用链的顺序，栈底一般是operator new函数。下图中绿色部分为ArkTS栈，在开启Record JS Stack开关后可以抓到。可以根据需要选择展示已释放或者未释放部分的内存，并可以搜索需要过滤的符号。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ac/v3/UWHzq9oGRh6rUzLqkKC-Ug/zh-cn_image_0000002370405444.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=E6E8476A5E84DE0F206FB5CA298494090973D5E231617F12DB72AC9EE578D6A3 "点击放大")

**统计模式信息**

在使用统计模式时，抓取的信息进行了精简化，不会展示每次调用栈具体时间，而是周期性聚类展示。所以不会展示周期内Native内存分配变化情况。可以通过下图Count看到栈出现的总次数和总大小。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a9/v3/-oG-tfhnSmuI-S3SEpSdhA/zh-cn_image_0000002404045165.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=D70D8B8E5A900454F9261D8C645688EEF6E233E112F7B3F940DA8F83C15EF500 "点击放大")

## 分析步骤

使用Allocation模板抓到trace之后，可以参考以下分析方式。

1.  内存分配Top线程分析：选择Created & Existing后，在Call Trees一栏可以看到不同线程未释放内存的情况，可以从内存泄漏较多的线程入手进行分析。在Allocation List中可以搜索线程名来进一步分析调用栈。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9e/v3/eFp2vMThT3Kk6J3O1jWOwg/zh-cn_image_0000002370565336.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=CCF88B8E17D240C40531301A5462A3A309ACE7FE448A138AA3095E630E8388A6 "点击放大")
    
    当应用侧ArkTS/JS的代码逻辑触发napi调用然后在native层有内存分配的情况下，ArkTS/JS栈会传递到profiler端侧和native栈进行缝合，展示出一套完整的调用链。所以profiler不仅可以用来分析内存泄漏问题，还可以用来分析业务逻辑和调用关系。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0/v3/TmEDIGgoT1aqVvLXty3Nnw/zh-cn_image_0000002404125001.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=63B012DE9BFEEE4E8C7E6040F10BF8E97499FB0D0F6ABF23902C1DDD810D5C80 "点击放大")
    
2.  内存分配Top调用栈分析：在使用非统计模式抓栈时，在Allocations List一栏可以对所有调用栈分配内存的大小进行排序，着重分析分配内存较多的栈。如果调用栈中某些帧只有地址，没有符号，则需要导入带符号的elf文件，然后重新解析。导入的按钮在过滤选项旁边。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2/v3/krDBkuiJR42ml6XtQeSL5w/zh-cn_image_0000002370405448.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=5E2DDD97834779B7B694C9C1C789CD8A8ABE12B63574AE646EBC40A3D3C95FB6 "点击放大")
    
3.  分析具体调用链：在Call Trees树状图中或者Allocations List中，找到需要分析的调用栈后，可以在右侧Heaviest Stack中清晰看到具体的调用链，调用链从上到下展示了调用逻辑。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3e/v3/gMdPelMlT2qVBTKOMNOKQA/zh-cn_image_0000002404045169.png?HW-CC-KV=V1&HW-CC-Date=20260313T023302Z&HW-CC-Expire=86400&HW-CC-Sign=63148159B2B390F85E584BF8017C56F72F6ECE7169FEC271EF92A446966086D9 "点击放大")
    

## 常见问题:

问题：为什么抓非[debug版本应用](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/performance-analysis-kit-terminology#debug版本应用)抓不到数据？

解答: 由于安全限制，profiler不支持抓非debug版本应用。

问题：为什么Allocation分析模板抓到的堆内存大小比hidumper看到的native heap数值要小？

解答：Allocation分析模板采集到的是目标进程用户态通过malloc、mmap等堆内存分配函数分配内存的栈。内存延迟释放，线程缓存等不被统计，但包含在smaps的native heap。

问题：为什么非aarch64架构设备使用Allocation分析模板的fp回栈方式抓取的数据有异常？

解答：Allocation分析模板的fp回栈暂不支持调优非aarch64架构的设备。

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-native-memory-analysis*