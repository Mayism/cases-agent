---
title: 编译报错“The path XX is not writable. please choose a new location”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-118
category: FAQ
updated_at: 2026-03-13T05:41:08.660Z
---

# 编译报错“The path XX is not writable. please choose a new location”

**问题现象**

在Mac上，通过打开DMG文件中的DevEco Studio图标启动DevEco Studio时，如果构建报错“The path XX is not writable. please choose a new location”，请选择一个新的位置。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/65/v3/z0HFnJRFSvm3WZWMDUxYjw/zh-cn_image_0000002229604193.png?HW-CC-KV=V1&HW-CC-Date=20260313T054103Z&HW-CC-Expire=86400&HW-CC-Sign=70B21A0EDCFC7B63ACD31DC53404DA64E6E64AD23E8E019248ED0D85737DA6F4)

**问题原因**

在Mac上直接通过DMG中的DevEco Studio图标打开DevEco Studio，会以只读方式打开。内置在DevEco Studio中的文件没有写权限。

**解决措施**

将“DevEco-Studio.app”拖拽到“Applications”文件夹中，安装后再使用。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-118*