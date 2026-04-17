---
title: HiSmartPerf Device性能使用指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/smartperf-guidelines
category: 指南
updated_at: 2026-03-13T05:26:31.744Z
---

# HiSmartPerf Device性能使用指导

## 工具简介

HiSmartPerf Device是一款性能功耗测试工具，支持监测性能、功耗相关指标，包括FPS、CPU、GPU、RAM、Temp等，并提供Device hap端和Device daemon端。Device hap适用于有屏设备，支持可视化操作，测试过程中可通过悬浮窗的开始和暂停来实时展示性能指标数据，保存后可生成数据报告，在报告中可分析各指标数据详情。Device daemon端支持shell命令行方式，同时适用于有屏和无屏设备。

### 指标说明

-   CPU：每秒读取一次设备节点下CPU大中小核的频点和各核使用率，衡量应用占用CPU资源的情况，占用过多的CPU资源会导致芯片发烫。
-   GPU：每秒读取一次设备节点下GPU的频点和负载信息，衡量应用占用GPU资源的情况，当GPU占用过多时，会导致性能下降，应用程序的运行速度变慢。
-   FPS：应用界面每秒刷新次数，衡量应用画面的流畅度，FPS越高通常表示用户体验越好。
-   TEMP：每秒读取一次设备节点下GPU温度、系统芯片温度信息。
-   RAM：每秒读取一次应用进程的实际物理内存，衡量应用的内存占比情况。
-   snapshot：每2秒截取一张应用界面截图。

## 实现原理

下图展示了HiSmartPerf Device工具的主要功能组成。Device hap端设置好采集项和采集参数后，启动应用，FPS、RAM、Trace等指标通过消息发送给Device daemon端，Device daemon端进行数据采集、数据持久化和数据分析，将生成的报告回传给Device hap端，Device hap端进行可视化显示。

![](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20260126143804.56787313894696085896022305194264:50001231000000:2800:FB9BA26147BB3FAAEFB4620BEFFCEC698B2992CFE23E6E43791C32BC5728F3DB.png)

## 约束与限制

1.  Device daemon端从API version 9开始预置使用。
    
2.  Device daemon端执行需连接硬件设备，Device hap端需在有屏幕设备使用。
    
3.  Device daemon端和Device hap端执行前均需完成[hdc环境配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hdc)，并进入shell环境拉起daemon进程。
4.  Device hap端从API version 20开始支持自动拉起Device daemon端的功能。

说明

-   在使用可以自动拉起Device daemon进程的Device hap端时，点击性能/功耗测试，选择测试应用后，待hap端界面显示采集器连接成功，即Device daemon进程已被拉起。

-   **进入shell**

```shell
C:\Users\issusser>hdc shell
$
```

-   **拉起和查看daemon进程**（**手动拉起daemon进程**）

```shell
C:\Users\issusser>hdc shell
// 手动拉起daemon进程
$ SP_daemon
// 查看daemon进程是否存在
$ ps -ef | grep SP_daemon
shell          1584     1 0 21:50:05 ?     00:00:00 SP_daemon
shell          1595  1574 3 21:51:02 pts/0 00:00:00 grep SP_daemon
$
```

-   **拉起和查看daemon进程**（**自动拉起daemon进程**）

```shell
C:\Users\issusser>hdc shell
//查看daemon进程是否存在
$ ps -ef | grep SP_daemon
testserver   40960     1 4 15:38:48 ?     00:00:00 SP_daemon -deviceServer:69df7e4df0edf70cbe204549028d7171
shell        41109 41033 67 15:38:59 ?    00:00:00 grep SP_daemon
$
```

## HiSmartPerf Device hap端

