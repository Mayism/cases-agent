---
title: 编译报错“Failed to get a resolved OhmUrl by filepath xx”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-10
category: FAQ
updated_at: 2026-03-13T05:30:49.866Z
---

# 编译报错“Failed to get a resolved OhmUrl by filepath xx”

-   **场景一：**
    
    **问题现象**
    
    如果工程在本地可编译成功，压缩后拷贝到其他环境中再打开该工程编译构建失败，提示 “ERROR: ArkTS:ERROR Failed to get a resolved OhmUrl by filepath xx”。
    
    **解决措施**
    
    该问题源于工程中存在oh\_modules目录。由于oh\_modules中包含软链接，压缩后软链接失效，导致在其他环境中编译时无法找到对应的文件。
    
    删除工程中的oh\_modules，执行File > Sync and Refresh Project。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/33/v3/uKzWh8CQQNyIMNSv5VM5_g/zh-cn_image_0000002194158588.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=2F471FCEB1D0D0C81520C58AEF837545331A2BF859CCFBDEA2E9F2310B8BA9EE)
    
-   **场景二：**
    
    **问题现象**
    
    当配置三方包依赖时，如果将依赖配置到devDependencies，而源码中又引用了这些依赖中的 API，会导致编译失败。例如，三方包@hms-security/ucs-appauth将依赖@network/gr配置在devDependencies中，源码中使用了@network/gr的 API 时，编译会失败，提示错误信息：“ERROR: ArkTS:ERROR Failed to get a resolved OhmUrl by filepath xxx”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1d/v3/Na_Nu0zETTa23nvvFYqh2Q/zh-cn_image_0000002229603977.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=A97BD427C2D4756092D4B8D4B6BB0750845B54D95C88F5032D966558700029DC)
    
    **问题确认**
    
    1.  进入上面标黄色的源码文件中，可以看到依赖有红色告警信息。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5c/v3/osbWfX2TQsibPlrYU2WCiQ/zh-cn_image_0000002194318188.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=56D0053E1E0A143B31EFB218372329C905B662278D8DDEBF5844EA37596CB466 "点击放大")
        
    2.  进入包下的oh-package.json5文件，查看依赖配置为devDependencies。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/75/v3/zlIPgOdCSleyOOWc_3qd2g/zh-cn_image_0000002229603989.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=9FA25008186CEA29FB3915453B7464FA4082D931DCC910C352F88F9DA6440237)
        
    
    **解决措施**
    
    -   向开发团队建议：运行时的依赖不应配置在devDependencies中。
    -   在依赖上层引入对应的devDependencies中的三方包规避此问题。

-   **场景三：**
    
    **问题现象**
    
    DevEco Studio编译失败，提示“ERROR: ArkTS:ERROR Failed to get a resolved OhmUrl by filepath xxx”。
    
    **问题确认**
    
    检查工程目录下的build-profile.json5文件中modules字段配置的srcPath路径是否与实际路径不同，以及是否存在大小写不一致的问题。
    
    **解决措施**
    
    将build-profile.json5文件中modules字段的srcPath路径与真实路径保持一致。
    
-   **场景四：**
    
    **问题现象**
    
    工程A以相对路径引用了工程B的模块，这种引用会导致报错。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/s3EwiYsIR6CnXCQBVNnSMQ/zh-cn_image_0000002194318200.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=5C098B90658993D68016C9E3501CE274533E5175D2028563EBE44F4F604F4157)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/56/v3/Id_A9DvVSlmBpiYazQCkAA/zh-cn_image_0000002194158572.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=4EBE4B28B9F926BCE69D54C61B47BCDA52D0ECF615924D8A2528C5D94D2E0503)![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e4/v3/c1-xDiBRRYqaIhGu7GToZA/zh-cn_image_0000002229758449.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=0CC1ADD480D8CE95048742A4B2C9FB6D43E6A78B1EE40E6452D6D4BFA873A553)**处理措施**
    
    -   将工程B的har转换为工程A的一个模块引用。
    -   把工程B的har提前打包，在A中 以.har的方式引用。
    -   上传到仓库，以版本号的方式引用。
