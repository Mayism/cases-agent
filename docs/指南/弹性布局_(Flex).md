---
title: 弹性布局 (Flex)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-flex-layout
category: 指南
updated_at: 2026-03-12T08:33:39.611Z
---

# 弹性布局 (Flex)

## 概述

弹性布局（[Flex](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-flex)）提供更加有效的方式对容器中的子元素进行排列、对齐和分配剩余空间。常用于页面头部导航栏的均匀分布、页面框架的搭建、多行数据的排列等。

容器默认存在主轴与交叉轴，子元素默认沿主轴排列，子元素在主轴方向的尺寸称为主轴尺寸，在交叉轴方向的尺寸称为交叉轴尺寸。

**图1** 主轴为水平方向的Flex容器示意图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/78/v3/A7AttSV4To63vxdMr36anQ/zh-cn_image_0000002527044920.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=3B52D82A615D576A11885D65EB2F9C10850E401319509E840763168884ADF6D1)

## 基本概念

-   主轴：Flex组件布局方向的轴线，子元素默认沿着主轴排列。主轴开始的位置称为主轴起始点，结束位置称为主轴结束点。
    
-   交叉轴：垂直于主轴方向的轴线。交叉轴开始的位置称为交叉轴起始点，结束位置称为交叉轴结束点。
    

## 布局方向

在弹性布局中，容器的子元素可以按照任意方向排列。通过设置[FlexOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-flex#flexoptions对象说明)的参数direction，可以决定主轴的方向，从而控制子元素的排列方向。

**图2** 弹性布局方向图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b7/v3/UT_nBSwfTn6fVQBlpg8ouA/zh-cn_image_0000002558044801.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=EA72A8ABE8AFDB2629DEEEF46C4BB0AA5885210787BF5BE58907A3101CF655EF)

