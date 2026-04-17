---
title: 模型（Model）配置
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-model
category: 指南
updated_at: 2026-03-13T04:10:21.538Z
---

# 模型（Model）配置

CodeGenie支持通过服务提供商和URL协议接入第三方模型，为自定义Agent提供多样化的模型选择。

从DevEco Studio 6.0.1 Beta1开始，URL支持通过OpenAI协议接入第三方模型。

从DevEco Studio 6.0.2 Beta1开始，URL支持通过Anthropic、Gemini协议接入第三方模型，和新增Built-in Models内置模型。

从DevEco Studio 6.0.2 Release（6.0.2.646）开始， 支持通过服务提供商接入三方模型，URL接入时支持使用Ollama协议的三方模型。

## 操作步骤

1.  点击界面右上方**Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/W7HNSwq_SymWzZL8xIpb9g/zh-cn_image_0000002501069994.png?HW-CC-KV=V1&HW-CC-Date=20260313T040941Z&HW-CC-Expire=86400&HW-CC-Sign=777F651B7583138420D5AF41691956AF02CA26AA615E355DF714C16F955EC530)按钮，选择**Model**，进入配置页面。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d3/v3/sJHQxKJGTF-AUUnE7DK0Sg/zh-cn_image_0000002501069982.png?HW-CC-KV=V1&HW-CC-Date=20260313T040941Z&HW-CC-Expire=86400&HW-CC-Sign=D05A6B42C88879A8E11E0DF9957B8CC31BB9EA64B1284D21A037A8AFF03DB7A2 "点击放大")
    
2.  点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d3/v3/V0uWLF4xQiGvNumVQQa1oA/zh-cn_image_0000002556039631.png?HW-CC-KV=V1&HW-CC-Date=20260313T040941Z&HW-CC-Expire=86400&HW-CC-Sign=391C22BAA4F83A159E9C088650F97752463E30BB9775E4D4A0C5246AFD9FD5D2)按钮添加模型，当前支持通过Service Provider（服务提供商）和URL两种方式添加。
    
    -   通过服务提供商添加。填写**Name**、**Provider**、**API Key**、**Model**字段后，点击**Add**，校验成功后模型将被添加到列表中。
        
        -   **Name**：模型名称。
        -   **Provider**：模型的提供商，可选项包括OpenAI、Gemini、Anthropic、DeepSeek、Alibaba Cloud、Z.ai。
        -   **API Key**：模型的访问密钥，在提供商网站申请。
        -   **Model**：模型的标识。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/OpZ4b9LdRWKkKnhJNyJODw/zh-cn_image_0000002525119688.png?HW-CC-KV=V1&HW-CC-Date=20260313T040941Z&HW-CC-Expire=86400&HW-CC-Sign=E39B33BFB9C85799699CF2EB66A168166FDC60CD28BB1A79D5C737846C6D8D61 "点击放大")
        
    
    -   通过URL添加。填写**Name**、**Protocol**、**Url**、**API Key**、**Model**字段后，点击**Add**，校验成功后模型将被添加到列表中。
        
        -   **Name**：模型名称。
        -   **Url**：模型的访问地址。
        -   **Protocol**：模型的协议，可选项包括OpenAI、Anthropic、Gemini、Ollama。
        -   **API Key**：模型的访问密钥，在提供商网站申请。
        -   **Model**：模型的标识。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ee/v3/RVdAFtf6Ruua5FTkPqw4mg/zh-cn_image_0000002556159609.png?HW-CC-KV=V1&HW-CC-Date=20260313T040941Z&HW-CC-Expire=86400&HW-CC-Sign=9414C0510F8A0989FA4CC79369363417DB4433969687CC4520DE70BFE9363DC3 "点击放大")
        
    
3.  在**All Models**下展示所有添加成功的模型，Built-in Models为内置模型，Custom Models为三方模型（自定义模型）。将鼠标悬浮在三方模型上会显示两个操作按钮：编辑、删除，方便开发者管理三方模型。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6d/v3/bkik8G54Sh-r4Fw5Zlpwvg/zh-cn_image_0000002556243619.png?HW-CC-KV=V1&HW-CC-Date=20260313T040941Z&HW-CC-Expire=86400&HW-CC-Sign=013E899FCCF739A16834C2D219B7C58ECB79D9D6AE06CAABC60E4CA263BBA8A8 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-model*