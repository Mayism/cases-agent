---
title: 规则（Rules）配置
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-rules
category: 指南
updated_at: 2026-03-13T04:10:26.223Z
---

# 规则（Rules）配置

从DevEco Studio 6.0.2 Beta1开始，CodeGenie支持用户配置规则（Rules）。在自定义智能体模型下，智能问答时可生成更加符合Rules规范的代码。规则包括全局级别规则（Global Rules）和工程级别规则（Project Rules）。

**Global Rules**：支持开发者自行导入规则文件（Custom rule），或使用默认规则（Default rule），或不使用规则（No rules）；规则与用户绑定，对当前用户下所有工程生效；支持添加多个自定义规则，添加后可选择是否生效。

**Project Rules**：需开发者自行导入或创建规则；规则仅对当前工程有效；仅支持添加一个自定义规则，添加后即生效。

说明

-   规则文件：扩展名为.md的Markdown文件，.md文件中仅二级标题及以下的规则内容生效。
-   默认规则（Default rule）需联网使用，无网络或网络故障时用户可选择Custom rule或No rules。

## Global Rules配置

1.  点击页面右侧菜单栏CodeGenie图标，完成登录后。点击界面右上方**Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e9/v3/N2i6ntiCSZWU-gMGU6432Q/zh-cn_image_0000002500909902.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=958FB15913584A0D67FE5984A0F644850F4A2F7ABBBF445BEE0C28B949BACC26)按钮，选择**Rules**，进入配置页面。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f7/v3/LIw6I_HqTjuB4Vnz_u134g/zh-cn_image_0000002532669799.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=A63B60C90E0F67795357229F6AD32BD377D2A68C74AEF908B0A29513FFC5411E)
    
2.  以有网络为例，点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/06/v3/kwAqMURKShe9kPxR7I8I9w/zh-cn_image_0000002532669805.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=04B7395A7D67317931497FBC3DF29DD953501D2EF9E75C32988AB2A3FF988E12)图标导入规则文件。无网络时操作界面可能存在差异，以实际为准。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7a/v3/QLEZutr4SiSktFyTTrF-nw/zh-cn_image_0000002532669801.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=AA9CBCA1CE92A772C33015A443A87CCE53AC99D3E108F1ED721E77CBAA4C21E1)
    
3.  选择和管理规则文件。Global Rules列表全量展示了默认规则、自定义规则和无规则，当前仅支持选择其中一个规则。若选择No rules，则全局规则不生效。
    
    -   将鼠标悬浮在默认规则上，点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f3/v3/sGadp5e2SmC_jVr9FIb0AQ/zh-cn_image_0000002532749755.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=1AC012C273B4FCD97E90A36AC7299981BDC5C331705886A8781652D5E1A27B08)编辑图标，开发者可查看具体规则内容。
    -   将鼠标悬浮在自定义规则上，会出现编辑和删除按钮，方便开发者管理自定义规则。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/SVtZU2QoRoOn1RJIyKcm-A/zh-cn_image_0000002501069744.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=ECDCF527C420ED58352AF82788F47318F3122EC6B6A0D61363C2EE1F6E48C60F)
    

## Project Rules配置

1.  点击页面右侧菜单栏CodeGenie图标，完成登录后。点击界面右上方**Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/zp41KAQpRVy9XWSg49scpA/zh-cn_image_0000002500909892.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=2B087DF7E2C9AA956E811477536C27C4F1D6D69143E0F32FCD5E7BBE1E3490B8)按钮，选择**Rules**，进入配置页面。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/49/v3/geFPv0sOTYCUW2HOULiyLw/zh-cn_image_0000002501069746.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=FEE957C000001623C9CE11517535903AAEC45995596C1B3604D49AFB369A876B)
    
2.  创建或导入Rule文件。
    
    -   创建Rule文件方法：点击**Create Rule**，工程目录中会新增/.codegenie/project\_rule.md文件，在project\_rule.md文件中输入规则内容。
    -   导入Rule文件方法：点击**Import Rule**，工程目录中会新增/.codegenie/project\_rule.md文件，project\_rule.md文件内容即为导入的规则文件内容。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/mtDw_uIUSoecPZhyMGnabA/zh-cn_image_0000002501069736.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=27A2150AC89F47812D607A93153FE349BC9EE26D28688FAAB8900AAD4409C130)
    
3.  管理规则文件。将鼠标悬浮在工程文件上，会出现编辑和删除按钮，方便开发者管理工程规则文件。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/43/v3/4zpHYPOlSjGShlspODKl0g/zh-cn_image_0000002500909896.png?HW-CC-KV=V1&HW-CC-Date=20260313T040945Z&HW-CC-Expire=86400&HW-CC-Sign=192487FCE7E7BF9658C6C40D7CBEEF3C5C9C7723435439336FE2E81926C0F154)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-rules*