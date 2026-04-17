---
title: 应用运行报错：hap path error
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-55
category: FAQ
updated_at: 2026-03-13T05:58:58.664Z
---

# 应用运行报错：hap path error

**问题现象**

启动调试或运行应用/服务时，应用运行崩溃，提示错误信息“errorMsg: hap path error”。

**解决措施**

如果依赖的应用包未安装，建议进入**Run/Debug Configurations > Deploy Multi Hap****/Hsp**页签，勾选**Deploy Multi Hap/Hsp Packages**，选择所需依赖的应用包，然后重新运行应用。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/34/v3/FvMG9bj0Tva3RomTkEM5pQ/zh-cn_image_0000002487797922.png?HW-CC-KV=V1&HW-CC-Date=20260313T055852Z&HW-CC-Expire=86400&HW-CC-Sign=0C584571778E90DC1DF4A220911F0731F9757DEF523F11EADE4EB026BB3D466C)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-55*