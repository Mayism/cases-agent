---
title: 集成游戏资源加速ExtensionAbility方法，未配置游戏资源加速ExtensionAbility组件类型信息，导致功能未生效。
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/graphics-accelerate-assetdownload-faq-2
category: 指南
updated_at: 2026-03-12T19:49:16.589Z
---

# 集成游戏资源加速ExtensionAbility方法，未配置游戏资源加速ExtensionAbility组件类型信息，导致功能未生效。

未配置游戏资源加速ExtensionAbility组件类型信息将出现如下异常日志：

```bash
bundle[xxx] do not have Asset Acceleration Extension Ability.
```

请开发者在“src/main/module.json5”的extensionAbilities层级中添加资源加速ExtensionAbility信息。

```cangjie
"extensionAbilities": [
  {
    "name": "AssetAccelExtAbility", // 游戏资源加速ExtensionAbility组件的名称。
    "srcEntry": "./ets/extensionability/AssetAccelExtAbility.ets", // 游戏资源加速ExtensionAbility组件所对应的代码路径。
    "type": "assetAcceleration"
  }
]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/graphics-accelerate-assetdownload-faq-2*