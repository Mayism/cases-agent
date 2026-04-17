---
title: 如何判断JS对象中是否存在某个值
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-192
category: FAQ
updated_at: 2026-03-13T03:55:17.182Z
---

# 如何判断JS对象中是否存在某个值

Object.values(对象名).indexOf(待检测值)，若返回-1表示不包含对应值；返回值不等于-1则表示包含。

```kotlin
var res = array.indexOf(val)
```

[DetermineValue.js](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/DetermineValue.js#L7-L7)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-192*