---
title: 使用TSan检测线程错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-tsan
category: 指南
updated_at: 2026-03-13T05:00:56.147Z
---

# 使用TSan检测线程错误

TSan（ThreadSanitizer）是一个检测数据竞争的工具。它包含一个编译器插桩模块和一个运行时库。TSan开启后，会使性能降低5到15倍，同时使内存占用率提高5到10倍。关于TSan的检测原理请参考[TSan](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-tsan-detection)。

## 功能介绍

### 应用场景

TSan能够检测出如下问题：

-   数据竞争检测
    
    数据竞争（Data Race）是指两个或多个线程在没有适当的同步机制情况下同时访问相同的内存位置，其中至少有一个线程在写入。数据竞争是导致多线程程序行为不可预测的主要原因之一。
    

-   锁错误检测
    
    TSan 不仅能检测数据竞争，还能检测与锁相关的错误：
    
    -   死锁（Deadlock）：死锁是指两个或多个线程互相等待对方释放锁，导致程序无法继续执行。
    -   双重解锁（Double Unlock）：同一线程尝试解锁已经解锁的锁。
    -   未持有锁解锁：一个线程尝试解锁一个它未持有的锁。

-   条件变量错误检测
    
    条件变量用于线程之间的通信和同步，常见错误包括：
    
    -   未持有锁等待：一个线程在未持有相关锁的情况下调用 wait。
    -   未持有锁唤醒：一个线程在未持有相关锁的情况下调用 signal 或 broadcast。

### 错误报告

当 TSan 检测到错误时，它会生成详细的报告，包括：

-   错误类型：例如数据竞争、死锁等。
-   内存地址：涉及的内存地址。
-   线程信息：涉及的线程ID和线程创建的堆栈跟踪。
-   源代码位置：每一个内存访问的源代码位置和堆栈跟踪。
-   上下文信息：访问类型（读/写）、访问大小等。

## 使用约束

-   TSan仅支持API 12及以上版本。
-   ASan、TSan、UBSan、HWASan不能同时开启，四个只能开启其中一个。
-   TSan开启后会申请大量虚拟内存，其他申请大虚拟内存的功能（如gpu图形渲染）可能会受影响。
-   TSan不支持静态链接libc或libc++库。

## 使能TSan

可通过以下两种方式使能TSan。

### 方式一

1.  点击**Run > Edit Configurations >** **Diagnostics**，勾选**Thread Sanitizer**。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/94/v3/NORSo1cLQY2P_JVqt_FFGw/zh-cn_image_0000002500910422.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=D6D0AACC795699F302BB6940E90F2AF17A18B388C15556E490A2A349143AFB96)
    
2.  如果有引用本地library，需在library模块的build-profile.json5文件中，配置arguments字段值为“-DOHOS\_ENABLE\_TSAN=ON”，表示以TSan模式编译so文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/__S2HMX8SYasEFrf_lK-nA/zh-cn_image_0000002532670343.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=358BEF73F16FFACD1325BD19AFB30897F43E2E4FBC6CF08291249A2825855AEA)
    

### 方式二

1.  修改工程目录下AppScope/app.json5，添加TSan配置开关。
    
    ```json
     "tsanEnabled": true
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/WUHCojXiTguf6LU3RzVqgQ/zh-cn_image_0000002501070262.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=441DCF39D9FB5BACDCB9CEC4545D5516FAF7E873B0251BBE7284DC8A8A6647A6)
    
2.  设置模块级构建TSan插桩。
    
    在需要使能TSan的模块中，通过添加构建参数开启TSan检测插桩，在对应模块的模块级build-profile.json5中添加命令参数：
    
    ```json
    "arguments": "-DOHOS_ENABLE_TSAN=ON"
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f4/v3/OQISpayhTlOZRrJjPlyhgA/zh-cn_image_0000002532670337.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=BCCB1AA57DF053430CF8C93968700947E331FB23F2E04947223C66F0F824F73B)
    

## 启用TSan

1.  运行或调试当前应用。
2.  当程序出现线程错误时，弹出TSan log信息，点击信息中的链接即可跳转至引起线程错误的代码处。日志中的异常检测类型请参考[TSan异常检测类型](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-tsan-detection#section1180812915516)。
    
    说明
    
    当前使用call\_once接口会存在TSan误报的现象，开发者可以在调用该接口的函数前添加\_\_attribute\_\_((no\_sanitize("thread")))来屏蔽该问题。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/61/v3/X-aVHOoTQDuFQw5U-vReRw/zh-cn_image_0000002500910420.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=C8C4AC4C6C8A8C98DA7DB65CBD67D063C5F5E16C97E001960390F1721401AA16)
    
3.  如果是release应用，本地无工程代码，可以使用AnalyzeStackTrace功能，提供要解析堆栈的so，解析结果为源码地址。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/BdyDx3rTTqGPOIdb_DDvvA/zh-cn_image_0000002532670335.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=A035B904F3829BE9480EDB3E0C2EC59B10DE6B3B664141CEFA335EC6ABD6F2A9 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-tsan*