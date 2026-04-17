---
title: 线性布局 (Row/Column)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-linear
category: 指南
updated_at: 2026-03-12T08:32:47.084Z
---

# 线性布局 (Row/Column)

## 概述

线性布局（LinearLayout）是开发中最常用的布局，通过线性容器[Row](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-row)和[Column](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-column)构建。线性布局是其他布局的基础，其子元素在线性方向上（水平方向和垂直方向）依次排列。线性布局的排列方向由所选容器组件决定，Row容器内子元素按照水平方向排列，Column容器内子元素按照垂直方向排列。根据不同的排列方向，开发者可选择使用Row或Column容器创建线性布局。

说明

在复杂界面中使用多组件嵌套时，若布局组件的嵌套层数过深或嵌套的组件数量过多，将会产生额外开销。建议通过移除冗余节点、利用布局边界减少布局计算、合理采用渲染控制语法及布局组件方法来优化性能。最佳实践请参考[布局优化指导](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-improve-layout-performance)。

**图1** Column容器内子元素排列示意图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/3gRI9fUtTD2s2ov7ceY2Uw/zh-cn_image_0000002526884968.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=7C698109F33277D7492CB616C569FDB172074288BF7A61B0E3C4C2DA914C8191)

**图2** Row容器内子元素排列示意图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/68/v3/GU7Sb5_JSdSvGY8s068-Cg/zh-cn_image_0000002557924815.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=60992ED42BE483B22FB55347DB14F4CFBD3C381EA8919F21FFBA7081E30C158C)

## 基本概念

-   布局容器：具有布局能力的容器组件，可以承载其他元素作为其子元素，布局容器会对其子元素进行尺寸计算和布局排列。
    
-   布局子元素：布局容器内部的元素。
    
