---
title: so信息可视化
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-native-so
category: 指南
updated_at: 2026-03-13T04:57:13.625Z
---

# so信息可视化

在native调试窗口中，点击**Layout Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5b/v3/mHUelenmTqawx6a3pmLgZw/zh-cn_image_0000002533435023.png?HW-CC-KV=V1&HW-CC-Date=20260313T045633Z&HW-CC-Expire=86400&HW-CC-Sign=F4674FE077392DD431EE7DB5F53CAFAA5330A165598DA76D2615B34DF7552943)，勾选**Modules**，打开模块视图。

在native调试期间，**Modules**窗口会列出并显示有关应用使用的so信息。点击各属性可按升序/降序来排序，；支持字符串匹配搜索。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/y_zqp219TOm4nWPMxNo5pQ/zh-cn_image_0000002501831802.png?HW-CC-KV=V1&HW-CC-Date=20260313T045633Z&HW-CC-Expire=86400&HW-CC-Sign=2D4C37CC1C80FD53B9D14DB53F77A3B676E2F9AA3C9B8B2CB98B4DB6094F787B)

-   加载符号表文件
    
    如果符号未加载，可右键点击模块，选择**Load Modules**，加载本地携带符号信息的so文件。加载成功后，Symbol Status列会显示"Symbols Loaded"。
    
    如需将符号恢复为初始状态，可右键点击模块，选择**Reset** **Modules**。
    
-   添加源码地址映射
    
    加载的符号表文件路径默认是编译时的路径，若与本地的源码文件路径不一致时，需要关联源码文件。右键点击模块，选择**Set Source Mapping**，选择本地源码文件路径，映射成功后，Source Root Path列会显示映射后的路径。
    
    如需恢复为默认路径，可右键点击模块，选择**Reset** **Source Mapping****s**。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-native-so*