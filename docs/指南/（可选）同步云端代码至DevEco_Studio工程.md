---
title: （可选）同步云端代码至DevEco Studio工程
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-sync
category: 指南
updated_at: 2026-03-13T04:05:18.774Z
---

# （可选）同步云端代码至DevEco Studio工程

DevEco Studio还支持您将AGC云端当前项目下的代码同步至本地工程，包括之前从本地部署到AGC云端的代码、以及在AGC云端编写的代码，以保证云端和本地的版本一致性，方便您的日常开发。

云端代码同步目前支持以下模式：[仅同步云函数/云对象](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-sync#section588213529814)、[仅同步云数据库](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-sync#section474014335350)、[一键同步云侧代码](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-sync#section1198316575339)。

## 同步云函数/云对象

说明

对于使用DevEco Studio 4.1 Canary 2之前的版本部署的函数，同步下来的是JavaScript代码。

### 同步单个云函数/云对象

云函数/云对象部署到AGC云端后，如在云端又进行了新改动，您可再将云端的云函数/云对象同步到本地工程。云函数/云对象的同步方式一致，下文以云对象为例进行说明。

1.  右击云对象目录，选择“Sync '_云对象名_'”。下文以云对象“id-generator”为例。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e9/v3/LFuXZN4lSO25IqRpjvnAUQ/zh-cn_image_0000002214704461.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=8D7C5B3B8ED9C80E7D1F41009137BCE9EAB5C512271AB925A2E1455B0024D411)
    
2.  在确认弹框中点击“Overwrite”，AGC云端的云对象“id-generator”将覆盖更新本地云对象“id-generator”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c4/v3/arSc7E5uRb-R-emAesiCKw/zh-cn_image_0000002214704477.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=3941EF99A606690428CA130C652F2E7BF5ADCF9D2043F949C87D0EBAD1B60C23)
    
3.  等待同步完成，“cloudfunctions”目录下将生成从云端同步下来的云对象“id-generator”，同时将本地原云对象“id-generator”备份在同路径下。
    
    说明
    
    后续如执行部署或调试，DevEco Studio会自动跳过备份数据。但出于精简包的考虑，建议您在对比代码差异后，及时将无用的备份数据删除。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/98/v3/gtc6K6QbSg6ybdjAcHgBuA/zh-cn_image_0000002179498228.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=BAD9A75CAAE8ABDED6D90390E03043F568F67FC3D6981E4C9B10754816AD1BAA)
    

### 批量同步云函数/云对象

批量同步云函数/云对象即将AGC云端当前项目下的所有云函数/云对象同步至本地工程。

1.  右击“cloudfunctions”目录，选择“Sync Cloud Functions”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ea/v3/L6eSFVY6QYOTkpA8h33G4Q/zh-cn_image_0000002179338512.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=C05187DDCA06624CBFA7320490DDBFDAE3532EDB81750CA376988D570B30D2DB)
    
2.  弹窗提示您本地工程下存在同名云函数/云对象。
    
    -   选择“Skip”，同步时将跳过本地同名云函数/云对象。
    -   选择“Overwrite”，AGC云端的云函数/云对象将覆盖更新本地同名云函数/云对象。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/01/v3/g3-UQAkERimb9vTpJwLk_Q/zh-cn_image_0000002214704441.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=213CF66692ED9D99E047055400824C3605ACE98DFC97A5797636C9DAB82DB471)
    
3.  如选择“Skip”，等待同步完成后，“cloudfunctions”目录下将生成从云端同步下来的本项目下所有云函数/云对象，本地已存在的不同步。
    
    如下图，“cloudfunctions”目录下新增了云端同步下来的“test-cloud-function”，上图中本地已存在的云函数/云对象未被覆盖更新。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a1/v3/1LV8QFh2S0iQ5p42dTwAzg/zh-cn_image_0000002214704485.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=EAB225EF70B2F9E8D1056866FA7283ECCF73A752D3CEB24AB446A7D76FC86CD8)
    