-   主轴：线性布局容器在布局方向上的轴线，子元素默认沿主轴排列。Row容器主轴为水平方向，Column容器主轴为垂直方向（图示可参考弹性布局[基本概念](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-flex-layout#基本概念)中的主轴）。
    
-   交叉轴：垂直于主轴方向的轴线。Row容器交叉轴为垂直方向，Column容器交叉轴为水平方向（图示可参考弹性布局[基本概念](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-flex-layout#基本概念)中的交叉轴）。
    
-   间距：布局子元素的间距。
    

## 布局子元素在排列方向上的间距

在布局容器内，可以通过space属性设置排列方向上子元素的间距，使各子元素在排列方向上有等间距效果。

### Column容器内排列方向上的间距

**图3** Column容器内排列方向的间距图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cb/v3/FbBT3-CDQOOZiqT6tTgC4g/zh-cn_image_0000002527044900.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=C1690B40BEC015416300F2C3AC309135D4ED940493775B56974D4929BF165EDC)

```TypeScript
Column({ space: 20 }) {
  Text('space: 20').fontSize(15).fontColor(Color.Gray).width('90%')
  Row().width('90%').height(50).backgroundColor(0xF5DEB3)
  Row().width('90%').height(50).backgroundColor(0xD2B48C)
  Row().width('90%').height(50).backgroundColor(0xF5DEB3)
}.width('100%')
```

[ColumnLayoutExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutExample.ets#L20-L27)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/R2bFYKlFRsyFYWYsUiXj_w/zh-cn_image_0000002558044781.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=0CA80FF842FD5C544D9EE6CD7D9A442D293B228785C42BE7074376D2DB2731F1)

### Row容器内排列方向上的间距

**图4** Row容器内排列方向的间距图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/5n74b2n4T9uI3pFwy03Q6w/zh-cn_image_0000002526884970.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=2FF642BB59170067F2FBAE24058340E42222F6587024444DBCCA14F59325900B)

```TypeScript
Row({ space: 35 }) {
  Text('space: 35').fontSize(15).fontColor(Color.Gray)
  Row().width('10%').height(150).backgroundColor(0xF5DEB3)
  Row().width('10%').height(150).backgroundColor(0xD2B48C)
  Row().width('10%').height(150).backgroundColor(0xF5DEB3)
}.width('90%')
```

[RowLayoutExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutExample.ets#L20-L27)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b9/v3/QQmV-aWtQ8SnzmUyGK8FMA/zh-cn_image_0000002557924817.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=F39DC80ECE3C1C6E9803297374C418116915A6AC305CACF29EFC7EAE4B33715E)

## 布局子元素在主轴上的排列方式

在布局容器内，可以通过[justifyContent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-column#justifycontent8)属性设置子元素在容器主轴上的排列方式。可以从主轴起始位置开始排布，也可以从主轴结束位置开始排布，或者均匀分割主轴的空间。

### Column容器内子元素在垂直方向上的排列

**图5** Column容器内子元素在垂直方向上的排列图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7e/v3/pYzjN_ctR_2gHbNo9NXM5Q/zh-cn_image_0000002527044902.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=C972EE4A9EA03CB43FFDF9D8F65518A6B5429A845EFFD61AC5F7D96093B4DEA7)

-   justifyContent(FlexAlign.Start，默认值)：元素在垂直方向首端对齐，第一个元素与行首对齐，同时后续的元素与前一个对齐。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.Start)
    ```
    
    [ColumnLayoutJustifyContentStart.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutJustifyContentStart.ets#L20-L70)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d5/v3/ytKhM0WITKK8p7Hxrdx4BA/zh-cn_image_0000002558044783.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=DC6508821E278208B6150619569B21185385B313B031AAC9D5DAEDC6D6880C4D)
    
-   justifyContent(FlexAlign.Center)：元素在垂直方向中心对齐，第一个元素与行首的距离与最后一个元素与行尾距离相同。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.Center)
    ```
    
    [ColumnLayoutJustifyContentCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutJustifyContentCenter.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a0/v3/hJEgy2tDRm-TCC60bOFc4A/zh-cn_image_0000002526884972.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=1DE99A605EB27CF4E12BD2A534AFF056DAD056A870721C89A385445414509DA2)
    
-   justifyContent(FlexAlign.End)：元素在垂直方向尾部对齐，最后一个元素与行尾对齐，其他元素与后一个对齐。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.End)
    ```
    
    [ColumnLayoutJustifyContentEnd.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutJustifyContentEnd.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/ql2Af1HJSg2tISlCfy0K0w/zh-cn_image_0000002557924819.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=392321A492A0B689DD251C86A191CE1A53684F2A1337055FB433F7EBB19767EF)
    
-   justifyContent(FlexAlign.SpaceBetween)：垂直方向均匀分配元素，相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.SpaceBetween)
    ```
    
    [ColumnLayoutJustifyContentSpaceBetween.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutJustifyContentSpaceBetween.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cf/v3/MCAgSq_xQsqU035UK2Lf_Q/zh-cn_image_0000002527044904.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=84334565699A00454A2AEE9F84259C36BF13F741353D1B16266035A36D6FA241)
    
-   justifyContent(FlexAlign.SpaceAround)：垂直方向均匀分配元素，相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.SpaceAround)
    ```
    
    [ColumnLayoutJustifyContentSpaceAround.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutJustifyContentSpaceAround.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/HpcQxac7RF2WAh4R_2L_lw/zh-cn_image_0000002558044785.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=5ADB42FB26359BA7026B105374C15A1CE5B733FC6689D0EF45A8BCC8061D78B9)
    
-   justifyContent(FlexAlign.SpaceEvenly)：垂直方向均匀分配元素，相邻元素之间的距离、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').height(300).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.SpaceEvenly)
    ```
    
    [ColumnLayoutJustifyContentSpaceEvenly.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ColumnLayoutJustifyContentSpaceEvenly.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d8/v3/C2vUPpIXQQWHDozfW3VFPw/zh-cn_image_0000002526884974.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=87336D70FD27AE176356EB879BE2842EA7DCF6647392A5842624AF4DBFE42C47)
    

### Row容器内子元素在水平方向上的排列

**图6** Row容器内子元素在水平方向上的排列图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0e/v3/SuS7g-JWSbOuAZZwiN1Stw/zh-cn_image_0000002557924821.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=23AC75C2AA699FFA07B95EE4FF9EE0167D0443E67A2F417B6EBCF5AE9846E5EB)

