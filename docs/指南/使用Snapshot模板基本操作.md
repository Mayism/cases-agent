---
title: 使用Snapshot模板基本操作
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-snapshot-basic-operations
category: 指南
updated_at: 2026-03-13T05:16:13.786Z
---

# 使用Snapshot模板基本操作

## 查看快照详情

1.  创建Snapshot场景调优分析任务，操作方法可参考[性能问题定位：深度录制](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/deep-recording)。
    
    说明
    
    -   在任务分析窗口，可以通过“Ctrl+鼠标滚轮”缩放时间轴，通过“Shift+鼠标滚轮”左右移动时间轴。或使用快捷键W/S放大或缩小时间轴，使用A键/D键可以左右移动时间轴。
    -   将鼠标悬停在泳道任意位置，可以通过M键添加单点的时间标签。
    -   鼠标框选要关注的时间段，可以通过“Shift+M”添加时间段的时间标签。
    -   在任务分析窗口，可以通过“Ctrl+, ”向前选中单点的时间标签，通过“Ctrl+. ”向后选中单点的时间标签。
    -   在任务分析窗口，可以通过“Ctrl+\[ ”向前选中时间段的时间标签，通过“Ctrl+\]”向后选中时间段的时间标签。
    
2.  设置Snapshot泳道。
    
    单击任务左上角的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/DOIDVr-nSGKf5igaKYOWgQ/zh-cn_image_0000002501070272.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=09E15CF5AEE5E8FAD17ACA936C4E486835A142DFCAB5B7D71C61D335962A33A1)进行泳道的筛选，再次单击此按钮可关闭设置并生效。
    
3.  单击ArkTS Snapshot泳道的“options”下拉列表，可以设置是否需要抓取基础类型number的数据。默认不抓取。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7a/v3/EbHMOz68Scqc2nqTjPzPYg/zh-cn_image_0000002501070264.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=81964BC195C7B58F62B59A670992CC8E0B8C88942530CCA23A848BDBE3F5CA3F)
    
4.  开始录制后可观察Memory泳道的内存使用情况，在需要定位的时刻单击任务左上角的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/v0GE8JYTTviAt3gnrVhwVQ/zh-cn_image_0000002532670347.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=C52C64854255AFB58DFD7B501B475F5036A5B8A608F988E72CDEE497CF1DFDA3)启动一次快照。
    
    “ArkTS Snapshot”泳道的紫色区块表示一次快照完成。
    
    说明
    
    -   在任务录制过程中，单击分析窗口左上角的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6b/v3/R7kAxxb2SKGCNPubQvIoew/zh-cn_image_0000002501070270.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=3BFB7E523ECA425267AE4AC07F3E9B5037D78196A7551F753F33DF72E119B516)可启动内存回收机制。
    -   当方舟虚拟机的调优对象的某个程序/进程占用的部分内存空间在后续的操作中不再被该对象访问时，内存回收机制会自动将这部分空间归还给系统，降低程序错误概率，减少不必要的内存损耗。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e8/v3/BGn6V9AoTEOolzi5Z_h4iw/zh-cn_image_0000002500910408.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=9095AF4DE4935A307DE0F6738925F4EE6C5388C62062D6F3AA3BF7151D7FF9A9 "点击放大")
    
    在“Statistics”页签中显示当前快照的详细信息：
    
    -   Constructor：构造器。
    -   Count：该对象的数量。
    -   Distance：从GC Root到这个对象的距离。
    -   Shallow Size：该对象的实际大小。
    -   Retained Size：当前对象释放时，总共可以释放的内存大小。
    -   Native Size：该对象所引用的Native内存大小。
    -   Retained Native Size：当前对象释放时，总共可以释放的Native内存大小。
    -   带![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/33/v3/OuHtdR-oQgWjRlY-TFrspw/zh-cn_image_0000002500910410.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=7ACFA565DB87D2A1A03A1DBFDF90E538FF5C4800CD423F752EA4C7FA5292B17A)标识的对象，表示其为全局对象，可以通过全局window对象直接访问。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/76/v3/ba-3OGH-TzOS6zafainpZQ/zh-cn_image_0000002532750273.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=C89600EBA934E6F2633022AE047B7723962925702877B4549B8C2D9EDBE5EA48 "点击放大")
    

