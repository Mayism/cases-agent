---
title: 编译报错“Cannot find module XXX or its corresponding type declarations”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-4
category: FAQ
updated_at: 2026-03-13T05:30:22.576Z
---

# 编译报错“Cannot find module XXX or its corresponding type declarations”

-   **场景一：**
    
    **问题现象**
    
    Stage模板工程编译引用native文件(.so) 提示“Cannot find module XXX or its corresponding type declarations.”。
    
    **解决措施**
    
    当前Stage工程在编译构建阶段新增对native文件（.so）导出符号的语法校验。如果现有工程引用了没有对应声明文件（.d.ts）的native文件（.so），语法校验工具会报错，提示找不到对应的声明文件。
    
    如果出现类似问题，尝试以下解决方法：
    
    1.  在对应cpp目录下新建types/libxxx目录，并在该目录下新增index.d.ts用于声明native文件的类型符号；新增oh-package.json5配置文件用于校验工具的模块查询。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/94/v3/Vy0KMoxZT5eluncdij-Jug/zh-cn_image_0000002229604373.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=2BDD7A7F00F32E8724B4A224B3591E922E98AA3877A4F2CCC219DE068D0B3C4C)
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/G_eF6J0SQMCt8xZjXhMj4Q/zh-cn_image_0000002194158980.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=FB9EB28A2DA1132EEDB9C54585E2CD13BCA32D4B4A5C6C73D60F637BA3C38D1A)
        
    2.  在native文件引用的模块内的oh-package.json5中添加native文件的本地依赖，并根据DevEco Studio提示点击\*\*Sync Now\*\*同步工程，下图以entry模块引用native文件为例。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bb/v3/7qJDiiZKRuCkLO8u7-rnxQ/zh-cn_image_0000002194318572.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=14470E80C385EA3FA60E68377F2964B4657791E6197A6CDBB77484276B04BF4F)
        

-   **场景二：**
    
    **问题现象**
    
    API 11 Stage模板工程编译失败，提示“Cannot find module '@kit.xxx' or its corresponding type declarations”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a9/v3/7VUhnbcBT7mGcusDVSgzsg/zh-cn_image_0000002229758849.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=4BE5154ECA5222A99C0D6ED2CBF22974F757508472E8CBAC5283E866EFBAC08A)
    
    **问题原因**
    
    出现该问题的原因是使用DevEco Studio NEXT Developer Preview1及之后版本。新创建的API 11 Stage模型的模板文件中，import方式改为import xxx from '@kit.xxx'。若SDK使用的是HarmonyOS NEXT Developer Preview1之前的版本，将会出现编译报错，因为旧的SDK不支持此类方式导入。
    
    **解决措施**
    
    如果出现类似问题，需要对SDK进行更新或更新DevEco Studio。
    
    -   如果使用的是DevEco Studio NEXT Developer Preview1至HarmonyOS NEXT Developer Beta1（5.0.3.300）之间的版本，在菜单栏点击**Tool > SDK Manager**，将SDK更新至HarmonyOS NEXT Developer Preview1及以上版本后，重新进行编译。
    -   如果使用的是HarmonyOS NEXT Developer Beta1（5.0.3.300）及以上的版本，SDK随DevEco Studio软件包安装，无需单独下载，请在[下载中心](https://developer.huawei.com/consumer/cn/download/)下载并使用新版本DevEco Studio。
-   **场景三：**
    
    **问题现象**
    
    引用第三方包，构建失败，提示“Cannot find module 'xxx' or its corresponding type declarations”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/43/v3/oh9tGsyTQlay6Wr_g8aJtA/zh-cn_image_0000002229758853.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=6C93963D66845022BF8FF2D73D94A8449928B35C94B42190942BFD651455E282)
    
    **解决措施**
    
    进入模块级或工程级的oh-package.json5文件，检查三方包是否已安装。若未安装，执行ohpm install安装。若已安装，检查“main”字段是否配置正确。若未配置或配置错误，需配置为正确的入口文件。
    
