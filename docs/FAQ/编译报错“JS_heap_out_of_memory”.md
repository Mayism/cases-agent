---
title: 编译报错“JS heap out of memory”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-1
category: FAQ
updated_at: 2026-03-13T05:30:01.277Z
---

# 编译报错“JS heap out of memory”

**问题现象**

编译构建时，出现报错“JS heap out of memory”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c7/v3/3FqrwcstQOq6tkyBPA3oqg/zh-cn_image_0000002194158628.png?HW-CC-KV=V1&HW-CC-Date=20260313T052954Z&HW-CC-Expire=86400&HW-CC-Sign=B450861833CD2414DDFE1DBCD17C6C18DC1860C90D374CC5889A5F26D35A5009)

**解决措施**

出现该报错的原因是hvigor运行时内存不足。在使用3.1.0及以上版本的hvigor时，可通过以下方式修改hvigor运行时内存的最大值。

勾选 Enable the Daemon for tasks：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/da/v3/EbHMy-KLRGaJVRonvRjfew/zh-cn_image_0000002194318244.png?HW-CC-KV=V1&HW-CC-Date=20260313T052954Z&HW-CC-Expire=86400&HW-CC-Sign=D2C2A580F40EA3C288DF23820E2C9C8D0D3F822397E21091E3D2F37244DD42B1)

在hvigor-config.json5中修改maxOldSpaceSize字段，根据工程大小适当增大，例如设置为 8192。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-1*