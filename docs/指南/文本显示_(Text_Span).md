---
title: 文本显示 (Text/Span)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-text-display
category: 指南
updated_at: 2026-03-12T08:38:31.273Z
---

# 文本显示 (Text/Span)

Text是文本组件，用于展示用户视图，如显示文章的文字内容。该组件支持绑定自定义文本选择菜单，用户可根据需要选择不同功能。此外，还可以扩展自定义菜单，丰富可用选项，进一步提升用户体验。Span则用于展示行内文本。

具体用法请参考[Text](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text)和[Span](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-span)组件的使用说明。

常见问题请参考[文本显示（Text/Span）常见问题](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-text-faq#文本显示textspan常见问题)。

## 创建文本

Text可通过以下两种方式来创建：

-   string字符串。
    
    ```TypeScript
    Text('我是一段文本')
    ```
    
    [CreateText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CreateText.ets#L25-L28)
    

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/03/v3/fbZLdJNlS0KCKIt2umHPWw/zh-cn_image_0000002526885058.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=D223564E239EB9DB809926E813945E13B69DB3B632744C3A49D5C4985D199D62)

-   引用Resource资源。
    
    资源引用类型可以通过$r创建Resource类型对象，文件位置为/resources/base/element/string.json，具体内容如下：
    
    ```json
    {
      "string": [
        {
          "name": "module_desc",
          "value": "模块描述"
        }
      ]
    }
    ```
    
    ```TypeScript
    // 请将$r('app.string.module_desc')替换为实际资源文件，在本示例中该资源文件的value值为"模块描述"
    Text($r('app.string.module_desc'))
      .baselineOffset(0)
      .fontSize(30)
      .border({ width: 1 })
      .padding(10)
      .width(300)
    ```
    
    [CreateText.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CreateText.ets#L35-L43)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c7/v3/BMq0EeN9QACcnOglE-nzOw/zh-cn_image_0000002557924905.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=847AA280F8A01199AE6528344CE4329941B4A811FBFA374A739E189A97542FD7)
    

## 添加子组件

[Span](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-span)只能作为[Text](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text)和[RichEditor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-richeditor)组件的子组件显示文本内容。可以在一个Text内添加多个Span来显示一段信息，例如产品说明书、承诺书等。

-   创建Span。
    
    Span组件需嵌入在Text组件中才能显示，单独使用时不会显示任何内容。Text与Span同时配置文本内容时，Span内容将覆盖Text内容。
    
    ```TypeScript
    // 请将$r('app.string.TextSpan_textContent_text')替换为实际资源文件，在本示例中该资源文件的value值为"我是Text"
    Text($r('app.string.TextSpan_textContent_text')) {
      // 请将$r('app.string.TextSpan_textContent_span')替换为实际资源文件，在本示例中该资源文件的value值为"我是Span"
      Span($r('app.string.TextSpan_textContent_span'))
    }
    .padding(10)
    .borderWidth(1)
    ```
    
    [TextSpan.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextSpan.ets#L27-L35)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bd/v3/R1CAgrgORu2SfytYY5B6pQ/zh-cn_image_0000002527044990.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=F6B8C84689A1CC9671544C9378BDC304667E422B8C1EBF73A274E02CD39D5FDF)
    
-   设置文本装饰线及颜色。
    
    通过[decoration](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-span#decoration)设置文本装饰线及颜色。
    
    ```TypeScript
    Text() {
      // 请将$r('app.string.TextSpan_textContent_span_one')替换为实际资源文件，在本示例中该资源文件的value值为"我是Span1，"
      Span($r('app.string.TextSpan_textContent_span_one'))
        .fontSize(16)
        .fontColor(Color.Grey)
        .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
      // 请将$r('app.string.TextSpan_textContent_span_two')替换为实际资源文件，在本示例中该资源文件的value值为"我是Span2"
      Span($r('app.string.TextSpan_textContent_span_two'))
        .fontColor(Color.Blue)
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .decoration({ type: TextDecorationType.Underline, color: Color.Black })
      // 请将$r('app.string.TextSpan_textContent_span_three')替换为实际资源文件，在本示例中该资源文件的value值为"我是Span3"
      Span($r('app.string.TextSpan_textContent_span_three'))
        .fontSize(16)
        .fontColor(Color.Grey)
        .decoration({ type: TextDecorationType.Overline, color: Color.Green })
    }
    .borderWidth(1)
    .padding(10)
    ```
    
    [TextSpan.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextSpan.ets#L39-L60)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f7/v3/qA29C8u6SqyAlo8LiIeGvA/zh-cn_image_0000002558044871.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=47B1FF6269225107DA7383BD01DB0F3C9CE327BC762F0719FB24D2463D41D19E)
    
-   通过[textCase](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-span#textcase)设置文字一直保持大写或者小写状态。
    
    ```TypeScript
    Text() {
      Span('I am Upper-span').fontSize(12)
        .textCase(TextCase.UpperCase)
    }
    .borderWidth(1)
    .padding(10)
    ```
    
    [TextSpan.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextSpan.ets#L64-L71)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4f/v3/7pOOQr3uTxuCUwkB7m-QSA/zh-cn_image_0000002526885060.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=687A43714CDFD635FB19077A25220B15466495BBCE4F2A9623DD9799D79CB41A)
    
-   添加事件。
    
    由于Span组件无尺寸信息，仅支持添加点击事件[onClick](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-events-click#onclick)、悬浮事件[onHover](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-events-hover#onhover)。
    
    ```TypeScript
    // xxx.ets
    import { hilog } from '@kit.PerformanceAnalysisKit';
    @Entry
    @Component
    export struct TextSpanOnHover {
      @State textStr1: string = '';
      @State textStr2: string = '';
      build() {
        NavDestination() {
          Row() {
            Column() {
              Text() {
                Span('I am Upper-span')
                  .textCase(TextCase.UpperCase)
                  .fontSize(30)
                  .onClick(() => {
                    hilog.info(0x0000, 'Sample_TextComponent', 'Span onClick is triggering');
                    this.textStr1 = 'Span onClick is triggering';
                  })
                  .onHover(() => {
                    hilog.info(0x0000, 'Sample_TextComponent', 'Span onHover is triggering');
                    this.textStr2 = 'Span onHover is triggering';
                  })
              }
              Text('onClick：' + this.textStr1)
                .fontSize(20)
              Text('onHover：' + this.textStr2)
                .fontSize(20)
            }.width('100%')
          }
          .height('100%')
        }
        // ···
      }
    }
    ```
    
    [TextSpanOnHover.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextSpanOnHover.ets#L15-L58)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/95/v3/IziI_oyAT2-0cITB6Za9Lg/zh-cn_image_0000002557924907.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=ADE7B1B17ABD2EF1594084BB02A77A7730FC9CE031DAA9A9CB03FD665D5A9499)
    

## 创建自定义文本样式

Text组件支持创建自定义文本样式，以下为修改文本样式的主要属性。

| 属性名称 | 功能描述 |
| --- | --- |
| baselineOffset | 设置文本基线的偏移量。 |
| contentTransition | 设置数字翻牌效果。 |
| copyOption | 设置文本是否可粘贴。 |
| decoration | 设置文本装饰线样式，如类型、颜色及其粗细。 |
| enableAutoSpacing | 设置是否开启中文与西文的自动间距。 |
| enableDataDetector | 设置是否进行文本特殊实体识别。 |
| font | 设置文本字体相关属性。 |
| fontColor | 设置文本字体颜色。 |
| fontFamily | 设置文本字体族。 |
| fontFeature | 设置文字特性效果，比如数字等宽的特性。 |
| fontSize | 设置文本字体大小。 |
| fontStyle | 设置文本字体风格。 |
| fontWeight | 设置文本字体粗细。 |
| halfLeading | 设置文本是否将行间距平分至行的顶部与底部。 |
| heightAdaptivePolicy | 设置文本自适应布局调整字号的方式。 |
| letterSpacing | 设置文本字符间距。 |
| lineHeight | 设置文本行高。 |
| lineSpacing | 设置文本的行间距。 |
| marqueeOptions | 设置跑马灯配置项，如开关、步长、循环次数、方向等。 |
| maxFontSize | 设置自适应字体最大尺寸。 |
| maxLines | 设置文本最大显示行数。 |
| minFontSize | 设置自适应字体最小尺寸。 |
| optimizeTrailingSpace | 控制每行末尾空格的优化。 |
| privacySensitive | 设置是否支持卡片敏感隐私信息。 |
| shaderStyle | 设置文本渐变色样式。 |
| textCase | 设置文本大小写转换。 |
| textAlign | 设置文本段落在水平方向的对齐方式。 |
| textIndent | 设置首行文本缩进。 |
| textOverflow | 控制文本超长处理方式。 |
| textSelectable | 设置文本是否可选择。 |
| textVerticalAlign | 设置文本段落在垂直方向的对齐方式。 |
| wordBreak | 设置断行规则。 |

下面对常用的接口进行举例说明。

-   通过[textAlign](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#textalign)属性设置文本对齐样式。
    
    ```TypeScript
    // 请将$r('app.string.TextAlign_Start')替换为实际资源文件，在本示例中该资源文件的value值为"左对齐"
    Text($r('app.string.TextAlign_Start'))
      .width(300)
      .textAlign(TextAlign.Start)
      .border({ width: 1 })
      .padding(10)
    // 请将$r('app.string.TextAlign_Center')替换为实际资源文件，在本示例中该资源文件的value值为"中间对齐"
    Text($r('app.string.TextAlign_Center'))
      .width(300)
      .textAlign(TextAlign.Center)
      .border({ width: 1 })
      .padding(10)
    // 请将$r('app.string.TextAlign_End')替换为实际资源文件，在本示例中该资源文件的value值为"右对齐"
    Text($r('app.string.TextAlign_End'))
      .width(300)
      .textAlign(TextAlign.End)
      .border({ width: 1 })
      .padding(10)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L29-L48)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/10/v3/QlY-sT4uT_KSHCEiU6o9Uw/zh-cn_image_0000002527044992.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=FE5277B1BFBC980FD66F79175DDD418374325E15F644C32B6CFB7E30527064F6)
    
-   通过[textOverflow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#textoverflow)属性控制文本超长处理，textOverflow需配合[maxLines](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#maxlines)一起使用（默认情况下文本自动折行）。从API version 18开始，文本超长时设置跑马灯的方式展示时，支持设置跑马灯的配置项，比如开关、步长、循环次数、方向等。
    
    ```TypeScript
    Text('This is the setting of textOverflow to Clip text content This is the setting of textOverflow ' +
      'to None text content. This is the setting of textOverflow to Clip text content This is the setting ' +
      'of textOverflow to None text content.')
      .width(250)
      .textOverflow({ overflow: TextOverflow.None })
      .maxLines(1)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
    // 'app.string.CustomTextStyle_textContent_epsis'资源文件中的value值为
    // '我是超长文本，超出的部分显示省略号 I am an extra long text, with ellipses displayed for any excess。'
    Text($r('app.string.CustomTextStyle_textContent_epsis'))
      .width(250)
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .maxLines(1)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
    // 'app.string.CustomTextStyle_textContent_marq'资源文件中的value值为
    // '当文本溢出其尺寸时，文本将滚动显示
    // When the text overflows its dimensions,the text will scroll for displaying.'
    Text($r('app.string.CustomTextStyle_textContent_marq'))
      .width(250)
      .textOverflow({ overflow: TextOverflow.MARQUEE })
      .maxLines(1)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
    // 'app.string.CustomTextStyle_textContent_marq_def'资源文件中的value值为
    // '当文本溢出其尺寸时，文本将滚动显示，支持设置跑马灯配置项
    // When the text overflows its dimensions, the text will scroll for displaying.'
    Text($r('app.string.CustomTextStyle_textContent_marq_def'))
      .width(250)
      .textOverflow({ overflow: TextOverflow.MARQUEE })
      .maxLines(1)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .marqueeOptions({
        start: true,
        fromStart: true,
        step: 6,
        loop: -1,
        delay: 0,
        fadeout: false,
        marqueeStartPolicy: MarqueeStartPolicy.DEFAULT
      })
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L57-L105)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7b/v3/vFrOjI_ZQXGOgCbiClaAXQ/zh-cn_image_0000002558044873.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=0E3CC2D9DD952262A973E9B620AB960FCA094831B8CF800DE9877CAE6CA8B807)
    
-   通过[lineHeight](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#lineheight)属性设置文本行高。
    
    ```TypeScript
    Text('This is the text with the line height set. This is the text with the line height set.')
      .width(300).fontSize(12).border({ width: 1 }).padding(10)
    Text('This is the text with the line height set. This is the text with the line height set.')
      .width(300)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .lineHeight(20)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L111-L120)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/33/v3/0WRznZRWRRauohZTIy3oqQ/zh-cn_image_0000002526885062.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=34AC846C87EDA2B6A5724CA50745854EC7EFDDC2965D3E654C49DF638D29175A)
    
-   通过[decoration](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#decoration)属性设置文本装饰线样式、颜色及其粗细。
    
    ```TypeScript
    Text('This is the text')
      .decoration({
        type: TextDecorationType.LineThrough,
        color: Color.Red
      })
      .borderWidth(1).padding(15).margin(5)
    Text('This is the text')
      .decoration({
        type: TextDecorationType.Overline,
        color: Color.Red
      })
      .borderWidth(1).padding(15).margin(5)
    Text('This is the text')
      .decoration({
        type: TextDecorationType.Underline,
        color: Color.Red
      })
      .borderWidth(1).padding(15).margin(5)
    Text('This is the text')
      .decoration({
        type: TextDecorationType.Underline,
        color: Color.Blue,
        style: TextDecorationStyle.DASHED
      })
      .borderWidth(1).padding(15).margin(5)
    Text('This is the text')
      .decoration({
        type: TextDecorationType.Underline,
        color: Color.Blue,
        style: TextDecorationStyle.DOTTED
      })
      .borderWidth(1).padding(15).margin(5)
    Text('This is the text')
      .decoration({
        type: TextDecorationType.Underline,
        color: Color.Blue,
        style: TextDecorationStyle.DOUBLE
      })
      .borderWidth(1).padding(15).margin(5)
    Text('This is the text')
      .decoration({
        type: TextDecorationType.Underline,
        color: Color.Blue,
        style: TextDecorationStyle.WAVY,
        thicknessScale: 4
      })
      .borderWidth(1).padding(15).margin(5)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L126-L174)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/53/v3/D1_aYNnIQDCPDLqPBNJbhQ/zh-cn_image_0000002557924909.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=F9928085D004771174E45949EE0C913A5EAA57CEAC82A65A4906E795488BAFDF)
    
-   通过[baselineOffset](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#baselineoffset)属性设置文本基线的偏移量。
    
    ```TypeScript
    Text('This is the text content with baselineOffset 0.')
      .baselineOffset(0)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .width('100%')
      .margin(5)
    Text('This is the text content with baselineOffset 30.')
      .baselineOffset(30)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .width('100%')
      .margin(5)
    Text('This is the text content with baselineOffset -20.')
      .baselineOffset(-20)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .width('100%')
      .margin(5)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L180-L202)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c9/v3/vR-YshZsSeqVHsfjEJTh3g/zh-cn_image_0000002527044994.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=1ADDE5091F497C7A3669D1D55747946A24D2B82EC8D764C40C7AC0DFF524CC86)
    
-   通过[letterSpacing](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#letterspacing)属性设置文本字符间距。
    
    ```TypeScript
    Text('This is the text content with letterSpacing 0.')
      .letterSpacing(0)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .width('100%')
      .margin(5)
    Text('This is the text content with letterSpacing 3.')
      .letterSpacing(3)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .width('100%')
      .margin(5)
    Text('This is the text content with letterSpacing -1.')
      .letterSpacing(-1)
      .fontSize(12)
      .border({ width: 1 })
      .padding(10)
      .width('100%')
      .margin(5)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L208-L230)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8e/v3/P9-TH7ZnSkuEtf3ks5OIdQ/zh-cn_image_0000002558044875.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=9FFC6D719BDD40862D3D6D1235CBB6DDCC22BDBC6ECAE28213684C1793BC220B)
    
-   通过[minFontSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#minfontsize)与[maxFontSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#maxfontsize)自适应字体大小。
    
    minFontSize用于设置文本的最小显示字号，maxFontSize用于设置文本的最大显示字号。这两个属性必须同时设置才能生效，并且需要与[maxLines](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#maxlines)属性或布局大小限制配合使用，单独设置任一属性将不会产生效果。
    
    ```TypeScript
    /* 请将$r('app.string.CustomTextStyle_textContent_one_style')替换为实际资源文件，在本示例中该资源文件的
     value值为"我的最大字号为30，最小字号为5，宽度为250，maxLines为1" */
    Text($r('app.string.CustomTextStyle_textContent_one_style'))
      .width(250)
      .maxLines(1)
      .maxFontSize(30)
      .minFontSize(5)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    /* 请将$r('app.string.CustomTextStyle_textContent_two_style')替换为实际资源文件，
     在本示例中该资源文件的value值为"我的最大字号为30，最小字号为5，宽度为250，maxLines为2" */
    Text($r('app.string.CustomTextStyle_textContent_two_style'))
      .width(250)
      .maxLines(2)
      .maxFontSize(30)
      .minFontSize(5)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    /* 请将$r('app.string.CustomTextStyle_textContent_no_max')替换为实际资源文件，在本示例中该资源文件的
      value值为"我的最大字号为30，最小字号为15，宽度为250,高度为50" */
    Text($r('app.string.CustomTextStyle_textContent_no_max'))
      .width(250)
      .height(50)
      .maxFontSize(30)
      .minFontSize(15)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    /* 请将$r('app.string.CustomTextStyle_textContent_high')替换为实际资源文件，在本示例中该资源文件的
      value值为"我的最大字号为30，最小字号为15，宽度为250,高度为100" */
    Text($r('app.string.CustomTextStyle_textContent_high'))
      .width(250)
      .height(100)
      .maxFontSize(30)
      .minFontSize(15)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L236-L273)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/68/v3/p-LkSxDBQl6jaC_NEQQf_g/zh-cn_image_0000002526885064.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=BEB2D518EA852914A2019C708CF4488B6576AE774A913BDC4CD5AF37B638D49E)
    
-   通过[textCase](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#textcase)属性设置文本大小写。
    
    ```TypeScript
    Text('This is the text content with textCase set to Normal.')
      .textCase(TextCase.Normal)
      .padding(10)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    // 文本全小写展示
    Text('This is the text content with textCase set to LowerCase.')
      .textCase(TextCase.LowerCase)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    // 文本全大写展示
    Text('This is the text content with textCase set to UpperCase.')
      .textCase(TextCase.UpperCase)
      .border({ width: 1 })
      .padding(10)
      .margin(5)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L279-L300)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/51/v3/eAFMDNZRRieT4PiAhaIEzw/zh-cn_image_0000002557924911.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=AA137A149651A72C7D7816AF37961A1BC23853494D17D791E068E06342A185D5)
    
-   通过[copyOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#copyoption9)属性设置文本是否可复制粘贴。
    
    ```TypeScript
    // 请将$r('app.string.CustomTextStyle_textContent_incopy')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段可复制文本。"
    Text($r('app.string.CustomTextStyle_textContent_incopy'))
      .fontSize(30)
      .copyOption(CopyOptions.InApp)
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L310-L315)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c5/v3/7UfR8Z9VQiaPrSUR0ZRYAg/zh-cn_image_0000002527044996.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=0AD0D6E5B4968E34644A1B9800A0192D7870E36DD4B38FA3F0D8988E76F3F29A)
    
-   通过[fontFamily](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#fontfamily)属性设置字体列表。应用当前支持'HarmonyOS Sans'字体和[注册自定义字体](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-font)。
    
    ```TypeScript
    Text('This is the text content with fontFamily')
      .fontSize(30)
      .fontFamily('HarmonyOS Sans')
    ```
    
    [CustomTextStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/CustomTextStyle.ets#L301-L305)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/1O-NnDahRXyNEfUVy5B0OA/zh-cn_image_0000002558044877.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=C393A930CD4715E30577F564F0B8E1C9A162E997FD8F508E1155F34FBD1CCF9E)
    
-   从API version 20开始，支持通过[contentTransition](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#contenttransition20)属性设置数字翻牌效果。
    
    ```TypeScript
    @Entry
    @Component
    export struct ContentTransition {
      private static readonly INITIAL_SCORE: number = 98;
      @State number: number = ContentTransition.INITIAL_SCORE;
      @State numberTransition: NumericTextTransition =
        new NumericTextTransition({ flipDirection: FlipDirection.DOWN, enableBlur: false });
      build() {
        NavDestination() {
          Column() {
            Text(this.number + '')
              .borderWidth(1)
              .fontSize(40)
              .contentTransition(this.numberTransition)
            Button('chang number')
              .onClick(() => {
                this.number++
              })
              .margin(10)
          }
          .width('100%')
          .height('100%')
        }
        // ···
      }
    }
    ```
    
    [ContentTransition.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/ContentTransition.ets#L15-L47)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/28/v3/L2oQ906USmqQ_NlaBliekQ/zh-cn_image_0000002526885066.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=B93DABE83147D6F732D2E75306AD4A96D63CE5DAAD851ACB4A803D7A9EE1180A)
    
-   从API version 20开始，支持通过[optimizeTrailingSpace](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#optimizetrailingspace20)设置是否在文本布局过程中优化每行末尾的空格，可解决行尾空格影响对齐显示效果问题。
    
    ```TypeScript
    Column() {
      // 启用优化行尾空格功能
      Text('Trimmed space enabled     ')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .optimizeTrailingSpace(true)
        .textAlign(TextAlign.Center)
      // 不启用优化行尾空格功能
      Text('Trimmed space disabled     ')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .optimizeTrailingSpace(false)
        .textAlign(TextAlign.Center)
    }
    ```
    
    [TextLayout.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextLayout.ets#L65-L83)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dc/v3/fqIr7rm9Tl2NVucgcMCKYQ/zh-cn_image_0000002557924913.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=4A5E6CFB60EE1DE975BA02F138E3F6A49C21F5A92A0BB8699DA9EDB33E859CFF)
    
-   从API version 20开始，支持通过[lineSpacing](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#linespacing20)设置文本的行间距。当不配置[LineSpacingOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-text-common#linespacingoptions20对象说明)时，首行上方和尾行下方默认会有行间距，当onlyBetweenLines设置为true时，行间距仅适用于行与行之间，首行上方无额外的行间距。
    
    ```TypeScript
    import { LengthMetrics } from '@kit.ArkUI';
    @Extend(Text)
    function style() {
      .width(250)
      .height(100)
      .maxFontSize(30)
      .minFontSize(15)
      .border({ width: 1 })
    }
    @Entry
    @Component
    export struct LineSpacing {
      build() {
        NavDestination() {
          Column() {
            Text('The line spacing of this context is set to 20_px, and the spacing is effective only between the lines.')
              .lineSpacing(LengthMetrics.px(20), { onlyBetweenLines: true })
              .style()
          }
        }
        // ···
      }
    }
    ```
    
    [LineSpacing.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/LineSpacing.ets#L16-L46)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/12/v3/2tvHqZwxQgOX4Ml2sj12CA/zh-cn_image_0000002527044998.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=A81BBAE244CFE312B294B6E3485298E1402E2C6F6762CCBAE88FB661808B4501)
    
-   从API version 20开始，支持通过[enableAutoSpacing](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#enableautospacing20)设置是否开启中文与西文的自动间距。
    
    ```TypeScript
    @Entry
    @Component
    export struct EnableAutoSpacing {
      @State enableSpacing: boolean = false;
      build() {
        NavDestination() {
        Column() {
          Row({ space: 20 }) {
            // 请将$r('app.string.Enable_automatic_spacing')替换为实际资源文件，在本示例中该资源文件的value值为"开启自动间距"
            Button($r('app.string.Enable_automatic_spacing'))
              .onClick(() => this.enableSpacing = true)
              .backgroundColor(this.enableSpacing ? '#4CAF50' : '#E0E0E0')
              .fontColor(this.enableSpacing ? Color.White : Color.Black)
            // 请将$r('app.string.off_automatic_spacing')替换为实际资源文件，在本示例中该资源文件的value值为"关闭自动间距"
            Button($r('app.string.off_automatic_spacing'))
              .onClick(() => this.enableSpacing = false)
              .backgroundColor(!this.enableSpacing ? '#F44336' : '#E0E0E0')
              .fontColor(!this.enableSpacing ? Color.White : Color.Black)
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
          .margin({ top: 30, bottom: 20 })
          // 请将$r('app.string.Automatic_spacing_has_been_enabled')替换为实际资源文件，在本示例中该资源文件的value值为"当前状态:已开启自动间距"
          // 请将$r('app.string.Automatic_spacing_has_been_turned_off')替换为实际资源文件，在本示例中该资源文件的value值为"当前状态:已关闭自动间距"
          Text(this.enableSpacing ? $r('app.string.Automatic_spacing_has_been_enabled') : $r('app.string.Automatic_spacing_has_been_turned_off'))
            .fontSize(16)
            .fontColor(this.enableSpacing ? '#4CAF50' : '#F44336')
            .margin({ bottom: 20 })
          // 设置是否应用中西文自动间距
          /* 请将$r('app.string.Chinese_and_Western_Auto_Spacing_automatic_spacing')替换为实际资源文件，在本示例中该资源文件的
            value值为"中西文Auto Spacing自动间距" */
          Text($r('app.string.Chinese_and_Western_Auto_Spacing_automatic_spacing'))
            .fontSize(24)
            .padding(15)
            .backgroundColor('#F5F5F5')
            .width('90%')
            .enableAutoSpacing(this.enableSpacing)
        }
        .width('100%')
        .height('100%')
        .padding(20)
        }
        // ...
      }
    }
    ```
    
    [EnableAutoSpacing.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/EnableAutoSpacing.ets#L16-L68)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a9/v3/Dt32KKcHTICLBR2mN6N_nA/zh-cn_image_0000002558044879.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=2777A1A6D192784D14DCE76C4608FD63CEF1FA425E1BE8A702C7EA90227AE893)
    
-   从API version 20开始，支持通过[shaderStyle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#shaderstyle20)设置渐变色。
    
    ```TypeScript
    @Entry
    @Component
    export struct ShaderStyle {
      @State message: string = 'Hello World';
      @State linearGradientOptions: LinearGradientOptions =
        {
          direction: GradientDirection.LeftTop,
          colors: [[Color.Red, 0.0], [Color.Blue, 0.3], [Color.Green, 0.5]],
          repeating: true,
        };
      build() {
        NavDestination() {
          Column({ space: 5 }) {
            // 请将$r('app.string.direction_LeftTop')替换为实际资源文件，在本示例中该资源文件的value值为"direction为LeftTop的线性渐变"
            Text($r('app.string.direction_LeftTop')).fontSize(18).width('90%').fontColor(0xCCCCCC)
              .margin({ top: 40, left: 40 })
            Text(this.message)
              .fontSize(50)
              .width('80%')
              .height(50)
              .shaderStyle(this.linearGradientOptions)
          }
          .height('100%')
          .width('100%')
        }
        // ...
      }
    }
    ```
    
    [ShaderStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/ShaderStyle.ets#L16-L50)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0c/v3/cxyBN-x4Sv6TtM2BY2bz9Q/zh-cn_image_0000002526885068.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=36990180170094014879043DB3341409B734A613C0706137C6AFC047894D5AA8)
    

## 添加事件

Text组件可以添加通用事件，可以绑定[onClick](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-events-click#onclick)、[onTouch](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-events-touch#ontouch)等事件来响应操作。

```TypeScript
// xxx.ets
import { hilog } from '@kit.PerformanceAnalysisKit';
@Entry
@Component
export struct GeneralEvents {
  @State textStr1: string = '';
  @State textStr2: string = '';
  build() {
    NavDestination() {
      Row() {
        Column() {
          Text('This is a text component.')
            .fontSize(30)
            .onClick(() => {
              hilog.info(0x0000, 'Sample_TextComponent', 'Text onClick is triggering');
              this.textStr1 = 'Text onClick is triggering';
            })
            .onTouch(() => {
              hilog.info(0x0000, 'Sample_TextComponent', 'Text onTouch is triggering');
              this.textStr2 = 'Text onTouch is triggering';
            })
          Text('onClick：' + this.textStr1)
            .fontSize(20)
          Text('onTouch：' + this.textStr2)
            .fontSize(20)
        }.width('100%')
      }
      .height('100%')
    }
    // ···
  }
}
```

[GeneralEvents.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/GeneralEvents.ets#L16-L54)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/GpkpvvaaTKGODUCttKlKjQ/zh-cn_image_0000002557924915.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=FEA5C97C324AC2C9289060EBD2318ABDCFAA1B43B4E97ACE461DFA23B7E80BCD)

## 设置垂直居中

从API version 20开始，Text组件支持通过[textVerticalAlign](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#textverticalalign20)属性实现文本段落在垂直方向的对齐。

-   以下示例展示了如何通过textVerticalAlign属性设置文本垂直居中对齐效果。
    
    ```TypeScript
    // 请将$r('app.media.startIcon')替换为实际资源文件
    Text() {
      Span('Hello')
        .fontSize(50)
      ImageSpan($r('app.media.startIcon'))
        .width(30).height(30)
        .verticalAlign(ImageSpanAlignment.FOLLOW_PARAGRAPH)
      Span('World')
    }
    .textVerticalAlign(TextVerticalAlign.CENTER)
    ```
    
    [TextLayout.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextLayout.ets#L85-L97)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/YtxSU5n3SLe70WL506Z-OA/zh-cn_image_0000002527045000.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=F02EB512426203BE470F18B178E2FA5B424A17C603DC785CB39C2AFC66F0D9B9)
    

## 设置选中菜单

### 弹出选中菜单

-   设置Text被选中时，会弹出包含复制、翻译、搜索的菜单。
    
    Text组件需要设置[copyOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#copyoption9)属性才可以被选中。
    
    ```TypeScript
    // 请将$r('app.string.selected_menu')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，用来展示选中菜单"
    Text($r('app.string.selected_menu'))
      .fontSize(30)
      .copyOption(CopyOptions.InApp)
    ```
    
    [TextLayout.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextLayout.ets#L101-L106)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c9/v3/0v4v5IZNS8WdHUuEi78kHQ/zh-cn_image_0000002558044881.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=2E5E3AEC082EA65875A3A3EC1F4C123CDCEC50EC6E2D0F1A7CD321C12092E80E)
    
-   Text组件通过设置[bindSelectionMenu](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#bindselectionmenu11)属性绑定自定义选择菜单。
    
    ```TypeScript
    controller: TextController = new TextController();
    options: TextOptions = { controller: this.controller };
    ```
    
    [SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/SelectMenu.ets#L23-L26)
    
    ```TypeScript
    // 请将$r('app.string.show_selected_menu')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，用来展示选中菜单"
    Text($r('app.string.show_selected_menu'), this.options)
      .fontSize(30)
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.RightClickTextCustomMenu, TextResponseType.RIGHT_CLICK, {
        onAppear: () => {
          // 请将$r('app.string.SelectMenu_Text_Ejected')替换为实际资源文件，在本示例中该资源文件的value值为"自定义选择菜单弹出时触发该回调"
          hilog.info(0x0000, 'Sample_TextComponent',
            this.getUIContext()
              .getHostContext()!.resourceManager.getStringSync($r('app.string.SelectMenu_Text_Ejected').id));
        },
        onDisappear: () => {
          // 'SelectMenu_Text_Close'资源文件中的value值为'自定义选择菜单关闭时触发该回调'
          hilog.info(0x0000, 'Sample_TextComponent',
            this.getUIContext()
              .getHostContext()!.resourceManager.getStringSync($r('app.string.SelectMenu_Text_Close').id));
        }
      })
    ```
    
    [SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/SelectMenu.ets#L102-L119)
    
    ```TypeScript
    // 定义菜单项
    @Builder
    RightClickTextCustomMenu() {
      Column() {
        Menu() {
          MenuItemGroup() {
            // 请将$r('app.media.app_icon')替换为实际资源文件
            MenuItem({ startIcon: $r('app.media.app_icon'), content: 'CustomMenu One', labelInfo: '' })
              .onClick(() => {
                // 使用closeSelectionMenu接口关闭菜单
                this.controller.closeSelectionMenu();
              })
            MenuItem({ startIcon: $r('app.media.app_icon'), content: 'CustomMenu Two', labelInfo: '' })
            MenuItem({ startIcon: $r('app.media.app_icon'), content: 'CustomMenu Three', labelInfo: '' })
          }
        }.backgroundColor('#F0F0F0')
      }
    }
    ```
    
    [SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/SelectMenu.ets#L27-L46)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b0/v3/UfPhVBmURjeSzeuQhKRLHQ/zh-cn_image_0000002526885070.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=D11E8B6DD3A3FFF8D9CFD899BA9D22100D4A45B5EA88A9FFDB98D4A384302CAD)
    
-   Text组件通过设置[editMenuOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#editmenuoptions12)属性扩展自定义选择菜单，可以设置扩展项的文本内容、图标以及回调方法。
    
    ```TypeScript
    // 请将$r('app.string.show_selected_menu')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，用来展示选中菜单"
    Text($r('app.string.show_selected_menu'))
      .fontSize(20)
      .copyOption(CopyOptions.LocalDevice)
      .editMenuOptions({
        onCreateMenu: this.onCreateMenu, onMenuItemClick: this.onMenuItemClick
      })
    ```
    
    [SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/SelectMenu.ets#L123-L131)
    
    ```TypeScript
    // 定义onCreateMenu，onMenuItemClick
    // 请将$r('app.media.app_icon')替换为实际资源文件
    onCreateMenu = (menuItems: Array<TextMenuItem>) => {
      let item1: TextMenuItem = {
        content: 'customMenu1',
        icon: $r('app.media.app_icon'),
        id: TextMenuItemId.of('customMenu1'),
      };
      let item2: TextMenuItem = {
        content: 'customMenu2',
        id: TextMenuItemId.of('customMenu2'),
        icon: $r('app.media.app_icon'),
      };
      menuItems.push(item1);
      menuItems.unshift(item2);
      return menuItems;
    }
    onMenuItemClick = (menuItem: TextMenuItem, textRange: TextRange) => {
      if (menuItem.id.equals(TextMenuItemId.of('customMenu2'))) {
        // 请将$r('app.string.SelectMenu_Text_customMenu')替换为实际资源文件，在本示例中该资源文件的value值为"拦截 id: customMenu2 start:"
        hilog.info(0x0000, 'Sample_TextComponent',
          this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.SelectMenu_Text_customMenu')
            .id) + textRange.start + '; end:' +
          textRange.end);
        return true;
      }
      if (menuItem.id.equals(TextMenuItemId.COPY)) {
        // 请将$r('app.string.SelectMenu_Text_copy')替换为实际资源文件，在本示例中该资源文件的value值为"拦截 COPY start:"
        hilog.info(0x0000, 'Sample_TextComponent',
          this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.SelectMenu_Text_copy').id) +
          textRange.start + '; end:' + textRange.end);
        return true;
      }
      if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
        // 请将$r('app.string.SelectMenu_Text_SelectionAll')替换为实际资源文件，在本示例中该资源文件的value值为"不拦截 SELECT_ALL start:"
        hilog.info(0x0000, 'Sample_TextComponent',
          this.getUIContext()
            .getHostContext()!.resourceManager.getStringSync($r('app.string.SelectMenu_Text_SelectionAll').id) +
          textRange.start + '; end:' +
          textRange.end);
        return false;
      }
      return false;
    };
    ```
    
    [SelectMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/SelectMenu.ets#L47-L88)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b6/v3/KPN264wPRw6LftDYIZKhmw/zh-cn_image_0000002557924917.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=2AB5A129BDF53175041371BE5DAD064509D39121E23CBE17215BF9DFFDAF3830)
    

### 关闭选中菜单

使用Text组件时，若需要实现点击空白处关闭选中的场景，分为以下两种情况：

-   在Text组件区域内点击空白处，会正常关闭选中态和菜单；
    
-   在Text组件区域外点击空白处，前提是Text组件设置[selection](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#selection11)属性，具体示例如下：
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    export struct SelectionChange {
      @State text: string =
        'This is set selection to Selection text content This is set selection to Selection text content.';
      @State start: number = 0;
      @State end: number = 20;
      build() {
        NavDestination() {
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
            Text(this.text)
              .fontSize(12)
              .border({ width: 1 })
              .lineHeight(20)
              .margin(30)
              .copyOption(CopyOptions.InApp)
              .selection(this.start, this.end)
              .onTextSelectionChange((selectionStart, selectionEnd) => {
                // 更新选中态位置
                this.start = selectionStart;
                this.end = selectionEnd;
              })
          }
          .height(600)
          .width(335)
          .borderWidth(1)
          .onClick(() => {
            // 监听父组件的点击事件，将选中首尾位置均设置为-1，即可清除选中
            this.start = -1;
            this.end = -1;
          })
        }
        // ···
      }
    }
    ```
    
    [SelectionChange.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/SelectionChange.ets#L15-L57)
    

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f5/v3/QLWTMtMjRTmKCipL0F7DMA/zh-cn_image_0000002527045002.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=A7FF763AA3775C3CD62E78B513CED26C1E2EDA30DBBE272F8A69069FB936F639)

### 屏蔽系统菜单回调和自定义扩展菜单

从API version 12开始，支持通过[editMenuOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#editmenuoptions12)屏蔽系统菜单回调和自定义扩展菜单项。

```TypeScript
// xxx.ets
@Entry
@Component
export struct CustomAndBlockMenus {
  private static readonly CREATE_MENU_ITEM_ID_1: string = 'create1';
  private static readonly CREATE_MENU_ITEM_ID_2: string = 'create2';
  private static readonly PREPARE_MENU_ITEM_ID: string = 'prepare1';
  @State private text: string = 'Text editMenuOptions';
  @State private endIndex: number = 0;
  @State blockCallbackText: string = '';
  // 创建菜单项辅助方法
  private createMenuItem(id: string, content: string): TextMenuItem {
    // $r('app.media.startIcon')需要替换为开发者所需的图像资源文件
    return {
      content: content,
      icon: $r('app.media.startIcon'),
      id: TextMenuItemId.of(id)
    };
  }
  // 查找菜单项索引
  private findMenuItemIndex(menuItems: Array<TextMenuItem>, menuItemId: TextMenuItemId): number {
    return menuItems.findIndex((item: TextMenuItem) => item.id.equals(menuItemId));
  }
  // 创建菜单回调
  private onCreateMenu = (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
    const createItem1: TextMenuItem = this.createMenuItem(
      CustomAndBlockMenus.CREATE_MENU_ITEM_ID_1,
      'create1'
    );
    const createItem2: TextMenuItem = this.createMenuItem(
      CustomAndBlockMenus.CREATE_MENU_ITEM_ID_2,
      'create2'
    );
    // 添加自定义菜单项
    menuItems.push(createItem1);
    menuItems.unshift(createItem2);
    // 移除不需要的系统菜单项
    this.removeMenuItemById(menuItems, TextMenuItemId.AI_WRITER);
    this.removeMenuItemById(menuItems, TextMenuItemId.TRANSLATE);
    return menuItems;
  }
  // 移除指定菜单项
  private removeMenuItemById(menuItems: Array<TextMenuItem>, menuItemId: TextMenuItemId): void {
    const targetIndex: number = this.findMenuItemIndex(menuItems, menuItemId);
    if (targetIndex !== -1) {
      menuItems.splice(targetIndex, 1);
    }
  }
  // 菜单项点击回调
  private onMenuItemClick = (menuItem: TextMenuItem, textRange: TextRange): boolean => {
    const menuItemId: TextMenuItemId = menuItem.id;
    // 处理自定义菜单项
    if (menuItemId.equals(TextMenuItemId.of(CustomAndBlockMenus.CREATE_MENU_ITEM_ID_2))) {
      let msg = '拦截 id: create2 start:' + textRange.start + '; end:' + textRange.end;
      this.blockCallbackText = msg
      return true;
    }
    if (menuItemId.equals(TextMenuItemId.of(CustomAndBlockMenus.PREPARE_MENU_ITEM_ID))) {
      let msg = '拦截 id: prepare1 start:' + textRange.start + '; end:+' + textRange.end;
      this.blockCallbackText = msg
      return true;
    }
    // 处理系统菜单项
    if (menuItemId.equals(TextMenuItemId.COPY)) {
      let msg = '拦截 COPY start:' + textRange.start + '; end:' + textRange.end;
      this.blockCallbackText = msg
      return true;
    }
    if (menuItemId.equals(TextMenuItemId.SELECT_ALL)) {
      let msg = '不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end;
      this.blockCallbackText = msg
      return false;
    }
    return false;
  }
  // 准备菜单回调
  private onPrepareMenu = (menuItems: Array<TextMenuItem>): Array<TextMenuItem> => {
    const prepareItem: TextMenuItem = this.createMenuItem(
      CustomAndBlockMenus.PREPARE_MENU_ITEM_ID,
      `prepare1_${this.endIndex}`
    );
    menuItems.unshift(prepareItem);
    return menuItems;
  }
  // 编辑菜单选项
  @State private editMenuOptions: EditMenuOptions = {
    onCreateMenu: this.onCreateMenu,
    onMenuItemClick: this.onMenuItemClick,
    onPrepareMenu: this.onPrepareMenu
  };
  // 文本选择变化回调
  private onTextSelectionChange = (selectionStart: number, selectionEnd: number): void => {
    this.endIndex = selectionEnd;
  }
  build() {
    NavDestination() {
      Column() {
        Text(this.text)
          .fontSize(20)
          .copyOption(CopyOptions.LocalDevice)
          .editMenuOptions(this.editMenuOptions)
          .margin({ top: 100 })
          .onTextSelectionChange(this.onTextSelectionChange)
        Text(this.blockCallbackText).borderWidth(1)
      }
      .width('90%')
      .margin('5%')
    }
  }
}
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/25/v3/Pd_O6I0zTcOr925bjRaMOg/zh-cn_image_0000002558044883.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=0E4C30CC3EA3B29AFFA975CC22D76F4723F46404F8E7046B04981A69C45D4F10)

### 屏蔽系统服务类菜单

-   从API version 20开始，支持通过[disableSystemServiceMenuItems](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-textmenucontroller#disablesystemservicemenuitems20)屏蔽文本选择菜单内所有系统服务菜单项。
    
    ```TypeScript
    import { TextMenuController } from '@kit.ArkUI';
    // xxx.ets
    @Entry
    @Component
    export struct ServiceMenuItems {
      aboutToAppear(): void {
        // 禁用所有系统服务菜单
        TextMenuController.disableSystemServiceMenuItems(true);
      }
      aboutToDisappear(): void {
        // 页面消失恢复系统服务菜单
        TextMenuController.disableSystemServiceMenuItems(false);
      }
      build() {
        NavDestination() {
          Row() {
            Column() {
              // 请将$r('app.string.Service_MenuItems_Text')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，长按弹出文本选择菜单。"
              Text($r('app.string.Service_MenuItems_Text'))
                .height(60)
                .fontStyle(FontStyle.Italic)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Center)
                .copyOption(CopyOptions.InApp)
                .editMenuOptions({
                  onCreateMenu: (menuItems: Array<TextMenuItem>) => {
                    // menuItems不包含被屏蔽的系统菜单项
                    return menuItems;
                  },
                  onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
                    return false;
                  }
                })
            }.width('100%')
          }
          .height('100%')
        }
        // ...
      }
    }
    ```
    
    [ServiceMenuItems.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/ServiceMenuItems.ets#L15-L61)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/0IBuNH2iR_SDTLnX11azjw/zh-cn_image_0000002526885072.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=8EC29E5BD7A51BAF72BFD4E09B17D969A72561A3716D1BCA835918F4175CEBA5)
    
-   从API version 20开始，支持通过[disableMenuItems](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-textmenucontroller#disablemenuitems20)屏蔽文本选择菜单内指定的系统服务菜单项。
    
    ```TypeScript
    import { TextMenuController } from '@kit.ArkUI';
    // xxx.ets
    @Entry
    @Component
    export struct DisableMenuItems {
      aboutToAppear(): void {
        // 禁用搜索菜单
        TextMenuController.disableMenuItems([TextMenuItemId.SEARCH])
      }
      aboutToDisappear(): void {
        // 恢复系统服务菜单
        TextMenuController.disableMenuItems([])
      }
      build() {
        NavDestination() {
          Row() {
            Column() {
              // 请将$r('app.string.Service_MenuItems_Text')替换为实际资源文件，在本示例中该资源文件的value值为"这是一段文本，长按弹出文本选择菜单。"
              Text($r('app.string.Service_MenuItems_Text'))
                .height(60)
                .fontStyle(FontStyle.Italic)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Center)
                .copyOption(CopyOptions.InApp)
                .editMenuOptions({
                  onCreateMenu: (menuItems: Array<TextMenuItem>) => {
                    // menuItems不包含搜索
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
        // ...
      }
    }
    ```
    
    [DisableMenuItems.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/DisableMenuItems.ets#L15-L63)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/a1a2tHieR9yA3Bzc79AWLA/zh-cn_image_0000002557924919.jpg?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=6AAF66F737307EE3D6BAE35115735A669619D4D0FBC774B916664E1CAD3B937A)
    

### 默认菜单支持自定义刷新能力

从API version 20开始，当文本选择区域变化后显示菜单之前触发[onPrepareMenu](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-text-common#属性-1)回调，可在该回调中进行菜单数据设置。

```TypeScript
// 请将$r('app.media.xxx')替换为实际资源文件
// xxx.ets
import { hilog } from '@kit.PerformanceAnalysisKit';
const DOMAIN = 0x0000;
@Entry
@Component
export struct PrepareMenu {
  @State text: string = 'Text editMenuOptions';
  @State endIndex: number = 0;
  onCreateMenu = (menuItems: Array<TextMenuItem>) => {
    let item1: TextMenuItem = {
      content: 'create1',
      icon: $r('app.media.startIcon'),
      id: TextMenuItemId.of('create1'),
    };
    let item2: TextMenuItem = {
      content: 'create2',
      id: TextMenuItemId.of('create2'),
      icon: $r('app.media.startIcon'),
    };
    menuItems.push(item1);
    menuItems.unshift(item2);
    return menuItems;
  }
  onMenuItemClick = (menuItem: TextMenuItem, textRange: TextRange) => {
    if (menuItem.id.equals(TextMenuItemId.of('create2'))) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'intercept id: create2 start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.of('prepare1'))) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'intercept id: prepare1 start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.COPY)) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'intercept COPY start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'No interception SELECT_ALL start:' + textRange.start + '; end:' + textRange.end);
      return false;
    }
    return false;
  }
  onPrepareMenu = (menuItems: Array<TextMenuItem>) => {
    let item1: TextMenuItem = {
      content: 'prepare1_' + this.endIndex,
      icon: $r('app.media.startIcon'),
      id: TextMenuItemId.of('prepare1'),
    };
    menuItems.unshift(item1);
    return menuItems;
  }
  @State editMenuOptions: EditMenuOptions = {
    onCreateMenu: this.onCreateMenu,
    onMenuItemClick: this.onMenuItemClick,
    onPrepareMenu: this.onPrepareMenu
  };
  build() {
    NavDestination() {
    Column() {
      Text(this.text)
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions(this.editMenuOptions)
        .margin({ top: 100 })
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          this.endIndex = selectionEnd;
        })
    }
    .width('90%')
    .margin('5%')
    }
    // ...
  }
}
```

[PrepareMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/PrepareMenu.ets#L15-L96)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/Y4ktzd7VRQGdxGRHVZRFGg/zh-cn_image_0000002527045004.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=A96AE9D3160E4A37C599C218F6C83E5C26DCBB1F830517D05039FE5FCEA8CEA6)

## 设置AI菜单

Text组件通过[enableDataDetector](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#enabledatadetector11)和[dataDetectorConfig](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#datadetectorconfig11)属性实现AI菜单的显示。AI菜单的表现形式包括：单击AI实体（指可被识别的内容，包括地址、邮箱等）弹出菜单的实体识别选项，选中文本后，文本选择菜单与鼠标右键菜单中显示的实体识别选项。

说明

从API version 20开始，支持在文本选择菜单与鼠标右键菜单中显示实体识别选项。当[enableDataDetector](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#enabledatadetector11)设置为true，且[copyOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#copyoption9)设置为CopyOptions.LocalDevice时，该功能生效。菜单选项包括[TextMenuItemId](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-text-common#textmenuitemid12)中的url(打开链接)、email(新建邮件)、phoneNumber(呼叫)、address(导航至该位置)、dateTime(新建日程提醒)。

该功能生效时，需选中范围内，包括一个完整的AI实体，才能展示对应的选项。

-   如果需要单击AI实体弹出菜单的实体识别选项，可以配置[enableDataDetector](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#enabledatadetector11)为true。
    
-   如果在单击的交互方式之外，还需要文本选择菜单与鼠标右键菜单中显示的实体识别选项，可以配置[enableDataDetector](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#enabledatadetector11)为true，且[copyOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#copyoption9)设置为CopyOptions.LocalDevice，具体示例如下所示：
    
    ```TypeScript
    // 'app.string.AIMenu_Text_One'资源文件中的value值为'电话号码：(86) (755) ********  \n \n 链接：www.********.com
    // \n \n 邮箱：***@example.com\n \n 地址：XX省XX市XX区XXXX \n \n 时间：XX年XX月XX日XXXX'
    Text($r('app.string.AIMenu_Text_One'))
      .fontSize(16)
      .copyOption(CopyOptions.LocalDevice)
      .enableDataDetector(true)// 使能实体识别
      .dataDetectorConfig({
        // 配置识别样式
        // types可支持PHONE_NUMBER电话号码、URL链接、EMAIL邮箱、ADDRESS地址、DATE_TIME时间
        // types设置为null或者[]时，识别所有类型的实体
        types: [], onDetectResultUpdate: (result: string) => {
        }
      })
    ```
    
    [AIMenu.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/AIMenu.ets#L25-L39)
    
-   如果需要调整识别出的样式，可以通过[dataDetectorConfig](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#datadetectorconfig11)实现，具体可以参考[TextDataDetectorConfig](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-text-common#textdatadetectorconfig11对象说明)配置项。
    
-   如果需要调整菜单的位置，可以通过[editMenuOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#editmenuoptions12)实现，具体可以参考示例[文本扩展自定义菜单](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#示例12文本扩展自定义菜单)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/76/v3/45qj9Mx2SFexHCDq6iDdJw/zh-cn_image_0000002558044885.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=124CAFA3398B2C44172CEF45556C224EB7319502D3522E63D5A5D8817367851C)
    

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/42/v3/kfrjBr2QTwu1V5TEwprFsw/zh-cn_image_0000002526885074.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=FAAD506478B0754DBDA61E9753B6FAE8E1629E3E433E88C62D74D02484D76FE5)

## 实现热搜榜

该示例通过[maxLines](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#maxlines)、[textOverflow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#textoverflow)、[textAlign](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text#textalign)、[constraintSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-size#constraintsize)属性展示了热搜榜的效果。

```TypeScript
import { ComponentCard } from '../../common/Card';
@Entry
@Component
export struct TextHotSearch {
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        // ...
          Column() {
            Row() {
              Text('1').fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
              // 请将$r('app.string.TextHotSearch_textContent_one')替换为实际资源文件，在本示例中该资源文件的value值为"我是热搜词条1"
              Text($r('app.string.TextHotSearch_textContent_one'))
                .fontSize(12)
                .fontColor(Color.Blue)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .fontWeight(300)
              // 请将$r('app.string.TextHotSearch_textContent_two')替换为实际资源文件，在本示例中该资源文件的value值为"爆"
              Text($r('app.string.TextHotSearch_textContent_two'))
                .margin({ left: 6 })
                .textAlign(TextAlign.Center)
                .fontSize(10)
                .fontColor(Color.White)
                .fontWeight(600)
                .backgroundColor(0x770100)
                .borderRadius(5)
                .width(15)
                .height(14)
            }.width('100%').margin(5)
            Row() {
              Text('2').fontSize(14).fontColor(Color.Red).margin({ left: 10, right: 10 })
              /* 请将$r('app.string.TextHotSearch_textContent_three')替换为实际资源文件，在本示例中该资源文件的
                value值为"我是热搜词条2 我是热搜词条2 我是热搜词条2 我是热搜词条2 我是热搜词条2" */
              Text($r('app.string.TextHotSearch_textContent_three'))
                .fontSize(12)
                .fontColor(Color.Blue)
                .fontWeight(300)
                .constraintSize({ maxWidth: 200 })
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              // 请将$r('app.string.TextHotSearch_textContent_four')替换为实际资源文件，在本示例中该资源文件的value值为"热"
              Text($r('app.string.TextHotSearch_textContent_four'))
                .margin({ left: 6 })
                .textAlign(TextAlign.Center)
                .fontSize(10)
                .fontColor(Color.White)
                .fontWeight(600)
                .backgroundColor(0xCC5500)
                .borderRadius(5)
                .width(15)
                .height(14)
            }.width('100%').margin(5)
            Row() {
              Text('3').fontSize(14).fontColor(Color.Orange).margin({ left: 10, right: 10 })
              // 请将$r('app.string.TextHotSearch_textContent_five')替换为实际资源文件，在本示例中该资源文件的value值为"我是热搜词条3"
              Text($r('app.string.TextHotSearch_textContent_five'))
                .fontSize(12)
                .fontColor(Color.Blue)
                .fontWeight(300)
                .maxLines(1)
                .constraintSize({ maxWidth: 200 })
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              // 请将$r('app.string.TextHotSearch_textContent_four')替换为实际资源文件，在本示例中该资源文件的value值为"热"
              Text($r('app.string.TextHotSearch_textContent_four'))
                .margin({ left: 6 })
                .textAlign(TextAlign.Center)
                .fontSize(10)
                .fontColor(Color.White)
                .fontWeight(600)
                .backgroundColor(0xCC5500)
                .borderRadius(5)
                .width(15)
                .height(14)
            }.width('100%').margin(5)
            Row() {
              Text('4').fontSize(14).fontColor(Color.Grey).margin({ left: 10, right: 10 })
              /* 请将$r('app.string.TextHotSearch_textContent_six')替换为实际资源文件，在本示例中该资源文件的
                value值为"我是热搜词条4 我是热搜词条4 我是热搜词条4 我是热搜词条4 我是热搜词条4" */
              Text($r('app.string.TextHotSearch_textContent_six'))
                .fontSize(12)
                .fontColor(Color.Blue)
                .fontWeight(300)
                .constraintSize({ maxWidth: 200 })
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }.width('100%').margin(5)
          }.width('100%')
        // ...
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    // ...
  }
}
```

[TextHotSearch.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/TextComponent/entry/src/main/ets/pages/text/TextHotSearch.ets#L16-L124)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cb/v3/Sbc2YqkAQOq5tugZ22o3LQ/zh-cn_image_0000002557924921.png?HW-CC-KV=V1&HW-CC-Date=20260312T083615Z&HW-CC-Expire=86400&HW-CC-Sign=6D4BD13F26D7C00D8B5E4E4B26153FF9C10378C0080EB48F198CCF28EECA9F53)

## 示例代码

-   [文字特效合集](https://gitcode.com/HarmonyOS_Samples/text-effects)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-text-display*