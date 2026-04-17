---
title: 使用ASan检测内存错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-asan
category: 指南
updated_at: 2026-03-13T05:00:55.749Z
---

# 使用ASan检测内存错误

为追求C/C++的极致性能，编译器和OS(Windows/Linux/Mac)运行框架不会对内存操作进行安全检测。针对该场景，DevEco Studio集成ASan（Address-Sanitizer）为开发者提供面向C/C++的地址越界检测能力，并通过FaultLog展示错误的堆栈详情及导致错误的代码行。关于ASan的检测原理请参考[ASan检测原理](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-address-sanitizer-principle#section159561141247)。

## 使用约束

-   如果应用内的任一模块使能ASan，那么entry模块需同时使能ASan。如果entry模块未使能ASan，该应用在启动时将闪退，出现CPP Crash报错。
-   ASan、TSan、UBSan、HWASan不能同时开启，四个只能开启其中一个。

## 使能ASan

可通过以下两种方式使能ASan。

### 方式一

1.  点击**Run > Edit Configurations >** **Diagnostics**，勾选**Address Sanitizer**。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/aa/v3/3u4YS9xVRXiBFJ9wzwL8rg/zh-cn_image_0000002532670083.png?HW-CC-KV=V1&HW-CC-Date=20260313T050014Z&HW-CC-Expire=86400&HW-CC-Sign=79D96CAC5C510AC130E6BAFAD982F417350FDCE9B7B71B21173EB80AE5E64CFD)
    
2.  如果有引用本地library，需在library模块的build-profile.json5文件中，配置arguments字段值为“-DOHOS\_ENABLE\_ASAN=ON”，表示以ASan模式编译so文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/05/v3/UMAOe0ktRQqw2mUCTz2x0A/zh-cn_image_0000002500910162.png?HW-CC-KV=V1&HW-CC-Date=20260313T050014Z&HW-CC-Expire=86400&HW-CC-Sign=CEB3B7F8020B21DF02DE3FD9EAC0DEF741B78E4EC006C9B302AB5E1DCE9618BD)
    

### 方式二

1.  修改工程目录下AppScope/app.json5，添加ASan配置开关。
    
    ```json
     "asanEnabled": true
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/toy_2pDoS--mLjYralXQcw/zh-cn_image_0000002532750033.png?HW-CC-KV=V1&HW-CC-Date=20260313T050014Z&HW-CC-Expire=86400&HW-CC-Sign=8248C80FE535D35261BFCA541D53DDC4A0F59253A8F990AD984F9742EB0824D5)
    
2.  设置模块级构建ASan插桩。
    
    在需要使能ASan的模块中，通过添加构建参数开启ASan检测插桩，在对应模块的模块级build-profile.json5中添加命令参数：
    
    ```json
    "arguments": "-DOHOS_ENABLE_ASAN=ON"
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/11/v3/vylHLdRDRtmHyv2ane44Ow/zh-cn_image_0000002501070006.png?HW-CC-KV=V1&HW-CC-Date=20260313T050014Z&HW-CC-Expire=86400&HW-CC-Sign=2F59B97A98B3D1645DAFBD31EB4AC20E68A05F4B9B8C0FAF7003D1C82ABFCFAF)
    
    说明
    
    该参数未配置不会报错，但是除包含malloc和free函数等少数内存错误外，出现其他需要插桩检测的内存错误时，ASan无法检测到错误。
    

## 配置参数（可选）

ASAN\_OPTIONS用于在运行时配置ASan的行为，包括设置检测级别、输出格式、内存错误报告的详细程度等。ASAN\_OPTIONS支持在app.json5中配置，也支持在Run/Debug Configurations中配置。app.json5的优先级更高，即两种方式都配置后，以app.json5中的配置为准。关于ASAN\_OPTIONS的配置方式和常用参数请参考[配置参数](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-asan-detection#section1496994494018)。

## 启用ASan

1.  运行或调试当前应用。
2.  当程序出现内存错误时，弹出ASan log信息，点击信息中的链接即可跳转至引起内存错误的代码处。日志中各字段的说明请参考[ASan日志规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/address-sanitizer-guidelines#asan日志规格)，异常检测类型请参考[ASan异常检测类型](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-asan-detection#section12508111110451)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8d/v3/TaNH8gMyTK-PJK7sGc9cYg/zh-cn_image_0000002532670077.png?HW-CC-KV=V1&HW-CC-Date=20260313T050014Z&HW-CC-Expire=86400&HW-CC-Sign=4A7C734E02BD849F6DB24A7D4676C1EC923179AE76194EE3831C68F5D20A06A4 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-asan*