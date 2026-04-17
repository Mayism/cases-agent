---
title: TextInput按压态背景色如何修改
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-124
category: FAQ
updated_at: 2026-03-13T03:48:53.420Z
---

# TextInput按压态背景色如何修改

可以使用动态属性进行设置。自定义class实现AttributeModifier接口，并给组件设置.attributeModifier()进行绑定即可。参考代码如下：

```
@Entry
@Component
struct Index {
  @State modifier: MyTextInputModifier = new MyTextInputModifier();
  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'test' })
          .width('80%')
          .height(100)
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.backgroundColor(Color.Grey);
  }
  applyPressedAttribute(instance: TextInputAttribute): void {
    instance.backgroundColor(Color.Blue);
  }
}
```

[ModifyBackgroundColorOfPressedState.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ModifyBackgroundColorOfPressedState.ets#L21-L49)

**参考链接**

[动态属性设置](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-attribute-modifier)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-124*