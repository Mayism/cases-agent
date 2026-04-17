---
title: 编译报错“Cannot resolved import statement”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-140
category: FAQ
updated_at: 2026-03-13T05:43:34.832Z
---

# 编译报错“Cannot resolved import statement”

**错误描述**

在编译过程中，提示“Cannot resolved import statement”错误信息。

**可能原因**

导入文件时，大小写不一致会导致问题（导入到单个文件夹时，默认寻址小写 “index.ets”文件，但该文件夹下仅存在大写“index.ets”文件）。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/fLoeqJoGQomCAN7SqKo9Pg/zh-cn_image_0000002194318384.png?HW-CC-KV=V1&HW-CC-Date=20260313T054330Z&HW-CC-Expire=86400&HW-CC-Sign=0BE7A2A28EDA32147EE13230DD2CAEA6467C87DC7F9E9603709A39B0312263C9)

**解决措施**

检查import文件的大小写。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-140*