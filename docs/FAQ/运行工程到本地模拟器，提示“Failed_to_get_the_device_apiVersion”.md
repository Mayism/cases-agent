---
title: 运行工程到本地模拟器，提示“Failed to get the device apiVersion”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-5
category: FAQ
updated_at: 2026-03-13T05:50:20.214Z
---

# 运行工程到本地模拟器，提示“Failed to get the device apiVersion”

**问题现象**

本地模拟器启动后，运行工程到模拟器，提示“Failed to get the device apiVersion”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/66/v3/hVnClcYXSK6BBDJnJtvwIA/zh-cn_image_0000002194317932.png?HW-CC-KV=V1&HW-CC-Date=20260313T055013Z&HW-CC-Expire=86400&HW-CC-Sign=F7C0E4FC3E642E0D208431070D4093ACBE864C9F640CC028F0BDA89F1060EFD8)

**解决措施**

可以通过以下方法重新运行工程：

-   在**Local Emulator**的设备列表窗口，点击“Wipe User Data”清除模拟器数据，然后重新启动模拟器并运行工程。
-   打开命令行工具，进入HarmonyOS SDK安装目录下的 \`default/base/toolchains\` 路径，执行以下命令重启 hdc server：
    
    ```bash
    ./hdc kill -r
    ```
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/68/v3/ALHATeINRz6kwNuonyIy2w/zh-cn_image_0000002229758185.png?HW-CC-KV=V1&HW-CC-Date=20260313T055013Z&HW-CC-Expire=86400&HW-CC-Sign=1BE308FBC7AA8D6DE765C27672C4FFD5892906516CC6FA5FE08AFC9D8FBEE4D8)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-running-5*