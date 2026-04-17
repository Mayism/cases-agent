---
title: Profile Manager
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-profile-manager
category: 指南
updated_at: 2026-03-13T04:49:50.237Z
---

# Profile Manager

由于真机设备有丰富的设备型号，不同设备型号的屏幕分辨率可能不一样。因此，在HarmonyOS应用/元服务开发过程中，由于设备类型繁多，可能需要查看在不同设备上的界面显示效果。对此，DevEco Studio的预览器提供了Profile Manager功能，支持开发者自定义预览设备Profile（包含分辨率和语言），从而可以通过定义不同的预览设备Profile，查看HarmonyOS应用/元服务在不同设备上的预览显示效果。当前支持自定义设备分辨率及系统语言。

定义设备后，可以在Previewer右上角，单击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3/v3/q7Y4_Em_QlOVlDZVD8_3kw/zh-cn_image_0000002501069726.png?HW-CC-KV=V1&HW-CC-Date=20260313T044909Z&HW-CC-Expire=86400&HW-CC-Sign=640A4D1205C3FDEBD877120421BFA7E47EB1DD2ABB88CBEB0AA7D7AECAEB4B65)按钮，打开Profile管理器，切换预览设备。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/NfhwnfAwRzKWM8T7E4ruEg/zh-cn_image_0000002532749741.png?HW-CC-KV=V1&HW-CC-Date=20260313T044909Z&HW-CC-Expire=86400&HW-CC-Sign=B6948738D8066E8CFD0F5FC9EF3B553B03327B60E688A90C0C2AB65962934C80 "点击放大")

同时，Profile Manager还支持多设备预览功能，具体请参考[查看多端设备预览效果](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-multi-profile)。

下面以自定义一款Phone设备为例，介绍设备Profile Manager的使用方法。

1.  在预览器界面，打开Profile Manager界面。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9f/v3/HQ7YCdWcTseMUC7Rh-Py8A/zh-cn_image_0000002500909878.png?HW-CC-KV=V1&HW-CC-Date=20260313T044909Z&HW-CC-Expire=86400&HW-CC-Sign=1DD2A408E7BEDFE78973A4102469592E0FB3CB428F2F49C00EABE0AC5B6538CE)
    
2.  在Profile Manager界面，单击**\+ New Profile**按钮，添加设备。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/u0nsxk-xRZmlxIioZBK8HA/zh-cn_image_0000002501069724.png?HW-CC-KV=V1&HW-CC-Date=20260313T044909Z&HW-CC-Expire=86400&HW-CC-Sign=20C80E67E79CCED74D17A3A88D759A70387396939DE0FDDC3AC3F3C619E563B7)
    
3.  在**Create Profile**界面，填写新增设备的信息，如**Profile ID**（设备型号）、**Device type**（设备类型）、**Resolution**（分辨率）和**Language and region**（语言和区域）等。其中Device type只能选择module.json5中deviceTypes字段已定义的设备。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/65/v3/pgY6dxEVS-KJel41skJ3iw/zh-cn_image_0000002532669785.png?HW-CC-KV=V1&HW-CC-Date=20260313T044909Z&HW-CC-Expire=86400&HW-CC-Sign=30E1053BD9C76330BDE6C62A6F5F7C493BE04B3CDB3695049901647934008A75)
    
4.  设备信息填写完成后，单击**OK**完成创建。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-profile-manager*