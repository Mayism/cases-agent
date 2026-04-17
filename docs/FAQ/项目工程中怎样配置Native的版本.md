---
title: 项目工程中怎样配置Native的版本
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-55
category: FAQ
updated_at: 2026-03-13T05:35:30.438Z
---

# 项目工程中怎样配置Native的版本

在工程级build-profile.json5的app.products中如下进行配置：

```json
"products": [
  {
    "name": "default",
    "signingConfig": "default",
    "compatibleSdkVersion": "5.0.5(17)",
    "targetSdkVersion": "5.0.5(17)",
    "runtimeOS": "HarmonyOS",
  }
],
```

[build-profile.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/build-profile.json5#L5-L13)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-55*