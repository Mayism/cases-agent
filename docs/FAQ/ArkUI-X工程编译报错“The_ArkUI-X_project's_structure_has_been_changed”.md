---
title: ArkUI-X工程编译报错“The ArkUI-X project's structure has been changed”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-28
category: FAQ
updated_at: 2026-03-13T05:32:13.967Z
---

# ArkUI-X工程编译报错“The ArkUI-X project's structure has been changed”

**问题现象**

使用DevEco Studio 4.0.0.700及以上版本打开ArkUI-X历史工程时，工程同步或构建会提示“ERROR: The ArkUI-X project's structure has been changed. Migrate and adapt the project as instructed in FAQs.”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/54/v3/KGHIdR50Tb2ZUnyTIHbT4g/zh-cn_image_0000002194158592.png?HW-CC-KV=V1&HW-CC-Date=20260313T053209Z&HW-CC-Expire=86400&HW-CC-Sign=7E5D4A3056EF10A7D22ACA85AD3CC92796BDB5D64BEFFEB966AA2DBAF04919C9)

**解决措施**

出现该提示的原因是在旧版本的ArkUI-X工程模板中，ArkUI-X工程标识（"crossplatform": true）配置在工程目录下build-profile.json5中，在DevEco Studio 4.0.0.700及以上版本需要在工程目录下.arkui-x/arkui-x-config.json5文件中配置ArkUI-X工程模块、工程标识等信息。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c6/v3/M9dF7F2USCKsiaYO_ojnUA/zh-cn_image_0000002229758465.png?HW-CC-KV=V1&HW-CC-Date=20260313T053209Z&HW-CC-Expire=86400&HW-CC-Sign=879F517DCFE35936ADB967EA5F593D53101D0E65F0632EB88B623E7F12931E01)

配置位置变更后，使用历史工程模板的开发者，如果使用DevEco Studio 4.0.0.700及以上版本，需手动迁移适配新的工程结构。迁移步骤如下：

1.  删除工程目录下build-profile.json5中的ArkUI-X工程标识（"crossplatform": true）。
2.  在工程下.arkui-x目录中新建arkui-x-config.json5文件，配置内容为 "crossplatform": true, "modules"中配置工程中所有ArkUI-X模块的module name。
    
    工程迁移后结构如下：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8/v3/MhjVuNF-RqSsfjgAUUXepg/zh-cn_image_0000002229758461.png?HW-CC-KV=V1&HW-CC-Date=20260313T053209Z&HW-CC-Expire=86400&HW-CC-Sign=F3733EDF1982A896A43FC9187207856080C9C33C07D5C6E62B519FF97742C9AB)
    
3.  迁移完成后，点击菜单栏 File > Sync and Refresh Project 同步工程，然后重新编译构建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d5/v3/Sy65C-VKQceLSjqLMDh8hg/zh-cn_image_0000002229603993.png?HW-CC-KV=V1&HW-CC-Date=20260313T053209Z&HW-CC-Expire=86400&HW-CC-Sign=BEB7BC1D8AF03C08D962FB1928E9BB0D61F7BB4CA76F44E7D6AE8F756826F235)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-28*