-   justifyContent(FlexAlign.Start，默认值)：元素在水平方向首端对齐，第一个元素与行首对齐，同时后续的元素与前一个对齐。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.Start)
    ```
    
    [RowLayoutJustifyContentStart.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutJustifyContentStart.ets#L20-L109)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/92/v3/vFCNFmOnSva-MN5TsVr4tQ/zh-cn_image_0000002527044906.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=8DB9CEDB66D2E17EA1A22FF8A91B35DB2E2E31390D965DE24EED72116DA525D1)
    
-   justifyContent(FlexAlign.Center)：元素在水平方向中心对齐，第一个元素与行首的距离与最后一个元素与行尾距离相同。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.Center)
    ```
    
    [RowLayoutJustifyContentCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutJustifyContentCenter.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8d/v3/deHhIBJ7QnuGfdwyUaNEmA/zh-cn_image_0000002558044787.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=A0136FA157FA32171EAD46033B8BC37B6D1E606F2E2F0615DBA47F9E164439C0)
    
-   justifyContent(FlexAlign.End)：元素在水平方向尾部对齐，最后一个元素与行尾对齐，其他元素与后一个对齐。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.End)
    ```
    
    [RowLayoutJustifyContentEnd.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutJustifyContentEnd.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a2/v3/GSH4CrGdTvKxXNK7BC5NTg/zh-cn_image_0000002526884976.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=1BF5A606EB9E89282BE93F19177CB9285AF8C0F1CE33C878790C2C0A8FD41DA2)
    
-   justifyContent(FlexAlign.SpaceBetween)：水平方向均匀分配元素，相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.SpaceBetween)
    ```
    
    [RowLayoutJustifyContentSpaceBetween.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutJustifyContentSpaceBetween.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7f/v3/mhO1KNI6SsyfNvSvMLUs4Q/zh-cn_image_0000002557924823.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=8AD4B08798BA3E5F0FC099FDCC5A0FD6EC4401E78380338D9B31357FADF154CB)
    
-   justifyContent(FlexAlign.SpaceAround)：水平方向均匀分配元素，相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.SpaceAround)
    ```
    
    [RowLayoutJustifyContentSpaceAround.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutJustifyContentSpaceAround.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8/v3/FsK6tu1BSnau9NcencRLhQ/zh-cn_image_0000002527044908.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=092CE197EE917E40C33341066AEDAE4A5CBC01A7B83A79032B99D93D7FD76262)
    
-   justifyContent(FlexAlign.SpaceEvenly)：水平方向均匀分配元素，相邻元素之间的距离、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).backgroundColor('rgb(242,242,242)').justifyContent(FlexAlign.SpaceEvenly)
    ```
    
    [RowLayoutJustifyContentSpaceEvenly.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutJustifyContentSpaceEvenly.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/YXgFgmUgT9aDU4-sHtw7MA/zh-cn_image_0000002558044789.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=2C48CFAB148B32ED65E4B0D37493FEF8AFB25D44528A3199545827C0631DF2BA)
    

## 布局子元素在交叉轴上的对齐方式