-   **场景四：**
    
    **问题现象**
    
    包路径被混淆，代码中又是在引用包路径后面拼接了路径，导致模块引用不到而报错。
    
    例如：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8e/v3/LB3ZDwF7RDS_gzrE01SZ0Q/zh-cn_image_0000002194158984.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=92624F81EA8E72F4C230586E3628F3CCBC99EC48BEF9559573CCB830E22AC250)
    
    代码中这样引用
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/69/v3/Ig-d3iofSlCW_Svmb_dHyg/zh-cn_image_0000002229758861.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=5A44E119387779AED2ADE02D6B7A04A2BFA3919714E6207B7524F68891577C66)这样引用会找不到模块，导致报错。
    
    **解决措施**
    
    修改引用方式，采用推荐的方式。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5f/v3/EsZY8oOfTFKXG9pj3k2hVA/zh-cn_image_0000002194158972.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=1F7C953BB55349B72401572BC9F2C4FDEF4A736949EF2CC988BBFD1A4DEA431D)
    
-   **场景五：**
    
    **问题现象**
    
    被引用模块oh-package.json5配置有误，执行了ohpm install 并且成功地安装了依赖，但是还报错模块找不到。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/393NfTavTjG6rBamwH8xdA/zh-cn_image_0000002194158976.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=A00AF6BE26574FE53BD6913166E6EFE4AFEA4938D356224DA8EF8B032EC35A8D)
    
    被引用模块的 oh-package.json5 中配置了错误的types字段。
    
    该字段优先于main字段。 如果 types 字段配置的不存在，就会报错模块找不到。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cb/v3/6GCskReoSo60vYzufxOPoA/zh-cn_image_0000002229604353.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=2A2E39B9EECB13598AED323B47B5A459FC6C94C1B3578F048BE002FD90CE3FD5)
    
    **解决措施**
    
    如果该包中没有d.ets声明，可以删除这个字段。配置错误或不存在会导致报错。
    
-   **场景六：**
    
    **问题现象**
    
    oh-package.json5中dependencies中引入模块的名称和实际使用时import的不一致。
    
    在代码中“import”时，应使用大写的“HAR”而不是“dependencies”里配置的“har”。务必保持完全一致，否则在Linux系统中会报错，提示模块找不到。
    
    **解决措施**
    
    引入和使用改成一致。
    
-   **场景七：**
    
    **问题现象**
    
    引用模块的oh-package.json5中main字段值和实际的文件名称大小写不一致。
    
    **解决措施**
    
    将main字段和实际文件名称大小写改为一致。
    
-   **场景八**：
    
    **问题现象**
    
    Stage模板工程编译构建失败，提示“Cannot find module '@bundle:rollup\_plugin\_ignore\_empty\_module\_placeholder' or its corresponding type declarations”。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/gljXB3GxQVabDg6L5jOBrA/zh-cn_image_0000002229758841.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=A8C2EC2311EB2AAE8C5ED69A85DB9C646C7BB1026AA47286C5C53660177E2330)
    
    **解决措施**
    
    该问题源于工程引用了无对应实现文件的.d.ts声明文件。
    
    1.  在build目录搜索\`rollup\_plugin\_ignore\_empty\_module\_placeholder\`定位问题模块。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/11/v3/roSmvSNDRLe2fDFjDDOGkQ/zh-cn_image_0000002194158956.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=2E36D2F14BE3E9435760FE06611F7EA01B4AD44E44E53AFF1245C6BD89A264C9)
        
        在输入栏中输入“rollup\_plugin\_ignore\_empty\_module\_placeholder”，找到问题模块的中间文件。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7f/v3/q-27VWcNQ52M0WgFxx4hNg/zh-cn_image_0000002194158964.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=5E432399A1D3A516B1AA32288E121896A09254E98F77525B801DB45012D57330)
        
    
    2.  在引用类型文件中通过添加type显式声明符号类型。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/de/v3/CPYudtgkRCS-oabVBs6FXg/zh-cn_image_0000002229758865.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=68004C30F66483E0F48942EE95A1BF677D0E38FB10B2867C33F215201669740A)
        
    
    3.  同时排查是否从d.ts/d.ets中引用值类型符号。禁止在声明文件中声明值变量。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/mPKnuAZaT2iQ8YOvgJ9wYw/zh-cn_image_0000002194158968.png?HW-CC-KV=V1&HW-CC-Date=20260313T053016Z&HW-CC-Expire=86400&HW-CC-Sign=A1B6D48C738879D6D36DC488466573FF7649E79760715495F0E96748C984FC4A)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-4*