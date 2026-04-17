---
title: MCP协议上架指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-kit-listing-mcp-protocol
category: 指南
updated_at: 2026-03-13T03:28:27.122Z
---

# MCP协议上架指导

## **意图注册配置操作步骤**

1.  账号登录：
    
    1.  通过“[华为开发者联盟](https://developer.huawei.com/consumer/cn/) \> 管理中心 \> 生态服务 \> 智慧服务 \> 小艺开放平台（原HarmonyOS服务开放平台） \> 意图框架”，进入意图注册入口。
        
        如发布渠道为“智能体/小艺对话”只能使用与应用上架相同的账号登录。反之发布渠道为“插件市场”无特殊账号要求。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8d/v3/FF6ANi_5Qo-aVRtyuNcqZQ/zh-cn_image_0000002370462624.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=6D0C351F6D66E508E4472C8DB0A6B1CEB911AA6C498197555F1F46CC14172159 "点击放大")
        
    2.  点击“立即体验”即可进入意图注册入口。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ac/v3/JxQiNBtTTfyZB4cbb9PBbg/zh-cn_image_0000002370462696.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=20F7D1EBE2D7373A2E7EC9D3505920C3614154BE55251BE9AC8C8464C5545CF5 "点击放大")
    
2.  注册意图集
    1.  如图，点击“注册意图”。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/22/v3/JEpJBw8eSwW17baW1Kzd_g/zh-cn_image_0000002404182437.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=7A199648EAFE142B59F9D37BD3A1000B90C41D277A9E002AB75C1936199DBE0F "点击放大")
        
    2.  选择“MCP协议”并填写基本信息创建意图集。
        
        1.  意图集（插件）名称：需唯一标识。
        2.  意图集（插件）描述：开发者自定义插件描述信息。
        3.  分类：按业务场景选择。
        4.  MCP服务配置：填写MCP URL（服务器地址信息，不含鉴权信息）。
        5.  认证信息配置：对应鉴权信息（注意放在Header/Query）。
        6.  协议类型：根据情况选择，提供SSE/Streamable两种。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b7/v3/EZepd7cmSQ-JPMTqHBtxZA/zh-cn_image_0000002370622864.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=5A517F71BDE1F4E1A4B79BC8FD929317FA9436E320970C0FEB21B6986DB3C947 "点击放大")
        
3.  编辑：创建后自动进入”插件编辑“页面。
    1.  编辑基本信息：
        
        1.  开发者品牌：该信息是对外露出的品牌传播名（注意和企业账号，公司名称区别开）。
        2.  图标：192\*192。
        3.  使用描述：需使用Markdown格式。（需对server的功能概述、apikey申请方式表达准确清晰）。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f2/v3/U1gGy3xyRX-RkrQMBwRivw/zh-cn_image_0000002370631568.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=2B1D35F14B923867C1B8198064D470615AEA125E0965CAA3D3B7E6E381FABB5C "点击放大")
        
4.  工具检查：保存后切换至"工具"页签。若基本信息配置无误，工具列表中会根据基本信息内容自动生成1条/多条信息。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/H1wA6JpEQYOku0-27zSo3g/zh-cn_image_0000002404278633.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=472F3C9D18BD5F29006A97EC07BE823A19A349EAEF7E034FBE9A0E1CE66922BC "点击放大")
    
    1.  出现工具列表：请检查工具入参，参数是否重复或者缺失，参数类型是否正确。若一切无误，则配置成功。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/87/v3/V4R6oS6hQ_K57RJ1Lw-V6w/zh-cn_image_0000002370479076.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=4692AB434872F23AEC0E9149E5A18AAA6C374487AACE329C466B83B39331C616 "点击放大")
        
    2.  未出现工具列表：请等候几分钟重新进入，后台加载存在延时；如若重新进入后，仍未加载出工具信息，可能是插件的链接和鉴权信息配置错误。多次尝试后仍未解决，请通过邮箱联系华为意图框架同学（hagservice@huawei.com） 。
    
5.  审核：切换至“发布”页签，点击“提交审核”。
    1.  选择发布渠道，点击确定，提交审核。
        
        1.  智能体：开发者上架MCP Server，仅供开发者自己开发的智能体来调用。
        2.  小艺对话：开发者上架MCP Server，可供开发者自己开发的智能体调用，也可供小艺APP主对话调用（当前暂不支持开发者独立在小艺主对话上线该能力，需联系华为意图框架同学）。
        3.  插件市场：开发者上架MCP server，可供开发者自己开发的智能体调用，也可供平台上其他开发者开发智能体时调用（回到开发者源头平台去开服）。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/66/v3/Toyy6VS3Q-iiu9B6ut8pqQ/zh-cn_image_0000002404278877.png?HW-CC-KV=V1&HW-CC-Date=20260313T032745Z&HW-CC-Expire=86400&HW-CC-Sign=A89B217FCD51538E8ADF5DA839C1A60BAE410809111E4FD921835244FEE6F77C "点击放大")
        
    2.  提交审核后，请耐心等待平台相关审核流程完成；完成后即可在“[华为开发者联盟](https://developer.huawei.com/consumer/cn/) \> 管理中心 \> 生态服务 \> 智慧服务 \> 小艺开放平台（原HarmonyOS服务开放平台） \> 意图框架 \> 小艺插件市场”中找到您的工具。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-kit-listing-mcp-protocol*