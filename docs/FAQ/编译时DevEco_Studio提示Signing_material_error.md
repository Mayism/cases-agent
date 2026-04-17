---
title: 编译时DevEco Studio提示Signing material error
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-44
category: FAQ
updated_at: 2026-03-13T05:34:10.438Z
---

# 编译时DevEco Studio提示Signing material error

**问题现象**

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/41/v3/ByU4jQkASgqmQAvNVWI4-w/zh-cn_image_0000002229604197.png?HW-CC-KV=V1&HW-CC-Date=20260313T053403Z&HW-CC-Expire=86400&HW-CC-Sign=6FB26D9F74BC138ACD27BCF503D2EA83FDD7179040B53466880FA665124DE355 "点击放大")

**解决措施**

删除C盘用户路径下 .hvigor 文件夹中的 meta 文件，然后重新签名并编译。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-44*