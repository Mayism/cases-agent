---
title: 基于Link的装饰器方案
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-decorator-link
category: 指南
updated_at: 2026-03-13T03:25:47.121Z
---

# 基于Link的装饰器方案

开发者使用@InsightIntentLink装饰器进行基于Link的意图声明，可快速将已实现的Link跳转功能接入意图框架，以购买电影票意图为例，详细说明如下：

1.  装饰器的添加位置：装饰器建议添加到处理该Link的Class上，如下所示。
    
    ```typescript
    import { InsightIntentLink, LinkParamCategory } from '@kit.AbilityKit';
    import { url } from '@kit.ArkTS';
    @InsightIntentLink({
      intentName: 'PurchaseMovieTickets',
      domain: 'PurchaseTickets',
      intentVersion: '1.0.1',
      displayName: '购买电影票',
      llmDescription: '用于在线购买电影票，允许用户选择指定影院、电影和场次时间进行购票。在用户明确表达购票需求，且已提供所有必要信息（cinema, film, time）时使用。如果信息不全或者用户只是查询电影信息、放映时间或票价，不应调用此工具。',
      uri: 'decorator://ability.entry/main',
      parameters: {
        "type": "object",
        "properties": {
          "cinema": {
            "type": "string",
            "description": "目标影院名称，仅支持平台合作的影院"
          },
          "film": {
            "type": "string",
            "description": "目标电影名称，需为当前上映或即将上映且在影院排片列表中的电影"
          },
          "time": {
            "type": "string",
            "description": "放映时间，必须为未来的场次，且需为影院当天有效排片时间；时间格式应为'YYYY-MM-DD HH:MM'（例如'2025-07-01 19:30'）"
          }
        },
        "required": ["cinema", "film", "time"]
      },
      paramMappings:[
        {
          paramName: 'cinema',
          paramMappingName: 'location',
          paramCategory: LinkParamCategory.LINK
        },
        {
          paramName: 'film',
          paramMappingName: 'title',
          paramCategory: LinkParamCategory.LINK
        },
        {
          paramName: 'time',
          paramMappingName: 'time',
          paramCategory: LinkParamCategory.LINK
        }
      ]
    })
    export class PurchaseMovieTicketsLinkIntent {
       private purchaseMovieTickets(uri: string): void {
         // 从want中获取传入的链接信息。
         // 如传入的url为：decorator://ability.entry/main?location=XXX影城&title=XXX&time=2025.06.01
         let urlObject = url.URL.parseURL(uri);
         let location = urlObject.params.get('location');
         if (location === "XXX影城") {
           // ...
         }
       }
     }
    ```
    