-   FlexDirection.Row（默认值）：主轴为水平方向，子元素从起始端沿着水平方向开始排布。
    
    ```TypeScript
    Flex({ direction: FlexDirection.Row }) {
      Text('1').width('33%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(50).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .height(70)
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexDirectionRow.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexDirectionRow.ets#L20-L30)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a1/v3/5YnUptv0R0WQuRDugnhOSw/zh-cn_image_0000002526884990.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=7A02AF25F25E4B99724ABA8D84864BDBECB61A75C931BFEDB17A9D6261FEF913)
    
-   FlexDirection.RowReverse：主轴为水平方向，子元素从终点端沿着FlexDirection.Row相反的方向开始排布。
    
    ```TypeScript
    Flex({ direction: FlexDirection.RowReverse }) {
      Text('1').width('33%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(50).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .height(70)
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexDirectionRowReverse.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexDirectionRowReverse.ets#L20-L30)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/81/v3/BBsBRSN0RUGnytLjlCompg/zh-cn_image_0000002557924837.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=03295AD7694098DFB90A3BC68C0EB0F31EFF792BB9EA24F6C73767345A3C51D3)
    
-   FlexDirection.Column：主轴为垂直方向，子元素从起始端沿着垂直方向开始排布。
    
    ```TypeScript
    Flex({ direction: FlexDirection.Column }) {
      Text('1').width('100%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('100%').height(50).backgroundColor('#D2B48C')
      Text('3').width('100%').height(50).backgroundColor('#F5DEB3')
    }
    .height(70)
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexDirectionColumn.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexDirectionColumn.ets#L20-L30)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b5/v3/7eCRSxoUT4GZTo5Tej5evA/zh-cn_image_0000002527044922.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=24D772C3F9FA6A9DEDA8B5BEA86DF8D5288886EB753C920DDF4E709C33AC0DF3)
    
-   FlexDirection.ColumnReverse：主轴为垂直方向，子元素从终点端沿着FlexDirection.Column相反的方向开始排布。
    
    ```TypeScript
    Flex({ direction: FlexDirection.ColumnReverse }) {
      Text('1').width('100%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('100%').height(50).backgroundColor('#D2B48C')
      Text('3').width('100%').height(50).backgroundColor('#F5DEB3')
    }
    .height(70)
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexDirectionColumnReverse.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexDirectionColumnReverse.ets#L20-L30)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/df/v3/SOJId6d3TlK6kop8eRFm7w/zh-cn_image_0000002558044803.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=AECF9077AF18F4DB7383C6F0A31578A1A8F3E279A441F74DE707C1A971CA235A)
    

## 布局换行

弹性布局分为单行布局和多行布局。默认情况下，Flex容器中的子元素都排在一条线（又称“轴线”）上。wrap属性控制当子元素主轴尺寸之和大于容器主轴尺寸时，Flex是单行布局还是多行布局。在多行布局时，通过交叉轴方向，确认新行排列方向。

-   FlexWrap.NoWrap（默认值）：不换行。如果子元素的宽度总和大于父元素的宽度，则子元素会被压缩宽度。
    
    ```TypeScript
    Flex({ wrap: FlexWrap.NoWrap }) {
      Text('1').width('50%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('50%').height(50).backgroundColor('#D2B48C')
      Text('3').width('50%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexWrapNoWrap.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexWrapNoWrap.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c3/v3/4u3GaFTYTBSAU2FR4wfU4A/zh-cn_image_0000002526884992.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=53E90B27C661DCFA43A25EFBD4D18E993C39CABC48C9573A9EBBEB85B3164D60)
    
-   FlexWrap.Wrap：换行，每一行子元素按照主轴方向排列。
    
    ```TypeScript
    Flex({ wrap: FlexWrap.Wrap }) {
      Text('1').width('50%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('50%').height(50).backgroundColor('#D2B48C')
      Text('3').width('50%').height(50).backgroundColor('#D2B48C')
    }
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexWrapWrap.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexWrapWrap.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/75/v3/Itky4knER3iNxiwxOAXINA/zh-cn_image_0000002557924839.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=38D8DB70B27F5EA6B53C239CF8FFE5FB8A7940D582812C37B171E554A7FA786A)
    
-   FlexWrap.WrapReverse：换行，每一行子元素按照主轴反方向排列。
    
    ```TypeScript
    Flex({ wrap: FlexWrap.WrapReverse}) {
      Text('1').width('50%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('50%').height(50).backgroundColor('#D2B48C')
      Text('3').width('50%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexWrapWrapReverse.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexWrapWrapReverse.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/bAlLwtaBTJCPzNbQ3d8C-Q/zh-cn_image_0000002527044924.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=A5BDA8F23EB40DE264F90CBE4AFE41D514B757DEDB3CC4F2FFEF35398364A535)
    

## 主轴对齐方式

通过justifyContent参数设置子元素在主轴方向的对齐方式。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5/v3/3us3MjvLRr-qW7Rxj2jAPw/zh-cn_image_0000002558044805.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=111D96FD82B565983CD7E42E268F21E8281E643362BEA3CEDF6EB4BD24795CC1)

-   FlexAlign.Start（默认值）：子元素在主轴方向起始端对齐， 第一个子元素与父元素边沿对齐，其他元素与前一个元素对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.Start }) {
      Text('1').width('20%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('20%').height(50).backgroundColor('#D2B48C')
      Text('3').width('20%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignStart.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignStart.ets#L20-L19)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/MiDXIlUFRp6QicUdCya79g/zh-cn_image_0000002526884994.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=EDEC1A3CADBCE8263FF54C70869724A092681655A2D1BA9A9C67B07DFA6639EB)
    
-   FlexAlign.Center：子元素在主轴方向居中对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.Center }) {
      Text('1').width('20%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('20%').height(50).backgroundColor('#D2B48C')
      Text('3').width('20%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenter.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/3Z_TQ6ScTfqkoCBBavRFxA/zh-cn_image_0000002557924841.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=2C4E5DBEBC6FE02406D053E53848E76C8BD1D6BB5A950E4C28304F4B5314ADCC)
    
-   FlexAlign.End：子元素在主轴方向终点端对齐，最后一个子元素与父元素边沿对齐，其他元素与后一个元素对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.End }) {
      Text('1').width('20%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('20%').height(50).backgroundColor('#D2B48C')
      Text('3').width('20%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignEnd.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignEnd.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e4/v3/BnPFHVR_QESwHtvDNUGVrQ/zh-cn_image_0000002527044926.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=138CF40E224A89F7EBF2EF37D477E1B2ED79CE8ABE6C54291B9B8A9D383154F7)
    
-   FlexAlign.SpaceBetween：Flex主轴方向均匀分配弹性元素，相邻子元素之间距离相同。第一个子元素和最后一个子元素与父元素边沿对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      Text('1').width('20%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('20%').height(50).backgroundColor('#D2B48C')
      Text('3').width('20%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignSpaceBetween.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignSpaceBetween.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cb/v3/ucE-k4ayQuqduiVWriVWqA/zh-cn_image_0000002558044807.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=46A36A7D0A28C3C05EDFE5A8BB1CA322E35902F494D2A93A7E40525D80743A75)
    
-   FlexAlign.SpaceAround：Flex主轴方向均匀分配弹性元素，相邻子元素之间距离相同。第一个子元素到主轴起始端的距离和最后一个子元素到主轴终点端的距离是相邻元素之间距离的一半。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Text('1').width('20%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('20%').height(50).backgroundColor('#D2B48C')
      Text('3').width('20%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignSpaceAround.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignSpaceAround.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/75/v3/nDwicP3AQdqEcISyb9em7w/zh-cn_image_0000002526884996.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=FC633D4B4E5B15B8B7A662BF5F91D73BDEC28A9FAB560F2F45D6C0FD9CCCF912)
    
-   FlexAlign.SpaceEvenly：Flex主轴方向元素等间距布局，相邻子元素之间的间距、第一个子元素与主轴起始端的间距、最后一个子元素到主轴终点端的间距均相等。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
      Text('1').width('20%').height(50).backgroundColor('#F5DEB3')
      Text('2').width('20%').height(50).backgroundColor('#D2B48C')
      Text('3').width('20%').height(50).backgroundColor('#F5DEB3')
    }
    .width('90%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignSpaceEvenly.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignSpaceEvenly.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b0/v3/ehzYJsIdSkiiTnOqfQhmqw/zh-cn_image_0000002557924843.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=24463FDDB056600420E54425D2A3E5FE2EC7F77D4F1DEB8EC0563BF75E6078EC)
    

## 交叉轴对齐方式

容器和子元素都可以设置交叉轴对齐方式，且子元素设置的对齐方式优先级较高。

### 容器组件设置交叉轴对齐

可以通过设置[FlexOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-flex#flexoptions对象说明)的参数alignItems，设置子元素在交叉轴的对齐方式。

-   ItemAlign.Auto：使用Flex容器中默认配置。
    
    ```TypeScript
    Flex({ alignItems: ItemAlign.Auto }) {
      Text('1').width('33%').height(30).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(40).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexItemAlignAuto.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexItemAlignAuto.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/53/v3/Jfy3aUPjTf-uSNTj0ApYgQ/zh-cn_image_0000002527044928.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=D17975562DBA0876B117629B76DBAD089D818A6026D151AF691010E29A5CF50E)
    
-   ItemAlign.Start：交叉轴方向首部对齐。
    
    ```TypeScript
    Flex({ alignItems: ItemAlign.Start }) {
      Text('1').width('33%').height(30).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(40).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexItemAlignStart.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexItemAlignStart.ets#L20-L72)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4f/v3/_wLouKJ7SPuEgBlwNYg2iQ/zh-cn_image_0000002558044809.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=0F240DAEF0F5F580DB15138F47EF69BBF820B1FB2655D4F9ED990DF0934E758F)
    
-   ItemAlign.Center：交叉轴方向居中对齐。
    
    ```TypeScript
    Flex({ alignItems: ItemAlign.Center }) {
      Text('1').width('33%').height(30).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(40).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexItemAlignCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexItemAlignCenter.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b0/v3/rTXc5ADTQUyTJHH_VaoAqg/zh-cn_image_0000002526884998.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=B7A681A6E06D6A3FB81A0645D4D7EBD5406EEAC1DE9B997C48FE2F4BA22DAE04)
    
-   ItemAlign.End：交叉轴方向底部对齐。
    
    ```TypeScript
    Flex({ alignItems: ItemAlign.End }) {
      Text('1').width('33%').height(30).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(40).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexItemAlignEnd.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexItemAlignEnd.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9d/v3/43OyicC6SDSDajJbyAEYow/zh-cn_image_0000002557924845.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=5D3A275BCB47D12526058043B9DFCDDFA5AAD9C9C6E7C43D25A9531EFEB40DFF)
    
-   ItemAlign.Stretch：交叉轴方向拉伸填充，在未设置尺寸时，拉伸到容器尺寸。元素在Flex容器中，沿交叉轴方向拉伸填充。容器为Flex且设置[FlexWrap](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-appendix-enums#flexwrap)为FlexWrap.Wrap或FlexWrap.WrapReverse时，元素拉伸到与当前行或列交叉轴长度最长的元素尺寸。其余情况下，无论元素尺寸是否设置，均拉伸到容器尺寸。
    
    ```TypeScript
    Flex({ alignItems: ItemAlign.Stretch }) {
      Text('1').width('33%').backgroundColor('#F5DEB3')
      Text('2').width('33%').backgroundColor('#D2B48C')
      Text('3').width('33%').backgroundColor('#F5DEB3')
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexItemAlignStretch.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexItemAlignStretch.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9b/v3/QAxcpQHtT-GJDk6vqr145A/zh-cn_image_0000002527044930.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=C03E3696879CECFE73C5CB138D84085E51AF2858872C3921B401FAB015BF696F)
    
-   ItemAlign.Baseline：交叉轴方向文本基线对齐。
    
    ```TypeScript
    Flex({ alignItems: ItemAlign.Baseline }) {
      Text('1').width('33%').height(30).backgroundColor('#F5DEB3')
      Text('2').width('33%').height(40).backgroundColor('#D2B48C')
      Text('3').width('33%').height(50).backgroundColor('#F5DEB3')
    }
    .size({ width: '90%', height: 80 })
    .padding(10)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexItemAlignBaseline.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexItemAlignBaseline.ets#L20-L29)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/98/v3/wRz4zq0RTIO5mDvy3_fzLA/zh-cn_image_0000002558044811.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=F7A9925F0D5717576AA7F5785C4C31D314C75D1C0830B7A961596813BAE78269)
    

### 子元素设置交叉轴对齐

子元素的[alignSelf](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-flex-layout#alignself)属性也可以设置子元素在父容器交叉轴的对齐方式，且会覆盖Flex布局容器中alignItems配置。如下例所示：

```TypeScript
Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) { // 容器组件设置子元素居中
  Text('alignSelf Start').width('25%').height(80)
    .alignSelf(ItemAlign.Start)
    .backgroundColor('#F5DEB3')
  Text('alignSelf Baseline')
    .alignSelf(ItemAlign.Baseline)
    .width('25%')
    .height(80)
    .backgroundColor('#D2B48C')
  Text('alignSelf Baseline').width('25%').height(100)
    .backgroundColor('#F5DEB3')
    .alignSelf(ItemAlign.Baseline)
  Text('no alignSelf').width('25%').height(100)
    .backgroundColor('#D2B48C')
  Text('no alignSelf').width('25%').height(100)
    .backgroundColor('#F5DEB3')
}.width('90%').height(220).backgroundColor('#AFEEEE')
```

[FlexAlignSelf.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignSelf.ets#L20-L39)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5e/v3/T5P_SJBIRFuUK0EGGlkUKQ/zh-cn_image_0000002526885000.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=CE8E401508E1CE6991FA545AB1253E7F6745F1964669E770713E2B4E1E914CF6)

上例中，Flex容器中alignItems设置交叉轴子元素的对齐方式为居中，子元素自身设置了alignSelf属性的情况，覆盖父组件的alignItems值，表现为alignSelf的定义。

### 内容对齐

可以通过[alignContent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-flex#flexoptions对象说明)参数设置子元素各行在交叉轴剩余空间内的对齐方式，只在多行的Flex布局中生效，可选值有：

-   FlexAlign.Start：子元素各行与交叉轴起点对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.Start }) {
      Text('1').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('2').width('60%').height(20).backgroundColor('#D2B48C')
      Text('3').width('40%').height(20).backgroundColor('#D2B48C')
      Text('4').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('5').width('20%').height(20).backgroundColor('#D2B48C')
    }
    .width('90%')
    .height(100)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenterFlexAlignStart.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenterFlexAlignStart.ets#L20-L37)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/lDrQwNpARzKbsB1qtBRcHg/zh-cn_image_0000002557924847.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=238011CA86DF744C91D02FA544CC6E6BB4B8C8019459473688B73B9995D516FE)
    
-   FlexAlign.Center：子元素各行在交叉轴方向居中对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
      Text('1').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('2').width('60%').height(20).backgroundColor('#D2B48C')
      Text('3').width('40%').height(20).backgroundColor('#D2B48C')
      Text('4').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('5').width('20%').height(20).backgroundColor('#D2B48C')
    }
    .width('90%')
    .height(100)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenterFlexAlignCenter.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenterFlexAlignCenter.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/68/v3/QaaTOCkJRE6breDYUXrzaA/zh-cn_image_0000002527044932.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=E2FFF31E8BF9496259C54E7C672FF85CC3AAABAAA8F6AA6AEE5BE6B7E41B491D)
    
-   FlexAlign.End：子元素各行与交叉轴终点对齐。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceBetween }) {
      Text('1').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('2').width('60%').height(20).backgroundColor('#D2B48C')
      Text('3').width('40%').height(20).backgroundColor('#D2B48C')
      Text('4').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('5').width('20%').height(20).backgroundColor('#D2B48C')
    }
    .width('90%')
    .height(100)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenterFlexAlignSpaceBetween.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenterFlexAlignSpaceBetween.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d9/v3/Cy87s0rxTMOn1ZA1_r81cg/zh-cn_image_0000002558044813.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=3054ADDAD804F6871E0925E99A036FAF758BF4EDB1046C1E082E430946AF9C89)
    
-   FlexAlign.SpaceBetween：子元素各行与交叉轴两端对齐，各行间垂直间距平均分布。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.End }) {
      Text('1').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('2').width('60%').height(20).backgroundColor('#D2B48C')
      Text('3').width('40%').height(20).backgroundColor('#D2B48C')
      Text('4').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('5').width('20%').height(20).backgroundColor('#D2B48C')
    }
    .width('90%')
    .height(100)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenterFlexAlignEnd.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenterFlexAlignEnd.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b6/v3/-qEIOS3cQASMdowfoyTDkg/zh-cn_image_0000002526885002.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=DD1D1002C6364E83965855CBBA5FBF5BE9F466C34829058D1A621F54FE42F8D3)
    
-   FlexAlign.SpaceAround：子元素各行间距相等，是元素首尾行与交叉轴两端距离的两倍。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceAround }) {
      Text('1').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('2').width('60%').height(20).backgroundColor('#D2B48C')
      Text('3').width('40%').height(20).backgroundColor('#D2B48C')
      Text('4').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('5').width('20%').height(20).backgroundColor('#D2B48C')
    }
    .width('90%')
    .height(100)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenterFlexAlignSpaceAround.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenterFlexAlignSpaceAround.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b9/v3/B54-a2NVSEexJ54h1w4Zcg/zh-cn_image_0000002557924849.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=0D87090F32C7286DE06A10D4D5F21C84D14B89264C7ECB11267877DB44FF835F)
    
-   FlexAlign.SpaceEvenly: 子元素各行间距，子元素首尾行与交叉轴两端距离都相等。
    
    ```TypeScript
    Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceEvenly }) {
      Text('1').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('2').width('60%').height(20).backgroundColor('#D2B48C')
      Text('3').width('40%').height(20).backgroundColor('#D2B48C')
      Text('4').width('30%').height(20).backgroundColor('#F5DEB3')
      Text('5').width('20%').height(20).backgroundColor('#D2B48C')
    }
    .width('90%')
    .height(100)
    .backgroundColor('#AFEEEE')
    ```
    
    [FlexAlignCenterFlexAlignSpaceEvenly.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexAlignCenterFlexAlignSpaceEvenly.ets#L20-L31)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/47/v3/9U-_n0L_QTK55wgpwUQhZQ/zh-cn_image_0000002527044934.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=8847DD731F984A9514FDF57EC9198784D4834F7D693425DCA943DDB3980970DB)
    

## 自适应拉伸

在弹性布局父组件尺寸过小时，通过子元素的以下属性设置其在父容器的占比，达到自适应布局。

-   [flexBasis](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-flex-layout#flexbasis)：设置子元素在父容器主轴方向上的基准尺寸。如果设置了该属性，则子项占用的空间为该属性所设置的值；如果没设置该属性，那子项的空间为width/height的值。
    
    ```TypeScript
    Flex() {
      Text('flexBasis("auto")')
        .flexBasis('auto')// 未设置width以及flexBasis值为auto，内容自身宽度
        .height(100)
        .backgroundColor('#F5DEB3')
      Text('flexBasis("auto")'+' width("40%")')
        .width('40%')
        .flexBasis('auto')// 设置width以及flexBasis值auto，使用width的值
        .height(100)
        .backgroundColor('#D2B48C')
      Text('flexBasis(100)') // 未设置width以及flexBasis值为100，宽度为100vp
        .flexBasis(100)
        .height(100)
        .backgroundColor('#F5DEB3')
      Text('flexBasis(100)')
        .flexBasis(100)
        .width(200)// flexBasis值为100，覆盖width的设置值，宽度为100vp
        .height(100)
        .backgroundColor('#D2B48C')
    }.width('90%').height(120).padding(10).backgroundColor('#AFEEEE')
    ```
    
    [FlexBasis.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexBasis.ets#L20-L43)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/79/v3/qwjYJmRZTCyocK3YNCH_-g/zh-cn_image_0000002558044815.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=2EE368A80C315C8337A471827A4DCB3336E55DFC44A8D33C49F1B8DBA72ED3A3)
    
-   [flexGrow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-flex-layout#flexgrow)：设置父容器的剩余空间分配给此属性所在组件的比例，用于分配父组件的剩余空间。下述示例运行需要保证设备为横屏状态，否则运行效果可能存在差异。
    

```TypeScript
  Flex() {
    Text('flexGrow(1)')
      .flexGrow(1)
      .width(100)
      .height(100)
      .backgroundColor('#F5DEB3')
    Text('flexGrow(4)')
      .flexGrow(4)
      .width(100)
      .height(100)
      .backgroundColor('#D2B48C')
    Text('no flexGrow')
      .width(100)
      .height(100)
      .backgroundColor('#F5DEB3')
  }.width(360).height(120).padding(10).backgroundColor('#AFEEEE')
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fd/v3/Y58C6hZqRDCuiHEXxTFA7w/zh-cn_image_0000002526885004.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=0C7148B807BF74C9E7DE7439C48DB696646439FAF58BD047A0A6AB502AF73DD2)

