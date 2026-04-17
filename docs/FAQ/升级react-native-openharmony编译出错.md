---
title: 升级react-native-openharmony编译出错
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-185
category: FAQ
updated_at: 2026-03-13T05:47:25.932Z
---

# 升级react-native-openharmony编译出错

**问题现象**

升级react-native-openharmony编译出错，类似如下报错：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/cRVBkgD0TNiDvj6d1N8i2A/zh-cn_image_0000002304734606.png?HW-CC-KV=V1&HW-CC-Date=20260313T054719Z&HW-CC-Expire=86400&HW-CC-Sign=11C0B393D3E671F13E65495AD60746C4CC9BC1F8DD3838AC33BE5D2E5A59EF22)

**问题原因**

旧版本的react-native-openharmony缓存还在,导致某些链接找不到。

**解决措施**

删除要编译的模块根目录下的.cxx和build目录,然后重新触发编译。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-185*