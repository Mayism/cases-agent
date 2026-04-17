---
title: FaultLog
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log
category: 指南
updated_at: 2026-03-13T05:00:16.636Z
---

# FaultLog

当应用运行发生错误导致应用进程终止时，应用将会抛出错误日志以通知应用崩溃的原因，开发者可通过查看错误日志分析应用崩溃的原因及引起崩溃的代码位置。

FaultLog由系统自动从设备进行收集，包括如下几类故障信息：

-   App Freeze
-   CPP Crash
-   JS Crash
-   System Freeze
-   [ASan](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-asan)
-   [HWASan](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hwasan)
-   [TSan](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-tsan)
-   [UBSan](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ubsan)

说明

调试模式（debug和attach）下，DevEco Studio会屏蔽当前工程的App Freeze和System Freeze等超时检测，避免调试过程出现超时检测影响开发者调试。

当前支持屏蔽的App Freeze故障类型：

-   THREAD\_BLOCK\_3S/THREAD\_BLOCK\_6S：应用主线程卡死检测，卡住3秒/6秒。
-   APP\_INPUT\_BLOCK：输入响应超时。

当前支持屏蔽的System Freeze故障类型：

-   LIFECYCLE\_TIMEOUT：app、ability生命周期切换超时。

## 查看FaultLog日志

### 查看设备历史抛出的FaultLog日志

打开FaultLog窗口，将显示当前选中设备抛出的所有FaultLog日志。

FaultLog故障信息左侧按照**应用/元服务包名 > 故障类型 > 故障时间**结构组成，选中具体的故障日期，则会在右侧展示详细的故障信息，并对部分关键信息进行高亮展示，便于开发者进行故障定位。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/UrCBxiX0SwqQriHp0CJrUw/zh-cn_image_0000002532670263.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=8FECBCC77BBF977278FF3BECA84F0372911C84B2A52188B338B438C0CF288711)

### 查看设备实时抛出的FaultLog日志

当设备抛出FaultLog日志时，DevEco Studio将会弹出消息提示框，开发者点击**Jump to Log**即可跳转至FaultLog窗口查看日志信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/_fpZnKy-QrC6D1jgJAtXpA/zh-cn_image_0000002532750231.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=9D3169903407CA6242E82F71AFB67A30F6778162536769751EECAC56759414CF)

### 跳转至引起错误的代码行

若抛出的FaultLog中的堆栈信息中的链接或偏移地址指向的是当前工程中的某行代码，该段信息将会被转换为超链接形式，点击后可跳转至对应代码行。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a8/v3/PkimUC0TS_uBQD6z_x6gtQ/zh-cn_image_0000002500910356.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=C2DAAD3B89E65D9E6CEF800076D4F28C820B2C86D6C014050E590D9DC6B01EF6)

## 导出日志

开发者可将当前显示的日志信息保存到本地，以便后续的进一步分析。开发者可根据需要选择保存当前选中节点的日志或保存所有日志。

-   保存当前选中节点的日志：
    -   在当前选中节点右键点击**Export FaultLog**。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6a/v3/kByQdVvvTWGZYPNNFS0aYw/zh-cn_image_0000002532670287.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=95B12A949E2691753690BB785976A9C9996B30531CC8F87113E5A5F95F819F85)
        
    -   点击Export FaultLog按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/67/v3/J4iY8-_ZQeGPuSn1RKFCxA/zh-cn_image_0000002501070210.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=D2DC17F8A50E27229C2DE6981BC4CC2AEE3EA28025F0DEA4A6FC33079122D6D3)，弹出子选项后进一步点击**Export Selected FaultLog**。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6/v3/fS1r-W51QEW6OG4sZxoWUw/zh-cn_image_0000002532670273.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=F6F91686584C54CFF42EC4AFACBF05CD5A4E3F84B34F4284AEC9F7AF7C2449E5)
        
-   保存所有日志：点击Export FaultLog按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/37/v3/WnQPLEa4QSCNptQRme1uzA/zh-cn_image_0000002532670269.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=77F9910C15224CFAC0E6616ED4DD7FD0615FC65281955D3C464F80AE4F90763C)，弹出子选项后进一步点击**Export All FaultLog**。

## 查看cppcrash结构化日志

从DevEco Studio 6.0.0 Beta1版本开始，支持对Cpp Crash类型的FaultLog，进行结构化展示和日志过滤。

1.  双击cppcrash日志，**Fault Info**右侧会出现**Fault Analysis**页签。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4c/v3/8uZ__rqNQ5G8eBQLQZOD8g/zh-cn_image_0000002501070192.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=C996ED90FABE9F8A6A829A2E461E41B2392ED68E34E3CE323D87F3FF4787B7BB "点击放大")
    
