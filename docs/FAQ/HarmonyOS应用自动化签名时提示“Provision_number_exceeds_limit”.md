---
title: HarmonyOS应用自动化签名时提示“Provision number exceeds limit”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-4
category: FAQ
updated_at: 2026-03-24T11:27:04.570Z
---

# HarmonyOS应用自动化签名时提示“Provision number exceeds limit”

**问题现象**

使用自动化签名功能对HarmonyOS进行签名时，提示“Provision number exceeds limit”信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4d/v3/YVAOizRwRz2ecnNJbQVa1A/zh-cn_image_0000002194318424.png?HW-CC-KV=V1&HW-CC-Date=20260324T112704Z&HW-CC-Expire=86400&HW-CC-Sign=73D04329FFBB2F24FD9455FB1D6EE1E0345D12D17BDF4305CCA18379286A04D4)

**解决措施**

AGC（AppGallery Connect）限制了自动化签名的使用次数。同一开发者账号在最近30天内使用自动化签名功能的次数不能超过150次。

可通过如下几种方式进行解决：

-   方法1：建议相同BundleName的应用，如果设备无变化，请使用同一套签名文件信息，不要反复进行重签名操作。
-   方法2：更换其它开发者账号进行登录，然后进行签名。
-   方法3：AGC限制同一个账号在30天内使用自动化签名的次数不超过150次。等待一段时间后，可重新使用该账号签名。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-4*