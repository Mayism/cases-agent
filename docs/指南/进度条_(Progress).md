---
title: 进度条 (Progress)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-progress-indicator
category: 指南
updated_at: 2026-03-12T08:46:43.781Z
---

# 进度条 (Progress)

Progress是进度条显示组件，显示内容通常为目标操作的当前进度。具体用法请参考[Progress](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-progress)。

## 创建进度条

Progress通过调用接口来创建，接口调用方式如下：

```typescript
Progress(options: {value: number, total?: number, type?: ProgressType})
```

其中，value用于设置初始进度值，total用于设置进度总长度，type用于设置Progress样式。

```typescript
Progress({ value: 24, total: 100, type: ProgressType.Linear }) // 创建一个进度总长为100，初始进度值为24的线性进度条
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/48/v3/DCYWztK-QN2PPneLBC5LPg/zh-cn_image_0000002557925005.png?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=73E906A22C2EAF1C351E4E1A64FEA250B0D140DE80F9997FC76F31826A0BF139)

## 设置进度条样式

Progress有5种可选类型，通过ProgressType可以设置进度条样式。ProgressType类型包括：ProgressType.Linear（线性样式）、 ProgressType.Ring（环形无刻度样式）、ProgressType.ScaleRing（环形有刻度样式）、ProgressType.Eclipse（圆形样式）和ProgressType.Capsule（胶囊样式）。

-   线性样式进度条（默认类型）
    
    说明
    
    从API version 9开始，组件高度大于宽度时，自适应垂直显示；组件高度等于宽度时，保持水平显示。
    
    ```TypeScript
    Progress({ value: 20, total: 100, type: ProgressType.Linear }).width(200).height(50)
    Progress({ value: 20, total: 100, type: ProgressType.Linear }).width(50).height(200)
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/InfoComponent/ProgressProject/entry/src/main/ets/pages/Index.ets#L36-L39)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ae/v3/Kku1ItZUTeOFQBZP1yI2kw/zh-cn_image_0000002527045090.png?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=1985452AF61C929D6C673460617203E4513F69A09FDCE2A2A6FDA1C45AAF4E6E)
    
-   环形无刻度样式进度条
    
    ```TypeScript
    // 从左往右，1号环形进度条，默认前景色为蓝色渐变，默认strokeWidth进度条宽度为2.0vp
    Progress({ value: 40, total: 150, type: ProgressType.Ring }).width(100).height(100)
    // 从左往右，2号环形进度条
    Progress({ value: 40, total: 150, type: ProgressType.Ring }).width(100).height(100)
      .color(Color.Grey)    // 进度条前景色为灰色
      .style({ strokeWidth: 15})    // 设置strokeWidth进度条宽度为15.0vp
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/InfoComponent/ProgressProject/entry/src/main/ets/pages/Index.ets#L43-L50)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c8/v3/xUN6hjJ5QhOW7C6BHpWdmw/zh-cn_image_0000002558044971.png?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=7DAF0F40960278AD4EAA8F42A52FA9E59374462DDCFACDBD8EB3F89DE184AD2E)
    
-   环形有刻度样式进度条
    
    ```TypeScript
    Progress({ value: 20, total: 150, type: ProgressType.ScaleRing }).width(100).height(100)
      .backgroundColor(Color.Black)
      .style({ scaleCount: 20, scaleWidth: 5 })    // 设置环形有刻度进度条总刻度数为20，刻度宽度为5vp
    Progress({ value: 20, total: 150, type: ProgressType.ScaleRing }).width(100).height(100)
      .backgroundColor(Color.Black)
      .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 5 })    // 设置环形有刻度进度条宽度15，总刻度数为20，刻度宽度为5vp
    Progress({ value: 20, total: 150, type: ProgressType.ScaleRing }).width(100).height(100)
      .backgroundColor(Color.Black)
      .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 3 })    // 设置环形有刻度进度条宽度15，总刻度数为20，刻度宽度为3vp
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/InfoComponent/ProgressProject/entry/src/main/ets/pages/Index.ets#L55-L65)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6e/v3/1EHGz1JnToCZrB5O_cWjdQ/zh-cn_image_0000002526885160.png?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=81EB1602F80278E58B8C5714991DA59B9726F88BECFD20A2DCD39E0CFD0141F3)
    
-   圆形样式进度条
    
    ```TypeScript
    // 从左往右，1号圆形进度条，默认前景色为蓝色
    Progress({ value: 10, total: 150, type: ProgressType.Eclipse }).width(100).height(100)
    // 从左往右，2号圆形进度条，指定前景色为灰色
    Progress({ value: 20, total: 150, type: ProgressType.Eclipse }).color(Color.Grey).width(100).height(100)
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/InfoComponent/ProgressProject/entry/src/main/ets/pages/Index.ets#L70-L75)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/rHKLL0nPTk2Eo02LP05l_g/zh-cn_image_0000002557925007.png?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=48634DC5C7AB1DE7B55369A8FA20CDA9950A787B1762848061ACDC027EFAC76E)
    
-   胶囊样式进度条
    
    说明
    
    -   头尾两端圆弧处的进度展示效果与ProgressType.Eclipse样式一致。
        
    -   中段处的进度展示效果为矩形状长条，与ProgressType.Linear线性样式相似。
        
    -   组件高度大于宽度时，自适应垂直显示。
        
    
    ```TypeScript
    Progress({ value: 10, total: 150, type: ProgressType.Capsule }).width(100).height(50)
    Progress({ value: 20, total: 150, type: ProgressType.Capsule }).width(50).height(100).color(Color.Grey)
    Progress({ value: 50, total: 150, type: ProgressType.Capsule }).width(50).height(100).color(Color.Blue).backgroundColor(Color.Black)
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/InfoComponent/ProgressProject/entry/src/main/ets/pages/Index.ets#L80-L84)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1f/v3/qXJ1IUBiRt67IeI9ePGG-Q/zh-cn_image_0000002527045092.png?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=733CE417C42A1245187A58615663F32CF4D0661549D1B830B09716A24320983F)
    

## 场景示例

更新当前进度值，如应用安装进度条，可通过点击Button增加progressValue，value属性将progressValue设置给Progress组件，进度条组件即会触发刷新，更新当前进度。

```TypeScript
@Entry
@Component
struct ProgressCase1 {
  @State progressValue: number = 0;    // 设置进度条初始值为0
  build() {
    Column() {
      Column() {
        Progress({value:0, total:100, type:ProgressType.Capsule}).width(200).height(50).value(this.progressValue)
        Row().width('100%').height(5)
        // 请将$r('app.string.progress_add')替换为实际资源文件，在本示例中该资源文件的value值为"进度条+5"
        Button($r('app.string.progress_add'))
          .onClick(()=>{
            this.progressValue += 5;
            if (this.progressValue > 100){
              this.progressValue = 0;
            }
          })
      }
    }.width('100%').height('100%')
  }
}
```

[ProgressCase1.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/InfoComponent/ProgressProject/entry/src/main/ets/pages/ProgressCase1.ets#L15-L36)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/84/v3/gBTFLpjFSYSAy4Bi5QAWxg/zh-cn_image_0000002558044973.gif?HW-CC-KV=V1&HW-CC-Date=20260312T084620Z&HW-CC-Expire=86400&HW-CC-Sign=054DB81B3774978F0009A4C53CDC29E85C72E98244FAD4214D73100AED728318)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-progress-indicator*