2.  点击**Fault Analysis**页签，会展示结构化的日志信息。
    
    -   页面上方的字段对应了FaultLog中的字段，具体对应关系请查看[字段说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section1983219211210)。
    -   页面下方包含Stacks和Logs两个页签。
        -   **Stacks**：展示线程的堆栈信息，具体请参考[查看堆栈信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section459581010138)。
        -   **Logs**：展示FaultLog中的HiLog日志，具体请查看[查看HiLog日志](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section13361239195113)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/3Bs83JQrSxu8FP1NFzJf4g/zh-cn_image_0000002501070190.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=BD0DCD6B452C304CC10BA0E5305E4535C6A5E2929ED34AF895F431F150FBBBE1 "点击放大")
    

### 字段说明

**Fault Analysis**页签中的字段和FaultLog的字段对应关系如下。

**表1**

| Fault Analysis的字段 | 说明 |
| --- | --- |
| Occurrence time | FaultLog发生的时间，对应FaultLog中的Timestamp字段 |
| Analysis time | 触发日志结构化展示的时间，即双击日志文件的时间 |
| Frontend | 是否是前台应用，对应FaultLog中的Foreground字段 |
| Bundle name | 包名，对应FaultLog中的Module name字段 |
| Device type | 设备类型 |
| App build number | 应用构建号，对应FaultLog中的VersionCode字段 |
| App version | 应用版本，对应FaultLog中的Version字段 |
| Device model | 设备信息，对应FaultLog中的Device info字段 |
| System version | 系统镜像版本，对应FaultLog中的Build info字段 |
| Abnormal signal | 异常信号，对应FaultLog中的Reason字段 |

### 查看堆栈信息

Stacks页面包含了FaultLog中的堆栈信息，并以线程为单元进行折叠，点击展开按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a9/v3/k3G9zYjWTNSHTGboZBMwuw/zh-cn_image_0000002532670265.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=8F9AA25A6CDEF51B88FEE0DB9DA21E7E799109DEF59D2A43D24BE26AA218CB3C)，可以展开对应线程。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9a/v3/r9fR_3i5Tg6Cj0gf4Rq73Q/zh-cn_image_0000002532750233.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=AF1FC9260D85AD959083E623822427976BE966AC9866D139D94E1C1AB963D231 "点击放大")

图中标注1的勾选框是展开应用堆栈，标注2的勾选框是展开系统堆栈，两个勾选框一共组成了四种状态，具体如下表。

**表2**

| 勾选框勾选状态 | 说明 |
| --- | --- |
| 1、2都不勾选 | 展示所有线程，线程处于折叠状态。 |
| 1、2都勾选 | 展示所有线程，线程处于状态。 |
| 只勾选1 | 只展示应用线程，线程处于状态。 |
| 只勾选2 | 只展示系统线程，线程处于状态。 |

### 查看HiLog日志

Logs页面展示了FaultLog中的HiLog日志，支持日志级别的过滤和搜索。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c/v3/SEZ1p21DRUm5wPnHXb5PLw/zh-cn_image_0000002532670267.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=E182CADD507EDA7C379B5E9C700430D4B848C3D6DF6A8DDA34D204B4ACBB331A)

## 查看appfreeze结构化日志

从DevEco Studio 6.0.0 Beta2版本开始，支持对AppFreeze类型的FaultLog，进行结构化展示和日志过滤。

1.  双击appfreeze日志，**Fault Info**右侧会出现**Fault Analysis**页签。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/81/v3/GWs5-NmkSgWnLgDPgGYs-Q/zh-cn_image_0000002532750229.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=6E875F4DCC8DF3ADDCC942C86E231B27A16EFF22A4515832296F368BDE64F9B2)
    
