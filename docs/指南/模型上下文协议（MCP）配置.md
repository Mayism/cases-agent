---
title: 模型上下文协议（MCP）配置
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-mcp
category: 指南
updated_at: 2026-03-13T04:10:13.389Z
---

# 模型上下文协议（MCP）配置

## 功能介绍

模型上下文协议（Model Context Protocol，简称MCP）是一种开放协议，允许大型语言模型（LLMs）访问自定义的工具和服务，可以通过部署MCP Server并将其集成到自定义智能体中来使用。关于 MCP 的更多信息，请参考 [MCP 官方文档](https://modelcontextprotocol.io/introduction)。

从DevEco Studio 6.0.1 Beta1开始，CodeGenie支持配置MCP。

## 环境约束

为保证MCP Server正常启动，需要安装npx和uvx，并配置到环境变量。

-   npx：依赖于Node.js，建议使用Node.js的LTS版本。
-   uvx：基于Python的快速执行工具，建议安装Python 3.9 以上的版本。

## 操作步骤

1.  点击页面右侧菜单栏CodeGenie图标，完成登录后。点击界面右上方**Settings**![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c2/v3/FiPC2Q9rStWd-5_CXFC0rQ/zh-cn_image_0000002532749971.png?HW-CC-KV=V1&HW-CC-Date=20260313T040932Z&HW-CC-Expire=86400&HW-CC-Sign=A9D4CB821D444ECA7A6116D0F3C7A9196568F04051723DE6FA788DA1CB2B5A4F)按钮，选择**MCP**，进入配置页面。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fe/v3/8d_DjsY0SHyunfHXEiH8ww/zh-cn_image_0000002532749967.png?HW-CC-KV=V1&HW-CC-Date=20260313T040932Z&HW-CC-Expire=86400&HW-CC-Sign=FC895E38724F021194291890616ED26185B8AE69F794615CADD44D5EA1A2308B "点击放大")
    
2.  点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dd/v3/LHhFxG-7RoSjKQKTrgakOw/zh-cn_image_0000002500910092.png?HW-CC-KV=V1&HW-CC-Date=20260313T040932Z&HW-CC-Expire=86400&HW-CC-Sign=348AE9AB4D123C5433E430D89B93B12235D93C74B285D74DE1EB1205E825A72C)按钮，添加MCP工具。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/54/v3/3vpqm4ZLRVquHMwtWj44GA/zh-cn_image_0000002534952175.png?HW-CC-KV=V1&HW-CC-Date=20260313T040932Z&HW-CC-Expire=86400&HW-CC-Sign=36663A2CE82E94E7765CC6B77919826BD834F0C035A49E4A94E32D5A9C540ACE "点击放大")
    
3.  在编辑框中填写MCP工具的配置信息，填写完成后点击**Add**。
    
    说明
    
    MCP Server支持三种通信方式：Stdio 、Server-Sent Events (SSE) 和Streamable HTTP。
    
    Stdio方式支持配置cmd、args和env字段，SSE和Streamable HTTP方式支持配置url字段。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/xySQFkdcRymvLEVGwG7Tww/zh-cn_image_0000002501069938.png?HW-CC-KV=V1&HW-CC-Date=20260313T040932Z&HW-CC-Expire=86400&HW-CC-Sign=1B2097069D89AAF26469DF9560CF2FE416540E8AD9C2256A7CE87E7E1C252C45 "点击放大")
    
4.  在**MCP Tools**列表中，展示所有MCP工具信息，包括名称、连接状态、启用状态。同时，将鼠标悬浮在工具上会显示三个操作按钮：刷新、编辑和删除，方便开发者管理工具。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/Y-D1AFSpQI6Cd4V24oeITg/zh-cn_image_0000002503163036.png?HW-CC-KV=V1&HW-CC-Date=20260313T040932Z&HW-CC-Expire=86400&HW-CC-Sign=1B8FDE3CF916054FF5B95EC2EDD7FA50BA2885D92B68987D79EE630B4E3BA91E "点击放大")
    
    -   名称：MCP工具名称，如context7、Time。
    -   连接状态：工具连接状态，包括“成功”、“失败”和“连接中”三种状态。
    -   启用状态：工具是否已启用。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-agent-mcp*