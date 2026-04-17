---
title: 文本输入 (TextInput/TextArea/Search)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-text-input
category: 指南
updated_at: 2026-03-12T08:38:58.637Z
---

# 文本输入 (TextInput/TextArea/Search)

TextInput、TextArea是输入框组件，用于响应用户输入，比如评论区的输入、聊天框的输入、表格的输入等，也可以结合其它组件构建功能页面，例如登录注册页面。具体用法请参考[TextInput](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput)、[TextArea](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textarea)。Search是特殊的输入框组件，称为搜索框，默认样式包含搜索图标。具体用法请参考[Search](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-search)。

说明

仅支持单文本样式，若需实现富文本样式，建议使用[RichEditor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-richeditor)组件。

## 创建输入框

TextInput是单行输入框，TextArea是多行输入框，Search是搜索框。通过以下接口创建这些组件。

```typescript
TextInput(value?:{placeholder?: ResourceStr, text?: ResourceStr, controller?: TextInputController})
```

```typescript
TextArea(value?:{placeholder?: ResourceStr, text?: ResourceStr, controller?: TextAreaController})
```

```typescript
Search(options?:{placeholder?: ResourceStr, value?: ResourceStr, controller?: SearchController, icon?: string})
```

-   单行输入框。
    
    ```TypeScript
    TextInput()
    ```
    
    [CreatTextInput.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CreatTextInput.ets#L25-L27)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b0/v3/qbR4MuWZQZCkb_OXrldTVg/zh-cn_image_0000002527045006.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=FE1CE45EDC3E6A592ED0647324E16427259D0AC7221AA49418B996C4C8088830)
    
-   多行输入框。
    
    ```TypeScript
    TextArea()
    ```
    
    [CreatTextInput.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CreatTextInput.ets#L35-L37)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4d/v3/FNFVY8cHSs21e9C00Qaekw/zh-cn_image_0000002558044887.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=E1E874D3AC591300E308008D5A2DB184BEBF0EDD1AC55593917E1DA3D6C9D840)
    
-   多行输入框文字超出一行时会自动折行。
    
    ```TypeScript
    /* 请将$r('app.string.CreatTextInput_textContent')替换为实际资源文件，在本示例中该资源文件的value值为
     "我是TextArea我是TextArea我是TextArea我是TextArea" */
    TextArea({ text: $r('app.string.CreatTextInput_textContent') })
      .width(300)
    ```
    
    [CreatTextInput.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CreatTextInput.ets#L38-L42)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/77/v3/H5WRgEazTb2bQuH9nFj7gg/zh-cn_image_0000002526885076.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=CB9A61D3BA1F88179EF536A409B6E5043FE2846CE635F45909E4F6207393027C)
    
-   搜索框。
    
    ```TypeScript
    Search()
      // 请将$r('app.string.Creat_TextInput_Content')替换为实际资源文件，在本示例中该资源文件的value值为"搜索"
      .searchButton($r('app.string.Creat_TextInput_Content'))
    ```
    
    [CreatTextInput.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CreatTextInput.ets#L47-L51)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/9jc0z-y1RFONyOF96ac3aQ/zh-cn_image_0000002557924923.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=30AFA02F04BE91B7F55F44FE7110E81CA86D880123F2D01469D83960A4E8C41D)
    

## 设置输入框类型

TextInput、TextArea和Search都支持设置输入框类型，通过type属性进行设置，但是各组件的枚举值略有不同。下面以单行输入框为例进行说明。

TextInput有以下类型可选择：Normal基本输入模式、Password密码输入模式、Email邮箱地址输入模式、Number纯数字输入模式、PhoneNumber电话号码输入模式、USER\_NAME用户名输入模式、NEW\_PASSWORD新密码输入模式、NUMBER\_PASSWORD纯数字密码输入模式、NUMBER\_DECIMAL带小数点的数字输入模式、带URL的输入模式。通过[type](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#type)属性进行设置：

### 基本输入模式（默认类型）

```TypeScript
TextInput()
  .type(InputType.Normal)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L27-L30)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/vRacBLlPSbu-8WvgmzP-NA/zh-cn_image_0000002527045008.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=4A33FB8C1F68F06DD3F901643C27FAE0624B19CFE1B089B44590C03ECF775531)

### 密码模式

包括Password密码输入模式、NUMBER\_PASSWORD纯数字密码模式、NEW\_PASSWORD新密码输入模式。

以下示例是Password密码输入模式的输入框。

```TypeScript
TextInput()
  .type(InputType.Password)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L36-L39)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/75/v3/aYC5MB-XQZyZ2H9wdhgJQw/zh-cn_image_0000002558044889.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=2BC7991DDBF61D3CDDD3354007EEB6494150444BD1B7A501BF4CA0C261491070)

### 邮箱地址输入模式

邮箱地址输入模式的输入框，只能存在一个@符号。

```TypeScript
TextInput()
  .type(InputType.Email)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L45-L48)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/75/v3/Sw_0BQ0HRqWPEUOo0d6SAA/zh-cn_image_0000002526885078.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=DF1BA92F902BF643B4F0A077B60CE2F8C506E8CE38E4E93EF58F6A3F2A610A08)

### 纯数字输入模式

纯数字输入模式的输入框，只能输入数字\[0-9\]。

```TypeScript
TextInput()
  .type(InputType.Number)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L54-L57)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/JlVFMxVsRfK5MKWtOWV7ZQ/zh-cn_image_0000002557924925.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=19939208E6E33FD9AB6E158F5B7E67C921710217CCBFB006E10036D8ACDD284F)

### 电话号码输入模式

电话号码输入模式的输入框，支持输入数字、空格、+ 、-、\*、#、(、)，长度不限。

```TypeScript
TextInput()
  .type(InputType.PhoneNumber)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L63-L66)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4e/v3/6dUiGhSxS32Ort3H8kf62A/zh-cn_image_0000002527045010.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=CBF21BEAB1581F4DF8CBCC72273921D2212C5E4AA096018AA712DD8665492D90)

### 带小数点的数字输入模式

带小数点的数字输入模式的输入框，只能输入数字\[0-9\]和小数点，只能存在一个小数点。

```TypeScript
TextInput()
  .type(InputType.NUMBER_DECIMAL)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L72-L75)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ce/v3/Q4ULcRzrRUOshKbOsQ_rBg/zh-cn_image_0000002558044891.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=B85440007F32977DAD04CEFEA0F4DEB83D5EC07CE69C2D35E68DF2AFB8CF04CE)

