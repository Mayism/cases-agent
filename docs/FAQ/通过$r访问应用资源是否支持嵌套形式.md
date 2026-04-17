---
title: 通过$r访问应用资源是否支持嵌套形式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-102
category: FAQ
updated_at: 2026-03-13T03:46:51.570Z
---

# 通过$r访问应用资源是否支持嵌套形式

$r当前不支持嵌套。第二个参数需使用ResourceManager获取应用资源的字符串。参考代码如下：

```typescript
@Entry
@Component
struct Page16 {
  context = this.getUIContext();
  build() {
    Row() {
      Column() {
        Text($r('app.string.EntryAbility1_label2',
          this.context.getHostContext()!.resourceManager.getStringSync($r('app.string.EntryAbility_label'))))// path: resources\base\element\string.json
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[ResourceNesting.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ResourceNesting.ets#L21-L38)

**参考链接**

[ResourceManager](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-resource-manager#resourcemanager)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-102*