---
title: 开通Device Security服务
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/devicesecurity-deviceverify-activateservice
category: 指南
updated_at: 2026-03-12T12:41:45.496Z
---

# 开通Device Security服务

在开通Device Security服务前，请先参考“[应用开发准备](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-dev-overview)”完成基本准备工作，再继续进行以下开发活动。

说明

Device Security包括应用设备状态检测、安全检测、可信应用服务、业务风险检测能力、数字盾服务，开发者请根据实际使用场景，选择开启某个或者多个能力开关。

1.  登录[AppGallery Connect](https://developer.huawei.com/consumer/cn/service/josp/agc/index.html)网站，选择“开发与服务”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e5/v3/brKgNLsxS6Gm2AkVnmExvw/zh-cn_image_0000002515108437.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=CBD5BF5CDFBD3F8BAA66D99E3DDB3B15B151BB3F88F9284A47E190FB410C216B "点击放大")
    
2.  在项目列表中找到需要开通Device Security服务的项目。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1a/v3/vSziJ5AMTmW70nlZGUC88g/zh-cn_image_0000002514988437.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=3D29EACE8393FBAF602A532D504B97E3FC0E7F7D8C782B994C97ECAE8EA2D661 "点击放大")
    
3.  选择“开放能力管理”Tab页，找到需要使用的功能，点击左侧的按钮，开通相应的功能。
    
    -   **应用设备状态检测**：勾选“应用设备状态检测”并点击“保存”，接入“应用设备状态检测”。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8f/v3/DLx9WyWUR_iSr-04AFIvyw/zh-cn_image_0000002482788476.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=9764240C84A6A9ABD217DC9B6B3A97B6530636AF23DDA5983FCC9CC32502FE0A "点击放大")
        
    
    -   **安全检测**：勾选“安全检测服务”并点击“保存”，接入“安全检测服务”。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b4/v3/q-kjmv3aTGaMuHCcfP2XWw/zh-cn_image_0000002514988433.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=661AA0049259B35BC673CB9420B264C22E8D05441882530516BE8423867D5BD1 "点击放大")
        
    
    -   **可信应用服务**：勾选“可信应用服务”并点击“保存”，接入“可信应用服务”。
        
        说明
        
        开通“可信应用服务”需要先申请进入允许清单，请将Developer ID、公司名称、应用名称、申请使用的服务和使用该服务的场景，发送到agconnect@huawei.com。AGC运营将审核相关材料，通过后将为您配置受限开放服务使用的名单，审核周期为1-3个工作日，请耐心等待。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8c/v3/kNQolCQqQNOh6J7tD3-Dpw/zh-cn_image_0000002482908442.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=1D928278B5BB633E41484262684A14AFB8F2AC7A097A23D68EE99305E95EFBAC "点击放大")
        
    
    -   **业务风险检测****\-涉诈剧本检测**：勾选“涉诈剧本检测”并点击“保存”，接入“涉诈剧本检测”。
        
        说明
        
        目前“业务风险检测服务-涉诈剧本检测”仅限受邀开发者开放。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/10/v3/3FJbPQ24Tq-H9CXIdj6e-g/zh-cn_image_0000002557351297.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=B44062964054FD486ACD4F45024755199D8E9936FB35E82C55E2451DEF70F187 "点击放大")
        
    -   **数字盾服务**：点击“数字盾服务”右侧申请按钮，接入“数字盾服务”，审核通过后勾选对应服务并点击“保存”该服务配置。
        
        ① 在申请“数字盾服务”前，需要在[华为开发者联盟](https://developer.huawei.com/consumer/cn/)网站上注册成为开发者，并完成[企业开发者实名认证](https://developer.huawei.com/consumer/cn/doc/start/edrna-0000001062678489)。
        
        ② 点击“数字盾服务”右侧申请按钮，接入“数字盾服务”，审核通过后勾选对应服务并点击“保存”该服务配置。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/95/v3/Y3kI0k4bRJis_oXtp8SCCQ/zh-cn_image_0000002515108439.png?HW-CC-KV=V1&HW-CC-Date=20260312T124104Z&HW-CC-Expire=86400&HW-CC-Sign=6ED70DF0189AACDE797CD23F613FAE84CBC245179705FB8746E70E1FE2DF1E4E "点击放大")
        
        说明
        
        请您在申请框填写“数字盾服务”申请原因和应用场景。AGC运营将审核相关材料，通过后则可保存对应的服务配置，审核周期为1-3个工作日，请耐心等待。
        
    
4.  申请Profile（.p7b）文件，具体操作请参见[申请调试Profile](https://developer.huawei.com/consumer/cn/doc/app/agc-help-debug-profile-0000002248181278)。
    
    说明
    
    在开通服务后，需要重新申请Profile（.p7b）文件。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/devicesecurity-deviceverify-activateservice*