-   **场景五：**
    
    **问题现象**
    
    DevEco Studio编译失败，提示“Error Message: Failed to get a resolved OhmUrl for 'hvigor\\\_ignore\\\_xxxxx' imported by xxx”。
    
    **处理措施**
    
    如果hvigor\_ignore\_xxxxx所在的模块是一个har模块，需要排查oh\_package.json5中是否存在“"packageType": "InterfaceHar"”，如果存在，请删除“"packageType": "InterfaceHar"”。
    
    如果hvigor\_ignore\_xxxxx所在的模块是一个hsp模块，需要排查${模块路径}\\build\\default\\cache\\default\\default@CompileArkTS\\esmodule\\${debug/release}\\filesInfo.txt文件中是否存在hvigor\_ignore\_xxxxx路径，如果存在，可将hvigor\_ignore\_xxxxx路径所在的模块或包添加到当前编译模块oh\_package.json5的dependencies中临时规避。
    
-   **场景六：**
    
    **问题现象**
    
    DevEco Studio编译失败，提示“Failed to get a resolved OhmUrl for‘xxx’imported by‘yyy’”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/20/v3/YZ6hKmPoTAONXMWMQ6P8ow/zh-cn_image_0000002194318204.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=AB4DAE4B530079CD06828FA50E9B2CBAF81461331033C9D402D7B32833B43531 "点击放大")
    
    **问题确认**
    
    1.  检查yyy所在模块是否为[字节码HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-har#section16598338112415)，并查看工程级build-profile.json5的useNormalizedOHMUrl是否为true（缺省默认值为false）。如果为true，则默认构建字节码har。
    2.  如果yyy模块是字节码har，请检查xxx依赖是否已配置在工程级oh\_package.json5的dependencies中，但未配置在yyy模块级oh\_package.json5的dependencies中。
    
    **处理措施**
    
    -   将xxx依赖配置到yyy模块oh\_package.json5的dependencies中。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/LTo8DrgrT9CBPhisrq7Awg/zh-cn_image_0000002229603981.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=0E37889481B6CBB2E4C09BA754FA086C0C642CEC5C98D489C49C3E5D528F8A22 "点击放大")
        
    -   将yyy模块改为非字节码har，在模块级build-profile.json5文件中添加byteCodeHar字段并设置为false。

-   **场景七：**
    
    请确认当前使用的DevEco Studio和SDK版本是配套的，点击菜单栏**Help > About DevEco Studio**，**Help > About HarmonyOS SDK**分别查看DevEco Studio和SDK版本，版本配套关系请参考[版本概览](https://developer.huawei.com/consumer/cn/doc/harmonyos-releases/overview-502-release)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/44/v3/2X5C_r9cTnegs1wfU3BilQ/zh-cn_image_0000002229603985.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=71A914329BC7E1598B5E3C59AAE89D01F5F1A91F51906774771F3CEA44BC21D9)
    
-   **场景八：**
    
    **问题现象：**
    
    DevEco Studio编译失败，提示“ERROR: ArkTS:ERROR failed to execute es2abc ERROR: ArkTS:ERROR Failed to get a resolved OhmUrl by filepath xxx”。
    
    **处理措施**
    
    该问题由工程中引用了非标准模块目录（目录内无module.json5）引起，如下图所示。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/43/v3/fnbvrRazSoitvuVwWH11KA/zh-cn_image_0000002194318192.png?HW-CC-KV=V1&HW-CC-Date=20260313T053043Z&HW-CC-Expire=86400&HW-CC-Sign=4726C75233B296DB00EE8B33BFFC0491482B52512690C104CF76EC971AFCFE43)
    
    请新建Static Library模块，并将utils/common里面的代码迁移至Static Library模块内，并使用HAP引用HAR方式进行模块间引用。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-10*