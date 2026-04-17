---
title: 如何解决DevEco Studio编译hsp和闭源har包的时候，生成声明文件时emit的耗时过长导致编译慢的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-71
category: FAQ
updated_at: 2026-03-13T05:36:56.483Z
---

# 如何解决DevEco Studio编译hsp和闭源har包的时候，生成声明文件时emit的耗时过长导致编译慢的问题

说明

注：此方法为临时规避方案，后续将修复该问题，建议仅在阻塞时使用。

用于减少编译HSP和闭源HAR包时生成声明文件的耗时。

修改 ets\_checker.js 文件（文件路径：SDK路径\\default\\base\\ets\\build-tools\\ets-loader\\lib\\ets\_checker.js），编辑 processBuildHap 函数。

1.  生成 sourceFile，在遍历文件时生成声明文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7c/v3/K2Hj7fLxQ4CuDWFrpI5pwg/zh-cn_image_0000002229603953.png?HW-CC-KV=V1&HW-CC-Date=20260313T053651Z&HW-CC-Expire=86400&HW-CC-Sign=9A508DA0DE1F77CD19D4ECE7516C80A7390F1EFCE36240180C09E57BF00EC8C3 "点击放大")
    
2.  修改 getEmitOutput 函数，将其改为 getFileEmitOutput 函数，以获取声明文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/64/v3/xz_yQ-qaTf285y15PaEXyQ/zh-cn_image_0000002194318168.png?HW-CC-KV=V1&HW-CC-Date=20260313T053651Z&HW-CC-Expire=86400&HW-CC-Sign=EF8627020737985F0A2A9100A0DD247F82B2EFEF4138DE594EBF95C25B4D8069 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-71*