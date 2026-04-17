---
title: 如何实现点击输入框时会拉起软键盘，点击Button时软键盘关闭
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-265
category: FAQ
updated_at: 2026-03-13T04:01:52.174Z
---

# 如何实现点击输入框时会拉起软键盘，点击Button时软键盘关闭

可以通过调用输入法服务 @kit.IMEKit 的 stopInputSession()方法来隐藏软键盘。示例代码如下：

```typescript
import { inputMethod } from '@kit.IMEKit';
@Entry
@Component
struct ClickBlankHideKeyboard {
  build() {
    Column({ space: 12 }) {
      TextInput({ placeholder: 'Please enter your account' })
        .height(40)
      TextInput({ placeholder: 'Please input a password' })
        .height(40)
      Button('log on').width('100%')
        .onClick(() => {
          // Exit text editing mode
          try {
            this.inputRef.blur();
            // Close the current input session and hide the soft keyboard.
            inputMethod.getController().stopInputSession();
          } catch (err) {
            console.error('Failed to hide keyboard: ' + err);
          }
        })
    }
  }
}
```

[ClickButtonSoftwareKeyboardToClose.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ClickButtonSoftwareKeyboardToClose.ets#L21-L45)

参考链接：

[@ohos.inputMethod (输入法框架)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inputmethod)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-265*