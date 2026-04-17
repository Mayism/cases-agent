---
title: 如何获取App版本号，版本名，屏幕分辨率等信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-71
category: FAQ
updated_at: 2026-03-13T02:51:05.653Z
---

# 如何获取App版本号，版本名，屏幕分辨率等信息

1.  通过@kit.AbilityKit中的bundleManager模块查询bundleInfo，其中包含App版本号和版本名。
    
    ```typescript
    import { BusinessError } from '@kit.BasicServicesKit';
    import { bundleManager } from '@kit.AbilityKit';
    // ...
    bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).then((bundleInfo)=>{
      let versionName = bundleInfo.versionName;//App version name
      let versionNo = bundleInfo.versionCode;//App version code
    }).catch((error: BusinessError )=>{
      console.error("get bundleInfo failed,error is "+error)
    })
    ```
    
    [GetAppInformationWithBundle.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/GetAppInformationWithBundle.ets#L21-L29)
    
2.  在context.config中获取screenDensity，其中包含屏幕分辨率信息。
    
    ```typescript
    import { common } from '@kit.AbilityKit';
    // ...
    // In the utility class: Save the context to AppStorage in the EntryAbility - onCreate lifecycle, then use AppStorage to retrieve it in the utility class
    let context = AppStorage.get("context") as common.UIAbilityContext;
    let screenDensity = context.config.screenDensity;
    ```
    
    [GetAppInformation.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/GetAppInformation.ets#L21-L26)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-71*