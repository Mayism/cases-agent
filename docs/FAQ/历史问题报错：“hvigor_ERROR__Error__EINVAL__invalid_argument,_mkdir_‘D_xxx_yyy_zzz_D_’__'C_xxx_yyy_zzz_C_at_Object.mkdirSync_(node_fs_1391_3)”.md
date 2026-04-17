---
title: 历史问题报错：“hvigor ERROR: Error: EINVAL: invalid argument, mkdir ‘D:xxx\yyy\zzz\D:’/ 'C:xxx\yyy\zzz\C:at Object.mkdirSync (node:fs:1391:3)”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-190
category: FAQ
updated_at: 2026-03-13T05:47:57.079Z
---

# 历史问题报错：“hvigor ERROR: Error: EINVAL: invalid argument, mkdir ‘D:xxx\yyy\zzz\D:’/ 'C:xxx\yyy\zzz\C:at Object.mkdirSync (node:fs:1391:3)”

**问题现象**

构建报错：“hvigor ERROR: Error: EINVAL: invalid argument, mkdir ‘D:xxx\\yyy\\zzz\\D:’”

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b7/v3/ZoftP60aSS-eAHqmnse0Ew/zh-cn_image_0000002433194024.png?HW-CC-KV=V1&HW-CC-Date=20260313T054752Z&HW-CC-Expire=86400&HW-CC-Sign=8085C7D7F99A9BB244305D6B6FBD237DD88F78BA79AEC39E1BE1670A0340DFB1)

**常见错误场景**

工程A通过工程外模块的方式使用了工程B中的har模块，在工程B中执行ohpm后，在工程A中没有重新执行ohpm install直接编译（或者调试），导致编译报错。

**问题原因**

ohpm远程三方包安装后，软连接指向的路径为非本工程路径（是由于被其他工程篡改），编译时会出现预期之外的错误。注：能以非本工程路径存在的依赖仅为本地模块，参考官网工程外模块的使用方式）

**解决措施**

1.**在问题工程中重新执行ohpm install**，或者sync。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d1/v3/s9OxBvzsTduudqtXs94VUA/zh-cn_image_0000002433353864.png?HW-CC-KV=V1&HW-CC-Date=20260313T054752Z&HW-CC-Expire=86400&HW-CC-Sign=F67B165BFCA837A904248B1A620A6C52C1277ECDD2490AE541B7066C3CBF74F4 "点击放大")

2.使用build菜单先进行构建，再调试运行。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b7/v3/djg9JJwOTnyyp7eunjC4HQ/zh-cn_image_0000002466912421.png?HW-CC-KV=V1&HW-CC-Date=20260313T054752Z&HW-CC-Expire=86400&HW-CC-Sign=4966A577154EA438D63AAA38D17C35403D820941A7CAC107B6ED659BDED81357 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-190*