---
title: LABEL_VALUE_ERROR处理指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-15
category: FAQ
updated_at: 2026-03-13T05:31:16.748Z
---

# LABEL_VALUE_ERROR处理指导

**问题现象**

在工程同步、编译构建过程中，提示**LABEL\_VALUE\_ERROR**错误信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a2/v3/u5Rpsrp6TMuKZGv86oZ1Vg/zh-cn_image_0000002229758717.png?HW-CC-KV=V1&HW-CC-Date=20260313T053111Z&HW-CC-Expire=86400&HW-CC-Sign=947B667A0AF4A6DE6908EF7F18A7C160DC13062884FCB00B9B293E56F62B3101)

**解决措施**

该问题由config.json文件的资源引用规则变更引起，需将“label”字段的取值修改为资源引用方式。

1.  在**resources > base > element**中的string.json中添加对应的字符串信息。
2.  在config.json中重新引用该字符串资源。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/29/v3/1cY0YiJJT96JmnTyzE2crg/zh-cn_image_0000002194158844.png?HW-CC-KV=V1&HW-CC-Date=20260313T053111Z&HW-CC-Expire=86400&HW-CC-Sign=B60C4461676CDB54602B985AFCE4D1162FD152F6B7857076517C8F6E0304DA5A)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-15*