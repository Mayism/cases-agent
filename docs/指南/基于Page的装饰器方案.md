---
title: 基于Page的装饰器方案
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-decorator-page
category: 指南
updated_at: 2026-03-13T03:25:58.218Z
---

# 基于Page的装饰器方案

开发者使用@InsightIntentPage装饰器进行基于Page的意图声明，可快速将已有的Page页面接入意图框架，以购买电影票的意图为例，详细说明如下：

1.  装饰器添加位置：基于Page的装饰器需要添加在Entry页面组件上，建议在目标页面中进行声明。
    
    ```typescript
    import { InsightIntentPage } from '@kit.AbilityKit';
    @Builder
    export function PurchaseMovieTicketsIntentPageBuilder(pageName: string, param: object) {
      PurchaseMovieTicketsIntentPage({ param: param });
    }
    @InsightIntentPage({
      intentName: 'PurchaseMovieTickets',
      domain: 'PurchaseTickets',
      intentVersion: '1.0.1',
      displayName: '购买电影票',
      llmDescription: '用于在线购买电影票，允许用户选择指定影院、电影和场次时间进行购票。在用户明确表达购票需求，且已提供所有必要信息（cinema, film, time）时使用。如果信息不全或者用户只是查询电影信息、放映时间或票价，不应调用此工具。',
      uiAbility: 'EntryAbility',
      pagePath: './ets/pages/MainPage',
      navDestinationName: 'PurchaseMovieTicketsIntentPage',
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
      }
    })
    @Entry
    @Component
    struct PurchaseMovieTicketsIntentPage {
      param: object = new Object();
      cinema: string = '';
      film: string = '';
      time: string = '';
      aboutToAppear(): void {
        this.cinema= this.param?.['cinema'];
        this.film = this.param?.['film'];
        this.time = this.param?.['time'];
      }
      build() {
        NavDestination(){
          Text(`${this.cinema} ${this.film} ${this.time}`)
            .fontSize(30)
            .fontWeight(FontWeight.Bolder)
        }
        .title('IntentPage')
        .width('100%')
      }
    }
    ```
    
2.  装饰器的字段说明以及示例：@InsightIntentPage字段以及具体说明如下。
    
    | 字段名称 | 类型 | 必选 | 说明 |
    | --- | --- | --- | --- |
    | intentName | string | 是 | 意图名称，最大长度：64。 |
    | domain | string | 是 | 意图所属的功能垂域。 |
    | intentVersion | string | 是 | 意图的版本号，用于兼容性管理。 |
    | displayName | string | 是 | 意图的展示名称，用于界面显示，最大长度：64。 |
    | llmDescription | string | 否 | 意图的描述，详细描述该意图可实现的能力，便于大模型理解并调用。 |
    | parameters | Record<string, object> | 否 | 意图参数定义，描述参数类型以及含义。 |
    | uiAbility | string | 否 | 页面依赖的UiAbility名，如果不传递默认使用EntryAbility。 |
    | pagePath | string | 是 | Navigation组件所在页面的路径，路径基于Module的根目录的相对路径。 |
    | navDestinationName | string | 否 | Navigation子页面名称，如果不填写，则跳转到pagePath指定的页面。 |
    
    为便于大模型理解和调用，相关参数定义需要遵照[自定义意图相关信息定义规范](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-specification)。
    
3.  装饰器的添加方式：装饰器可以直接手动添加，同时也支持一键生成装饰器，建议使用后者，此方式需要安装相应插件，详细步骤如下。
    1.  打开CodeGenie插件：在DevEco Studio右侧边栏点击CodeGenie或输入快捷键Alt/Option+U，可以进入DevEco CodeGenie。若使用非最新版本的DevEco Studio，可通过[下载中心](https://developer.huawei.com/consumer/cn/download/deveco-codegenie)获取并使用相关功能，具体请参考[插件获取及安装](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-codegenie#section18337533718)。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2f/v3/-ENjVVXxSb667nhpkfOTJw/zh-cn_image_0000002402202277.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=35C68CD409BCD3BB332E07235FAD7BE410A263BE4286416437261BEAD415F8C9 "点击放大")
        
    2.  框选想要接入意图框架功能的代码。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f6/v3/V8ON-U_TTlSlUtR0KEcpTw/zh-cn_image_0000002402283005.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=204C9D21F93207FB14C328A10FE5811059CB9A2EBEE96B27D2F2FF15BA1F25C9 "点击放大")
        
    3.  在选中的代码块上右键CodeGenie > Insight Intent > 选择适合的装饰器。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/AvdU1SkeTLOAJ9D_mCsc2A/zh-cn_image_0000002368683178.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=82F21F76990868DB1EC9089B020F0AEFC306168B379398395CBC3797EA23B8B7 "点击放大")
        
    4.  在DevEco CodeGenie对话框中对意图定义，功能，参数等进行描述。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/13/v3/36oGptzfRt6AknSQ1QVxyQ/zh-cn_image_0000002402202953.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=C6404F834DBB5F3B3C2535BC04BBE1AF9E488B9695EE68B41EBDE1CFE2B1E7FB "点击放大")
        
    5.  回车或者点击发送按钮，即可生成对应的装饰器内容。
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d5/v3/QrXST4YkSoqg66wNjCBHrQ/zh-cn_image_0000002368523474.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=A817D779FE5DAA834C62B36B819B829F97770AA16E63A4445CB7C73747ABE836 "点击放大")
        
    6.  将光标放置于要插入装饰器的位置，点击插入图标，即可在对应位置插入装饰器。
        
        插入前：
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5a/v3/s-jgscLRSNy6H4NrxKxcjQ/zh-cn_image_0000002407408805.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=697B038F1B6DFC811D563EA1FD0F07E90D328FED189694A2B7F1F35DB432E860 "点击放大")
        
        插入后：
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/14/v3/PKEl69vEQgeVmu5DREGNiQ/zh-cn_image_0000002407528689.png?HW-CC-KV=V1&HW-CC-Date=20260313T032517Z&HW-CC-Expire=86400&HW-CC-Sign=6605E408E579F9CE278B9E3C34B4278EAAEEB07BEACD3C136AEE32C51AC1F27B "点击放大")
        
4.  装饰器的使用约束和说明：
    -   仅支持Navigation页面架构跳转。
    -   该跳转不能有自定义上下文依赖，比如必须打开前置页面才能跳转，开发者需要进行验证，确认兜底策略。
    -   跳转页面时，默认使用Navigation页面栈进行push，如果开发者需要实现其他跳转逻辑，则需要自行适配。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/intents-skill-all-rec-decorator-page*