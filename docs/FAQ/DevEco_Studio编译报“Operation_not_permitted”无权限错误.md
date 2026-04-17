---
title: DevEco Studio编译报“Operation not permitted”无权限错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-78
category: FAQ
updated_at: 2026-03-13T05:37:29.336Z
---

# DevEco Studio编译报“Operation not permitted”无权限错误

**问题描述**

DevEco Studio安装完成后一直报Operation not permitted无权限，具体报错如下所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/db/v3/pnxGmgvIRamOlQYUa-P7eA/zh-cn_image_0000002194158416.png?HW-CC-KV=V1&HW-CC-Date=20260313T053724Z&HW-CC-Expire=86400&HW-CC-Sign=99D08FB5F4012F0B13CECD9C75C1AA95D092D06ABDC733F4EE4B6F00825A5B3A)

**解决方案**

通过以下命令查看是否有com.example.myapplication标识

xattr -l /path/to/es2abc

用以下命令删除该标识

xattr -d com.example.myapplication/path/to/es2abc

根因：mac系统对文件访问有限制

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-78*