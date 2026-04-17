---
title: 使用HWASan检测内存错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hwasan
category: 指南
updated_at: 2026-03-13T05:00:56.324Z
---

# 使用HWASan检测内存错误

HWASan（Hardware-Assisted Address Sanitizer）是一款类似于[ASan](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-asan)的内存错误检测工具。 与ASan相比，HWASan使用的内存减少很多，因而更适合用于整个系统的清理。关于HWASan的检测原理请参考[HWASan检测原理](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-address-sanitizer-principle#section187526511146)。

## 约束条件

-   HWASan检测仅适用于AArch64架构的硬件。
-   ASan、TSan、UBSan、HWASan不能同时开启，四个只能开启其中一个。

## 使能HWASan

### 方式一

点击****Run > Edit Configurations >** Diagnostics**，勾选**Hardware-Assisted Address Sanitizer**开启检测。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1d/v3/8NlpkjQ4T62YlDbyxWQBng/zh-cn_image_0000002501070142.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=0A532F144D7791300C1383E87C532B523A24F35804B3C743886D88EE6B79F1BA)

### 方式二

1.  修改工程目录下的AppScope/app.json5文件，添加HWASan配置开关。
    
    ```json
    "hwasanEnabled": true
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bf/v3/v0QqANvdSN2rGzQe-Yj56g/zh-cn_image_0000002532750163.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=744464A965FF1134DBBC108831DD8694518FC2D6E6B64B04E22A769310C5A8E5)
    
2.  在需要使能HWASan的模块中，通过添加构建参数开启HWASan检测插桩，在对应模块的模块级build-profile.json5中添加命令参数：
    
    ```json
    "arguments": "-DOHOS_ENABLE_HWASAN=ON"
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e2/v3/f88EtiGtTpej9p4X3AD73w/zh-cn_image_0000002532750161.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=A91BAEFE9324B8E27564D60D0EDC5FF1499FD85795087EF4585AD71D16EFD892)
    

## 启用HWASan

1.  运行或调试当前应用。
2.  当程序出现内存错误时，弹出HWASan log信息，点击信息中的链接即可跳转至引起内存错误的代码处。日志中各字段的说明请参考[HWASan日志规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/address-sanitizer-guidelines#hwasan日志规格)，异常检测类型请参考[HWASan异常检测类型](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-hwasan-detection#section207321025115510)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1e/v3/HdVjehQqTD2ddXKo9-LCqw/zh-cn_image_0000002500910296.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=4C8C614F03A97492178564B876838100BE7EE751FC5D8538556F7F295E8CBAB4)
    
3.  如果是release应用，本地无工程代码，可以使用AnalyzeStackTrace功能，提供要解析堆栈的so，解析结果为源码地址。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/97/v3/LQ848N4_RbaM8F6I04-WWA/zh-cn_image_0000002501070144.png?HW-CC-KV=V1&HW-CC-Date=20260313T050017Z&HW-CC-Expire=86400&HW-CC-Sign=28DFDBF11A48601A81ECE9CDED8D5E86C999D794B0B868D8C069298D7675CBD9)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hwasan*