## 应用对象名称解析

方舟系统目前有方舟应用对象、系统内部框架对象、其他JS对象三类对象，从DevEco Studio 6.0.0 Beta1版本开始，支持对应用对象类的名称进行解析，帮助开发者快速定位问题所在的源码位置，从而提升问题定位效率。

1.  系统内部框架对象：用于描述HarmonyOS操作系统底层框架的核心对象，提供基础系统能力。为方便开发者查看，当前在Statistics中此类对象均归类到（framework）构造器节点下。此类对象均以\_GLOBAL开头。
2.  方舟应用对象：用于表示HarmonyOS应用中的具体组件、模块或资源。方舟应用对象需按照以下格式命名展示：
    
    ```swift
    com.example.app/MainModule@1.0.0/src/main/ets/MainPage.ets#MainPage(line: 10)[MainModule] //格式为BundleName/SelfModule@Version/FilePath/File#Class(line: xx)[RefModule]
    ```
    
3.  其他JS对象：用于描述方舟运行时中与JavaScript引擎相关的对象，提供JS语言层面的基础能力。例如：JSArray、JSSharedObject等。

在 Snapshot分析模板中，支持在Attributes页签点击方舟应用对象名称查看当前所选方舟应用对象的解析结果，便于确认问题出现的位置。各参数含义如下：

-   Module：模块信息。
-   Class：属性名称。
-   Path：编译后的源码路径。支持通过点击属性名称旁边的![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4a/v3/LQxRStC1QrW-FWbcn-Rx3A/zh-cn_image_0000002501070246.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=1DCED39EBD868573B902D52AADA0F0B48082654C836DE0641ACBC59E73F7CA2A)图标直接跳转至工程中的代码位置，方便开发者快速调试。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b2/v3/WJf6T5iYTEmhOE0LHtFTqw/zh-cn_image_0000002500910400.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=DC545865858458C9C5A52396DE3C5B04041FA6CCFAA96FA1C60C025B8BBB91EA "点击放大")

若应用编译模式是release，且启用了源码混淆，方舟应用对象将展示混淆后的数据。支持在Attributes页签查看当前所选应用对象的源码信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/26/v3/G7wL8xZWQ8KIGhETWgnAKw/zh-cn_image_0000002532750285.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=D15246B34BEE347B5B46A82304BAEDD1AD284342205B643F2082EF8F559ADEDA "点击放大")

说明

-   确保工程代码路径与解析信息匹配，否则跳转可能失败。
-   系统内部框架对象（framework）仅提供基本信息，不支持跳转。
-   对象名称后的line=0时表示无效行号，不支持跳转。

## 节点属性与引用链

在“Snapshot”的“Statistics”页签和“Comparison”页签中，所有实例对象节点展开后会显示"<fields>"以及"<references>"，这两项节点分别代表该实例对象的属性以及该实例对象的引用链信息。

在“Snapshot”的More区域则展示“Fields”和“References”两个页签，分别代表Detail区域所选择对象的属性以及引用链信息，方便快捷查看所选中对象的属性等详细信息，而不需要跳转至对应对象。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/db/v3/Cz2qMAwYTPCez-G8tlw5jA/zh-cn_image_0000002500910418.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=DF338A1A558EC234E0DAFA662A3D23419D2384E08F772627E0F77276847446BC "点击放大")

## 节点跳转

在“Snapshot”的“Comparison”页签中，查看内存对象、对象属性及其引用链时，若要查看某一对象的详细信息，可以单击该对象所在行行尾的跳转图标跳转至该对象所在的“Statistics”页签并定位至该对象所在的位置，以查看该对象的详细信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/88/v3/0ntHmPxBRviRqmRVGLLXVA/zh-cn_image_0000002500910402.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=8525EDE801F705E8A4B2D49E5E007974B6978AA563E7C5383291E93B7C9D0384 "点击放大")

