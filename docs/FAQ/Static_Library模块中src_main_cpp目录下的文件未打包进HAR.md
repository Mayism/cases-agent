---
title: Static Library模块中src/main/cpp目录下的文件未打包进HAR
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-23
category: FAQ
updated_at: 2026-03-13T05:32:08.296Z
---

# Static Library模块中src/main/cpp目录下的文件未打包进HAR

**问题现象**

点击**Build > Make Module ${libraryName}**编译构建生成HAR后，发现构建产物中未出现cpp目录下的文件。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/27/v3/_j852iwiRUiqB_16qYMMpQ/zh-cn_image_0000002229758217.png?HW-CC-KV=V1&HW-CC-Date=20260313T053203Z&HW-CC-Expire=86400&HW-CC-Sign=A8321ECD5199E2C76994C1166F1C1AC323866AC97215194F6437CC759C0FFCEE)

**解决措施**

如果使用的Hvigor为2.5.0-s及以上版本，在编译构建HAR的过程中，仅会将dependencies内处于本模块路径下的本地依赖打包进.har文件中，devDependencies里的依赖不会打包进.har文件中。

请将相应的本地依赖移至dependencies中，然后重新编译。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/zkYZbYNNT7qBFDMJ5uSTdA/zh-cn_image_0000002229603749.png?HW-CC-KV=V1&HW-CC-Date=20260313T053203Z&HW-CC-Expire=86400&HW-CC-Sign=F938700799406F43FD51DF1506C6395B132A115B95F2F5597A2F0A197B7FBB38)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-23*