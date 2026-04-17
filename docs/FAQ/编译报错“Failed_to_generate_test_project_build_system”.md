---
title: 编译报错“Failed to generate test project build system”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-21
category: FAQ
updated_at: 2026-03-13T05:31:56.604Z
---

# 编译报错“Failed to generate test project build system”

**问题现象**

执行多模块Native模块构建时，出现“Failed to generate test project build system.”错误信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/84/v3/Bb7z9TrNT-u4b5-uwsKKFA/zh-cn_image_0000002194158584.png?HW-CC-KV=V1&HW-CC-Date=20260313T053152Z&HW-CC-Expire=86400&HW-CC-Sign=52D98AADFE45BDF516787E4416FEE2EDE195B1FDFA7795BD8D2DD5D9D34C3477)

**解决措施**

请删除报错模块下的.cxx文件夹，然后选中需要构建的模块，执行Make Module {moduleName}完成单独构建。注意：此方案需避免多模块并行构建。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9a/v3/vgZIsAhVR2u5jEbhD9sMSA/zh-cn_image_0000002229758457.png?HW-CC-KV=V1&HW-CC-Date=20260313T053152Z&HW-CC-Expire=86400&HW-CC-Sign=B3E99C91CF1265D3BEBC603734BD15DA117FAD3D8FEB70CE974AF8FBB64BAF82)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-21*