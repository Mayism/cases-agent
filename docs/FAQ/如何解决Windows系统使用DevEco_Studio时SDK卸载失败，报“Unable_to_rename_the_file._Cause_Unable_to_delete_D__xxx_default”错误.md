---
title: 如何解决Windows系统使用DevEco Studio时SDK卸载失败，报“Unable to rename the file. Cause:Unable to delete D:\xxx\default”错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-15
category: FAQ
updated_at: 2026-03-13T05:26:12.818Z
---

# 如何解决Windows系统使用DevEco Studio时SDK卸载失败，报“Unable to rename the file. Cause:Unable to delete D:\xxx\default”错误

**问题描述**

Windows系统使用DevEco Studio时，SDK卸载失败，提示错误信息。

Unable to rename the file. Cause: Unable to delete D:\\\\xxx\\\\default.

**解决方案**

1、启动任务管理器。

2、切换到“性能”页签。

3、点击下方“打开资源监视器”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/da/v3/Mg32I2dZR_y8SdtSNcf4nQ/zh-cn_image_0000002194158616.png?HW-CC-KV=V1&HW-CC-Date=20260313T052608Z&HW-CC-Expire=86400&HW-CC-Sign=FBCAE3C91BC12B92FCD5AA82A40D75FB5F818D1563E6A655F8B4AC6D162CA5F1)

4、将路径 D:\\xxx\\default 粘贴到关联句柄窗口右侧的搜索栏中，按回车键搜索占用的进程，然后结束该进程。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/A1aRDZEvR22djOZiT_d1BQ/zh-cn_image_0000002229758493.png?HW-CC-KV=V1&HW-CC-Date=20260313T052608Z&HW-CC-Expire=86400&HW-CC-Sign=9987CC6EC338169898C0E3F5D4A9751CFDF07744677A3FA047F237DE42B9706C)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-15*