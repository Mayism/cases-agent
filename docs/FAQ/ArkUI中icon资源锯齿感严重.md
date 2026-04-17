---
title: ArkUI中icon资源锯齿感严重
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-114
category: FAQ
updated_at: 2026-03-13T03:47:48.647Z
---

# ArkUI中icon资源锯齿感严重

**解决方案**

Image组件的插值效果interpolation默认为ImageInterpolation.None，可能会导致锯齿问题，因此可以通过设置interpolation为High/Medium/Low来减少锯齿效果。

**参考链接**

[ImageInterpolation](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-image#imageinterpolation)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-114*