---
title: 打开历史工程，报错提示“Install failed FetchPackageInfo: hypium failed”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-4
category: FAQ
updated_at: 2026-03-13T05:25:07.090Z
---

# 打开历史工程，报错提示“Install failed FetchPackageInfo: hypium failed”

**问题现象**

在DevEco Studio打开历史工程，依赖安装不成功，报错信息为“Install failed FetchPackageInfo: hypium failed”。

**解决措施**

导致该问题的原因是包名使用错误。在工程级**oh-package.json5**中，将**devDependencies**字段下"hypium"修改为"@ohos/hypium"。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/da/v3/HDMYADGURX6sXmbjJoXb5g/zh-cn_image_0000002194158560.png?HW-CC-KV=V1&HW-CC-Date=20260313T052502Z&HW-CC-Expire=86400&HW-CC-Sign=204D44F90F3392970F6D69F8ECFD244A0825599B671B7C5728C9007182323651)

@ohos/hypium版本号可通过ohpm命令获取，在DevEco Studio中打开Terminal，输入**ohpm info @ohos/hypium**命令，输出结果中dist-tags下方即为版本号。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6b/v3/fkLMpbH6TMKByL39jRd3Bg/zh-cn_image_0000002402257997.png?HW-CC-KV=V1&HW-CC-Date=20260313T052502Z&HW-CC-Expire=86400&HW-CC-Sign=51E3D7B777E857AC0E3549DC47758914126AD585FA41DF2F56B7C273E05B8BFF)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-project-management-4*