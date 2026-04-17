---
title: HarmonyOS应用自动化签名时提示“Unsupported restricted ACL permission exist in the configuration”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-5
category: FAQ
updated_at: 2026-03-24T11:27:06.407Z
---

# HarmonyOS应用自动化签名时提示“Unsupported restricted ACL permission exist in the configuration”

**问题现象**

在对HarmonyOS应用工程中，勾选“Automatically generate signature”时，提示“Unsupported restricted ACL permission exist in the configuration”报错信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d8/v3/V-SGdHjqR0GrNMvcecvcOQ/zh-cn_image_0000002250504069.png?HW-CC-KV=V1&HW-CC-Date=20260324T112706Z&HW-CC-Expire=86400&HW-CC-Sign=54296C1A70F3B1FB9E244AAF0E1DB293E8DEFEDC1552AD8D5EA48E7EC73370AB)

**解决措施**

出现该问题的原因是当前DevEco Studio自动签名只支持部分的ACL权限，当前工程中使用了不在支持范围之内的ACL权限，建议尝试手动签名。

**参考链接**

[自动签名支持的ACL权限](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section5301916183411)

[手动签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-5*