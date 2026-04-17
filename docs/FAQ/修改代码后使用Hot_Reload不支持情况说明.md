---
title: 修改代码后使用Hot Reload不支持情况说明
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-20
category: FAQ
updated_at: 2026-03-13T05:57:16.613Z
---

# 修改代码后使用Hot Reload不支持情况说明

**问题现象**

执行热重载过程中，如果当前修改不支持热重载，控制台会打印蓝色重启链接，提示重新安装并重启。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f6/v3/AbXxVyfnRMe86Fmht-_Ttw/zh-cn_image_0000002194318220.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=E9A93DFE26AEA4388288626BF86F1CB3541ADFC0CFDC937ADA25BAB74B3F047F "点击放大")

**解决措施**

DevEco Studio的热重载功能支持特定的代码场景。如果修改的代码超出支持范围，系统将提示“当前修改不支持”，并要求重启。具体支持的代码范围，请参阅[Hot Reload使用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hot-reload#section995453874915)。

**常见不支持代码场景**

-   不支持@Entry装饰器的struct Index内成员变量和成员函数的新增或修改。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6b/v3/trF0bn1uSS6Vu0vgRVrUww/zh-cn_image_0000002229604013.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=4E78476F4000753FC31B8B5E3ABCA02956220D97D2C4B923058EAC6F83854C3F "点击放大")
    
-   不支持@Entry入口文件内class成员函数的新增。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0a/v3/kUV3GAuoS8S-Fcw8Zs8Djw/zh-cn_image_0000002194158608.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=62C82D771DB3DF8056131E5CE676920D4FB427C51084F2161BBC5D934236881A "点击放大")
    
-   不支持@Entry入口文件内枚举的修改。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bd/v3/bLFMRvlWSL-dNGO_llxmbQ/zh-cn_image_0000002194158604.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=D8631ABDE7692CD044DCBD0A3C3B48459D82CD9B763AC7FB4083C51A032B5398 "点击放大")
    
-   不支持import未加载的模块的新增、修改。
    
    若一个代码文件在热重载启动时未被当前文件导入，则不支持在热重载过程中新增对该代码文件的导入。如下图所示，TestC.ets在热重载启动时未在Index.ets中导入，则在热重载过程中不支持在Index.ets中新增导入TestC.ets的语句。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/97/v3/Bfd0EqX0QPOZRmaXwUuKTg/zh-cn_image_0000002229604005.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=22A1D399B0A69ECD7C4DE58E76A2A0E0AF079984091E6E99E48C3A997B5959F4 "点击放大")
    
    如果热重载启动之前import语句处于置灰状态，此文件在编译过程中将不会被编译，属于未加载的模块。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cc/v3/RH8xa_NHQtGXsfPXeBjQ6A/zh-cn_image_0000002194318228.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=2479D946143A341F8E3718F85C9CCA1EFC42FA9F46258A6677D6CF57CF6D16D4 "点击放大")
    
-   不支持顶层闭包变量的修改（但支持顶层闭包的新增、删除）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ad/v3/y47sdummQsa_MnnnP6byZA/zh-cn_image_0000002229758481.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=BB4EDD261D9E0D977E3B9AF7B06DBB40DF7F2708EDBAC11EDB1FAFD701967CD9 "点击放大")
    
-   支持class类继承，但class继承类和被继承类都不可以放在@Entry入口文件中，建议将class写在非@Entry入口文件中。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ff/v3/NWCMgPE-QJqDwQLeITFyIg/zh-cn_image_0000002229604009.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=154A7CFEE3D568AC41CCD49688EC827DDD44A7363F24E4B7C7EA03F4D74F9EAC "点击放大")
    
-   不支持@Entry入口文件内大部分装饰器的修改。
    
    当前Hot Reload不支持大部分装饰器的修改。@Entry入口文件内支持@Styles装饰器的新增和修改，支持@Builder装饰器的修改，但不支持新增，不支持@State装饰器的新增和修改。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cf/v3/-VJB2fMvQ6OZLJNjZs0DWQ/zh-cn_image_0000002229758473.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=333D1BF0982A3AC7D83EB53AAD926BAA71335EDF18CDA037ADE60BD243829A3F "点击放大")
    
-   不支持在@Entry文件内新增、修改其他struct自定义组件。建议以import方式引入。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bf/v3/ipJgZhdTRpO_KWFYrB5LhQ/zh-cn_image_0000002194318224.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=8E26E68DAAFC46395FC0B14DDFC62C75087016C6A6809282B384282F7CEF365A "点击放大")
    
-   不支持在@Entry文件内新增、修改与@State变量重名的class或函数。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d0/v3/jKrL2gHMTzqz6jkw49qKTA/zh-cn_image_0000002194318216.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=3044B5BBAE92F4DCB6C9EF0283BE9D0C56111FE76A2E6F824DE3270BDE2DA383 "点击放大")
    
-   不支持修改非ets/ts代码文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/39/v3/j5Fq4d5NTf2d8HUGIT0KYg/zh-cn_image_0000002229758489.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=7379DA1F697D49D7AD545C37C9E99EBC7712596320739B0450F3046C603D9182 "点击放大")
    
-   不支持修改worker线程文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b5/v3/lmY7JtO-QU2Ict6wvb3wpA/zh-cn_image_0000002194158612.png?HW-CC-KV=V1&HW-CC-Date=20260313T055710Z&HW-CC-Expire=86400&HW-CC-Sign=600151DFB579187EC0A70F53B1BA401B5EC5875FB9041A58C68872325055EBA7 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-20*