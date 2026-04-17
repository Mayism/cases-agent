---
title: 栅格布局 (GridRow/GridCol)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-grid-layout
category: 指南
updated_at: 2026-03-12T08:34:33.003Z
---

# 栅格布局 (GridRow/GridCol)

## 概述

栅格布局是一种通用的辅助定位工具，对移动设备的界面设计有较好的借鉴作用。主要优势包括：

1.  提供可循的规律：栅格布局可以为布局提供规律性的结构，解决多尺寸多设备的动态布局问题。通过将页面划分为等宽的列数和行数，可以方便地对页面元素进行定位和排版。
    
2.  统一的定位标注：栅格布局可以为系统提供一种统一的定位标注，保证不同设备上各个模块的布局一致性。这可以减少设计和开发的复杂度，提高工作效率。
    
3.  灵活的间距调整方法：栅格布局可以提供一种灵活的间距调整方法，满足特殊场景布局调整的需求。通过调整列与列之间和行与行之间的间距，可以控制整个页面的排版效果。
    
4.  自动换行和自适应：栅格布局可以完成一对多布局的自动换行和自适应。当页面元素的数量超出了一行或一列的容量时，他们会自动换到下一行或下一列，并且在不同的设备上自适应排版，使得页面布局更加灵活和适应性强。
    

[GridRow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow)为栅格容器组件，需与栅格子组件[GridCol](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridcol)在栅格布局场景中联合使用。

## 栅格容器GridRow

### 栅格容器断点

栅格容器以设备的水平宽度（[像素单位](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-pixel-units)，单位vp）作为断点依据，定义设备的宽度类型，形成了一套断点规则。开发者可根据需求在不同的断点区间实现不同的页面布局效果。

栅格容器默认断点将设备宽度分为xs、sm、md、lg四类，尺寸范围如下：