### 带URL的输入模式

带URL的输入模式，无特殊限制。

```TypeScript
TextInput()
  .type(InputType.URL)
```

[SetTextInputType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextInputType.ets#L81-L84)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/pzF0yrl9Rm-nMGLXigqWlQ/zh-cn_image_0000002526885080.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=CCF0D1BCB673CCFDB1DA28D6F8BD274328B624999EE0F2B5D09177E1CBC1BB49)

## 设置输入框多态样式

TextInput、TextArea支持设置输入框多态样式，通过[style](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textarea#style10)属性进行设置。下面以多行输入框TextArea为例进行说明。

TextArea有以下2种类型可选择：默认风格，入参是TextContentStyle.DEFAULT；内联模式，也称内联输入风格，入参是TextContentStyle.INLINE。

### 默认风格

默认风格的输入框，在编辑态和非编辑态，样式没有区别。

```TypeScript
TextArea()
  .style(TextContentStyle.DEFAULT)
```

[SetInputMultiTypeStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetInputMultiTypeStyle.ets#L25-L28)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/69/v3/RO3DtA5WQjOjLpxFIDNO7A/zh-cn_image_0000002557924927.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=D73DC51451D0A58D30A7EB8B7692DFD0BE6EE7E27DD9F802F31E4738DEFBD1F9)

### 内联模式

内联模式，也称内联输入风格。内联模式的输入框在编辑态和非编辑态样式有明显区分。

```TypeScript
TextArea()
  .style(TextContentStyle.INLINE)
```

[SetInputMultiTypeStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetInputMultiTypeStyle.ets#L32-L35)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bd/v3/FdF9kmCZRqqaNuz73cfxSQ/zh-cn_image_0000002527045012.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=19AF3C1AD05ADAC1263E6C155613255ED7A146BF1CBF1278B6E8961809F158D4)

## 自定义样式

-   设置无输入时的提示文本。
    
    ```TypeScript
    // 请将$r('app.string.i_am_placeholder')替换为实际资源文件，在本示例中该资源文件的value值为"我是提示文本"
    TextInput({ placeholder: $r('app.string.i_am_placeholder') })
    ```
    
    [CustomTextInputStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CustomTextInputStyle.ets#L25-L28)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/luc-MaAmTouDlsfOtI9ogQ/zh-cn_image_0000002558044893.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=47DB87D3BAA615019D7D5AC78DD17AA1653D1F6F805146BFE2339E6C1292052D)
    
-   设置输入框当前的文本内容。
    
    ```TypeScript
    TextInput({
      // 请将$r('app.string.i_am_placeholder')替换为实际资源文件，在本示例中该资源文件的value值为"我是提示文本"
      placeholder: $r('app.string.i_am_placeholder'),
      // 请将$r('app.string.i_am_current_text_content')替换为实际资源文件，在本示例中该资源文件的value值为"我是当前文本内容"
      text: $r('app.string.i_am_current_text_content')
    })
    ```
    
    [CustomTextInputStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CustomTextInputStyle.ets#L32-L39)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/cz3W0yEJTrm5jgDUOlouSw/zh-cn_image_0000002526885082.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=B94B27864B5D34EF955BF698F8444ADE567988CA17CABC45A3A6FDA12E92D94E)
    
-   添加backgroundColor改变输入框的背景颜色。
    
    ```TypeScript
    TextInput({
      // 请将$r('app.string.i_am_placeholder')替换为实际资源文件，在本示例中该资源文件的value值为"我是提示文本"
      placeholder: $r('app.string.i_am_placeholder'),
      // 请将$r('app.string.i_am_current_text_content')替换为实际资源文件，在本示例中该资源文件的value值为"我是当前文本内容"
      text: $r('app.string.i_am_current_text_content')
    })
      .backgroundColor(Color.Pink)
    ```
    
    [CustomTextInputStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CustomTextInputStyle.ets#L43-L51)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5d/v3/Ky6I2tgVSx6aRl6nVHG1zg/zh-cn_image_0000002557924929.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=6AE63160414DAEB721E82AC55DB4D30F75705166412CAAE9DCCE427D6A7FFEFB)
    
    更丰富的样式可以结合[通用属性](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-component-general-attributes)实现。
    

## 添加事件

文本框主要用于获取用户输入的信息，并将信息处理成数据进行上传，绑定[onChange](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onchange)事件可以获取输入框内改变的文本内容，绑定[onSubmit](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onsubmit)事件可以获取回车提交的文本信息，绑定[onTextSelectionChange](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#ontextselectionchange10)事件可以获取文本选中时手柄的位置信息或者编辑时光标的位置信息等等。用户也可以使用通用事件进行相应的交互操作。

说明

在密码模式下，设置[showPassword](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#showpassword12)属性时，在[onSecurityStateChange](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onsecuritystatechange12)回调中，建议增加状态同步，具体详见如下示例。

[onWillInsert](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onwillinsert12)、[onDidInsert](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#ondidinsert12)、[onWillDelete](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onwilldelete12)、[onDidDelete](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#ondiddelete12)回调仅支持系统输入法的场景。

[onWillChange](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onwillchange15)的回调时序晚于[onWillInsert](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onwillinsert12)、[onWillDelete](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#onwilldelete12)，早于[onDidInsert](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#ondidinsert12)、[onDidDelete](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#ondiddelete12)。

```TypeScript
import { hilog } from '@kit.PerformanceAnalysisKit';
const TAG = '[Sample_Textcomponent]';
const DOMAIN = 0xF811;
const BUNDLE = 'Textcomponent_';
@Entry
@Component
struct TextInputEventAdd {
  @State text: string = '';
  @State textStr1: string = '';
  @State textStr2: string = '';
  @State textStr3: string = '';
  @State textStr4: string = '';
  @State textStr5: string = '';
  @State textStr6: string = '';
  @State textStr7: string = '';
  @State textStr8: string = '';
  @State textStr9: string = '';
  @State passwordState: boolean = false;
  controller: TextInputController = new TextInputController();
  build() {
    Row() {
      Column() {
        Text(`${this.textStr1}\n${this.textStr2}\n${this.textStr3}
          \n${this.textStr4}\n${this.textStr5}\n${this.textStr6}
          \n${this.textStr7}\n${this.textStr8}\n${this.textStr9}`)
          .fontSize(20)
          .width('70%')
        TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
          .type(InputType.Password)
          .showPassword(this.passwordState)
          .onChange((value: string) => {
            // 文本内容发生变化时触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onChange is triggering: ' + value);
            this.textStr1 = `onChange is triggering: ${value}`;
          })
          .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
            // 按下输入法回车键时触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onSubmit is triggering: ' + enterKey + event.text);
            this.textStr2 = `onSubmit is triggering: ${enterKey} ${event.text}`;
          })
          .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
            // 文本选择的位置发生变化或编辑状态下光标位置发生变化时，触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onTextSelectionChange is triggering: ' + selectionStart + selectionEnd);
            this.textStr3 = `onTextSelectionChange is triggering: ${selectionStart} ${selectionEnd}`;
          })
          .onSecurityStateChange((isShowPassword: boolean) => {
            // 密码显隐状态切换时，触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onSecurityStateChange is triggering: ' + isShowPassword);
            this.passwordState = isShowPassword;
            this.textStr4 = `onSecurityStateChange is triggering: ${isShowPassword}`;
          })
          .onWillInsert((info: InsertValue) => {
            // 在将要输入时，触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onWillInsert is triggering: ' + info.insertValue + info.insertOffset);
            this.textStr5 = `onWillInsert is triggering: ${info.insertValue} ${info.insertOffset}`;
            return true;
          })
          .onDidInsert((info: InsertValue) => {
            // 在输入完成时，触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onDidInsert is triggering: ' + info.insertValue + info.insertOffset);
            this.textStr6 = `onDidInsert is triggering: ${info.insertValue} ${info.insertOffset}`;
          })
          .onWillDelete((info: DeleteValue) => {
            // 在将要删除时，触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onWillDelete is triggering: ' + info.deleteValue + info.deleteOffset);
            this.textStr7 = `onWillDelete is triggering: ${info.deleteValue} ${info.deleteOffset}`;
            return true;
          })
          .onDidDelete((info: DeleteValue) => {
            // 在删除完成时，触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onDidDelete is triggering: ' + info.deleteValue + info.deleteOffset);
            this.textStr8 = `onDidDelete is triggering: ${info.deleteValue} ${info.deleteOffset}`;
          })
          .onFocus(() => {
            // 绑定通用事件，输入框获焦时触发该回调
            hilog.info(DOMAIN, TAG, BUNDLE + 'onFocus is triggering');
            this.textStr9 = `onFocus is triggering`;
          })
      }.width('100%')
    }
    .height('100%')
  }
}
```

[TextInputAddEvent.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/TextInputAddEvent.ets#L15-L101)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f/v3/F0xEtdiDSJe4gT2Lw-Yc1Q/zh-cn_image_0000002527045014.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=705B295AC920ECE0C07AD709F1E303491771C43CD83D2A9A379D0534CA6D2BA7)

## 选中菜单

输入框中的文字被选中时会弹出包含剪切、复制、翻译、搜索的菜单。

TextInput:

```TypeScript
// 请将$r('app.string.show_selected_menu')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，用来展示选中菜单"
TextInput({ text: $r('app.string.show_selected_menu') })
```

[SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SelectMenu.ets#L26-L29)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e4/v3/S2bkiqTwRlyLsm_Uc1MdRA/zh-cn_image_0000002558044895.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=F8078EF87E4B6483B7CF21D441B891E8572B648C79F7D56CF5BF3FD63B83A093)

TextArea:

```TypeScript
// 请将$r('app.string.show_selected_menu')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，用来展示选中菜单"
TextArea({ text: $r('app.string.show_selected_menu') })
```

[SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SelectMenu.ets#L30-L33)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/99/v3/4ImmphRPQvOKJdDCIiQIUQ/zh-cn_image_0000002526885084.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=065AC01453DAAA7EC9C2BDB18207F4215F18E4E01BFFB074E74B04F95E7F673C)

## 禁用系统服务类菜单

从API version 20开始，支持使用[disableSystemServiceMenuItems](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-textmenucontroller#disablesystemservicemenuitems20)方法屏蔽文本选择菜单中的所有系统服务菜单项。

```TypeScript
import { TextMenuController } from '@kit.ArkUI';
@Entry
@Component
struct DisableSystemServiceMenuItem {
  aboutToAppear(): void {
    // 禁用所有系统服务菜单项
    TextMenuController.disableSystemServiceMenuItems(true)
  }
  aboutToDisappear(): void {
    // 页面消失时恢复系统服务菜单项
    TextMenuController.disableSystemServiceMenuItems(false)
  }
  build() {
    Row() {
      Column() {
        // 请将$r('app.string.ProhibitSelectMenu_content')替换为实际资源文件，在本示例中该资源文件的value值为"这是一个TextInput，长按弹出文本选择菜单"
        TextInput({ text: $r('app.string.ProhibitSelectMenu_content') })
          .height(60)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .caretStyle({ width: '4vp' })
          .editMenuOptions({
            onCreateMenu: (menuItems: Array<TextMenuItem>) => {
              // menuItems不包含被屏蔽的系统菜单项
              return menuItems
            },
            onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
              return false
            }
          })
      }.width('100%')
    }
    .height('100%')
  }
}
```

[DisableSystemServiceMenuItems.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/disablemenu/DisableSystemServiceMenuItems.ets#L16-L56)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bf/v3/lWqucKTTS22wOwSajc2gGg/zh-cn_image_0000002557924931.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=50DBFAE34CB322F64E9E503C6818827A25D404BE355408D7CE517DD0511DBB2F)

从API version 20开始，支持使用[disableMenuItems](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-textmenucontroller#disablemenuitems20)方法屏蔽文本选择菜单中指定的系统服务菜单项。

```TypeScript
import { TextMenuController } from '@kit.ArkUI';
@Entry
@Component
struct DisableMenuItem {
  aboutToAppear(): void {
    // 禁用搜索，翻译和AI帮写
    TextMenuController.disableMenuItems([TextMenuItemId.SEARCH, TextMenuItemId.TRANSLATE, TextMenuItemId.AI_WRITER])
  }
  aboutToDisappear(): void {
    // 页面消失时恢复系统服务菜单项
    TextMenuController.disableMenuItems([])
  }
  build() {
    Row() {
      Column() {
        // 请将$r('app.string.ProhibitSelectMenu_content')替换为实际资源文件，在本示例中该资源文件的value值为"这是一个TextInput，长按弹出文本选择菜单"
        TextInput({ text: $r('app.string.ProhibitSelectMenu_content') })
          .height(60)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .caretStyle({ width: '4vp' })
          .editMenuOptions({
            onCreateMenu: (menuItems: Array<TextMenuItem>) => {
              // menuItems不包含搜索和翻译
              return menuItems;
            },
            onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
              return false
            }
          })
      }.width('100%')
    }
    .height('100%')
  }
}
```

[DisableMenuItems.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/disablemenu/DisableMenuItems.ets#L16-L56)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/44/v3/RvNt8FnbSuatrD0NFIJF3g/zh-cn_image_0000002527045016.png?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=58092ABDC71981246F66B0FC1B08F4F67B6779828E80F8D6B5446E3BD16479D0)

## 自动填充

输入框可以通过[contentType](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#contenttype12)属性设置自动填充类型。

支持的类型请参考[ContentType](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#contenttype12枚举说明)。

```TypeScript
// 请将$r('app.string.Auto_Fill_PlaceHolder')替换为实际资源文件，在本示例中该资源文件的value值为"输入你的邮箱..."
TextInput({ placeholder: $r('app.string.Auto_Fill_PlaceHolder') })
  .width('95%')
  .height(40)
  .margin(20)
  .contentType(ContentType.EMAIL_ADDRESS)
```

[AutoFill.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/AutoFill.ets#L25-L32)

## 设置属性

-   设置省略属性。
    
    输入框可以通过[ellipsisMode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#ellipsismode18)属性设置省略位置。
    
    ellipsisMode属性需要配合[textOverflow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#textoverflow12)属性设置为TextOverflow.Ellipsis使用，单独设置ellipsisMode属性不生效。
    
    ```TypeScript
    // 请将$r('app.string.Set_Omission_Property_textContent')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，用来展示省略模式"
    TextInput({ text: $r('app.string.Set_Omission_Property_textContent') })
      .textOverflow(TextOverflow.Ellipsis)
      .ellipsisMode(EllipsisMode.END)
      .style(TextInputStyle.Inline)
      .fontSize(30)
      .margin(30)
    ```
    
    [SetProperty.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetProperty.ets#L26-L34)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/06/v3/YWbXPAhJQHuDHNHdZHOSlQ/zh-cn_image_0000002558044897.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=5EFBBF4B10CE188F125FCD3AC9982BD5543A82E2A3ED36CB2BF9833F23E5DFAE)
    
-   设置文本描边属性。
    
    从API version 20开始，输入框可以通过[strokeWidth](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#strokewidth20)和[strokeColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput#strokecolor20)属性设置文本的描边宽度及颜色。
    
    ```TypeScript
    TextInput({ text: 'Text with stroke' })
      .width('100%')
      .height(60)
      .borderWidth(1)
      .fontSize(40)
      .strokeWidth(LengthMetrics.px(3.0))
      .strokeColor(Color.Red)
    ```
    
    [SetProperty.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetProperty.ets#L37-L45)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f4/v3/omf0tUUPQLmDxK41BAvWSA/zh-cn_image_0000002526885086.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=9B377631594F3660070B950F61B1F7584EBCBB428012E6E0ADC609EAE38B62FE)
    

## 设置文本行间距

从API version 20开始，支持通过[lineSpacing](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#linespacing20)设置文本的行间距。如果不配置[LineSpacingOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-text-common#linespacingoptions20对象说明)时，首行上方和尾行下方默认会有行间距。如果onlyBetweenLines设置为true时，行间距仅适用于行与行之间，首行上方无额外行间距。

```TypeScript
TextArea({
  text: 'The line spacing of this TextArea is set to 20_px, and the spacing is effective only between the lines.'
})
  .fontSize(22)
  .lineSpacing(LengthMetrics.px(20), { onlyBetweenLines: true })
```

[SetTextMargin.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/SetTextMargin.ets#L26-L32)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c8/v3/5zZsx7DjS-e6higHZL-7EA/zh-cn_image_0000002557924933.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=DBA94D7A879C63831EB29D6A52E10C7F58FE01C0C05AFF7F4BCC5A09BB1AB858)

## 键盘避让

键盘抬起后，具有滚动能力的容器组件在横竖屏切换时，才会生效键盘避让，若希望无滚动能力的容器组件也生效键盘避让，建议在组件外嵌套一层具有滚动能力的容器组件，比如[Scroll](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-scroll)、[List](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-list)、[Grid](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-grid)。

```TypeScript
@Entry
@Component
struct KeyboardAvoid {
  placeHolderArr: string[] = ['1', '2', '3', '4', '5', '6', '7'];
  build() {
    Scroll() {
      Column() {
        ForEach(this.placeHolderArr, (placeholder: string) => {
          TextInput({ placeholder: 'TextInput ' + placeholder })
            .margin(30)
            // ···
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}
```

[KeyboardAvoidance.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/KeyboardAvoidance.ets#L18-L40)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bd/v3/8h-i9cIgT-2hYP7IvTvKCA/zh-cn_image_0000002527045018.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=E5CBB11705551F0F92B468898C71A1541D55A4432524972B56E95B54AF5E5B5E)

## 光标避让

[keyBoardAvoidMode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-e#keyboardavoidmode11)枚举中的OFFSET和RESIZE在键盘抬起后，不支持二次避让。如果想要支持光标位置在点击或者通过接口设置变化后发生二次避让，可以考虑使用OFFSET\_WITH\_CARET和RESIZE\_CARET替换原有的OFFSET和RESIZE模式。

对于滚动容器更推荐使用RESIZE\_WITH\_CARET，非滚动容器应该使用OFFSET\_WITH\_CARET。

```TypeScript
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { KeyboardAvoidMode } from '@kit.ArkUI';
```

[EntryAbility.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/entryability/EntryAbility.ets#L18-L22)

```TypeScript
// Used in UIAbility
onWindowStageCreate(windowStage: window.WindowStage): void {
  // Main window is created, set main page for this ability
  hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
  windowStage.loadContent('pages/Index', (err, data) => {
    let keyboardAvoidMode = windowStage.getMainWindowSync().getUIContext().getKeyboardAvoidMode();
    windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET_WITH_CARET);
    if (err.code) {
      hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
      return;
    }
    hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
  });
}
```

[EntryAbility.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/entryability/EntryAbility.ets#L34-L50)

```TypeScript
@Entry
@Component
struct CursorAvoid {
  @State caretPosition: number = 600;
  areaController: TextAreaController = new TextAreaController();
  text = 'Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot,' +
    ' or someone we hardly know. As a result, what we do remember is anything that makes others happy, ' +
    'anything that makes ourselves unhappy,' +
    ' totally forgetting that there is something happy in our own life.\
    So the best way to destroy happiness is to look at something and focus on even the smallest flaw. ' +
    'It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
    If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. ' +
    'Happiness is just what you think will make you happy.' +
    'Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, ' +
    'or someone we hardly know. As a result, what we do remember is anything that makes others happy, ' +
    'anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
  ';
  build() {
    Scroll() {
      Column() {
        Row() {
          Button('CaretPosition++: ' + this.caretPosition).onClick(() => {
            this.caretPosition += 1;
          }).fontSize(10)
          Button('CaretPosition--: ' + this.caretPosition).onClick(() => {
            this.caretPosition -= 1;
          }).fontSize(10)
          Button('SetCaretPosition: ').onClick(() => {
            this.areaController.caretPosition(this.caretPosition);
          }).fontSize(10)
        }
        TextArea({ text: this.text, controller: this.areaController })
          .width('100%')
          .fontSize('20fp')
      }
    }.width('100%').height('100%')
  }
}
```

[CursorAvoidance.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/CursorAvoidance.ets#L18-L59)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/66/v3/PbEzCuofRZq0HgCzye7MZQ/zh-cn_image_0000002558044899.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=1187F36D871993507F8A4BF632C78A5F9DEEFB4CC6F9C7A84D764AF6CFE7C352)

## 常见问题

### 如何设置TextArea的文本最少展示行数并自适应高度

**问题现象**

设置TextArea的初始高度来控制最少文本展示行数，当输入文本超过初始高度时，TextArea的高度自适应。

**解决措施**

设置[minLines](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textarea#minlines20)（从API version 20开始），或者设置height为"auto"，并使用[constraintSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-size#constraintsize)自行计算高度。

```TypeScript
import { MeasureUtils } from '@kit.ArkUI';
@Entry
@Component
struct TextExample {
  private textAreaPadding = 12;
  private setMaxLines = 3;
  private resourceManager = this.getUIContext().getHostContext()?.resourceManager;
  // 请在resources\base\element\string.json文件中配置name为'NormalQuestion_change'，value为非空字符串的资源
  private changeText = this.resourceManager?.getStringByNameSync('NormalQuestion_change') as string;
  @State fullText: string = this.changeText;
  @State originText: string = this.changeText;
  @State uiContext: UIContext = this.getUIContext();
  @State uiContextMeasure: MeasureUtils = this.uiContext.getMeasureUtils();
  textSize: SizeOptions = this.uiContextMeasure.measureTextSize({
    textContent: this.originText,
    fontSize: 18
  });
  build() {
    Column() {
      TextArea({ text: 'minLines: ' + this.fullText })
        .fontSize(18)
        .width(300)
        .minLines(3)
      Blank(50)
      TextArea({ text: 'constraintSize: ' + this.fullText })
        .fontSize(18)
        .padding({ top: this.textAreaPadding, bottom: this.textAreaPadding })
        .width(300)
        .height('auto')
        .constraintSize({
          // 结合padding计算，设置至少显示this.setMaxLines行文本
          // 若涉及适老化字号缩放，需要监听并调整高度
          minHeight: this.textAreaPadding * 2 +
            this.setMaxLines * this.getUIContext().px2vp(Number(this.textSize.height))
        })
      Blank(50)
      // 请将$r('app.string.NormalQuestion_AddInput')替换为实际资源文件，在本示例中该资源文件的value值为"增加输入"
      Button($r('app.string.NormalQuestion_AddInput'))
        .onClick(() => {
          this.fullText += this.changeText;
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .padding({ top: 30 })
  }
}
```

[NormalQuestion.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/textInput/NormalQuestion.ets#L15-L68)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/50/v3/kXZ7W_56RVKs8wcgfuIkZw/zh-cn_image_0000002526885088.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083833Z&HW-CC-Expire=86400&HW-CC-Sign=85D4DD1D411DD814F2682A67F10F72F8D1A81E338CE2C5A4E12F24A68F2C1843)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-text-input*