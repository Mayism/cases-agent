---
title: TextInput如何限制输入字符为某些字符
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-106
category: FAQ
updated_at: 2026-03-13T03:47:11.497Z
---

# TextInput如何限制输入字符为某些字符

TextInput的inputFilter属性可设置正则表达式，用于校验输入字符。校验不通过时，输入无效。参考代码如下：

```typescript
@Entry
@Component
struct Index {
  controller: TextInputController = new TextInputController();
  build() {
    Column() {
      TextInput({ placeholder: 'Please input a password', text: '123456', controller: this.controller })
        .type(InputType.Password)
        .placeholderColor(Color.Gray)
        .inputFilter('[0-9]', (val) => { //Only allow the input of characters 0-9, other characters are invalid
          console.error('TextInputExample : ' + val);
          // Invalid input return 0
          return 0;
        })
    }
  }
}
```

[LimitInputCharacters.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/LimitInputCharacters.ets#L21-L38)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-106*