## 历史节点前进/后退

当在“Comparison”和“Statistics”之间进行节点跳转后，单击详情区域左下角的左右箭头可以前进或者后退至下一个或上一个历史节点，以便快速在多个历史节点之间跳转查看。当箭头为激活状态时，表示前进/后退功能可用，当箭头为灰色状态时则代表无法使用该功能。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/08/v3/QKb6pJ3qRX2jSP_DoJuX-Q/zh-cn_image_0000002500910414.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=617CEBF203D663A22D01C4F65C7282F47505380F130DE20802BE5E4A256BB597 "点击放大")

## 比较快照差异

在“Snapshot”的“Comparison”页签中，以当前选择的快照为base，下拉框选择的快照为Target，即可得到两次快照信息的比较结果。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b3/v3/BTkBz7PcSu6wUmLKGfMWZQ/zh-cn_image_0000002501070260.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=B96AA7A8E46FD2E44F395F6CBCF81EA5ED261C5DB217E21A9EBA2F968A2B24AF "点击放大")

在“Snapshot”的“Comparison”页签中，可进行两次快照的差异比较，比较内容包括新增数、删除数、个数增量、分配大小、释放大小、大小增量等等。通过不断对比，可快速分析和定位内存问题的具体位置。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/PF5mGAoIRQqqQrVqyX45IQ/zh-cn_image_0000002532670321.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=560BDF97C5ED582D265BC8F768EC9E31B11EE3AC3E094B354996AE09FFE29D35 "点击放大")

## 引用链向最小引用距离展开

Snapshot分析支持一键向引用链最小的引用距离方向展开。系统会计算从GC Roots垃圾收集器根到选定实例对象的最短路径（最短路径是指Distance逐渐-1的路径，最终抵达Distance = 1的节点），通过最短路径，能够清晰地看到该对象的句柄被哪些对象持有，快速定位问题产生的根源。

选择一个实例节点，底部搜索栏的Path to GC Root按钮呈可点击状态。点击该按钮选择搜索模式并确认，系统会计算从GC Roots到选定对象的最短路径，并在右侧区域展示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/W4dK6k4DSuG7rv9UOXHH8w/zh-cn_image_0000002501070266.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=297BEDEA9DEF10CA46163240FAC7CD9CDCB60634DFF84DFCDE688597C66BF2B6 "点击放大")

目前支持单根路径搜索、指定数量的根路径搜索和展示所有根路径三种搜索模式，默认为单根搜索。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7c/v3/EsMSkRHDRB2NiGyk9ayAHA/zh-cn_image_0000002532750277.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=8DC53F99CC7A30E37D6E25A80258CF21543E9CEC63428FA2E47B850C034FB04B "点击放大")

设置完搜索模式后点击OK，右侧more区域会自动跳转至Shortest Paths页面展示搜索结果。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3b/v3/3sY_DROyTAKl-NEBSOlDtQ/zh-cn_image_0000002532750283.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=292591D116753738DA5602DB4114028F3A6C6B513CAFB7E6F90B5DC70F6C5B4E "点击放大")

## 引用链可视化

从DevEco Studio 6.0.0 Beta1版本开始，Snapshot模板支持将所有引用链以图表形式展示。系统会计算该节点周边的引用节点，并以关系图的形式清晰展示该对象的引用关系，便于定位问题产生的根源。

选择一个实例结点或reference引用关系节点后，底部搜索栏的**Visualization**按钮呈可点击状态。点击该按钮，配置搜索模式后，系统会计算该节点周边的引用节点，并跳转到Graph页签进行展示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1b/v3/iYqTi4yWRLeo57s3DnAxOg/zh-cn_image_0000002500910424.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=EBE373D629CC47E8E3B4F5B75671557BFC082272E56897072FBAA13B0CD4C162 "点击放大")

目前支持最多展示30个周边节点，默认展示20个。当前支持以下两种优先级的引用链展开方式：