2.  点击**Fault Analysis**页签，会展示结构化的日志信息。
    
    -   页面上方的字段对应了FaultLog中的字段，具体对应关系请查看[字段说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section15864144624712)。
    -   页面下方包含Stacks、Logs、System、3s/6s Compare四个页签。
        -   **Stacks**：展示线程的堆栈信息，使用方式和cppcrash日志相同，具体请参考[查看堆栈信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section459581010138)。
        -   **Logs**：展示FaultLog中的HiLog日志，使用方式和cppcrash日志相同，具体请参考[查看HiLog日志](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section13361239195113)。
        -   **System**：从DevEco Studio 6.0.0 Beta3版本开始，新增System页签，用于在高负载场景下，展示设备CPU/内存的日志信息，具体请参考[查看高负载CPU/内存日志信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section179717814915)。
        -   **3s/6s Compare**：从DevEco Studio 6.0.2 Beta1版本开始，新增3s/6s Compare页签，用于对[THREAD\_BLOCK\_6S](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/appfreeze-guidelines#thread_block_6s-应用主线程卡死超时)类型的AppFreeze问题，展示3s和6s时间点的主线程堆栈日志，具体请参考[查看3s/6s堆栈日志](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section76467955514)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e4/v3/i24v9H5EToe4BZWrFNJseQ/zh-cn_image_0000002500910352.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=8671A26C80706287F5F867A948FF0C797DE53A54F9818280D858D175485DFB1C)
    

### 字段说明

**Fault Analysis**页签中的字段和FaultLog的字段对应关系如下。

**表3**

| Fault Analysis的字段 | 说明 |
| --- | --- |
| Occurrence time | FaultLog发生的时间，对应FaultLog中的Timestamp字段 |
| Analysis time | 触发日志结构化展示的时间，即双击日志文件的时间 |
| Frontend | 是否是前台应用，对应FaultLog中的Foreground字段 |
| Bundle name | 包名，对应FaultLog中的Module name字段 |
| Device type | 设备类型 |
| App build number | 应用构建号，对应FaultLog中的VersionCode字段 |
| App version | 应用版本，对应FaultLog中的Version字段 |
| Device model | 设备信息，对应FaultLog中的Device info字段 |
| System version | 系统镜像版本，对应FaultLog中的Build info字段 |
| Freeze type | 冻结类型，对应FaultLog中的Reason字段 |

### 查看堆栈信息

Stacks页签用于查看appfreeze中的堆栈信息，使用方式和cppcrash日志相同，具体请参考[查看堆栈信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section459581010138)。

### 查看HiLog日志

Logs页签用于查看appfreeze中的HiLog，使用方式和cppcrash日志相同，具体请参考[查看HiLog日志](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log#section13361239195113)。

### 查看高负载CPU/内存日志信息

从DevEco Studio 6.0.0 Beta3版本开始，新增System页签，用于在高负载场景下，展示设备CPU/内存的日志信息，有助于分析高负载和appfreeze之间的关联关系。

如下是CPU的相关日志。

①：柱状图表示对应时间点的CPU使用情况（百分比）。

②：鼠标悬浮在柱状图上，会显示CPU总使用率、CPU使用率top5的进程号（Pid）和对应的CPU使用率。

③：选中柱状图后，显示相关的日志。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/65/v3/FrkxxHrJRquq8VHSXDZy2g/zh-cn_image_0000002500910344.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=0E303A085248F67988A093A271347191DE7C07632A20AAFB5A4CFB404F0A173D)

如下是内存的相关日志。

①：柱状图表示对应时间点的内存使用情况（百分比）。

②：鼠标悬浮在柱状图上，会显示内存使用率、内存占用top5的进程和对应的内存大小。

③：选中柱状图后，显示相关的日志。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/78/v3/LcQOXzplT0uQID1pRT0oEw/zh-cn_image_0000002501070212.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=00E4C044E88110C11258A24385AC5221AC226F2824CDD2DD3D5804E282A70300)

### 查看3s/6s堆栈日志

从DevEco Studio 6.0.2 Beta1版本开始，新增3s/6s Compare页签，用于对[THREAD\_BLOCK\_6S](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/appfreeze-guidelines#thread_block_6s-应用主线程卡死超时)类型的AppFreeze问题，展示3s和6s时间点的主线程堆栈日志，并标识栈帧中可能的故障处。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/50/v3/N2Ee7HP-RpKBEVx0bALY3g/zh-cn_image_0000002532670261.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=2F251E9325B5A7366B89CF47A4C82506A1AF550814CE9EFA0932E3804274D5E1)

如果不是THREAD\_BLOCK\_6S类型的AppFreeze问题，不会展示3s/6s Compare页签。

## 查看应用终止日志

从DevEco Studio 6.0.2 Beta1版本开始，提供**AppKilled**窗口，用于查看设备上应用终止的相关信息，包括应用异常退出的时间、进程名、是否前台应用、异常退出原因，点击**recordId**可以查看详细的FaultLog信息。支持按设备、应用和异常原因对信息进行过滤。

AppKilled窗口中支持查看的异常退出原因请参考[reason字段说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hidumper#reason字段说明)，如需对问题进行排查处理，请参考[App Killed（应用终止）检测](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/appkilled-guidelines)。

说明

2in1、Tablet设备不支持查看APP\_INPUT\_BLOCK和THREAD\_BLOCK\_6S类型的数据。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6/v3/mxY11m0_Tn6XgdrDM1xPpA/zh-cn_image_0000002533262913.png?HW-CC-KV=V1&HW-CC-Date=20260313T045936Z&HW-CC-Expire=86400&HW-CC-Sign=5C29E6E41DCAD46D5B7BD83F0F1FAC705DE3771877F697B7EB0FB5DF5F103DA2)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-fault-log*