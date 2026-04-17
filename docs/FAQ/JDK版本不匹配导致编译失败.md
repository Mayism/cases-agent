---
title: JDK版本不匹配导致编译失败
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-14
category: FAQ
updated_at: 2026-03-13T05:31:10.840Z
---

# JDK版本不匹配导致编译失败

**问题现象**

通过命令行方式构建HarmonyOS应用或元服务过程中出现构建失败，现象如下图所示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/oWLXbn68RF2vNT1VNGavgQ/zh-cn_image_0000002229604033.png?HW-CC-KV=V1&HW-CC-Date=20260313T053105Z&HW-CC-Expire=86400&HW-CC-Sign=D2693511C1036BC08DA49BF1C101CD8F1489224E8BC7C8FCB847E8E83AF5190C)

**解决措施**

该问题需使用配套的JDK 17版本解决，请根据如下方法进行修正：

1.  下载并安装JDK 17版本。
2.  修改JAVA\_HOME环境变量，取值为JDK 17。如果是Linux系统，可参考命令行方式构建服务或应用的[配置JDK](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-command-line-building-app#section195447475220)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-14*