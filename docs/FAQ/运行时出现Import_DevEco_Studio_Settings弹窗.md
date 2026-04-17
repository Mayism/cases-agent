---
title: 运行时出现Import DevEco Studio Settings弹窗
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-16
category: FAQ
updated_at: 2026-03-13T05:24:34.894Z
---

# 运行时出现Import DevEco Studio Settings弹窗

**问题现象**

问题出现包含两种场景：

场景一：首次运行DevEco Studio时，出现**Import DevEco Studio Settings**弹窗。

场景二：本地清理DevEco Studio缓存后再次下载安装运行时，可能出现**Import DevEco Studio Settings**弹窗。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/ashPU-naSF2BQJkDji4OJw/zh-cn_image_0000002474225988.png?HW-CC-KV=V1&HW-CC-Date=20260313T052430Z&HW-CC-Expire=86400&HW-CC-Sign=F6BA4A8CF70CEFCA68D8502476AF22F0879277BAC8093C7E145971143ED4385E)

**解决措施**

方案一：建议保持默认勾选项**Do not import settings**。

方案二：勾选**Config or installation directory**，上传配置项压缩包（settings.zip）。

说明

-   点击**File** > **Manage IDE Settings** > **Export Settings**...将包含Ark插件等配置项导出，再次运行时可以将配置项直接导入。
-   DevEco Studio版本不同，支持导出的配置项不同。可导出的配置项需以具体版本为准。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6b/v3/JCH_r3C2Q6CGB2Feo5Fxlg/zh-cn_image_0000002509067411.png?HW-CC-KV=V1&HW-CC-Date=20260313T052430Z&HW-CC-Expire=86400&HW-CC-Sign=0C0EF3C13FCDAF58899D3B024043B7D351A34EE7C85955A7E5D45D17C5E08DEE)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-16*