在布局容器内，可以通过[alignItems](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-column#alignitems)属性设置子元素在交叉轴（排列方向的垂直方向）上的对齐方式，且在各类尺寸屏幕中表现一致。其中，交叉轴为垂直方向时，取值为[VerticalAlign](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-appendix-enums#verticalalign)类型，水平方向取值为[HorizontalAlign](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-appendix-enums#horizontalalign)类型。

[alignSelf](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-flex-layout#alignself)属性用于控制单个子元素在容器交叉轴上的对齐方式，其优先级高于alignItems属性，如果设置了alignSelf属性，则在单个子元素上会覆盖alignItems属性。

### Column容器内子元素在水平方向上的排列

**图7** Column容器内子元素在水平方向上的排列图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2e/v3/E_A_6hXASMO_8isUwBo7vA/zh-cn_image_0000002526884978.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=C363F9BCFA71FF70AF74586977F27C66B5918A09A4C696D741594DD2DCDC55D1)

-   HorizontalAlign.Start：子元素在水平方向左对齐。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').alignItems(HorizontalAlign.Start).backgroundColor('rgb(242,242,242)')
    ```
    
    [RowLayoutHorizontalAlignStart.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutHorizontalAlignStart.ets#L20-L57)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/22/v3/VakiI79qQz6ZazFdmMCafw/zh-cn_image_0000002557924825.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=5DE95FC7ECD909ABAFD03D5065D7A3E7CA76F53FAF1174BA9868DB6F0A4194FC)
    
-   HorizontalAlign.Center（默认值）：子元素在水平方向居中对齐。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').alignItems(HorizontalAlign.Center).backgroundColor('rgb(242,242,242)')
    ```
    
    [RowLayoutHorizontalAlignCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutHorizontalAlignCenter.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/02/v3/HKABYqaKT0GlN6aF8fcjXQ/zh-cn_image_0000002527044910.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=C23823E214F47AFA835DFE614F797B7C6DBD1CD2AC817E598C73D6CC2AC756CB)
    
-   HorizontalAlign.End：子元素在水平方向右对齐。
    
    ```TypeScript
    Column({}) {
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
      Column() {
      }.width('80%').height(50).backgroundColor(0xD2B48C)
      Column() {
      }.width('80%').height(50).backgroundColor(0xF5DEB3)
    }.width('100%').alignItems(HorizontalAlign.End).backgroundColor('rgb(242,242,242)')
    ```
    
    [RowLayoutHorizontalAlignEnd.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutHorizontalAlignEnd.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/77/v3/_wJuXIuvSsWBYbY4iLyj8w/zh-cn_image_0000002558044791.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=32587008D8EE480ABC3918B4870BB91C35A66235DCA842ECD0C7B679A9A9BB45)
    

### Row容器内子元素在垂直方向上的排列

**图8** Row容器内子元素在垂直方向上的排列图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4e/v3/e0-E5Lq6SiGzJOIj1DHfxg/zh-cn_image_0000002526884980.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=F1A6486D0732EC39F96604EEEBFBB087530C713887AD5BFCBDA1E86C5A2A05E0)

-   VerticalAlign.Top：子元素在垂直方向顶部对齐。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).alignItems(VerticalAlign.Top).backgroundColor('rgb(242,242,242)')
    ```
    
    [RowLayoutVerticalAlignTop.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutVerticalAlignTop.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/wHnIhFZYRqeAZxPxQ83_kQ/zh-cn_image_0000002557924827.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=750D48BAAAE215325DF80AF79D2FC5A10E48D41434FBF2D5AC8A2E60D803FDA6)
    
-   VerticalAlign.Center（默认值）：子元素在垂直方向居中对齐。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).alignItems(VerticalAlign.Center).backgroundColor('rgb(242,242,242)')
    ```
    
    [RowLayoutVerticalAlignCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutVerticalAlignCenter.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/39/v3/AAqcXZ-DSmWJoItDktdeZg/zh-cn_image_0000002527044912.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=78FE6BDD2C295B960079C1A79C9E429F710A861B4E7B684B32A535F5CFA6384C)
    
-   VerticalAlign.Bottom：子元素在垂直方向底部对齐。
    
    ```TypeScript
    Row({}) {
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
      Column() {
      }.width('20%').height(30).backgroundColor(0xD2B48C)
      Column() {
      }.width('20%').height(30).backgroundColor(0xF5DEB3)
    }.width('100%').height(200).alignItems(VerticalAlign.Bottom).backgroundColor('rgb(242,242,242)')
    ```
    
    [RowLayoutVerticalAlignBottom.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/RowLayoutVerticalAlignBottom.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/P0JHT4LTRhyue5nd0G9BPg/zh-cn_image_0000002558044793.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=8B4C9D5E18D5E8606A8761160238AB4D5A50E3C7E7D10A7D5278B2EAFB92FEBF)
    

## 自适应拉伸

在线性布局下，常用空白填充组件[Blank](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-blank)，在容器主轴方向自动填充空白空间，达到自适应拉伸效果。Row和Column作为容器，只需要添加宽高为百分比，当屏幕宽高发生变化时，会产生自适应效果。

