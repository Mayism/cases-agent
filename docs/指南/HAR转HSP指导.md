---
title: HAR转HSP指导
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-to-hsp
category: 指南
updated_at: 2026-03-12T02:56:02.545Z
---

# HAR转HSP指导

目前HAR的使用存在打包多份，包膨胀的问题，导致整体应用包的体积很大，HSP可以很好地解决该问题，本文介绍如何通过配置项的变更将HAR工程转换为HSP工程。

说明

部分组件和模块在HAP、HSP、HAR中集成使用时存在差异，例如[加载HAR中Worker线程文件相比HSP存在单独的使用约束](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/worker-introduction#文件路径注意事项)，因此按照如下步骤完成HAR转HSP后，请关注对应组件和模块介绍并进行适配。

## HAR转HSP的操作步骤

1.  修改HAR模块下的module.json5文件，将type字段设置为shared，并新增deliveryWithInstall和pages字段。
    
    ```cangjie
    {
      "module": {
        // ...
        "type": "shared",
        "deliveryWithInstall": true,
        "pages": "$profile:main_pages",
        // ...
      }
    }
    ```
    
    [module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/HarToHsp/library/src/main/module.json5#L16-L33)
    
2.  在resources\\base下新增profile文件夹，在profile下新增一个main\_pages.json文件，并配置如下内容。
    
    ```json
    {
      "src": [
        "pages/PageIndex"
      ]
    }
    ```
    
3.  在ets目录下新增pages目录，并在pages目录下新增PageIndex.ets文件，配置如下内容。
    
    ```TypeScript
    @Entry
    @Component
    struct PageIndex {
      @State message: string = 'hello world';
      build() {
        Row() {
          Column() {
            Text(this.message)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [PageIndex.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/HarToHsp/library/src/main/ets/pages/PageIndex.ets#L16-L34)
    
4.  删除HAR模块的build-profile.json5文件中的consumerFiles字段配置。
    
5.  修改HAR模块的hvigorfile.ts文件，将以下内容替换文件内容。
    
    ```TypeScript
    // library\hvigorfile.ts
    import { hspTasks } from '@ohos/hvigor-ohos-plugin';
    export default {
      system: hspTasks,  // 编译修改成HSP的任务
      plugins:[]
    }
    ```
    
    [hvigorfile.ts](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/HarToHsp/library/hvigorfile.ts#L16-L24)
    
6.  修改oh-package.json5文件，新增packageType配置。
    
    ```cangjie
    {
      // ...
      "packageType": "InterfaceHar"
    }
    ```
    
    [oh-package.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/HarToHsp/library/oh-package.json5#L16-L29)
    
7.  修改项目根目录下的build-profile.json5文件，在modules标签下找到library的配置，新增targets标签。
    
    ```cangjie
    "modules": [
      // ...
      {
        "name": "library",
        "srcPath": "./library",
        "targets": [
          {
            "name": "default",
            "applyToProducts": [
              "default"
            ]
          }
        ]
      }
    ],
    ```
    
    [build-profile.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/bmsSample/HarToHsp/build-profile.json5#L43-L72)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/har-to-hsp*