---
title: 配置Client ID
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/health-configuration-client-id
category: 指南
updated_at: 2026-03-12T22:14:35.869Z
---

# 配置Client ID

1.  登录[AppGallery Connect](https://developer.huawei.com/consumer/cn/service/josp/agc/index.html)平台，在“开发与服务”中选择目标应用，获取“项目设置 > 常规 > 应用”的Client ID。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b/v3/nTPSWxvfQdWZlygySVydCQ/zh-cn_image_0000002509334467.png?HW-CC-KV=V1&HW-CC-Date=20260312T220653Z&HW-CC-Expire=86400&HW-CC-Sign=E39B57E6B9F827D1C53842DF14921465ADE1EE57278715D021EAE39BEAE4C882)
    
2.  在工程中entry模块的module.json5文件中，新增metadata，配置name为client\_id，value为上一步获取的Client ID的值，如下所示：
    
    ```json
    "module": {
      "name": "xxxx",
      "type": "entry",
      "description": "xxxx",
      "mainElement": "xxxx",
      "deviceTypes": [],
      "pages": "xxxx",
      "abilities": [],
      "metadata": [ // 配置如下信息
        {
          "name": "client_id",
          "value": "xxxxxx"
        }
      ]
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/health-configuration-client-id*