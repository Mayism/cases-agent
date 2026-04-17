---
title: 应用UI生成
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-generator
category: 指南
updated_at: 2026-03-13T04:09:44.331Z
---

# 应用UI生成

UI Generator用于快速生成可编译、可运行的HarmonyOS UI工程，支持基于已有UI布局文件（XML），快速生成对应的HarmonyOS UI代码，其中包含HarmonyOS基础工程、页面布局、组件及属性和资源文件等。

## 使用约束

建议使用DevEco Studio 5.0.3.700及以上版本。

## 启用插件

1.  在DevEco Studio菜单栏，点击**File > Setting****s...**（macOS为**DevEco Studio > Preferences****/Settings**）**\> Plugins**，在Installed列表中找到UI Generator插件，点击**Enable**启用。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b9/v3/nzr78GvhR3KMQmC9TuNiqg/zh-cn_image_0000002532750543.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=91D67BA9C1D28F010A2B46E0D31C9587485708D94EBAB4CA771BB8B4F0FE8CB7)
    
2.  单击OK并关闭设置窗口，插件启用成功。

## 开始使用

1.  在DevEco Studio菜单栏点击**Tools > Generate Project From...**打开UI Generator工具，首次使用需要阅读并确认用户协议，确认后可继续使用。
2.  输入待配置项路径，点击**Next**进入下一步。
    
    | 待配置项 | 说明 |
    | --- | --- |
    | Installation package path | 待转换的APK应用包的路径，请提供未混淆的Debug版本应用包。 |
    | SDK path | 等于或高于编译应用包所使用版本的SDK路径。 |
    | Git Bash path | Git Bash工具存放路径。若本地已下载安装Git Bash，插件将自动获取其路径。 |
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2d/v3/APImrXcmRE2YEXwbs8S23A/zh-cn_image_0000002500910670.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=73D6860BA3C559E98C2EAD555B652721EBACD7B00827FFD6A19AD3EFAB2B6B33)
    
3.  选择将要生成的XML页面（可在搜索框进行搜索），勾选后点击向右箭头将选中的XML导入至右侧。点击**Next**开始生成。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/69/v3/C2AgbmqoSJ-OjPVw8yBnCA/zh-cn_image_0000002532670581.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=DF15323D4B5E5972A79D51BEF3B832C16FA856620F0F848A3B273F2F4D8D874D)
    
4.  配置输出工程待配置项，点击**Finish**进行生成。
    
    | 待配置项 | 说明 |
    | --- | --- |
    | Destination Path | 生成新工程的保存路径(默认生成到用户目录下UIGenerationProjects，用户可根据需要自行更改) |
    | Compatible SDK | 生成的新工程所使用的SDK版本 |
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f1/v3/3stla03CRBGNO1eM0auHBw/zh-cn_image_0000002532750539.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=3A68AA87C630F5BACE0694335AC00F0DA54D153D8190631800EEFE3FF0344B06)
    
5.  （可选）如果所选XML无有效根节点，需要选择根节点信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/40/v3/fT2YWjc_Tsu_VdZYQ8onqQ/zh-cn_image_0000002532670583.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=FB6AF26AA6D378AA503746EC76E441479A92ABA7B8A2CA948A86B0BE0BD37E53)
    
6.  点击**Finish**，在弹窗中点击确认，打开新工程。
    
    生成的页面位于entry > src > main > ets > pages目录下，可以点击Previewer查看页面预览效果。不支持生成的组件、属性会以注释的形式给出，方便后续定位修改。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0b/v3/AzGVgcVcTg2opBmLDdBSYA/zh-cn_image_0000002500910674.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=FB85775472DC07EDEEFDADB13FBA4EE90F5799F79336E44AD0F12883AECA78E3)
    
7.  生成的新工程内的entry > src > main > resources目录包含文本、图像、颜色资源。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2d/v3/0sU_IBTLTguPABZAJAQNrw/zh-cn_image_0000002532750541.png?HW-CC-KV=V1&HW-CC-Date=20260313T040906Z&HW-CC-Expire=86400&HW-CC-Sign=97D3315C0570DCD25D3E5B4B930861B2D051280D47C106940B2AB56BCC50C55A "点击放大")
    
    更多操作指导，请参考视频课程：[毕方HarmonyOS UI代码生成工具](https://developer.huawei.com/consumer/cn/training/course/live/C101731322888995220)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ui-generator*