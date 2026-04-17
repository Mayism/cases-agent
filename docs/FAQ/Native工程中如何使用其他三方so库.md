---
title: Native工程中如何使用其他三方so库
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-34
category: FAQ
updated_at: 2026-03-13T03:30:34.601Z
---

# Native工程中如何使用其他三方so库

1.将编译好的so库放到Native工程的entry/libs/arm64-v8a/目录下，并将so库对应的头文件放到entry/src/main/cpp目录层级下（可以在cpp目录下增加一个文件夹专门存放三方so库的头文件）。

2.在CMakeLists.txt文件中链入so库。

3.在Native侧 .cpp文件中引入头文件使用so库的相关能力。

示例如下：

在Native侧集成三方库Curl

1\. 将移植后的Curl的so库放到Native工程的entry/libs/目录下，并将移植后生成的、包含头文件的include目录放到entry/src/main/cpp目录下。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1/v3/ZyyLUYYwQkyRrt3adTCp4A/zh-cn_image_0000002194158760.png?HW-CC-KV=V1&HW-CC-Date=20260313T033028Z&HW-CC-Expire=86400&HW-CC-Sign=B0F8EDEADCEB3D532AE65C155E12B8CBCA42A0F29920547660B4FEE185AC358A "点击放大")

2\. 在CMakeLists.txt文件中链入Curl对应的so库。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/10/v3/fCfA9ztqQ-Oa-dogqMAD3Q/zh-cn_image_0000002194158764.png?HW-CC-KV=V1&HW-CC-Date=20260313T033028Z&HW-CC-Expire=86400&HW-CC-Sign=4DCF2EACF4EF171A5F77184D201CD8A8A50B2AD071C7A8F79DAA513DB55B3F14 "点击放大")

3\. 在Native侧.cpp文件中通过引入头文件curl.h来使用Curl的相关能力。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/13/v3/QoEs0NUDScO6YTz_p9E9kQ/zh-cn_image_0000002229758629.png?HW-CC-KV=V1&HW-CC-Date=20260313T033028Z&HW-CC-Expire=86400&HW-CC-Sign=C0E4AB72FEA2A4F080550B769A1498AF2C049054CB7EB654DB0742E2176A790E "点击放大")

**参考链接：**

[在NDK工程中使用预构建库](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/build-with-ndk-prebuilts)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-34*