父容器宽度360vp，三个子元素原始宽度均为100vp，左右padding为20vp，总和320vp，剩余空间40vp根据flexGrow值的占比分配给子元素，未设置flexGrow的子元素不参与分配。

第一个元素以及第二个元素以1:4分配剩下的40vp。第一个元素为100vp+40vp \* 1/5=108vp，第二个元素为100vp+40vp \* 4/5=132vp。

-   [flexShrink](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-flex-layout#flexshrink): 当父容器空间不足时，子元素的压缩比例。
    
    ```TypeScript
    Flex({ direction: FlexDirection.Row }) {
      Text('flexShrink(3)')
        .flexShrink(3)
        .width(200)
        .height(100)
        .backgroundColor('#F5DEB3')
      Text('no flexShrink')
        .width(200)
        .height(100)
        .backgroundColor('#D2B48C')
      Text('flexShrink(2)')
        .flexShrink(2)
        .width(200)
        .height(100)
        .backgroundColor('#F5DEB3')
    }.width(400).height(120).padding(10).backgroundColor('#AFEEEE')
    ```
    
    [FlexShrink.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexShrink.ets#L20-L39)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/f8R1Zm0yTSu1A2Fqv-PUGQ/zh-cn_image_0000002557924851.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=32195DAD0D6C4E369A3B783B271D63A8C7205063F4AEA1C9A42EAA0338D71160)
    
    父容器宽度400vp，三个子元素原始宽度为200vp，左右padding为20vp，父容器给子元素的布局空间为380vp，超出父容器空间220vp。
    
    将第一个元素和第三个元素以3:2的压缩比例进行压缩，直至不再超出父容器提供的布局空间。第一个元素为200vp - (220vp / 5) \* 3=68vp，第三个元素为200vp - (220vp / 5) \* 2=112vp。
    

## 场景示例

使用弹性布局，可以实现子元素沿水平方向排列，两端对齐，子元素间距平分，垂直方向上子元素居中的效果。

```TypeScript
@Entry
@Component
struct FlexExample {
  build() {
    Column() {
      Column({ space: 5 }) {
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.NoWrap,
          justifyContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Center
        }) {
          Text('1').width('30%').height(50).backgroundColor('#F5DEB3')
          Text('2').width('30%').height(50).backgroundColor('#D2B48C')
          Text('3').width('30%').height(50).backgroundColor('#F5DEB3')
        }
        .height(70)
        .width('90%')
        .backgroundColor('#AFEEEE')
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}
```

[FlexExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/flexlayout/FlexExample.ets#L15-L39)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8c/v3/KvGv8X9ATy6EHtCgafD3ew/zh-cn_image_0000002527044936.png?HW-CC-KV=V1&HW-CC-Date=20260312T083314Z&HW-CC-Expire=86400&HW-CC-Sign=FE87EE8E6D06016212A6D6CA4D9CB758D9E98DC82F8A56E9AA7D719B4C1C4935)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-flex-layout*