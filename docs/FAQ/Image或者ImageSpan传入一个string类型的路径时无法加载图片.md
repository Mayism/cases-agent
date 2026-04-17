---
title: Image或者ImageSpan传入一个string类型的路径时无法加载图片
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-153
category: FAQ
updated_at: 2026-03-13T03:51:19.632Z
---

# Image或者ImageSpan传入一个string类型的路径时无法加载图片

目前规格上只支持常量，需要把string提取出来用$r( )包裹。例如：

```ini
localImageName = $r( 'app.media.icon' )
```

[ImageStrPath.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ImageStrPath.ets#L6-L6)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-153*