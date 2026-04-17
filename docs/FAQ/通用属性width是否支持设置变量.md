---
title: 通用属性width是否支持设置变量
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-191
category: FAQ
updated_at: 2026-03-13T03:55:09.184Z
---

# 通用属性width是否支持设置变量

通用属性width支持设置变量。

```scss
@Entry
@Component
struct Page1 {
  @State message: string = 'Hello';
  @State widthNum: number = 300;
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .width(this.widthNum)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[DoesWidthSupportSettingVariables.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/DoesWidthSupportSettingVariables.ets#L21-L40)

效果如下所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0/v3/2RDU7dMuSYSMjKAEQFA8HQ/zh-cn_image_0000002194158632.png?HW-CC-KV=V1&HW-CC-Date=20260313T035503Z&HW-CC-Expire=86400&HW-CC-Sign=AB77CC8DD2926148D165A1305054A7A2225E65FE130C62F981A4289E80A8A009 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-191*