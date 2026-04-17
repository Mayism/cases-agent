---
title: List组件如何实现多列效果
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-27
category: FAQ
updated_at: 2026-03-13T03:41:22.865Z
---

# List组件如何实现多列效果

设置[List](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-list)组件的lanes属性，以实现交叉轴上的多列布局。示例代码如下：

```typescript
// xxx.ets
@Entry
@Component
struct ListExample {
  @State arr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  build() {
    Column() {
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Row() {
              Text(item)
                .fontColor(Color.Red)
                .fontSize(40)
            }
          }
          .width('100%')
          .border({
            width: 1,
            color: Color.Black,
            radius: 5
          })
        })
      }
      .lanes(3)
      .alignListItem(ListItemAlign.Center)
    }
    .padding({ top: 30 })
  }
}
```

[ListImplementsMultiColumnEffect.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ListImplementsMultiColumnEffect.ets#L21-L51)

效果如图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d6/v3/8huIijUIS3uafFRdzY8Cbw/zh-cn_image_0000002194158740.png?HW-CC-KV=V1&HW-CC-Date=20260313T034116Z&HW-CC-Expire=86400&HW-CC-Sign=27A4142B11C8298043DD6DDD4EFF6DA26A453808DA8399A32C6B795B51D32A36 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-27*