4.  如选择“Overwrite”，等待同步完成后，“cloudfunctions”目录下将生成从云端同步下来的本项目下所有云函数/云对象；本地同名云函数/云对象也被覆盖更新，同时更新前的原云函数/云对象会备份在同路径下。
    
    如下图，“cloudfunctions”目录下新增了云端同步下来的“test-cloud-function”，本地已存在的几个云函数/云对象也被覆盖更新，并且均生成了备份文件“xxxx-_备份时间_.backup”。
    
    说明
    
    后续如执行部署或调试，DevEco Studio会自动跳过备份数据。但出于精简包的考虑，建议您在对比代码差异后，及时将无用的备份数据删除。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/_WrtPb6xRICQgdE-e8Q-qA/zh-cn_image_0000002179338508.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=AFC92DA8BC34C20910438BFF237BBF89067FC1D8DD98184C58DAC5CE2A7BB662)
    

## 同步云数据库

说明

目前仅支持同步对象类型。

### 同步单个对象类型

对象类型部署到AGC云端后，如又发生了新改动，您可再将云端的对象类型同步到本地。

1.  右击对象类型JSON文件（以“objecttype1.json”为例），选择“Sync 'objecttype1.json'”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e9/v3/jD98GMagTsax5VDidWJ24A/zh-cn_image_0000002179498216.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=EB6ADD2E7D754ED5BC2C8854348E4812873147198E83D7B50242851D7A67240D)
    
2.  在确认弹框中点击“Overwrite”，AGC云端的对象类型“objecttype1.json”将覆盖更新本地对象类型“objecttype1.json”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/vZrZx8LDQ4icrE8vQthPZQ/zh-cn_image_0000002214704465.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=6621FA7FC86C70E424D1A840771C5CFAAC98A603A8A3A9B05BB1FBECDCF9540B)
    
3.  等待同步完成，“objecttype”目录下将生成从云端同步下来的对象类型“objecttype1.json”。
    
    -   如果云端和本地的同名对象类型内容存在差异，则还会将本地原对象类型备份在同路径下。
    -   如果云端和本地的同名对象类型内容完全一致，则不生成备份。
    
    说明
    
    后续如执行部署，DevEco Studio会自动跳过备份数据。但出于精简包的考虑，建议您在对比代码差异后，及时将无用的备份数据删除。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/INLV7nFnSGCExXh94GpekQ/zh-cn_image_0000002214704445.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=4497F484515F70E98339F697EFAF2FE022151659796E2B71814953E4BC762D80)
    

### 批量同步对象类型

您可以将AGC云端当前项目下所有的对象类型一键同步至本地。

1.  右击“objecttype”目录，选择“Sync Object Type”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0a/v3/fE-IdH9ySAm2k2m8-5yRbg/zh-cn_image_0000002179338532.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=50E04616FF1423D6E7CC3A6F1204073A8120B790DDAFFFACFC6AA3695795319C)
    

2.  弹窗提示您本地工程下已存在同名对象类型，如下图“Post.json”与“objecttype1.json”。
    
    -   选择“Skip”，同步时将跳过本地同名对象类型。
    -   选择“Overwrite”，AGC云端的对象类型将覆盖更新本地同名对象类型。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ea/v3/a8yVLVCdROS3FmS90NmBCQ/zh-cn_image_0000002179498208.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=4B8BC0DF76DCF5EA7CBCCAE0E5DE90DE7FA5BACD6E5BE1751ECCFAB13EF283B3)
    
3.  如选择“Skip”，等待同步完成后，“objecttype”目录下将生成从云端同步下来的本项目下所有对象类型，本地已存在的不同步。
    
    如下图，“objecttype”目录下新增了云端同步下来的“test\_object.json”，本地已存在的“Post.json”与“objecttype1.json”未被覆盖更新。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fc/v3/AsOpyDp2R5SPACpXMXvLvg/zh-cn_image_0000002179498196.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=7C9B416116716E14319CF6626EB02482CD74DAF697CFAC0E291EF0B6CC104206)
    
4.  如选择“Overwrite”，等待同步完成后，“objecttype”目录下将生成从云端同步下来的所有对象类型，本地已存在的对象类型也被覆盖更新。
    
    -   如果云端和本地的同名对象类型内容存在差异，则还会将本地原对象类型备份在同路径下。
    -   如果云端和本地的同名对象类型内容完全一致，则不生成备份。
    
    如下图，“objecttype”目录下生成了“test\_object.json”、“Post.json”与“objecttype1.json”三个对象类型文件，其中：“test\_object.json”为从云端新同步下来的对象类型；“objecttype1.json”本地已存在且与云端内容一致，不生成备份；“Post.json”本地已存在但与云端内容存在差异，因此被覆盖更新，同时原“Post.json”备份为“Post.json-_备份时间_.backup”。
    
    说明
    
    后续如执行部署，DevEco Studio会自动跳过备份数据。但出于精简包的考虑，建议您在对比代码差异后，及时将无用的备份数据删除。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/6tuOlqYWTfuTukzTTU2djg/zh-cn_image_0000002214704489.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=53B473CDEBE7D63CB0B2227D9C336DFFE4693ADE6FAACDF98A5A205CB6ACE05C)
    