-   Retained Size：按照Retained Size从大到小展示周边节点。
-   Distance：按照Distance从小到大展示周边节点。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a4/v3/Sd-dUUVgSYmnRYz-QpIUBA/zh-cn_image_0000002500910404.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=7AE030496E821DD5418B4444A7C13B823759CD7FE9BB829B2009D0B9EDD06D91 "点击放大")

设置完搜索模式后点击OK，底部页签会自动跳转至Graph页面展示搜索结果，红色标示的是中心节点，线段展示连接的两个节点之间的引用关系。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b/v3/LdNcpbqjQf22g8-9aOkPiw/zh-cn_image_0000002532670345.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=AFED5150BFEB3E17832F8E0C93F3F3DAA23E633A01F5C7760317A3751823891B "点击放大")

支持选中节点，右侧的More区域将展示该节点的详细信息，包括Fields、References和Shortest Paths三个页签。当鼠标悬浮在图形上的节点或线段时，悬浮框将展示对应的详细信息。图形区域支持拖动查看，使用Ctrl+鼠标滚轮可对图形进行缩放。

当在节点点击右键，展示的菜单列表包括以下选项：

-   **Show More References**：展示当前节点更多的引用链。配置搜索模式后，重新生成以该节点为中心的引用链图形。
-   **Show Path to GC Root**：展示当前节点到GC Root的路径。选择搜索模式后，重新生成以该节点为中心到GC Root的引用链图形。
-   **Redraw with this node**：以该节点为中心重绘。
-   **Reveal in Statistics**：在Statistics页面中显示该节点。
-   **Clear Diagram**：清空当前图表中的所有内容。且清空底部栏的激活状态。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fa/v3/fAh4TjMmSNGKXhTDnAwa0Q/zh-cn_image_0000002532750287.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=CFC91569177FA57E4679B3F8CF2120BCB0C9CD4A576189F08C7E2CDB96887A17 "点击放大")

点击**Show More References**、**Show Path to GC Root**和**Redraw with this node**选项后，单击详情区域左下角的左右箭头，可以前进或者后退至下一个或上一个历史图形，以便在多个（最多三个）可视化图形之间跳转查看。当箭头为激活状态时，表示可用，当箭头为灰色状态时则代表无法使用该功能。![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1c/v3/at-bvjPzS-uofIhYbvosqg/zh-cn_image_0000002501070256.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=2849E108622D37AB498566C7947F9E9DA4CE4C56957A54D474693236F4B9EC41 "点击放大")

## 离线导入内存快照

DevEco Profiler支持离线导入内存快照功能，可导入一个或多个.heapsnapshot及.rawheap文件。

您可以在DevEco Profiler主界面的“Create Session”区域中，单击“Open File”，导入.heapsnapshot或.rawheap文件。

说明

-   导入的单个文件大小不超过1.5G。
-   批量导入的文件数量不超过10个。
-   .rawheap文件是应用发生Out of Memory现象时产生的原始内存文件。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cd/v3/L-RgaIRYSv-_DYiYNSAvcw/zh-cn_image_0000002500910406.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=8A5C5ED90C1C7B0565BD0B43144016F284090319B03D9201A84514B8DE6C6EFA "点击放大")

离线导入内存快照成功后，可以导入与.heapsnapshot或.rawheap文件匹配的.jsleaklist文件，展示jsleakwatcher监控采集到的内存泄漏对象。

说明

-   导入的单个jsleaklist文件大小不超过30M。
-   导入的jsleaklist文件通过文件中的hash值与已导入的heapsnapshot文件匹配。
-   可多次导入不同的jsleaklist文件，也可同时导入多个不同的jsleaklist文件，重复导入不会覆盖已导入的匹配上的jsleaklist文件。总的导入匹配成功的文件数量不超过导入的heapsnapshot文件。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/98/v3/9jl1QlcYR_Ks7IAtoewI2A/zh-cn_image_0000002500910416.png?HW-CC-KV=V1&HW-CC-Date=20260313T051532Z&HW-CC-Expire=86400&HW-CC-Sign=70E03B3F08016BB9FFA33FF4BE198E07BF2BE9E778626BFC69DF0E0A88A92D3C "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-snapshot-basic-operations*