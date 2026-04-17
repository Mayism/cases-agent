---
title: 编译报错“Could not load ${file1} (imported by ${file2}): Maximum call stack size exceeded”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-8
category: FAQ
updated_at: 2026-03-13T05:30:42.215Z
---

# 编译报错“Could not load ${file1} (imported by ${file2}): Maximum call stack size exceeded”

**问题现象**

Stage模板工程编译构建失败，提示 “ERROR: Could not load ${file1} (imported by ${file2}): Maximum call stack size exceeded”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/db9jOlDuSc69wPHTd5qtiw/zh-cn_image_0000002229758241.png?HW-CC-KV=V1&HW-CC-Date=20260313T053037Z&HW-CC-Expire=86400&HW-CC-Sign=A08AAAFFBBCFF247A785FCC10D0288615402EE2A5505C6A28CD51D8B5C629DBA)

**解决措施**

问题源于file1位于当前工程外，步骤如下：

1.  在工程中右键选择New > Module...。
2.  选择Static Library模板。
3.  配置build-profile.json中的dependencies添加HAR引用。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/02/v3/7KlY6xVYSEyf4eq9MQRBwg/zh-cn_image_0000002194158380.png?HW-CC-KV=V1&HW-CC-Date=20260313T053037Z&HW-CC-Expire=86400&HW-CC-Sign=EC66675FDA84E9F665EF1E066655C6D6095DA76DED19EAF29C8FFC306B7EB2E7)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-8*