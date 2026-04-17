---
title: EnterpriseAdminExtensionAbility开发指南
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/mdm-kit-admin
category: 指南
updated_at: 2026-03-12T14:11:34.614Z
---

# EnterpriseAdminExtensionAbility开发指南

## 概述

企业设备管理扩展能力组件，是设备管理应用必备组件。当开发者为企业开发设备管理应用时，需继承EnterpriseAdminExtensionAbility，在EnterpriseAdminExtensionAbility实例中实现MDM业务逻辑，EnterpriseAdminExtensionAbility实现了系统管理状态变化通知功能，并定义了管理应用激活、去激活、应用安装、卸载事件等回调接口。

## 接口说明

以下为本次开发示例所使用的接口，更多接口及使用方式请见[企业设备管理扩展能力接口文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-enterpriseadminextensionability)。

| 接口名称 | 描述 |
| --- | --- |
| [onAdminEnabled(): void](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-enterpriseadminextensionability#enterpriseadminextensionabilityonadminenabled) | 设备管理应用被激活回调方法。 |
| [onAdminDisabled(): void](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-enterpriseadminextensionability#enterpriseadminextensionabilityonadmindisabled) | 设备管理应用被解除激活回调方法。 |
| [onBundleAdded(bundleName: string): void](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-enterpriseadminextensionability#enterpriseadminextensionabilityonbundleadded) | 应用安装回调方法。 |
| [onBundleRemoved(bundleName: string): void](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-enterpriseadminextensionability#enterpriseadminextensionabilityonbundleremoved) | 应用卸载回调方法。 |

## 开发步骤

新建一个工程后，结构如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/52/v3/2QMb_wUOQTOUGw73i0-Nhw/zh-cn_image_0000002558536777.png?HW-CC-KV=V1&HW-CC-Date=20260312T141057Z&HW-CC-Expire=86400&HW-CC-Sign=77581F8386592D40FA1DE8DD68634882EF4F84747EA30D646B51F687F599ACA6)

首先，创建一个EnterpriseAdmin类型的ExtensionAbility（也就是EnterpriseAdminExtensionAbility）。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f7/v3/XWIH7zxyRd62hHd9_uTbsA/zh-cn_image_0000002527217046.png?HW-CC-KV=V1&HW-CC-Date=20260312T141057Z&HW-CC-Expire=86400&HW-CC-Sign=CE5E0B15D7A6A9BEC637B5D15915C5429F783ED8BD745F7F166AC70C98ADEAA8)

其次，打开新建的EnterpriseAdminAbility文件，导入EnterpriseAdminExtensionAbility模块，使其继承EnterpriseAdminExtensionAbility并加上需要的应用通知回调方法，如onAdminEnabled()、onAdminDisabled()等回调方法。当设备管理应用激活或者解除激活时，可以在对应回调方法中接收系统发送通知。

```TypeScript
import { EnterpriseAdminExtensionAbility } from '@kit.MDMKit';
// ···
export default class EnterpriseAdminAbility extends EnterpriseAdminExtensionAbility {
// ···
  // 设备管理器应用激活回调方法，应用可在此回调函数中进行初始化策略设置。
  onAdminEnabled() {
    console.info('onAdminEnabled');
    // ···
  }
  // 设备管理器应用去激活回调方法，应用可在此回调函数中通知企业管理员设备已脱管。
  onAdminDisabled() {
    console.info('onAdminDisabled');
    // ···
  }
  // 应用安装回调方法，应用可在此回调函数中进行事件上报，通知企业管理员。
  onBundleAdded(bundleName: string) {
    console.info('EnterpriseAdminAbility onBundleAdded bundleName:' + bundleName);
  }
  // 应用卸载回调方法，应用可在此回调函数中进行事件上报，通知企业管理员。
  onBundleRemoved(bundleName: string) {
    console.info('EnterpriseAdminAbility onBundleRemoved bundleName' + bundleName);
  }
};
```

[EnterpriseAdminAbility.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/EnterpriseAdminExtensionAbility/EnterpriseAdminExtensionAbility/entry/src/main/ets/enterpriseadminability/EnterpriseAdminAbility.ets#L27-L195)

最后，在工程Module对应的[module.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/module-configuration-file)配置文件中将EnterpriseAdminAbility注册为ExtensionAbility，type标签需要设置为“enterpriseAdmin”，srcEntry标签表示当前ExtensionAbility组件所对应的代码路径。

```cangjie
"extensionAbilities": [
  {
    "name": "EnterpriseAdminAbility",
    "type": "enterpriseAdmin",
    "exported": true,
    "srcEntry": "./ets/enterpriseadminability/EnterpriseAdminAbility.ets"
  }
],
```

[module.json5](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/EnterpriseAdminExtensionAbility/EnterpriseAdminExtensionAbility/entry/src/main/module.json5#L51-L60)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/mdm-kit-admin*