---
title: Text组件设置maxLines后如何确定文本是否被隐藏
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-156
category: FAQ
updated_at: 2026-03-13T03:51:39.341Z
---

# Text组件设置maxLines后如何确定文本是否被隐藏

可以通过measureTextSize来判断Text文本的高度是否超出maxLines设置的高度进行判断。参考代码如下：

```cangjie
@Entry
@Component
struct TextInputExample {
  @State text: string = '';
  @State truncatedHint: string = "Text not truncated";
  controller: TextInputController = new TextInputController();
  build() {
    Column() {
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(40)
        .margin(20)
        .fontSize(14)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value;
          let textSizeShow1: SizeOptions = this.getUIContext().getMeasureUtils().measureTextSize({
            textContent: this.text,
            constraintWidth: 100,
            fontSize: 14,
            overflow: TextOverflow.Ellipsis,
            maxLines: 2
          })
          let textSizeShow2: SizeOptions = this.getUIContext().getMeasureUtils().measureTextSize({
            textContent: this.text + " ",
            constraintWidth: 100,
            fontSize: 14,
            overflow: TextOverflow.Ellipsis,
            maxLines: 2000000
          })
          console.log("textSizeShow1.height=" + textSizeShow1.height);
          console.log("textSizeShow2.height=" + textSizeShow2.height);
          if (textSizeShow2 && textSizeShow1 && textSizeShow2?.height && textSizeShow1?.height && (textSizeShow2?.height > textSizeShow1?.height)) {
            console.log("Text truncated");
            this.truncatedHint = "Text truncated";
          } else {
            console.log("Text not truncated");
            this.truncatedHint = "Text not truncated";
          }
        })
      Text(this.text)
        .maxLines(2)
        .width(100)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .border({ width: 1 })
        .minFontSize(14)
        .maxFontSize(24)
      Text(this.truncatedHint)
    }.width('100%')
  }
}
```

[TextSetMaxlinesIsHideText.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/TextSetMaxlinesIsHideText.ets#L21-L77)

**参考链接**

[measureTextSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-measureutils#measuretextsize12)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-156*