2.  装饰器的字段说明以及示例：@InsightIntentLink字段以及具体说明如下。
    
    | 字段名称 | 类型 | 必选 | 说明 |
    | --- | --- | --- | --- |
    | intentName | string | 是 | 意图名称，最大长度：64。 |
    | domain | string | 是 | 意图所属的功能垂域。 |
    | intentVersion | string | 是 | 意图的版本号，用于兼容性管理。 |
    | displayName | string | 是 | 意图的展示名称，用于界面显示，最大长度：64。 |
    | llmDescription | string | 否 | 意图的描述，详细描述该意图可实现的能力，便于大模型理解并调用，接入自定义意图时，该字段必选。 |
    | uri | string | 是 | Link跳转uri。 |
    | parameters | Record<string, object > | 否 | 意图参数定义，描述参数类型以及含义。 |
    | paramMappings | [LinkIntentParamMapping[]](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-decorator-link#table1558332918513) | 否 | Link的参数映射，定义了意图入参与uri拼接参数的映射关系，如果需要参数映射或者需要添加wantParams，需要使用该字段。 |
    | result | Record<string, object > | 否 | 意图执行返回结果定义。 |
    
    LinkIntentParamMapping结构如下表：
    
    | 字段名称 | 类型 | 必选 | 说明 |
    | --- | --- | --- | --- |
    | paramName | string | 是 | 映射后的意图参数名称。 |
    | paramMappingName | string | 否 | 映射前的Link参数名称，意图调用时可将意图参数映射为Link参数，用于适配已有的Link调用。 |
    | paramCategory | LinkParamCategory | 否 | Link参数类型枚举，默认作为域名参数，设置为“link”类型；如需要wantParams，则需要设置为“want”类型。 |
    
    为便于大模型理解和调用，相关参数定义需要遵照[自定义意图相关信息定义规范](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-specification)。
    
3.  添加装饰器的方式：装饰器可以直接手动添加，同时也支持一键生成装饰器，建议使用后者，此方式需要安装相应插件，详细步骤如下：
    
    1.  打开CodeGenie插件：在DevEco Studio右侧边栏点击CodeGenie或输入快捷键Alt/Option+U，可以进入DevEco CodeGenie。若使用非最新版本的DevEco Studio，可通过[下载中心](https://developer.huawei.com/consumer/cn/download/deveco-codegenie)获取并使用相关功能，具体请参考[插件获取及安装](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-codegenie#section18337533718)。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/pHzw9A1KQA63c2H_vvN0GQ/zh-cn_image_0000002368516014.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=D1D327D700BC10CC761EC6D155BB1596708F14F754C634C0174D6B358E850C59 "点击放大")
        
    2.  框选想要接入意图框架功能的代码。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d0/v3/rbDocsNjRYCtkyLhLo0e8g/zh-cn_image_0000002402195681.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=F2455E4E10166872BD2519107B0E9EBD86151E5C53855B893ABA4FE155E65579 "点击放大")
        
    3.  在选中的代码块上右键CodeGenie > Insight Intent > 选择适合的装饰器。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a/v3/Ny3_BekmTMaGemnZvYAe3g/zh-cn_image_0000002368676202.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=FE96E4A0A2C82A72A011538829CAB132E1BF3A1F31290442694F46CDCD9B4DFE "点击放大")
        
    4.  在DevEco CodeGenie对话框中对意图定义、功能和参数等进行描述。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/19/v3/XSbkLlqASAK-LkmETBewYw/zh-cn_image_0000002368516410.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=129C42B3B27037A6B36833C3F4D39F5767C35778AD7FDD34639D250ABA602EE0 "点击放大")
        
    5.  回车或者点击发送按钮，即可生成对应的装饰器内容。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7e/v3/s3H1snYVS5O52UZFd3XQCA/zh-cn_image_0000002402276489.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=9D543F13B67E5DFA785EE28D635673C3DDB59B3D4217B1BF0DFB4E359652CD23 "点击放大")
        
    6.  将光标放置于要插入装饰器的位置，点击插入图标，即可在对应位置插入装饰器。
    
    插入前：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/5P8Jlr3ASGCtTu17NxBfiA/zh-cn_image_0000002402276777.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=539C1154D73DDEE3F3CC73B128E818E529FA7EAAF33D36B37021148914C3838A "点击放大")
    
    插入后：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b8/v3/VkP2G8LsQ3Su6RkMeR2bwA/zh-cn_image_0000002368517322.png?HW-CC-KV=V1&HW-CC-Date=20260313T032509Z&HW-CC-Expire=86400&HW-CC-Sign=9366EE2966341820FF03AB5FCF172A621C21B1B32332109AF6844ADEBE74892B "点击放大")
    
4.  装饰器的使用约束和说明：
    -   Link装饰器包含通过Link接入意图的所有配置，因此对装饰器所在Class、变量、成员没有要求，但是必须要在被依赖的ets文件中添加装饰器才可以被编译。
    -   支持开发者设置wantParameter，执行Link时，会将该参数附带到want的parameter中。
    -   装饰器方式仅支持参数名映射，不做参数加工，包括取值转换、合并等情况。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-decorator-link*