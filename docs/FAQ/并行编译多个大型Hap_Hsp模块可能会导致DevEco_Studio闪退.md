---
title: 并行编译多个大型Hap/Hsp模块可能会导致DevEco Studio闪退
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-193
category: FAQ
updated_at: 2026-03-13T05:48:15.596Z
---

# 并行编译多个大型Hap/Hsp模块可能会导致DevEco Studio闪退

**问题现象**

当应用包含了多个Hap/Hsp，每个模块的代码量都是100万行级别，直接点击DevEco Studio的构建（点击Build然后点击Build Hap(s)/APP(s)）之后DevEco Studio工具出现闪退。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3a/v3/4ENQk97PQnGqQEoXKvxuTg/zh-cn_image_0000002515675178.png?HW-CC-KV=V1&HW-CC-Date=20260313T054811Z&HW-CC-Expire=86400&HW-CC-Sign=02E41AC792F20CC409574BF2ED687116BABC976A47A802DE619E1202C3F52F9E)

**可能原因**

单个模块代码量大于100万行时单模块编译消耗内存大于5G，4个以上的模块并行编译内存会达到20G导致系统内存不足。

**解决措施**

将并行编译改为串行编译执行。在DevEco Studio上依次选中每个模块再点击编译(左侧选中模块，然后点击Build,再点击第一个按钮Make Module 'xxx')。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/04/v3/K35Ur1ymSOyS8ex4M_megg/zh-cn_image_0000002515835104.png?HW-CC-KV=V1&HW-CC-Date=20260313T054811Z&HW-CC-Expire=86400&HW-CC-Sign=3CDCFABA3EC1CDB631F6C37B6E097E9247D2ECB12CF9D141A576AE5BAED9EAA3)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-193*