---
title: 集成了游戏资源加速ExtensionAbility方法，未配置网络权限，导致功能未生效。
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/graphics-accelerate-assetdownload-faq-3
category: 指南
updated_at: 2026-03-12T19:49:19.978Z
---

# 集成了游戏资源加速ExtensionAbility方法，未配置网络权限，导致功能未生效。

未配置网络权限将出现如下异常日志：

```sql
ohos.permission.INTERNET check failed
```

请开发者在“src/main/module.json5”的requestPermissions层级中添加网络权限。

```cangjie
{
  "module": {
    // ...
    "requestPermissions": [
      {
        "name": "ohos.permission.INTERNET"
      }
    ]
  }
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/graphics-accelerate-assetdownload-faq-3*