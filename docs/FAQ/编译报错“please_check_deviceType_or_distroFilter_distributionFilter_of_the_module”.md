---
title: 编译报错“please check deviceType or distroFilter/distributionFilter of the module”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-20
category: FAQ
updated_at: 2026-03-13T05:31:51.010Z
---

# 编译报错“please check deviceType or distroFilter/distributionFilter of the module”

**问题现象**

HarmonyOS DevEco Studio编译时出现错误，提示如下之一：

-   Module: (xxx) and Module: (xxx) are entry, please check deviceType or distroFilter of the module.
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cb/v3/i-4ADWgmT3e5b4XGqLxXkA/zh-cn_image_0000002229604261.png?HW-CC-KV=V1&HW-CC-Date=20260313T053146Z&HW-CC-Expire=86400&HW-CC-Sign=71C5693AEE01153EBA5269C6965BAC4F7D9EC9C87F6FFBBF20A67DFE477D0B6B)
    
-   Module: (xxx) and Module: (xxx) have the same moduleName, please check deviceType or distroFilter of the module.
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/aQIKxZizSfWjNEHzn1WO2A/zh-cn_image_0000002194158880.png?HW-CC-KV=V1&HW-CC-Date=20260313T053146Z&HW-CC-Expire=86400&HW-CC-Sign=7939E3C7BA953976AF1A64E61A4850F67DD864894707323B7A5E5E2EF22BD820)
    
-   Module: (xxx) and Module: (xxx) have the same packageName, please check deviceType or distroFilter of the module.
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/69/v3/H6z5W7HzS7SYWM176_15fA/zh-cn_image_0000002194318488.png?HW-CC-KV=V1&HW-CC-Date=20260313T053146Z&HW-CC-Expire=86400&HW-CC-Sign=2EA220EFC710479BD8B937C4762E9C5E8347A851CC0426651884A275DEC3F237)
    
-   Module: (xxx) and Module: (xxx) have the same ability name.
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3b/v3/KTHZFyTsQfau0KXlUA51Yg/zh-cn_image_0000002194318492.png?HW-CC-KV=V1&HW-CC-Date=20260313T053146Z&HW-CC-Expire=86400&HW-CC-Sign=D2746DF347D6120AF38D4559C218DF3C0F2AC0EDF06851306BBFD210F2D756F6)
    

**解决措施**

-   可能是打包时工程未满足HAP唯一性校验逻辑，请参考[HAP唯一性校验逻辑](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-verification-rule)修改工程配置，满足校验逻辑即可正常打包。
-   如果工程中仅有一种设备类型，请确保工程级build-profile.json5文件中，同一模块的不同目标target的applyToProducts字段对应的product不相同。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/41/v3/83BSQlpvQHucwbXr2txm4g/zh-cn_image_0000002194158884.png?HW-CC-KV=V1&HW-CC-Date=20260313T053146Z&HW-CC-Expire=86400&HW-CC-Sign=DD9E62D811456A26C44F6CEDAA0337EAEE42EC65D05D40E8EC98733DEB0E05B8)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-20*