```TypeScript
@Entry
@Component
struct BlankExample {
  build() {
    Column() {
      Row() {
        Text('Bluetooth').fontSize(18)
        Blank()
        Toggle({ type: ToggleType.Switch, isOn: true })
      }.backgroundColor(0xFFFFFF).borderRadius(15).padding({ left: 12 }).width('100%')
    }.backgroundColor(0xEFEFEF).padding(20).width('100%')
  }
}
```

[BlankExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/BlankExample.ets#L15-L29)

**图9** 竖屏（自适应屏幕窄边）

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d6/v3/Fpl0iSKySFqjay2vaFbKwQ/zh-cn_image_0000002526884982.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=D4D9118CCE774ACAE28C5C96662D0523CB71E9BAA94D618DF96BADFD7342EB2A)

**图10** 横屏（自适应屏幕宽边）

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3d/v3/pgdYb94vSpSfzuy4CrTxxw/zh-cn_image_0000002557924829.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=711F71BB2BBE2ACAEDF80BC01C96CA7373A7B2CAB4F741249EC3B2949067EAD8)

## 自适应缩放

自适应缩放是指子元素随容器尺寸的变化而按照预设的比例自动调整尺寸，适应各种不同大小的设备。在线性布局中，可以使用以下两种方法实现自适应缩放。

-   父容器尺寸确定时，使用[layoutWeight](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-size#layoutweight)属性设置子元素和兄弟元素在主轴上的权重，忽略元素本身尺寸设置，使它们在任意尺寸的设备下自适应占满剩余空间。
    
    ```TypeScript
    @Entry
    @Component
    struct LayoutWeightExample {
      build() {
        Column() {
          Text('1:2:3').width('100%')
          Row() {
            Column() {
              Text('layoutWeight(1)')
                .textAlign(TextAlign.Center)
            }.layoutWeight(1).backgroundColor(0xF5DEB3).height('100%')
            Column() {
              Text('layoutWeight(2)')
                .textAlign(TextAlign.Center)
            }.layoutWeight(2).backgroundColor(0xD2B48C).height('100%')
            Column() {
              Text('layoutWeight(3)')
                .textAlign(TextAlign.Center)
            }.layoutWeight(3).backgroundColor(0xF5DEB3).height('100%')
          }.backgroundColor(0xffd306).height('30%')
          Text('2:5:3').width('100%')
          Row() {
            Column() {
              Text('layoutWeight(2)')
                .textAlign(TextAlign.Center)
            }.layoutWeight(2).backgroundColor(0xF5DEB3).height('100%')
            Column() {
              Text('layoutWeight(5)')
                .textAlign(TextAlign.Center)
            }.layoutWeight(5).backgroundColor(0xD2B48C).height('100%')
            Column() {
              Text('layoutWeight(3)')
                .textAlign(TextAlign.Center)
            }.layoutWeight(3).backgroundColor(0xF5DEB3).height('100%')
          }.backgroundColor(0xffd306).height('30%')
        }
      }
    }
    ```
    
    [LayoutWeightExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/LayoutWeightExample.ets#L15-L60)
    
    **图11** 横屏
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/17/v3/UBo9WtysSj-sRzQ__zKYJw/zh-cn_image_0000002527044914.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=00ED006E8D0324D48946BEA5F2C6F9373493E6435F8865ACEF868C663B82D793)
    
    **图12** 竖屏
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/22/v3/37igBEZxSUuTPEnZpQdw8A/zh-cn_image_0000002558044795.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=B654CE34B169829A2938C8C63A978A69B31AB0F280FE1B9412B5F0082E9C6DA1)
    
