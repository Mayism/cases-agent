---
title: 编译报错“Cannot read properties of undefined (reading 'split')”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-184
category: FAQ
updated_at: 2026-03-13T05:47:18.215Z
---

# 编译报错“Cannot read properties of undefined (reading 'split')”

-   场景一：
    
    **问题现象**
    
    当前使用的DevEco Studio版本与SDK版本不配套，导致DevEco Studio抛出异常：“TypeError: Cannot read properties of undefined (reading 'split')”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f6/v3/jUcHxkQDQ-6IQ6sOTBtz5Q/zh-cn_image_0000002264138776.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=5CDD3ACD04B486FDCB53C584874DCDC5B30AC5A144877563750102225B642437)
    
    **解决措施**
    
    1.  访问华为[开发者官网](https://developer.huawei.com/consumer/cn/download/deveco-studio)下载最新版DevEco Studio。
    2.  使用新版本DevEco Studio打开待迁移项目。
    3.  根据DevEco Studio自动弹出的迁移提示进行操作。
        
        -   点击“Migrate Assistant”功能。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/cI2ZVzIZS4mLaw9eanZagA/zh-cn_image_0000002264083104.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=4C759D303A10FACC6E1CFA2989C703BDE40379A8113691B3AB97B2C454BF723D)
        
        -   从版本列表中选择目标迁移版本。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/sc2xkaN_Sw2Jrac1iotPSg/zh-cn_image_0000002264081160.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=53991466609001E9ABE430691894EECA8D7DE27954E38D8E88F5BBD9F57812FF)
        
        -   按照向导完成项目迁移流程。
        
-   场景二：
    
    **问题现象**
    
    当工程级 build-profile.json5 文件未配置工程外模块依赖，而模块级 oh-package.json5 声明了工程外模块依赖并在代码中实际引用时，编译阶段会抛出异常：”Error: Cannot read properties of undefined (reading 'split')”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/H-PIGuTTRDyWk0HzTh0qoQ/zh-cn_image_0000002264140556.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=9EE87BBE270ECC7547BDA058DB5C5AFDBDE2AA3E4326B9D686BBA0EE8761A180)
    
    **解决措施**
    
    1.  检查下报错子模块中所引用的依赖，确保目标模块已在工程级 build-profile.json5 文件的 modules 字段中正确声明。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6d/v3/WFiX3HZrQU6Gnb_X5WR7xQ/zh-cn_image_0000002264140648.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=A31CF0A466957A34287917640CC6591FB1CEF3CA3479DE261FCC1DDC74B49DA8)
        
    2.  确认当前子模块的 oh-package.json5 中，该模块已添加到 dependencies 依赖列表。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/o02yFIKnSrSJlPuM18UPPQ/zh-cn_image_0000002298773813.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=DF09D00CED8A4F67DF6BB838708D97E753A54A3A25DD444DE71E132CFC6B772B)
        
    3.  若发现配置缺失，请手动补充完整。删除项目中的 oh\_modules 缓存目录，然后重新执行编译。
        
-   场景三：
    
    **问题现象**
    
    在HAP依赖字节码HAR进行编译的场景下，当import语句中的模块别名与dependencies中声明的别名大小写不一致时，编译系统将无法正确识别该依赖为字节码HAR，进而导致编译错误。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f/v3/4suGvirmSfCMPXJyK5Q9Mw/zh-cn_image_0000002264083960.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=4FD35E50E14A112789B5D1891E05D3B2691468CBEB00E249009130D3108D78B5)
    
    **解决措施**
    
    请检查并确保所有import语句的模块别名与其在dependencies中的声明保持完全一致的大小写格式。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/PUrNf2FiRryOjlut-o2zQA/zh-cn_image_0000002298661041.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=CB9537866ECD9E5EE3B8832B6E0EABF81924A7CE6DC096C8D18284274AA80213)
    
-   场景四：
    
    **问题现象**
    
    在编译字节码HAR时，若将依赖配置于devDependencies下，hvigor构建系统在编译阶段不会收集devDependencies中的依赖项，导致依赖解析失败并引发编译错误。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ba/v3/rcC_XmgrS663SriXchPCjQ/zh-cn_image_0000002264141304.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=F464D0B5CDF3474E494DD876BCD9B7BD64CF37E39524AE5986125036CACD5C14)
    
    **解决措施**
    
    请将依赖项从devDependencies移至dependencies。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/cMm2hZX6RpuaSe42IoJqPQ/zh-cn_image_0000002264084432.png?HW-CC-KV=V1&HW-CC-Date=20260313T054713Z&HW-CC-Expire=86400&HW-CC-Sign=51850D98BB32405D86A77EDB3A5A14B32F85C78E0B6C61A62DDEDC4A5D5BA778)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-184*