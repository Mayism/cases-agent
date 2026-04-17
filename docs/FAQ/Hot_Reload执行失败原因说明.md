---
title: Hot Reload执行失败原因说明
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-21
category: FAQ
updated_at: 2026-03-13T05:57:22.490Z
---

# Hot Reload执行失败原因说明

**问题现象**

热重载执行结果失败，控制台打印蓝色重启链接：“Reloaded 1 files failed. Please reinstall and restart.”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2e/v3/lXi75cEaTwaGBVl7910JaQ/zh-cn_image_0000002194318548.png?HW-CC-KV=V1&HW-CC-Date=20260313T055717Z&HW-CC-Expire=86400&HW-CC-Sign=515480C0D1D66DE1B9C0541E82CF66FFD0F6F6B6C05E2577009BA4A077998518 "点击放大")

**解决措施**

热重载的最后一步是将补丁包安装到设备并执行quickfix命令。如果quickfix命令执行失败，热重载也会失败。

导致补丁包安装失败的原因可检查以下几个方面：

-   检查工程签名是否正确，热重载需要使用debug签名（不支持release签名），否则热重载将无法执行。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/21/v3/qpdKUop4Qha6AQj3iunvCg/zh-cn_image_0000002229604317.png?HW-CC-KV=V1&HW-CC-Date=20260313T055717Z&HW-CC-Expire=86400&HW-CC-Sign=E478F709504DC62949E4678B85E76C0610C7068D977B66CF08124322CB974565 "点击放大")
    
-   检查工程的Build Mode，热重载不支持release模式，支持debug和<None>。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fa/v3/2aTzumJVRhqIIP5wip_GVQ/zh-cn_image_0000002487886068.png?HW-CC-KV=V1&HW-CC-Date=20260313T055717Z&HW-CC-Expire=86400&HW-CC-Sign=6A989BC3C8B84146A67F92989142B309001F831E8362A0C142E9AABC39900930)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-21*