| 断点名称 | 取值范围（vp） | 设备描述 |
| --- | --- | --- |
| xs | [0, 320） | 最小宽度类型设备。 |
| sm | [320, 600) | 小宽度类型设备。 |
| md | [600, 840) | 中等宽度类型设备。 |
| lg | [840, +∞) | 大宽度类型设备。 |

在GridRow栅格组件中，允许开发者使用[BreakPoints](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#breakpoints)自定义修改断点的取值范围，最多支持6个断点，除了默认的4个断点外，还可以启用xl和xxl断点，支持6种不同尺寸（xs，sm，md，lg，xl，xxl）设备的布局设置。

| 断点名称 | 设备描述 |
| --- | --- |
| xs | 最小宽度类型设备。 |
| sm | 小宽度类型设备。 |
| md | 中等宽度类型设备。 |
| lg | 大宽度类型设备。 |
| xl | 特大宽度类型设备。 |
| xxl | 超大宽度类型设备。 |

-   开发者可根据实际使用场景，通过一个单调递增数组设置断点位置。由于栅格容器默认支持4个断点，在不设置断点位置时，系统为默认断点配置的单调递增数组为\["320vp", "600vp", "840vp"\]。开发者使用[BreakPoints](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#breakpoints)最多可支持6个断点，因此此单调递增数组最大长度为5。
    
    假设传入的数组是\[n0, n1, n2, n3, n4\]，则各个断点取值如下：
    
    | 断点 | 取值范围 |
    | --- | --- |
    | xs | [0, n0) |
    | sm | [n0, n1) |
    | md | [n1, n2) |
    | lg | [n2, n3) |
    | xl | [n3, n4) |
    | xxl | [n4, INF) |
    
    ```typescript
    breakpoints: {value: ['100vp', '200vp']} // 表示xs、sm、md共3个断点被使用，小于100vp为xs，100vp-200vp为sm，大于200vp为md。
    breakpoints: {value: ['320vp', '600vp']} // 表示xs、sm、md共3个断点被使用，小于320vp为xs，320vp-600vp为sm，大于600vp为md。
    breakpoints: {value: ['320vp', '600vp', '840vp', '1440vp']} // 表示xs、sm、md、lg、xl共5个断点被使用，小于320vp为xs，320vp-600vp为sm，  600vp-840vp为md，840vp-1440vp为lg，大于1440vp为xl。
    ```
    
-   栅格容器通过监听窗口或容器的尺寸变化进行断点，通过reference设置断点切换参考物。考虑到应用可能以非全屏窗口的形式显示，以应用窗口宽度为参照物更为通用。
    
    例如，通过断点设置将应用宽度分成6个区间，通过columns配置各断点下栅格容器的栅格列数。
    
    ```TypeScript
    @Entry
    @Component
    struct WindowRefGridLayout {
      @State currentBp: string = "unknown"
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        Column({ space: 6 }) {
          Text(this.currentBp)
          GridRow({
            columns: {
              xs: 2, // 窗口宽度落入xs断点上，栅格容器分为2列。
              sm: 4, // 窗口宽度落入sm断点上，栅格容器分为4列。
              md: 8, // 窗口宽度落入md断点上，栅格容器分为8列。
              lg: 12, // 窗口宽度落入lg断点上，栅格容器分为12列。
              xl: 12, // 窗口宽度落入xl断点上，栅格容器分为12列。
              xxl: 12 // 窗口宽度落入xxl断点上，栅格容器分为12列。
            },
            breakpoints: {
              value: ['320vp', '600vp', '840vp', '1440vp', '1600vp'], // 表示在保留默认断点['320vp', '600vp', '840vp']的同时自定义增加'1440vp', '1600vp'的断点，实际开发中需要根据实际使用场景，合理设置断点值实现一次开发多端适配。
              reference: BreakpointsReference.WindowSize
            }
          }) {
            ForEach(this.bgColors, (color: ResourceColor, index?: number | undefined) => {
              GridCol({ span: 1 }) { // 所有子组件占一列。
                Row() {
                  Text(`${index}`)
                }.width('100%').height('50vp')
              }.backgroundColor(color)
            })
          }
          .height(200)
          .border({ color: 'rgb(39,135,217)', width: 2 })
          .onBreakpointChange((breakPoint) => {
            this.currentBp = breakPoint
          })
        }
      }
    }
    ```
    
    [GridLayoutReference.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutReference.ets#L15-L48)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/x3PlbctES5WdLsECBTE2lQ/zh-cn_image_0000002557924859.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=74B1767884F8ADD4C1972D2640E512CECC7909990EC9AEC3FEB854CD6FCC6120)
    

### 布局的总列数

GridRow中通过columns设置栅格布局的总列数。

-   API version 20之前，columns默认值为12，即在未设置columns时，任何断点下，栅格布局均被分成12列。
    
-   API version 20及以后，columns默认值为{ xs: 2, sm: 4, md: 8, lg: 12, xl: 12, xxl: 12 }。
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    struct GridColumnsWithDefaults {
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)', 'rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)'];
      build() {
        GridRow() {
          ForEach(this.bgColors, (item: ResourceColor, index?: number | undefined) => {
            GridCol({ span: 1 }) {
              Row() {
                Text(`${index}`)
              }.width('100%').height('50')
            }.backgroundColor(item)
          })
        }
      }
    }
    ```
    
    [GridLayoutColumns.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutColumns.ets#L15-L36)
    
    API version 20之前布局显示：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1f/v3/Psjk78VeQsW0UZigEVkcCg/zh-cn_image_0000002527044944.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=58EE6EA5095DFFE275133992513669A6D85A1211EB2538DD15FF817370A9745E)
    
    API version 20及以后布局显示（以sm设备为例，默认栅格列数为4）：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a1/v3/lHgcnm5tR_2C-16i8XTV-A/zh-cn_image_0000002558044825.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=7C0BF423C5C2F6BB64508CEA8F70B8D36D5FF03BD3AA155C47E36008E9B59A86)
    

columns支持number和[GridRowColumnOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#gridrowcolumnoption)两种类型, 可按两种方式设置栅格布局的总列数。

-   当columns类型为number时，栅格布局在任何尺寸设备下都被分为同一列数。下面分别设置栅格布局列数为4和8，子元素占一列，效果如下：
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    struct FixedFourColumnGrid {
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        Column({ space: 6 }) {
          Text('columns：4').alignSelf(ItemAlign.Start)
          Row() {
            GridRow({ columns: 4 }) {
              ForEach(this.bgColors, (item: ResourceColor, index?: number | undefined) => {
                GridCol({ span: 1 }) {
                  Row() {
                    Text(`${index}`)
                  }.width('100%').height('50')
                }.backgroundColor(item)
              })
            }
            .width('100%').height('100%')
          }
          .height(160)
          .border({ color: 'rgb(39,135,217)', width: 2 })
          .width('90%')
        }
      }
    }
    ```
    
    [GridLayoutColumnsToFour.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutColumnsToFour.ets#L15-L42)
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    struct FixedEightColumnGrid {
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        Column({ space: 6 }) {
          Text('columns：8').alignSelf(ItemAlign.Start)
          Row() {
            GridRow({ columns: 8 }) {
              ForEach(this.bgColors, (item: ResourceColor, index?: number | undefined) => {
                GridCol({ span: 1 }) {
                  Row() {
                    Text(`${index}`)
                  }.width('100%').height('50')
                }.backgroundColor(item)
              })
            }
            .width('100%').height('100%')
          }
          .height(160)
          .border({ color: 'rgb(39,135,217)', width: 2 })
          .width('90%')
        }
      }
    }
    ```
    
    [GridLayoutColumnsToEight.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutColumnsToEight.ets#L15-L42)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4/v3/ATtc4OtPRRSh4NinOgZJrA/zh-cn_image_0000002526885014.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=7D9C6011D786A1A56FD6CCC06E0DAB763B2CC8B95AF1FAADAFB7885001FB7ECC)
    
-   当columns类型为[GridRowColumnOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#gridrowcolumnoption)时，支持下面6种不同尺寸（xs，sm，md，lg，xl，xxl）设备的栅格列数设置，不同尺寸的设备支持配置不同的栅格列数。
    
    ```TypeScript
    @Entry
    @Component
    struct GridRowColumnOptionLayout {
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        GridRow({
          columns: { sm: 4, md: 8 },
          breakpoints: {
            value: ['320vp', '600vp', '840vp', '1440vp', '1600vp'] // 表示在保留默认断点['320vp', '600vp', '840vp']的同时自定义增加'1440vp', '1600vp'的断点，实际开发中需要根据实际使用场景，合理设置断点值实现一次开发多端适配。
          }
        }) {
          ForEach(this.bgColors, (item: ResourceColor, index?: number | undefined) => {
            GridCol({ span: 1 }) {
              Row() {
                Text(`${index}`)
              }.width('100%').height('50')
            }.backgroundColor(item)
          })
        }
        .height(200)
        .border({ color: 'rgb(39,135,217)', width: 2 })
      }
    }
    ```
    
    [GridLayoutColumnOption.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutColumnOption.ets#L15-L42)
    
    API version 20之前布局显示（xs设备未配置栅格列数，取默认列数12）：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/67/v3/h1-gGIc0TuS2frbRsVa9yw/zh-cn_image_0000002557924861.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=8BFD15F819175E7AB304D9B527039B48264C64348C367767A8AFF2D76CB60534)
    
    API version 20及以后布局显示（xs设备继承sm设备栅格列数）：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/5O9ufj3gSuq8gV-_Mg1dyg/zh-cn_image_0000002527044946.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=3FAC95899617F651EEFFF80E6A1581859E9ADBCC46E570001B84928839705DD9)
    
    仅部分设置sm、md的栅格列数，未配置的xs、lg、xl、xxl设备根据[栅格列数补全](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#gridrowcolumnoption)取默认值。
    

### 排列方向

栅格布局中，可以通过设置GridRow的direction属性来指定栅格子组件在栅格容器中的排列方向。该属性可以设置为[GridRowDirection](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#gridrowdirection枚举说明).Row（从左往右排列）或[GridRowDirection](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#gridrowdirection枚举说明).RowReverse（从右往左排列），以满足不同的布局需求。通过合理的direction属性设置，可以使得页面布局更加灵活和符合设计要求。

-   子组件默认从左往右排列。
    
    ```TypeScript
    GridRow({ direction: GridRowDirection.Row }) { /* ... */ }
    ```
    
    [GridLayoutDirectionRow.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutDirectionRow.ets#L21-L23)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/de/v3/G4YeCjucSH2czmPI5t6VHg/zh-cn_image_0000002558044827.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=402EE1FCD604151573359D5B343A0E5D363C82D2C31BD467C2C0F0E306545341)
    
-   子组件从右往左排列。
    
    ```TypeScript
    GridRow({ direction: GridRowDirection.RowReverse }) { /* ... */ }
    ```
    
    [GridLayoutDirectionRowReverse.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutDirectionRowReverse.ets#L21-L23)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e4/v3/7RxcVMn7R3yMP3iGHJZ7Nw/zh-cn_image_0000002526885016.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=CEA26F528A276497552B92280B0E5FCE319D72CB490EE1EF266580B2B4040CB9)
    

### 子组件间距

GridRow中通过gutter属性设置子元素在水平和垂直方向的间距。

-   当gutter类型为number时，同时设置栅格子组件间水平和垂直方向边距且相等。下例中，设置子组件水平与垂直方向距离相邻元素的间距为10。
    
    ```TypeScript
    GridRow({ gutter: 10 }) { /* ... */ }
    ```
    
    [GridLayoutGutterToNumber.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutGutterToNumber.ets#L21-L23)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9b/v3/lLptT6HPRc--f0t2KHsCzA/zh-cn_image_0000002557924863.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=0DD07B38604DA23BFBB91DF6FF6A6AA2F0632519C9ACB97C3616A9E58B2E4A9B)
    
-   当gutter类型为[GutterOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridrow#gutteroption)时，单独设置栅格子组件水平垂直边距，x属性为水平方向间距，y为垂直方向间距。
    
    ```TypeScript
    GridRow({ gutter: { x: 20, y: 50 } }) { /* ... */ }
    ```
    
    [GridLayoutGutterOption.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridLayoutGutterOption.ets#L21-L23)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/pkOYk1PvQjK74Qu0ZXDLxg/zh-cn_image_0000002527044948.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=C2CFCE9B858D29AB0D806D536BEE6600559E698BA8D2D18267B5443142B4FD53)
    

## 子组件GridCol

GridCol组件作为GridRow组件的子组件，通过给GridCol传参或者设置属性两种方式，设置span（占用列数），offset（偏移列数），order（元素序号）的值。

-   设置span。
    
    ```TypeScript
    let gSpan:Record<string,number> = { 'xs': 1, 'sm': 2, 'md': 3, 'lg': 4 }
    ```
    
    [GridColSpan.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColSpan.ets#L15-L17)
    
    ```TypeScript
    GridCol({ span: 2 }){}
    GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }){}
    GridCol(){}.span(2)
    GridCol(){}.span(gSpan)
    ```
    
    [GridColSpan.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColSpan.ets#L24-L29)
    
-   设置offset。
    
    ```TypeScript
    let gOffset:Record<string,number> = { 'xs': 1, 'sm': 2, 'md': 3, 'lg': 4 }
    ```
    
    [GridColOffset.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOffset.ets#L15-L17)
    
    ```TypeScript
    GridCol({ offset: 2, span: 1 }){}
    GridCol({ offset: { xs: 2, sm: 2, md: 2, lg: 2 }, span: 1 }){}
    GridCol({ span: 1 }){}.offset(gOffset)
    ```
    
    [GridColOffset.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOffset.ets#L24-L28)
    
-   设置order。
    
    ```TypeScript
    let gOrder:Record<string,number> = { 'xs': 1, 'sm': 2, 'md': 3, 'lg': 4 }
    ```
    
    [GridColOrder.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOrder.ets#L15-L17)
    
    ```TypeScript
    GridCol({ order: 2, span: 1 }){}
    GridCol({ order: { xs: 1, sm: 2, md: 3, lg: 4 }, span: 1 }){}
    GridCol({ span: 1 }){}.order(2)
    GridCol({ span: 1 }){}.order(gOrder)
    ```
    
    [GridColOrder.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOrder.ets#L24-L29)
    

### span

子组件占栅格布局的列数，决定了子组件的宽度。默认值为1。

span支持number和[GridColColumnOption](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridcol#gridcolcolumnoption)两种类型, 可按两种方式设置栅格子组件占栅格容器的列数。

-   当span类型为number时，子组件在所有尺寸设备下占用的列数相同。
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    struct SpanNumberExample {
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        GridRow({ columns: 8 }) {
          ForEach(this.bgColors, (color: ResourceColor, index?: number | undefined) => {
            GridCol({ span: 2 }) {
              Row() {
                Text(`${index}`)
              }.width('100%').height('50vp')
            }
            .backgroundColor(color)
          })
        }
        .border({ color: 'rgb(39,135,217)', width: 2 })
        .height('150vp')
      }
    }
    ```
    
    [GridColSpanToNumber.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColSpanToNumber.ets#L15-L37)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f7/v3/ftUpdhH7SuGpHVtJdtKiIg/zh-cn_image_0000002558044829.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=C508E63EA06B642F89849EAEEB03EDE3CC5D3A20D3A947D9487BB0D987FFF09E)
    
-   当span类型为GridColColumnOption时，支持6种不同尺寸（xs，sm，md，lg，xl，xxl）设备中子组件所占列数设置，不同尺寸的设备下子组件支持配置不同列数。若仅部分设置sm、md的列数，未配置的xs、lg、xl、xxl设备根据[列数补全](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-gridcol#gridcolcolumnoption)取默认值。
    
    ```TypeScript
    @Entry
    @Component
    struct SpanColumnOptionExample {
      @State currentBp: string = "unknown"
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        Column({ space: 6 }) {
          GridRow({ columns: 8 }) {
            ForEach(this.bgColors, (color: ResourceColor, index?: number | undefined) => {
              GridCol({
                span: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                }
              }) {
                Row() {
                  Text(`${index}`)
                }.width('100%').height('50vp')
              }
              .backgroundColor(color)
            })
          }
          .border({ color: 'rgb(39,135,217)', width: 2 })
          .height('150vp')
          .onBreakpointChange((breakPoint) => {
            this.currentBp = breakPoint
          })
          Text(this.currentBp)
        }
      }
    }
    ```
    
    [GridColSpanToOption.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColSpanToOption.ets#L15-L36)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/94/v3/Z6Che5qeS66lkIMK7A2Bgg/zh-cn_image_0000002526885018.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=A1CA1F5103CB561F3B7CCB75FE80CB446D3563D5AF641ED92CB339D4E43E77DD)
    

### offset

栅格子组件相对于前一个子组件的偏移列数，默认为0。

-   当offset类型为number时，子组件偏移相同列数。
    
    ```TypeScript
    @Entry
    @Component
    struct OffsetNumberExample {
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        Column() {
          GridRow({ columns: 12 }) {
            ForEach(this.bgColors, (color: ResourceColor, index?: number | undefined) => {
              GridCol({ offset: 2, span: 1 }) {
                Row() {
                  Text('' + index)
                }.width('100%').height('50vp')
              }
              .backgroundColor(color)
            })
          }
          Blank().width('100%').height(150)
        }.border({ color: 'rgb(39,135,217)', width: 2 })
      }
    }
    ```
    
    [GridColOffsetToNumber.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOffsetToNumber.ets#L15-L36)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/PCjOeygVRl2Lkk90h4Y8mA/zh-cn_image_0000002557924865.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=613871EA96048642CCE44C063A55A8E4CE335714A93EDB84CF1F160F295C3152)
    
    在lg及以上尺寸的设备上，栅格分成12列，每一个子组件占1列，偏移2列，每个子组件及间距共占3列，1行放4个子组件。
    
-   当offset类型为GridColColumnOption时，支持6种不同尺寸（xs，sm，md，lg，xl，xxl）设备中子组件所占列数设置，各个尺寸下数值可不同。
    
    ```TypeScript
    @Entry
    @Component
    struct OffsetColumnOptionExample {
      @State currentBp: string = "unknown"
      @State bgColors: ResourceColor[] =
        ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
          'rgb(255,192,0)', 'rgb(170,10,33)'];
      build() {
        Column({ space: 6 }) {
          GridRow({ columns: 12 }) {
            ForEach(this.bgColors, (color: ResourceColor, index?: number | undefined) => {
              GridCol({
                offset: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                },
                span: 1
              }) {
                Row() {
                  Text('' + index)
                }.width('100%').height('50vp')
              }
              .backgroundColor(color)
            })
          }
          .height(200)
          .border({ color: 'rgb(39,135,217)', width: 2 })
          .onBreakpointChange((breakPoint) => {
            this.currentBp = breakPoint
          })
          Text(this.currentBp)
        }
      }
    }
    ```
    
    [GridColOffsetToOption.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOffsetToOption.ets#L15-L38)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/hSIfqYS2QhWouVhfws4rdw/zh-cn_image_0000002527044950.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=3B2689A1A81C178870CCF78996DD4A53CA2B62BAAF4BF94AD88F74D6E518297F)
    

### order

栅格子组件的序号，决定子组件排列次序。当子组件不设置order或者设置相同的order, 子组件按照代码顺序展示。当子组件设置不同的order时，order较小的组件在前，较大的在后。

当子组件部分设置order，部分不设置order时，未设置order的子组件依次排序靠前，设置了order的子组件按照数值从小到大排列。

-   当order类型为number时，子组件在任何尺寸下排序次序一致。
    
    ```TypeScript
    GridRow({ columns: 12 }) {
        GridCol({ order: 4, span: 1 }) {
          Row() {
            Text('1')
          }.width('100%').height('50vp')
        }.backgroundColor('rgb(213,213,213)')
        GridCol({ order: 3, span: 1 }) {
          Row() {
            Text('2')
          }.width('100%').height('50vp')
        }.backgroundColor('rgb(150,150,150)')
        GridCol({ order: 2, span: 1 }) {
          Row() {
            Text('3')
          }.width('100%').height('50vp')
        }.backgroundColor('rgb(0,74,175)')
        GridCol({ order: 1, span: 1 }) {
          Row() {
            Text('4')
          }.width('100%').height('50vp')
        }.backgroundColor('rgb(39,135,217)')
    }
    ```
    
    [GridColOrderToNumber.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOrderToNumber.ets#L20-L46)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7b/v3/vUb_q8vKTNa524Zc9vU10A/zh-cn_image_0000002558044831.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=C8084B48720C9FDC98FB6A1C9E88B3A7B93895CB2939913AE7B446B3679F645F)
    
-   当order类型为GridColColumnOption时，支持6种不同尺寸（xs，sm，md，lg，xl，xxl）设备中子组件排序次序设置。在xs设备中，子组件排列顺序为1234；sm为2341，md为3412，lg为2431。
    
    ```TypeScript
    @Entry
    @Component
    struct OrderColumnOptionExample {
      @State currentBp: string = 'unknown'
      build() {
        Column({ space: 5 }) {
          GridRow({ columns: 12 }) {
            GridCol({
              order: { xs: 1, sm: 5, md: 3, lg: 7 }, span: 1 }) {
              Row() {
                Text('1')
              }.width('100%').height('50vp')
            }.backgroundColor('rgb(213,213,213)')
            GridCol({
              order: { xs: 2, sm: 2, md: 6, lg: 1 }, span: 1 }) {
              Row() {
                Text('2')
              }.width('100%').height('50vp')
            }.backgroundColor('rgb(150,150,150)')
            GridCol({ order: { xs: 3, sm: 3, md: 1, lg: 6 }, span: 1 }) {
              Row() {
                Text('3')
              }.width('100%').height('50vp')
            }.backgroundColor('rgb(0,74,175)')
            GridCol({ order: { xs: 4, sm: 4, md: 2, lg: 5 }, span: 1 }) {
              Row() {
                Text('4')
              }.width('100%').height('50vp')
            }.backgroundColor('rgb(39,135,217)')
          }.border({ width: 1, color: 'rgb(39,135,217)' }).height('200vp').onBreakpointChange((breakpoint) => {
            this.currentBp = breakpoint
          })
          Text(this.currentBp)
        }
      }
    }
    ```
    
    [GridColOrderToOption.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridColOrderToOption.ets#L15-L57)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bc/v3/IfNQP7hrR2CoSV867OdQhA/zh-cn_image_0000002526885020.gif?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=CF71884757302C8D105BB42E0583DC445B16D2DF6E1271D64223BF55322BB651)
    

## 栅格组件的嵌套使用

栅格组件也可以嵌套使用，完成一些复杂的布局。

以下示例中，栅格把整个空间分为12份。第一层GridRow嵌套GridCol，分为中间大区域以及“footer”区域。第二层GridRow嵌套GridCol，分为“left”和“right”区域。子组件空间按照上一层父组件的空间划分，粉色的区域是屏幕空间的12列，绿色和蓝色的区域是父组件GridCol的12列，依次进行空间的划分。

```TypeScript
@Entry
@Component
struct GridRowExample {
  build() {
    GridRow({ columns: 12 }) {
      GridCol({ span: 12 }) {
        GridRow({ columns: 12 }) {
          GridCol({ span: 2 }) {
            Row() {
              Text('left').fontSize(24)
            }
            .justifyContent(FlexAlign.Center)
            .height('90%')
          }.backgroundColor('#ff41dbaa')
          GridCol({ span: 10 }) {
            Row() {
              Text('right').fontSize(24)
            }
            .justifyContent(FlexAlign.Center)
            .height('90%')
          }.backgroundColor('#ff4168db')
        }
        .backgroundColor('#19000000')
      }
      GridCol({ span: 12 }) {
        Row() {
          Text('footer').width('100%').textAlign(TextAlign.Center)
        }.width('100%').height('10%').backgroundColor(Color.Pink)
      }
    }.width('100%').height(300)
  }
}
```

[GridRowExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/MultipleLayoutProject/entry/src/main/ets/pages/gridlayout/GridRowExample.ets#L15-L50)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/BLJNtIpiS_6s1NzfiIpztA/zh-cn_image_0000002557924867.png?HW-CC-KV=V1&HW-CC-Date=20260312T083409Z&HW-CC-Expire=86400&HW-CC-Sign=FD2568BCF17EC384875132C312EC3765B8A124A7CA0257C14B854E4C0B73BD37)

综上所述，栅格组件提供了丰富的自定义能力，功能非常灵活和强大。只需要明确栅格在不同断点下的Columns、Margin、Gutter及span等参数，即可确定最终布局，无需关心具体的设备类型及设备状态（如横竖屏）等。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-grid-layout*