工具使用说明请参见[操作指导](https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/smartperf-tool-device-haromnyos-0000002086884884#section91681917183510)，请前往[工具下载中心](https://developer.huawei.com/consumer/cn/download/hismartperf)获取HiSmartPerf工具。

## HiSmartPerf Device daemon端

### 执行查看帮助命令

```shell
$ SP_daemon --help
OpenHarmony performance testing tool SmartPerf command-line version
Usage: SP_daemon [options] [arguments]
options:
 -N              set the collection times(default value is 0) range[1,2147483647], for example: -N 10
 -PKG            set package name, must add, for example: -PKG ohos.samples.ecg
 -PID            set process pid, must add, for example: -PID 3568
 -threads        get threads, must add -PID or -PKG for example:
                 -threads -PID 3568 or -threads -PKG ohos.samples.ecg
 -c              get device CPU frequency and CPU usage, process CPU usage and CPU load ..
 -ci             get cpu instructions and cycles
 -g              get device GPU frequency and GPU load
 -f              get app refresh fps(frames per second) and fps jitters and refreshrate
 -profilerfps    get refresh fps and timestamp
 -sections       set collection time period(using with profilerfps)
 -t              get remaining battery power and temperature..
 -p              get battery power consumption and voltage(Not supported by some devices)
 -print          start mode print log
 -r              get process memory and total memory
 -snapshot       get screen capture
 -net            get uplink and downlink traffic
 -start          collection start command
 -stop           collection stop command
 -VIEW           set layler, for example: -VIEW DisplayNode
 -OUT            set csv output path.
 -d              get device DDR information
 -screen         get screen resolution
 -deviceinfo     get device information
 -server         start a process to listen to the socket message of the start and stop commands
 -clear          clear the process ID
 -ohtestfps      used by the vilidator to obtain the fps, the collection times can be set
 -recordcapacity get the battery level difference
 --version       get version
 --help          get help
 -editor         scenario-based collection identifier, parameter configuration items can be added later
 responseTime   get the page response delay after an application is operated
 completeTime   get the page completion delay after an application is operated
 fpsohtest      used by the vilidator to obtain the fps
example1:
SP_daemon -N 20 -c -g -t -p -r -net -snapshot -d
SP_daemon -N 20 -PKG ohos.samples.ecg -c -g -t -p -f -r -net -snapshot -d -nav -gc
SP_daemon -start -c
SP_daemon -stop
example2: These parameters need to be used separately
SP_daemon -screen
SP_daemon -deviceinfo
SP_daemon -server
SP_daemon -clear
SP_daemon -ohtestfps 10
SP_daemon -recordcapacity
example3: These parameters need to be used separately
SP_daemon -editor responseTime ohos.samples.ecg app name
SP_daemon -editor completeTime ohos.samples.ecg app name
SP_daemon -editor fpsohtest
command exec finished!
$
```

### 基础采集

基础采集主要采集整机或者应用的gpu、fps、CPU、DDR、内存等，支持秒级采集和启停采集，并将采集的结果写入data.csv。

**1\. 秒级采集**

| 基础采集命令参数 | 必选 | 说明 |
| --- | --- | --- |
| -N | 是 | 设置采集次数，一秒采集一次。 |
| -PKG | 否 | 设置包名。 |
| -PID | 否 | 设置进程ID或者线程ID。 |
| -threads | 否 | 采集应用子线程数量。 |
| -c | 否 | 采集cpu的频点和使用率。设置应用包名：采集整机和应用CPU信息。不设置应用包名：采集整机CPU信息。 |
| -g | 否 | 采集gpu的频点和负载信息。 |
| -f | 否 | 采集指定应用的fps以及屏幕刷新率，必须设置应用包名，采集游戏时会自动抓取游戏图层。 |
| -t | 否 | 采集GPU温度、系统芯片等温度。 |
| -p | 否 | 采集电流、电压。 |
| -ci | 否 | 采集cpu的指令数。设置应用包名时，采集整机和应用CPU指令数。不设置应用包名时，采集整机CPU指令数。 |
| -r | 否 | 采集内存。设置应用包名：采集整机和应用内存信息。不设置应用包名：采集整机内存信息。 |
| -snapshot | 否 | 屏幕截图。 |
| -net | 否 | 采集网络速率。 |
| -VIEW | 否 | 设置图层，需要先获取应用图层名。 |
| -d | 否 | 采集DDR。 |
| -sections | 否 | 设置分段采集。 |

-   设置包名采集1次应用线程数量

```shell
$ SP_daemon -N 1 -PKG ohos.samples.ecg -threads
order:0 timestamp=1741415592481
order:1 threadsNum=18847:113|
order:2 tids=18847:43411 43409 43350 43236 25783 25622 25384 25381 19423 19170 19167 19166 19165 19163 19162 19159 19157 19156 19154 19153 19152 19151 19150 19149 19147 19146 19145 19142 19141 19140 19139 19136 19135 19134 19120 19112 19111 19088 19083 19081 19077 19076 19075 19074 19073 19072 19071 19070 19055 19044 19040 19039 19034 19033 19032 19031 19030 19029 19028 19027 19019 19017 19016 19015 19014 19013 19012 19011 19009 19007 19006 19005 19004 19003 19001 19000 18999 18998 18997 18996 18995 18994 18993 18992 18991 18990 18989 18988 18987 18986 18985 18984 18983 18982 18981 18980 18977 18974 18946 18942 18936 18934 18933 18931 18930 18929 18928 18927 18926 18925 18924 18923 18847|
command exec finished!
$
```

-   采集2次整机CPU大中小核频率、各核使用率

```shell
$ SP_daemon -N 2 -c
order:0 timestamp=1739348046398
order:1 TotalcpuUsage=7.072368
order:2 TotalcpuidleUsage=92.927632
order:3 TotalcpuioWaitUsage=0.082237
order:4 TotalcpuirqUsage=0.246711
order:5 TotalcpuniceUsage=0.000000
order:6 TotalcpusoftIrqUsage=0.000000
order:7 TotalcpusystemUsage=3.125000
order:8 TotalcpuuserUsage=3.618421
order:9 cpu0Frequency=550000
order:10 cpu0Usage=16.666667
order:11 cpu0idleUsage=83.333333
order:12 cpu0ioWaitUsage=0.000000
order:13 cpu0irqUsage=2.941176
order:14 cpu0niceUsage=0.000000
order:15 cpu0softIrqUsage=0.000000
order:16 cpu0systemUsage=5.882353
order:17 cpu0userUsage=7.843137
order:18 cpu1Frequency=550000
...
command exec finished!
$
```

-   设置包名采集2次整机CPU大中小核频率、各核使用率以及进程CPU使用率、负载

```shell
$ SP_daemon -N 2 -PKG ohos.samples.ecg -c
order:0 timestamp=1741415021814
order:1 ChildProcCpuLoad=NA
order:2 ChildProcCpuUsage=NA
order:3 ChildProcId=NA
order:4 ChildProcSCpuUsage=NA
order:5 ChildProcUCpuUsage=NA
order:6 ProcAppName=ohos.samples.ecg
order:7 ProcCpuLoad=2.742330
order:8 ProcCpuUsage=7.825508
order:9 ProcId=18847
order:10 ProcSCpuUsage=2.014652
order:11 ProcUCpuUsage=5.810856
order:12 TotalcpuUsage=22.527016
order:13 TotalcpuidleUsage=77.472984
order:14 TotalcpuioWaitUsage=0.000000
order:15 TotalcpuirqUsage=0.083126
order:16 TotalcpuniceUsage=0.000000
order:17 TotalcpusoftIrqUsage=0.000000
order:18 TotalcpusystemUsage=7.148795
order:19 TotalcpuuserUsage=15.295096
order:20 cpu0Frequency=1430000
order:21 cpu0Usage=52.475248
order:22 cpu0idleUsage=47.524752
order:23 cpu0ioWaitUsage=0.000000
order:24 cpu0irqUsage=0.000000
...
command exec finished!
$
```

-   设置进程ID采集2次整机CPU大中小核频率、各核使用率以及进程CPU使用率、负载

```shell
$ SP_daemon -N 2 -PID 18847 -c
order:0 timestamp=1741415133211
order:1 ChildProcCpuLoad=NA
order:2 ChildProcCpuUsage=NA
order:3 ChildProcId=NA
order:4 ChildProcSCpuUsage=NA
order:5 ChildProcUCpuUsage=NA
order:6 ProcAppName=ohos.samples.ecg
order:7 ProcCpuLoad=2.510634
order:8 ProcCpuUsage=7.005678
order:9 ProcId=18847
order:10 ProcSCpuUsage=2.697061
order:11 ProcUCpuUsage=4.308617
order:12 TotalcpuUsage=24.979114
order:13 TotalcpuidleUsage=75.020886
order:14 TotalcpuioWaitUsage=0.000000
order:15 TotalcpuirqUsage=0.083542
order:16 TotalcpuniceUsage=0.000000
order:17 TotalcpusoftIrqUsage=0.000000
order:18 TotalcpusystemUsage=8.270677
order:19 TotalcpuuserUsage=16.624896
order:20 cpu0Frequency=1430000
order:21 cpu0Usage=50.000000
order:22 cpu0idleUsage=50.000000
order:23 cpu0ioWaitUsage=0.000000
order:24 cpu0irqUsage=0.000000
...
command exec finished!
$
```

说明

-   使用该命令采集时需进入被测应用内。

-   采集1次整机GPU频率和负载

```shell
$ SP_daemon -N 1 -g
order:0 timestamp=1705041456507
order:1 gpuFrequency=279000000
order:2 gpuLoad=12.000000
command exec finished!
$
```

-   采集2次整机温度

```shell
$ SP_daemon -N 2 -t
order:0 Battery=30.000000
order:1 cluster0=34.000000
order:2 gpu=34.000000
order:3 npu_thermal=35.000000
order:4 shell_back=32.445000
order:5 shell_frame=31.445000
order:6 shell_front=31.438000
order:7 soc_thermal=41.933000
order:8 system_h=32.250000
order:9 timestamp=1749275671938
order:0 Battery=30.000000
order:1 cluster0=34.000000
order:2 gpu=34.000000
order:3 npu_thermal=35.000000
order:4 shell_back=32.445000
order:5 shell_frame=31.445000
order:6 shell_front=31.438000
order:7 soc_thermal=41.742000
order:8 system_h=32.200000
order:9 timestamp=1749275673941
command exec finished!
$
```

-   采集1次整机电流和电压

```shell
$ SP_daemon -N 1 -p
order:0 timestamp=1705041491090
order:1 currentNow=-255
order:2 voltageNow=4377614
command exec finished!
$
```

-   采集1次整机cpu指令数

```shell
$ SP_daemon -N 1 -ci
order:0 hw-cpu-cycles=2168073451.00000
order:1 hw-instructions=833680950.00000
order:2 timestamp=1705041491090
command exec finished!
$
```

-   设置包名采集1次整机和指定应用cpu指令数

```shell
$ SP_daemon -N 1 -PKG ohos.samples.ecg -ci
order:0 cycles per instruction=2.617221
order:1 hw-cpu-cycles=1923046916.000000
order:2 hw-instructions=734766759.000000
order:3 timestamp=1501838024624
command exec finished!
$
```

说明

-   使用该命令采集时需进入被测应用内。

-   采集2次整机内存

```shell
$ SP_daemon -N 2 -r
order:0 timestamp=1705041562521
order:1 memAvailable=7339224
order:2 memFree=7164708
order:3 memTotal=11641840
order:0 timestamp=1705041563527
order:1 memAvailable=7339136
order:2 memFree=7164684
order:3 memTotal=11641840
command exec finished!
$
```

-   设置包名采集1次整机和指定应用进程内存

```shell
$ SP_daemon -N 1 -PKG ohos.samples.ecg -r
order:0 timestamp=1741415257059
order:1 arktsHeapPss=44835
order:2 childCarktsHeapPss=NA
order:3 childGpuPss=NA
order:4 childGraphicPss=NA
order:5 childHeapAlloc=NA
order:6 childHeapFree=NA
order:7 childHeapSize=NA
order:8 childNativeHeapPss=NA
order:9 childPrivateClean=NA
order:10 childPrivateDirty=NA
order:11 childPss=NA
order:12 childSharedClean=NA
order:13 childSharedDirty=NA
order:14 childStackPss=NA
order:15 childSwap=NA
order:16 childSwapPss=NA
order:17 gpuPss=222377
order:18 graphicPss=184276
order:19 heapAlloc=154696
order:20 heapFree=780
order:21 heapSize=163208
order:22 memAvailable=4612096
order:23 memFree=1240924
order:24 memTotal=11692696
order:25 nativeHeapPss=85290
order:26 privateClean=195816
order:27 privateDirty=418973
order:28 pss=693349
order:29 sharedClean=146848
order:30 sharedDirty=71056
order:31 stackPss=2492
order:32 swap=25360
order:33 swapPss=25356
command exec finished!
$
```

-   设置进程ID采集1次整机和指定应用进程内存

```shell
$ SP_daemon -N 1 -PID 18847 -r
order:0 timestamp=1741415293198
order:1 arktsHeapPss=45011
order:2 childCarktsHeapPss=NA
order:3 childGpuPss=NA
order:4 childGraphicPss=NA
order:5 childHeapAlloc=NA
order:6 childHeapFree=NA
order:7 childHeapSize=NA
order:8 childNativeHeapPss=NA
order:9 childPrivateClean=NA
order:10 childPrivateDirty=NA
order:11 childPss=NA
order:12 childSharedClean=NA
order:13 childSharedDirty=NA
order:14 childStackPss=NA
order:15 childSwap=NA
order:16 childSwapPss=NA
order:17 gpuPss=222381
order:18 graphicPss=184276
order:19 heapAlloc=154588
order:20 heapFree=757
order:21 heapSize=163184
order:22 memAvailable=4612096
order:23 memFree=1238420
order:24 memTotal=11692696
order:25 nativeHeapPss=85274
order:26 privateClean=195996
order:27 privateDirty=418977
order:28 pss=693440
order:29 sharedClean=146848
order:30 sharedDirty=71056
order:31 stackPss=2492
order:32 swap=25360
order:33 swapPss=25356
command exec finished!
$
```

说明

-   使用该命令采集时需进入被测应用内。

-   采集2次截图

```shell
$ SP_daemon -N 2 -snapshot
order:0 timestamp=1739349178766
order:1 capture=data/local/tmp/capture/screenCap_1739349178766.png
order:0 timestamp=1739349179769
order:1 capture=NA
command exec finished!
$
```

说明

-   截图采集是2秒截取一次。
    
-   截图报告存放路径为：data/local/tmp/capture。
    
-   采集结束后：进入 data/local/tmp/capture 查看生成的截图。
    
-   导出截图示例：hdc file recv data/local/tmp/capture/screenCap\_1700725192774.png D:\\。
    

-   采集2次网络速率

```shell
$ SP_daemon -N 2 -net
order:0 timestamp=1705041904832
order:1 networkDown=0
order:2 networkUp=0
order:0 timestamp=1705041905870
order:1 networkDown=22931
order:2 networkUp=2004
command exec finished!
$
```

-   设置包名采集5次指定应用帧率

```shell
$ SP_daemon -N 5 -PKG ohos.samples.ecg -f
order:0 timestamp=1705306472232
order:1 fps=43
order:2 fpsJitters=602261688;;8352083;;8267708;;8305209;;8298437;;8308854;;8313542;;8569271;;8061458;;8300521;;8308333;;8309896;;8429167;;8241667;;8258333;;8318229;;8312500;;8304167;;41760937;;16418750;;8298959;;8319270;;8308334;;8313541;;8302605;;8320312;;8298958;;8326042;;8321354;;8301042;;8310417;;8309895;;8308855;;8331250;;8286458;;8343229;;8278125;;8311458;;8306250;;8312500;;8320834;;8346875;;8283333
order:3 refreshrate=120
order:0 timestamp=1705306473234
order:1 fps=40
order:2 fpsJitters=674427313;;8191145;;8310417;;8319271;;8301562;;8318750;;8302084;;8314062;;8333334;;8283854;;8307812;;8311979;;8310417;;8307813;;8309375;;8323958;;8306250;;8308333;;8317709;;8296875;;8721875;;7895833;;8320833;;8340625;;8276563;;8409896;;8216145;;8310938;;8301042;;8362500;;8252604;;8317708;;8376042;;8256250;;8292187;;8303125;;8313542;;8310417;;8520312
order:3 refreshrate=120
...
command exec finished!
$
```

-   设置进程ID采集5次指定应用帧率

```shell
$ SP_daemon -N 5 -PID 18847 -f
order:0 timestamp=1741415862598
order:1 fps=28
order:2 fpsJitters=50192708;;16733855;;33466145;;33460938;;33468229;;33503125;;50156250;;16731250;;33458854;;33460417;;33462500;;33466667;;33461458;;33622396;;33307291;;50336980;;33302083;;16733854;;33464062;;33456771;;33467188;;50186979;;16728646;;33458854;;16736458;;33461459;;33448958;;33464062
order:3 refreshrate=60
...
command exec finished!
$
```

说明

-   使用该命令采集时需进入被测应用内，滑动或切换页面。
-   在智能刷新率情况下，刷新率是实时变化的（一秒内可能存在多次变化），refreshrate取值是采集时刻（timestamp）的刷新率。

-   采集10次指定图层帧率

```shell
$ SP_daemon -N 10 -VIEW DisplayNode -f
order:0 timestamp=1705306822850
order:1 fps=15
order:2 fpsJitters=876291843;;8314062;;8308334;;8314583;;8310417;;8308333;;8326042;;8314583;;8292708;;8492709;;8143750;;8340104;;8294271;;8302604;;8297396
order:3 refreshrate=120
order:0 timestamp=1705306823852
order:1 fps=12
order:2 fpsJitters=906667363;;8279167;;8311458;;8315625;;8291146;;8313021;;8323438;;8293750;;8303125;;8313541;;8301563;;8317708
order:3 refreshrate=120
...
command exec finished!
$
```

说明

-   DisplayNode 是指定的图层名。
    
-   使用该命令采集时，需在传入的图层上操作页面。
    
-   该命令不能与指定应用帧率一起采集（SP\_daemon -N 20 -PKG ohos.samples.ecg -f 或 SP\_daemon -N 20 -VIEW DisplayNode -f）。
    

-   采集1次DDR信息

```shell
$ SP_daemon -N 1 -d
order:0 timestamp=1739349607442
order:1 ddrFrequency=418000000
command exec finished!
$
```

-   全量采集示例1，采集10次整机信息，包括cpu、gpu、温度、功耗、内存信息、DDR信息、网络速率、屏幕截图

```shell
$ SP_daemon -N 10 -c -g -t -p -r -d -net -snapshot
order:0 timestamp=1739349730897
order:1 TotalcpuUsage=34.808013
order:2 TotalcpuidleUsage=65.191987
order:3 TotalcpuioWaitUsage=0.166945
order:4 TotalcpuirqUsage=0.083472
order:5 TotalcpuniceUsage=0.083472
order:6 TotalcpusoftIrqUsage=0.000000
order:7 TotalcpusystemUsage=11.936561
order:8 TotalcpuuserUsage=22.537563
order:9 cpu0Frequency=864000
...
order:115 cpu11systemUsage=1.000000
order:116 cpu11userUsage=1.000000
order:117 gpuFrequency=371000000
order:118 gpuLoad=0.000000
order:119 Battery=34.000000
order:120 cluster0=51.000000
order:121 gpu=47.000000
order:122 npu_thermal=35.000000
order:123 shell_back=35.870000
order:124 shell_frame=34.870000
order:125 shell_front=34.524000
order:126 soc_thermal=59.114000
order:127 system_h=36.777000
order:128 memAvailable=3608576
order:129 memFree=753520
order:130 memTotal=11697880
order:131 ddrFrequency=1531000000
order:132 networkDown=1344
order:133 networkUp=54
order:134 capture=data/local/tmp/capture/screenCap_1739349730947.png
...
command exec finished!
$
```

-   全量采集示例2，设置包名采集10次指定应用信息，包括cpu、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图

```shell
$ SP_daemon -N 10 -PKG ohos.samples.ecg -c -g -t -p -f -r -d -net -snapshot -threads
order:0 Battery=40.000000
order:1 ChildProcCpuLoad=NA
order:2 ChildProcCpuUsage=NA
order:3 ChildProcId=NA
order:4 ChildProcSCpuUsage=NA
order:5 ChildProcUCpuUsage=NA
order:6 ProcAppName=ohos.samples.ecg
order:7 ProcCpuLoad=4.528385
order:8 ProcCpuUsage=3.793903
order:9 ProcId=48875
order:10 ProcSCpuUsage=0.082836
order:11 ProcUCpuUsage=3.711067
order:12 TotalcpuUsage=39.602320
order:13 TotalcpuidleUsage=60.397680
order:14 TotalcpuioWaitUsage=0.248550
order:15 TotalcpuirqUsage=0.248550
order:16 TotalcpuniceUsage=0.000000
order:17 TotalcpusoftIrqUsage=0.000000
order:18 TotalcpusystemUsage=16.735708
order:19 TotalcpuuserUsage=22.369511
order:20 arktsHeapPss=48113
order:21 capture=data/local/tmp/capture/screenCap_1755656583554.png
...
order:150 ddrFrequency=1531000000
order:151 fps=101
order:152 fpsJitters=66921354;;8493229;;8217188;;8368229;;8495833;;8293750;;8401042;;8276042;;8522395;;8269792;;8326042;;8312500;;8410937;;8453125;;8267709;;8354166;;8361979;;8417709;;8325000;;8405208;;8607292;;8116146;;8619791;;8127604;;8320834;;8407291;;8361459;;8384375;;8294271;;8403645;;8388021;;8357813;;8334375;;8365625;;8380208;;8360417;;8388541;;8376563;;8332292;;8373958;;8352083;;8380729;;8312500;;8394792;;8386458;;8554688;;11023958;;11156771;;11161979;;11124479;;11137500;;11094271;;11269792;;11041667;;11129166;;11140625;;11152084;;11216666;;11247396;;41751042;;8261979;;8399479;;8368229;;8423438;;8289583;;8349479;;8417188;;8419791;;8786980;;8078645;;8131250;;16768230;;8409895;;8306250;;8396355;;8331770;;8329688;;8445312;;8392709;;11126562;;11125521;;11171875;;11208333;;8290105;;8383854;;8339583;;8347396;;8378125;;8496875;;11046875;;11225000;;8276042;;8409895;;8310938;;8371875;;8364062;;8377084;;8323958;;8344792;;8418750
order:153 gpu=53.000000
order:154 gpuFrequency=279000000
order:155 gpuLoad=27.000000
order:156 gpuPss=8368
order:157 graphicPss=252
order:158 heapAlloc=81244
order:159 heapFree=860
order:160 heapSize=91492
order:161 memAvailable=3858432
order:162 memFree=1429020
order:163 memTotal=11677756
order:164 nativeHeapPss=56952
order:165 networkDown=0
order:166 networkUp=0
order:167 npu_thermal=52.000000
order:168 privateClean=115064
order:169 privateDirty=11684
order:170 pss=163746
order:171 refreshrate=90
order:172 sharedClean=159052
order:173 sharedDirty=24664
order:174 shell_back=41.871000
order:175 shell_frame=40.871000
order:176 shell_front=40.549000
order:177 soc_thermal=63.358000
order:178 stackPss=536
order:179 swap=16144
order:180 swapPss=16144
order:181 system_h=42.764000
order:182 threadsNum=48875:50
order:183 tids=48875:51429 51319 51318 51317 51316 51289 51279 51278 51273 51272 51271 51266 51265 51260 51259 51258 51051 51048 50003 50002 50001 49999 49662 49074 49073 49065 49064 49063 49056 49055 49052 49051 48973 48965 48950 48949 48944 48943 48941 48940 48939 48938 48937 48936 48934 48933 48932 48931 48930 48875
order:184 timestamp=1755656584533
order:185 voltageNow=4186785
command exec finished!
$
```

-   全量采集示例3，设置进程ID采集10次指定应用信息，包括cpu、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图

```shell
$ SP_daemon -N 10 -PID 18847 -c -g -t -p -f -r -d -net -snapshot -threads
order:0 Battery=31.000000
order:1 ChildProcCpuLoad=NA
order:2 ChildProcCpuUsage=NA
order:3 ChildProcId=NA
order:4 ChildProcSCpuUsage=NA
order:5 ChildProcUCpuUsage=NA
order:6 ProcAppName=com.tencent.tmgp.pubgmhd.hw
order:7 ProcCpuLoad=9.672536
order:8 ProcCpuUsage=14.102564
order:9 ProcId=20801
order:10 ProcSCpuUsage=2.564103
order:11 ProcUCpuUsage=11.538462
order:12 TotalcpuUsage=41.176471
order:13 TotalcpuidleUsage=58.823529
order:14 TotalcpuioWaitUsage=0.000000
order:15 TotalcpuirqUsage=0.000000
order:16 TotalcpuniceUsage=0.000000
order:17 TotalcpusoftIrqUsage=0.000000
order:18 TotalcpusystemUsage=11.764706
order:19 TotalcpuuserUsage=29.411765
order:20 arktsHeapPss=18487
order:21 capture=data/local/tmp/capture/screenCap_1768031295544.png
...
order:150 ddrFrequency=1104000000
order:151 fps=30
order:152 fpsJitters=36692188;;17661458;;35677604;;42277084;;34199479;;32157292;;35612500;;30021354;;21380729;;41903125;;35553646;;43336458;;25243750;;32834896;;24838021;;30732291;;36751042;;42747396;;36190625;;24854687;;37228125;;34302084;;24382291;;37344792;;38457292;;31949479;;38650521;;11681770;;48624480
order:153 gpu=40.000000
order:154 gpuFrequency=279000000
order:155 gpuLoad=0.000000
order:156 gpuPss=316128
order:157 graphicPss=51084
order:158 heapAlloc=199957
order:159 heapFree=1277
order:160 heapSize=205108
order:161 memAvailable=4471808
order:162 memFree=641808
order:163 memTotal=11689880
order:164 nativeHeapPss=81777
order:165 networkDown=0
order:166 networkUp=0
order:167 npu_thermal=38.000000
order:168 privateClean=1053120
order:169 privateDirty=408248
order:170 pss=1690286
order:171 refreshrate=30
order:172 sharedClean=202172
order:173 sharedDirty=36008
order:174 shell_back=34.667000
order:175 shell_frame=33.667000
order:176 shell_front=33.167000
order:177 soc_thermal=39.971000
order:178 stackPss=2620
order:179 swap=200684
order:180 swapPss=200617
order:181 system_h=34.900000
order:182 threadsNum=20801:133
order:183 tids=20801:33639 33526 32362 32361 32355 32354 32353 32261 32258 32255 32254 32253 32252 32251 32250 32249 32235 32234 32233 31899 31897 31879 31869 31868 31809 31805 31799 31798 31797 31791 31778 31773 31772 31732 26198 25410 25409 25408 25407 25406 25405 25404 25403 25402 25401 25400 25399 25397 25395 25394 25393 25391 25390 25389 25388 25387 25386 25385 25384 25383 25382 25381 25380 25259 25190 25187 25186 25165 25164 25162 25161 25150 25141 25140 25138 25130 25115 25114 25113 25112 25111 25024 25023 25022 25021 25020 25019 25018 24996 24994 24993 24992 24991 24990 24989 24983 24982 24981 24980 24973 24972 24971 24970 24723 24718 24711 24694 24693 24663 24661 24657 24646 24645 24644 24642 24607 24605 24596 21032 21031 21030 21001 21000 20996 20995 20994 20993 20992 20991 20977 20975 20974 20801
order:184 timestamp=1768031295492
order:185 voltageNow=4189599
command exec finished!
$
```

说明

-   使用该命令采集时需进入被测应用内。

**2\. 启停采集**

先执行start开始采集命令，然后操作设备或应用，最后执行stop结束采集命令。

| 启停采集命令参数 | 必选 | 说明 |
| --- | --- | --- |
| -start | 是 | 开始采集，该命令参数后可添加基础采集命令，一秒采集一次。 |
| -stop | 是 | 结束采集，执行后会生成采集报告。 |
| -print | 否 | 一秒打印一次启停采集信息。 |

-   启停采集整机CPU大中小核频率、各核使用率

```shell
开始采集
$ SP_daemon -start -c
SP_daemon Collection begins
command exec finished!
$
结束采集
$ SP_daemon -stop
SP_daemon Collection ended
Output Path: data/local/tmp/smartperf/1/t_index_info.csv
command exec finished!
$
```

-   启停采集并打印整机CPU大中小核频率、各核使用率

```shell
开始采集（打印启停采集信息）
$ SP_daemon -start -c -print
SP_daemon Collection begins
order:0 TotalcpuUsage=20.860927
order:1 TotalcpuidleUsage=79.139073
order:2 TotalcpuioWaitUsage=0.000000
order:3 TotalcpuirqUsage=0.082781
order:4 TotalcpuniceUsage=0.000000
order:5 TotalcpusoftIrqUsage=0.000000
order:6 TotalcpusystemUsage=8.029801
order:7 TotalcpuuserUsage=12.748344
order:8 cpu0Frequency=1430000
order:9 cpu0Usage=44.554455
order:10 cpu0idleUsage=55.445545
order:11 cpu0ioWaitUsage=0.000000
order:12 cpu0irqUsage=0.000000
order:13 cpu0niceUsage=0.000000
order:14 cpu0softIrqUsage=0.000000
order:15 cpu0systemUsage=17.821782
order:16 cpu0userUsage=26.732673
order:17 cpu10Frequency=1239000
order:18 cpu10Usage=0.000000
order:19 cpu10idleUsage=100.000000
order:20 cpu10ioWaitUsage=0.000000
order:21 cpu10irqUsage=0.000000
order:22 cpu10niceUsage=0.000000
order:23 cpu10softIrqUsage=0.000000
order:24 cpu10systemUsage=0.000000
order:25 cpu10userUsage=0.000000
order:26 cpu11Frequency=1239000
order:27 cpu11Usage=0.000000
order:28 cpu11idleUsage=100.000000
order:29 cpu11ioWaitUsage=0.000000
order:30 cpu11irqUsage=0.000000
order:31 cpu11niceUsage=0.000000
order:32 cpu11softIrqUsage=0.000000
order:33 cpu11systemUsage=0.000000
order:34 cpu11userUsage=0.000000
...
command exec finished!
$
结束采集（在启停打印时，需重新开启命令框执行此命令）
$ SP_daemon -stop
SP_daemon Collection ended
Output Path: data/local/tmp/smartperf/1/t_index_info.csv
command exec finished!
$
```

说明

-   开始采集示例1（采整机cpu、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图）：SP\_daemon -start -c -g -t -p -r -d -net -snapshot -threads。
    
-   开始采集示例2（采整机和进程cpu负载、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图、线程数、文件描述符）：SP\_daemon -start -PKG ohos.samples.ecg -c -g -t -p -f -r -d -net -snapshot -threads。
    
-   开始采集示例3（采整机和进程cpu负载、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图、线程数、文件描述符）：SP\_daemon -start -PID 18847 -c -g -t -p -f -r -d -net -snapshot -threads。
-   开始采集示例4（采整机cpu、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图、线程数、文件描述符并且打印采集信息）：SP\_daemon -start -c -g -t -p -r -d -net -snapshot -threads -print。
-   开始采集示例5（采整机和进程cpu负载、gpu、温度、功耗、fps、内存信息、DDR信息、网络速率、屏幕截图、线程数、文件描述符并且打印采集信息）：SP\_daemon -start -PID 18847 -c -g -t -p -f -r -d -net -snapshot -threads -print。
-   开始采集需和结束采集结合使用，先执行开始采集命令，执行完后操作设备中的应用，最后执行结束采集命令。
-   在执行启停打印采集时，执行停止命令需重新打开命令框执行停止命令。
-   结束采集，文件输出路径为：data/local/tmp/smartperf/1/t\_index\_info.csv。
-   导出示例：hdc file recv data/local/tmp/smartperf/1/t\_index\_info.csv D:\\。

**3\. 查看csv采集结果**

若采集结果保存在csv文件中，可以按照如下操作导出和查看结果内容。

-   通过-N开启采集，采集结果默认输出路径：/data/local/tmp/data.csv
-   查看文件位置

```shell
C:\Users\issusser>hdc shell
$ cd data/local/tmp
$ ls
data.csv
$
```

-   导出文件到指定路径

```shell
C:\Users\issusser>hdc file recv data/local/tmp/data.csv D:\
[I][2023-11-08 16:16:41] HdcFile::TransferSummary success
FileTransfer finish, Size:429, File count = 1, time:6ms rate:71.50kB/s
C:\Users\issusser>
```

-   打开data.csv查看数据

在自定义导出路径里找到data.csv文件打开查看采集数据表，data.csv数据名描述如下：

| 数据项 | 说明 | 备注 |
| --- | --- | --- |
| threadsNum | 线程总数。 | - |
| tids | 线程id。 | - |
| cpuFrequency | CPU大中小核频率。 | 单位：kHz |
| cpuUsage | CPU各核使用率。 | % |
| cpuidleUsage | CPU空闲态使用率。 | % |
| cpuioWaitUsage | 等待I/O的使用率。 | % |
| cpuirqUsage | 硬中断的使用率。 | % |
| cpuniceUsage | 低优先级用户态使用率。 | % |
| cpusoftIrqUsage | 软中断的使用率。 | % |
| cpusystemUsage | 系统/内核态使用率。 | % |
| cpuuserUsage | 用户态使用率。 | % |
| ProcId | 进程id。 | - |
| ChildProcId | 子进程id。 | - |
| ProcAppName | app包名。 | - |
| ProcCpuLoad | 进程CPU负载占比。 | % |
| ChildProcCpuLoad | 子进程CPU负载占比。 | % |
| ProcCpuUsage | 进程CPU使用率。 | % |
| ChildProcCpuUsage | 子进程CPU使用率。 | % |
| ProcUCpuUsage | 进程用户态CPU使用率。 | % |
| ChildProcUCpuUsage | 子进程用户态CPU使用率。 | % |
| ProcSCpuUsage | 进程内核态CPU使用率。 | % |
| ChildProcSCpuUsage | 子进程内核态CPU使用率。 | % |
| TotalcpuUsage | CPU总使用率。 | % |
| TotalcpuidleUsage | CPU总空闲态使用率。 | % |
| TotalcpuioWaitUsage | CPU总等待I/O使用率。 | % |
| TotalcpuirqUsage | CPU总硬中断使用率。 | % |
| TotalcpuniceUsage | CPU总低优先级用户态使用率。 | % |
| TotalcpusoftIrqUsage | CPU总软中断使用率。 | % |
| TotalcpusystemUsage | CPU总系统/内核态使用率。 | % |
| TotalcpuuserUsage | CPU总用户态使用率。 | % |
| gpuFrequency | 整机GPU的频率。 | 单位：Hz |
| gpuLoad | 整机GPU的负载占比。 | % |
| hw-instructions | 执行的指令数。 | - |
| hw-cpu-cycles | CPU时钟周期数。 | 单位：ns |
| currentNow | 当前读到的电流值。 | 单位：mA |
| voltageNow | 当前读到的电压值。 | 单位：μV |
| fps | 每秒帧数。 | 单位：fps |
| fpsJitters | 每一帧绘制间隔。 | 单位：ns |
| refreshrate | 屏幕刷新率。 | 单位：Hz |
| networkDown | 下行速率。 | 单位：byte/s |
| networkUp | 上行速率。 | 单位：byte/s |
| ddrFrequency | DDR频率。 | 单位：Hz |
| shell_front | 前壳温度。 | 单位：°C |
| shell_frame | 边框温度。 | 单位：°C |
| shell_back | 后壳温度。 | 单位：°C |
| soc_thermal | 系统芯片温度。 | 单位：°C |
| system_h | 系统温度。 | 单位：°C |
| Battery | 电池温度。 | 单位：°C |
| cluster0 | CPU温度。 | 单位：°C |
| gpu | GPU温度。 | 单位：°C |
| npu_thermal | NPU温度。 | 单位：℃ |
| memAvailable | 整机可用内存。 | 单位：KB |
| memFree | 整机空闲内存。 | 单位：KB |
| memTotal | 整机总内存。 | 单位：KB |
| pss | 进程实际使用内存。 | 单位：KB |
| childPss | 子进程实际使用内存。 | 单位：KB |
| sharedClean | 共享的未改写页面。 | 单位：KB |
| childSharedClean | 子进程共享的未改写页面。 | 单位：KB |
| sharedDirty | 共享的已改写页面。 | 单位：KB |
| childSharedDirty | 子进程共享的已改写页面。 | 单位：KB |
| privateClean | 私有的未改写页面。 | 单位：KB |
| childPrivateClean | 子进程私有的未改写页面。 | 单位：KB |
| privateDirty | 私有的已改写页面。 | 单位：KB |
| childPrivateDirty | 子进程私有的已改写页面。 | 单位：KB |
| swap | 总的交换内存。 | 单位：KB |
| childSwap | 子进程总的交换内存。 | 单位：KB |
| swapPss | 交换的pss内存。 | 单位：KB |
| childSwapPss | 子进程交换的pss内存。 | 单位：KB |
| HeapSize | 堆内存大小。 | 单位：KB |
| childHeapSize | 子进程堆内存堆大小。 | 单位：KB |
| HeapAlloc | 可分配的堆内存大小。 | 单位：KB |
| childHeapAlloc | 子进程可分配的堆内存大小。 | 单位：KB |
| HeapFree | 剩余的堆内存大小。 | 单位：KB |
| childHeapFree | 子进程剩余的堆内存大小。 | 单位：KB |
| gpuPss | 使用的gpu内存大小。 | 单位：KB |
| childGpuPss | 子进程使用的gpu内存大小。 | 单位：KB |
| graphicPss | 使用的图形内存大小。 | 单位：KB |
| childGraphicPss | 子进程使用的图形内存大小。 | 单位：KB |
| arktsHeapPss | 使用的arkts内存大小。 | 单位：KB |
| childCarktsHeapPss | 子进程使用的arkts内存大小。 | 单位：KB |
| nativeHeapPss | 使用的native内存大小。 | 单位：KB |
| childNativeHeapPss | 子进程使用的native内存大小。 | 单位：KB |
| stackPss | 使用的栈内存大小。 | 单位：KB |
| childStackPss | 子进程使用的栈内存大小。 | 单位：KB |
| navPathName | 页面切换信息。 | - |
| timeStamp | 当前时间戳，对应采集时间。 | - |

### 场景化采集

除基础采集外，还支持采集响应和完成时延等内容。场景化采集结果不写入data.csv，采集结果直接在命令框显示。

场景化采集是对应用页面滑动、切换场景下的性能测试，针对不同操作场景执行相对应的采集命令，获取应用性能数据，包括页面的滑动帧率、页面切换或滑动的卡顿率、响应时延、完成时延以及最大连续丢帧，对采集数据进行输出打印，以便用户分析并优化应用性能。

| 场景化采集命令参数 | 必选 | 说明 |
| --- | --- | --- |
| -editor | 是 | 采集类型为场景化。 |
| timeDelay | 否 | 页面切换（支持ArKUI子系统的router、navigation、tabs、swiper控件内的页面切换/内容切换）。 |
| slideList | 否 | 页面滑动（支持ArKUI子系统的List、grid、scroll、waterflow等组件内的页面滑动）。 |

| 场景化采集数据项 | 说明 | 备注 |
| --- | --- | --- |
| ResponseTime | 页面切换、页面滑动的响应时延。 | 单位：ms |
| CompleteTime | 页面切换的完成时延。 | 单位：ms |
| HitchTimeRate | 页面切换、页面滑动的卡顿率。 | 单位：ms/s |
| MAX_RENDER_SEQ_MISSED_FRAMES | 页面切换、页面滑动的最大连续丢帧。 | NA |
| FPS | 页面滑动帧率。 | 单位：fps |

-   页面切换

步骤1：打开被测应用，进入需要测试的页面。

步骤2：在cmd命令行中输入命令：SP\_daemon -editor timeDelay并回车。

步骤3：等待1-2秒钟，然后手动点击页面内的按钮，跳转到下一个页面，等待测试完成。

测试完成后，打印结果示例如下：

```shell
$ SP_daemon -editor timeDelay
ResponseTime:41ms
CompleteTime:593ms
HitchTimeRate:68.65ms/s
MAX_RENDER_SEQ_MISSED_FRAMES:3
$
```

说明

-   时延计算受系统打点上报限制，开始时间为点击事件上报时间点，响应时延结束时间点为点击后系统响应首帧的上屏时间点，完成时延是切换后页面的首帧上屏时间点，与端到端用户感知时延存在差异。
-   页面切换卡顿率：目前只支持ArKUI子系统的router、navigation、tabs、swiper控件内的页面切换/内容切换。计算公式：页面切换卡顿率=页面切换动效时间内每一帧的累计丢帧时间（ms）/ 动效时长（s）。
-   最大连续丢帧受系统打点上报限制，与端到端用户感知时延存在差异。

-   页面切换同时会抓取trace，文件路径：data/local/tmp/sp\_trace\_delay.ftrace，通过hdc file recv的方式导出查看trace。

-   页面滑动

步骤1：打开被测应用，进入需要测试的页面。

步骤2：在cmd命令行中输入命令并回车：SP\_daemon -editor slideList。

步骤3：等待1-2秒钟，然后触摸屏幕滑动一次页面，等待测试完成。

测试完成后，打印结果示例如下：

```shell
$ SP_daemon -editor slideList
FPS:107.181fps
ResponseTime:20ms
HitchTimeRate:1.49ms/s
MAX_RENDER_SEQ_MISSED_FRAMES:0
$
```

说明

-   时延计算受系统打点上报限制，开始时间为点击事件上报时间点，响应时延结束时间点为滑动后系统响应首帧的上屏时间点，与端到端用户感知时延存在差异，需要注意的是，滑动场景时延计算不支持Web组件。
-   页面滑动帧率：指的是在页面滑动时，屏幕能够刷新的频率。需要注意的是，该场景目前只支持滑动一次页面。
-   页面滑动卡顿率：目前只支持ArKUI子系统的List、grid、scroll、waterflow滚动组件。计算公式：页面滑动卡顿率=页面滑动动效时间内每一帧的累计丢帧时间（ms）/ 动效时长（s）。
-   最大连续丢帧受系统打点上报限制，与端到端用户感知时延存在差异。

-   页面滑动同时会抓取trace，文件路径：data/local/tmp/sp\_trace\_fps.ftrace，通过hdc file recv的方式导出查看trace。

### 其他采集

当前设备电量采集结果可写入csv文件，其它命令需单独采集，采集结果不写入data.csv，仅在命令框显示。

| 场景化采集数据项 | 说明 | 备注 |
| --- | --- | --- |
| -screen | 否 | 采集屏幕分辨率和刷新率。 |
| -deviceinfo | 否 | 获取设备信息。 |
| -server | 否 | 启停采集用来拉起daemon进程。 |
| -clear | 否 | 清除所有SP_daemon进程。 |
| -profilerfps | 否 | 采集当前界面fps。 |
| -recordcapacity | 否 | 获取当前设备电量。 |

-   获取屏幕分辨率

```shell
$ SP_daemon -screen
activeMode: 1260x2720, refreshrate=60
command exec finished!
$
```

说明

-   activeMode表示当前屏幕分辨率，refreshrate表示屏幕刷新率。

-   获取设备信息

```shell
$ SP_daemon -deviceinfo
abilist: default
activeMode: 1260x2720
board: default
brand: default
cpu_c1_cluster: 0 1 2 3
cpu_c1_max: 1530000
cpu_c1_min: 418000
cpu_c2_cluster: 4 5 6 7 8 9
cpu_c2_max: 2150000
cpu_c2_min: 418000
cpu_c3_cluster: 10 11
cpu_c3_max: 2620000
cpu_c3_min: 1239000
cpu_cluster_name: policy0 policy1 policy2
daemonPerfVersion: 1.0.5
deviceTypeName: default
fullname: OpenHarmony-5.1.0.50
gpu_max_freq: 750000000
gpu_min_freq: 279000000
model: ohos
name: default
sn: default
version: default
command exec finished!
$
```

-   启动一个进程来监听start和stop命令的socket消息

```shell
$ SP_daemon -server
$
$ pidof SP_daemon
 7024
$
```

说明

-   可执行pidof SP\_daemon查看进程id。

-   清除SP\_daemon进程ID

```shell
$ pidof SP_daemon
 2725
$ SP_daemon -clear
$
$ pidof SP_daemon
$
```

说明

-   可执行pidof SP\_daemon查看进程id。

-   采集当前界面fps

```shell
$ SP_daemon -profilerfps 10
set num:10 success
fps:31|1739353731123
fps:30|1739353732123
fps:58|1739353733123
fps:24|1739353734123
fps:19|1739353735123
fps:19|1739353736123
fps:55|1739353737123
fps:26|1739353738123
fps:21|1739353739123
fps:19|1739353740123
SP_daemon exec finished!
$
```

说明

-   该条命令里的10表示采集的次数（一秒采集一次），可以设置为其他正整数。

-   采集当前界面fps（分段采集）

```shell
$ SP_daemon -profilerfps 100 -sections 10
set num:100 success
fps:33|1739353780123
sectionsFps:15|1739353780123
sectionsFps:60|1739353780223
sectionsFps:15|1739353780323
sectionsFps:60|1739353780423
sectionsFps:15|1739353780523
sectionsFps:15|1739353780623
sectionsFps:24|1739353780723
sectionsFps:60|1739353780823
sectionsFps:60|1739353780923
sectionsFps:60|1739353781023
fps:49|1739353781123
sectionsFps:60|1739353781123
sectionsFps:60|1739353781223
sectionsFps:60|1739353781323
sectionsFps:60|1739353781423
sectionsFps:60|1739353781523
sectionsFps:60|1739353781623
623
sectionsFps:15|1739353798723
sectionsFps:15|1739353798823
sectionsFps:10|1739353798923
sectionsFps:60|1739353799023
fps:20|1739353799123
sectionsFps:60|1739353799123
...
SP_daemon exec finished!
$
```

说明

-   该条命令里的100表示采集的次数（一秒采集一次），可以设置为其他正整数。
-   10表示分段：目前支持设置 1-10（正整数）段采集。

-   获取电池电量

```shell
$ SP_daemon -recordcapacity
recordTime: 1726903063
recordPower: 5502
```

说明

-   recordTime表示时间戳，recordPower表示当前时刻的电量。
-   采集结果写入/data/local/tmp/powerLeftRecord.csv。
-   导出示例：hdc file recv data/local/tmp/powerLeftRecord.csv D:\\。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/smartperf-guidelines*