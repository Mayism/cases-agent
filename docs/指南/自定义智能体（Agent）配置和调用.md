---
title: 自定义智能体（Agent）配置和调用
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-use
category: 指南
updated_at: 2026-03-13T04:10:40.281Z
---

# 自定义智能体（Agent）配置和调用

从DevEco Studio 6.0.1 Beta1开始，CodeGenie支持用户添加模型和自定义Agent，增强AI问答能力，提升AI辅助编程和分析能力。

从DevEco Studio 6.0.2 Beta1开始，Agent配置时支持开启DevEco Studio内置工具，包括Built-in Tools、Auto Run和Blocklist。

从DevEco Studio 6.0.2 Release（6.0.2.646）开始，DevEco Studio内置工具新增To Do工具；支持Agent智能体切换模型和配置三方模型。

## Agent配置

1.  点击界面右上方**Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c8/v3/tOve53QCQTax6D7XStoSgg/zh-cn_image_0000002532750049.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=411B1977D525D029F923B8BA5DEBB2B3489244E77503B9C9566D392B1CEC35A6)按钮，选择**Agent**；或者在输入框左下角下拉框选择**Create Agent**，进入配置页面。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ec/v3/iQS-yFqVS2qMc7E1yLSSmw/zh-cn_image_0000002524673686.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=EC6442B4E6BF5BCE34E7C32692A04DC6ED1527EB048444C8E42C1E90884C7B96 "点击放大")
    
2.  点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c4/v3/JQt4xPU8TIiCEc0S-nU_pw/zh-cn_image_0000002532750057.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=61E4EC45A407401EF5C00A5E60B7E14388C3E4EFC0766CB9C6BCA7A0F4C1623A)按钮，填写自定义Agent的相关信息。点击**Add**，将创建自定义Agent。
    
    -   **Name**：必填，自定义Agent的名称。
    -   **Prompt Description**：可选，自定义Agent的提示词。
    -   **MCP Tools**：可选，添加MCP工具，具体请参考[MCP配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-mcp)。
    -   **Built-in Tools**：可选，DevEco Studio内置工具，包括File Manager、Terminal、Compile and Build、To Do。
        -   File Manager开启后，支持读写本地的代码文件；
        -   Terminal开启后，在CodeGenie对话框执行命令时可自动拉起Terminal终端；
        -   Compile and Build开启后，支持编译与构建项目；
        -   To Do开启后，支持把一个复杂任务拆解成多步执行，帮助CodeGenie聚焦任务，避免遗忘任务，提升答复准确性。
    -   **Select Model**：必填，选择需要使用的模型，具体请参考[模型（Model）配置](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-model)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9b/v3/PPyOgCAqShitfYHU1bY33A/zh-cn_image_0000002555913695.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=45413FDCACC0FEB4A86A5F99AEE928754189FD9F25754D054065BD4F8683A730 "点击放大")
    
3.  在**All Agents**下展示所有智能体。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/70/v3/Sbj-qGq9TYmz2P5h71krKg/zh-cn_image_0000002524960722.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=0F7F3206CA9F486862122E67A3EA8753F047C2ABF5A518D2FE365416619DE7B3)
    
4.  设置**Auto Run**和**Blocklist**。
    
    -   Auto Run：内置工具和MCP工具被调用过程中，自动执行的开启开关。开启时，工具被调用可自动执行和输出内容；关闭时，工具被调用需开发者授权。默认关闭。
    -   Blocklist：开启Auto Run后，Blocklist中的命令不会自动执行。点击命令后×，可将命令从Blocklist中删除；在Enter Command中输入命令，点击Add，可将命令添加至Blocklist列表。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/95/v3/WxjCN3xlR-qkYtvx9DfSog/zh-cn_image_0000002504578280.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=445D327269C8EA38758CE1117DC1E4DB61BC50391F482E5A5629E175B45EE0D8 "点击放大")
    
5.  选择自定义智能体后，开发者可以切换模型，包括内置模型（deepseek-v3.2、glm-5）和三方模型（如deepseek）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/xzv6cXODSiCrD_pFczLNOw/zh-cn_image_0000002525503564.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=D13AD2136218F8C0AD230F21C30C82F4E8A4163C79A4A6CDE3818710E4A53D10)
    
6.  点击置灰的三方模型会跳转到Service Provider配置界面（如**deepseek-chat**），填写**API Key**字段即可添加模型。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b5/v3/WZLuYamWSc2ftNoALs7NXA/zh-cn_image_0000002525504298.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=2E59B30D5C3A08FEC7709FD0F45D3EDE00B3F97E32D44C2CECC89E49C06BB007 "点击放大")
    

## Agent调用

1.  Agent配置完成后，可以通过如下两种方式开启调用：
    
    -   在对话区域输入"/"调出命令，选择自定义的Agent（如**figma2code**）。
    -   在输入框左下角HarmonyOS Ask处下拉框中选择自定义的Agent（如**figma2code**）。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/13/v3/TYUAw6gERUimTP9Oi2EpYQ/zh-cn_image_0000002555754611.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=A3D28C1ACF072713A6F2A3CB8121D035794087222D83B79D8B2CDCBA09DC0577 "点击放大")
    
2.  选择自定义Agent后，在右侧可以切换模型，默认使用配置Agent时添加的模型。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b0/v3/rjMXucgoR6Oe2scFE2s8zA/zh-cn_image_0000002503322078.png?HW-CC-KV=V1&HW-CC-Date=20260313T041000Z&HW-CC-Expire=86400&HW-CC-Sign=EB8F383BF634D5C98551869660482CF2B90038ACED5A20D4E885BA26C43B2A63 "点击放大")
    
3.  根据业务需要，进行智能问答、代码生成、代码智能解读等，CodeGenie将会调用自定义Agent和选择的模型生成内容。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-use*