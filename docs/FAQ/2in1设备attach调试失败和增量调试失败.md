---
title: 2in1设备attach调试失败和增量调试失败
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-63
category: FAQ
updated_at: 2026-03-13T05:59:44.093Z
---

# 2in1设备attach调试失败和增量调试失败

**问题现象**

1、2in1设备应用调试失败，报错信息如下图所示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a4/v3/uMHJX4YmQSKs5HX7BLYLPQ/zh-cn_image_0000002557414329.png?HW-CC-KV=V1&HW-CC-Date=20260313T055939Z&HW-CC-Expire=86400&HW-CC-Sign=DFB2870F36F25598AA767956D44718DD3DAAE74C4E6D3EBBB082010A05A1809D)

2、2in1设备应用使用增量调试失败，报错信息如下图所示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a2/v3/jfm0FC4JSlOMCy457dhDNg/zh-cn_image_0000002526214500.png?HW-CC-KV=V1&HW-CC-Date=20260313T055939Z&HW-CC-Expire=86400&HW-CC-Sign=87E2469EC35112838E2A39BE8D8B4B121152207979DDEB314860CCFF64E09E66)

**解决措施**

2in1设备报上述错误可能原因是应用开启了应用加速服务功能，请在设备的**设置 > 应用加速服务**中，查看应用是否开启了应用加速服务，并关闭应用的加速服务。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e7/v3/yhL_v-NqS3O1T1ge6LhfGA/zh-cn_image_0000002557334361.png?HW-CC-KV=V1&HW-CC-Date=20260313T055939Z&HW-CC-Expire=86400&HW-CC-Sign=703FB9E9130EF0CB1529D3CEB41EB6F8CBDAFB29B53DC72EE7B6E81ECD54F0AD)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-63*