---
title: 怎样在编译配置中设置excludes文件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-57
category: FAQ
updated_at: 2026-03-13T05:35:42.674Z
---

# 怎样在编译配置中设置excludes文件

在模块级build-profile.json5中如下进行配置：

```json
"nativeLib": {
  "debugSymbol": {
    "strip": true,
    "exclude": [
      "**/3.so"
    ]
  }
},
```

[build-profile.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/CompilingAndBuilding/entry/build-profile.json5#L32-L39)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-57*