-   父容器尺寸确定时，使用百分比设置子元素和兄弟元素的宽度，使他们在任意尺寸的设备下保持固定的自适应占比。
    
    ```TypeScript
    @Entry
    @Component
    struct WidthExample {
      build() {
        Column() {
          Row() {
            Column() {
              Text('left width 20%')
                .textAlign(TextAlign.Center)
            }.width('20%').backgroundColor(0xF5DEB3).height('100%')
            Column() {
              Text('center width 50%')
                .textAlign(TextAlign.Center)
            }.width('50%').backgroundColor(0xD2B48C).height('100%')
            Column() {
              Text('right width 30%')
                .textAlign(TextAlign.Center)
            }.width('30%').backgroundColor(0xF5DEB3).height('100%')
          }.backgroundColor(0xffd306).height('30%')
        }
      }
    }
    ```
    
    [WidthExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/WidthExample.ets#L15-L40)
    
    **图13** 横屏
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/25sktKUyR3e2QJ72fephcw/zh-cn_image_0000002526884984.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=70D6EE8598864C6FC157E99236C9DF168149B4A8DD360F96859552216DDE3E52)
    
    **图14** 竖屏
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e2/v3/70DIwyEVRw2eNJcD91o_-A/zh-cn_image_0000002557924831.png?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=20D574B766712469E33562459C7B523CDC7157250C8D3A2E993808F5172FA23E)
    

## 自适应延伸

自适应延伸是指在不同尺寸设备下，当页面的内容超出屏幕大小而无法完全显示时，可以通过滚动条进行拖动展示。对于线性布局，这种方法适用于容器中内容无法一屏展示的场景。通常有以下两种实现方式。

-   [在List中添加滚动条](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-create-list#添加滚动条)：当List子项过多一屏放不下时，可以将每一项子元素放置在不同的组件中，通过滚动条进行拖动展示。可以通过[scrollBar](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-scroll#scrollbar)属性设置滚动条的常驻状态，[edgeEffect](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-scroll#edgeeffect)属性设置拖动到内容最末端的回弹效果。
    
-   使用[Scroll](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-scroll)组件：在线性布局中，开发者可以进行垂直方向或者水平方向的布局。当一屏无法完全显示时，可以在Column或Row组件的外层包裹一个可滚动的容器组件Scroll来实现可滑动的线性布局。
    
    垂直方向布局中使用Scroll组件：
    
    ```TypeScript
    @Entry
    @Component
    struct ScrollVerticalExample {
      scroller: Scroller = new Scroller();
      private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      build() {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item?:number|undefined) => {
              if(item){
                Text(item.toString())
                  .width('90%')
                  .height(150)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 })
              }
            }, (item:number) => item.toString())
          }.width('100%')
        }
        .backgroundColor(0xDCDCDC)
        .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
        .scrollBar(BarState.On) // 滚动条常驻显示
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .scrollBarWidth(10) // 滚动条宽度
        .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
      }
    }
    ```
    
    [ScrollVerticalExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ScrollVerticalExample.ets#L15-L47)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/84/v3/C8a-8lyBSmqY27hRyrseMw/zh-cn_image_0000002527044916.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=0C1FFDBA3AF1EC3739A2F50C07C08CC06424C1C58CFDD9CF2C04425A11ED447B)
    
    水平方向布局中使用Scroll组件：
    
    ```TypeScript
    @Entry
    @Component
    struct ScrollHorizontalExample {
      scroller: Scroller = new Scroller();
      private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      build() {
        Scroll(this.scroller) {
          Row() {
            ForEach(this.arr, (item?:number|undefined) => {
              if(item){
                Text(item.toString())
                  .height('90%')
                  .width(150)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ left: 10 })
              }
            })
          }.height('100%')
        }
        .backgroundColor(0xDCDCDC)
        .scrollable(ScrollDirection.Horizontal) // 滚动方向为水平方向
        .scrollBar(BarState.On) // 滚动条常驻显示
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .scrollBarWidth(10) // 滚动条宽度
        .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
      }
    }
    ```
    
    [ScrollHorizontalExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/linearlayout/ScrollHorizontalExample.ets#L15-L47)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/72/v3/vFzvXfpzS5qTfjdpF8OC4g/zh-cn_image_0000002558044797.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083221Z&HW-CC-Expire=86400&HW-CC-Sign=3B411E83A87304E591445C93B6D3E17956D51C4D5487AFF7A4BDA253F9DA81B4)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-linear*