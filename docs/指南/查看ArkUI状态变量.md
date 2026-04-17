---
title: 查看ArkUI状态变量
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arkui-state
category: 指南
updated_at: 2026-03-13T04:58:12.248Z
---

# 查看ArkUI状态变量

从DevEco Studio 6.0.2 Beta1版本开始，支持在调试时查看ArkUI状态变量的实时变化情况。

在调试窗口中，点击**Layout Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/40/v3/KywYEjHqSnGUlEe5HZhrmA/zh-cn_image_0000002501069814.png?HW-CC-KV=V1&HW-CC-Date=20260313T045731Z&HW-CC-Expire=86400&HW-CC-Sign=2E4EFB299ECDD9C62EC0B03F9F3A834C2CA0D0E0872CA2B986DC737CCB6DF546)，勾选**ArkUI State**，打开ArkUI状态变量面板。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/28/v3/L7GMPYP5SoefgKxNgvKzmA/zh-cn_image_0000002501069818.png?HW-CC-KV=V1&HW-CC-Date=20260313T045731Z&HW-CC-Expire=86400&HW-CC-Sign=8A2C7AA35B857DE939CA4296ACB9B48F67D01DA6BF1EC1518557804ABB47B4EC)

状态变量面板分为总览（Summary）和当前值（Current Value）两个子面板：

-   总览面板显示了当前应用运行时，状态变量更新的总体情况，包含了状态变量的名称、更新次数、装饰器类型、所属组件、所属类。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5/v3/xSfIPNFURj2qV4C6ORe2OQ/zh-cn_image_0000002500909974.png?HW-CC-KV=V1&HW-CC-Date=20260313T045731Z&HW-CC-Expire=86400&HW-CC-Sign=F95FA1719F9CE505D09D8BC5D25D4AE4DF4746C206AEDCA511BFAF8FA3C9AE02)
    
-   当前值面板记录了状态变量实时变化的数据，包含了状态变量的更新时间、名称、所属组件、所属类、装饰器类型、当前值、影响的组件数量。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9d/v3/cHZNmH7LQzKyNj4yy_h7ZA/zh-cn_image_0000002500909968.png?HW-CC-KV=V1&HW-CC-Date=20260313T045731Z&HW-CC-Expire=86400&HW-CC-Sign=B906674A86D175E7F6F7F73BF0772E3B869F64B60E3A0ED8BFC0D33E615D2564)当点击右侧的箭头时，新弹出的面板将显示当前选中状态变量影响的组件列表，包含影响组件的组件名、组件ID、是否为自定义组件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/98/v3/7yiiBZfXRWSSGYa9ZYfp-A/zh-cn_image_0000002532749833.png?HW-CC-KV=V1&HW-CC-Date=20260313T045731Z&HW-CC-Expire=86400&HW-CC-Sign=0E2B51ACF9C41647EB4E2C2AE2D6768F5A3AFE940E9C3FA9C9FA1DA7AA27946B)
    

说明

-   打开状态变量面板后才会开始监听状态变量的更新，因此，无法查看面板打开前状态变量的更新情况。
-   同一次调试过程中，关闭状态变量面板不会清空之前的数据，当前值面板最多展示1000条数据，超过限制后，仅展示最新的1000条数据。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-arkui-state*