## 一键同步云侧代码

说明

对于使用DevEco Studio 4.1 Canary 2之前的版本部署的函数，同步下来的是JavaScript代码。

1.  右击云开发工程（“CloudProgram”），选择“Sync Cloud Program”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/82/v3/PcBKPgOZT26cssthfhrDFw/zh-cn_image_0000002214858849.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=B9CD3C8E3EB244B2CF13B23B30F7FF4C18B726A4A8BB9A109C642E7C8EC0702D)
    
2.  弹窗提示您本地工程下已存在同名对象类型/云函数/云对象。
    
    -   选择“Skip”，同步时将跳过本地同名对象类型/云函数/云对象。
    -   选择“Overwrite”，AGC云端的对象类型/云函数/云对象将覆盖更新本地同名对象类型/云函数/云对象。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/R4GnZnzGR2enRtFZWLhBkQ/zh-cn_image_0000002214858861.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=378F04D7C51635C7BA3DCFAA5382C8E3DD55276B592C4E8D5DF6EAAD10C58A45)
    
3.  如选择“Skip”，等待同步完成后，“objecttype”目录下将生成从云端同步下来的本项目下所有对象类型，“cloudfunctions”目录下将生成从云端同步下来的本项目下所有云函数/云对象，本地已存在的云函数/云对象/对象类型均不同步。
    
    如下图：
    
    -   “objecttype”目录下新增了云端同步下来的“test\_object.json”，本地已存在的“Post.json”与“objecttype1.json”未被覆盖更新。
    -   “cloudfunctions”目录下生成了从云端同步下来的“test-cloud-function”，本地已存在的“id-generator”、“my-cloud-function”与“my-cloud-object”未被覆盖更新。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/81/v3/2HKHXYMkTtyPGvgU1ZDb-A/zh-cn_image_0000002179498236.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=CFBE30312FC85357627AADF8E51BF1D7F88DBF74F006C211A13B682257530D65)
    
4.  如选择“Overwrite”，等待同步完成后，“objecttype”目录下将生成从云端同步下来的本项目下所有对象类型，“cloudfunctions”目录下将生成从云端同步下来的本项目下所有云函数/云对象，本地已存在的云函数/云对象/对象类型也被覆盖更新。
    
    -   如果云端和本地的同名对象类型内容存在差异，则还会将本地原对象类型备份在同路径下。
    -   如果云端和本地的同名对象类型内容完全一致，则不生成备份。
    -   无论云端和本地的同名云函数/云对象代码是否一致，均会将本地原云函数/云对象备份在同路径下。
    
    如下图：
    
    -   “objecttype”目录下生成了“test \_object.json”、“Post.json”与“objecttype1.json”三个对象类型文件，其中：“test \_object.json”为从云端新同步下来的对象类型；“Post.json”本地已存在且与云端内容一致，不生成备份；“objecttype1.json”本地已存在但与云端内容存在差异，因此被覆盖更新，同时原“objecttype1.json”备份为“objecttype1.json-_备份时间_.backup”。
    -   “cloudfunctions”目录下生成了从云端同步下来的“test-cloud-function”，本地已存在的“id-generator”、“my-cloud-function”与“my-cloud-object”也被覆盖更新，并且均生成了备份文件“xxxx-_备份时间_.backup”。
        
        说明
        
        后续如执行部署或调试，DevEco Studio会自动跳过备份数据。但出于精简包的考虑，建议您在对比代码差异后，及时将无用的备份数据删除。
        
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/95/v3/HyW6CoGBTbOZz43p6fDPew/zh-cn_image_0000002179338516.png?HW-CC-KV=V1&HW-CC-Date=20260313T040437Z&HW-CC-Expire=86400&HW-CC-Sign=E7E77DB631F7C6007B059E12403EB0AAD03F595691BDB16DF080B9E781B92709)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/agc-harmonyos-clouddev-sync*