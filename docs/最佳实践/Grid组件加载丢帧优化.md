---
title: Grid组件加载丢帧优化
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-improve_grid_performance
category: 最佳实践
updated_at: 2026-03-13T02:34:37.165Z
---

# Grid组件加载丢帧优化

## 概述

网格是应用开发中常见的开发场景。它通过相交的横线和竖线，形成整齐有序的网状布局。网格适用于展示图片、媒体文件、购物商品等多种数据。当网格上下滑动时，子组件会带来测量和绘制的性能消耗。

在网格的高频场景中，性能优化是关键，包括加快渲染速度、提升滑动帧率、降低内存占用等，从而显著提升应用流畅度和用户体验。对于希望快速实现的开发者，可使用ScrollComponents库直接创建流畅滑动的网格，该库内置组件复用、懒加载、复用池共享等优化能力，并支持预创建和预加载，大幅减少开发者的性能调优成本，具体实现细节和最佳实践可参考[基于ScrollComponents实现网格](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-grid-based-on-scrollcomponents)。

在实现如下图所示可滚动布局效果时，可能会通过columnStart/columnEnd[设置子组件所占行列数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-layout-development-create-grid#设置子组件所占行列数)，实现不规则的布局效果。

**图1** columnStart/columnEnd实现不规则网格布局  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/3G3qWElqTFWSrDio9Ux8Kg/zh-cn_image_0000002194010632.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=84487BA53749090736F14F8928267D6B9A609E936BD1FCB44FFCB26E76211AEE)

在以下使用场景中，使用columnStart或columnEnd可能会导致性能问题：

1.  **删除或拖拽等改变GridItem位置**
2.  **使用scrollToIndex滑动到指定GridItem**

在Grid中存在多个GridItem时，如果使用columnStart/columnEnd或rowStart/rowEnd设置GridItem的大小，可能会导致性能问题。在这种情况下，建议使用GridLayoutOptions来提升性能。使用columnStart/columnEnd或rowStart/rowEnd布局时，如果调用scrollToIndex滑动到指定索引，Grid会遍历所有GridItem以查找位置。而使用GridLayoutOptions布局时，通过计算方式查找位置，效率更高。因此，可以通过设置GridLayoutOptions，并结合rowsTemplate或columnsTemplate来替代使用columnStart/columnEnd控制GridItem占用多列的情况。

## 案例说明

### 场景示例

介绍Grid中使用scrollToIndex滑动到指定位置的场景。案例中，columnStart/columnEnd设置不规则宫格布局的反例，与GridLayoutOption的正例对比，示例代码如下：

**反例：**使用columnStart/columnEnd设置GridItem大小。

```typescript
// Import performance dot modules
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
@Component
struct TextItem {
  @State item: string = '';
  build() {
    Text(this.item)
      .fontSize(16)
      .backgroundColor(0xF9CF93)
      .width('100%')
      .height(80)
      .textAlign(TextAlign.Center)
  }
  aboutToAppear() {
    // Finish the task
    hiTraceMeter.finishTrace('useColumnStartColumnEnd', 1);
  }
}
class MyDataSource implements IDataSource {
  private dataArray: string[] = [];
  public pushData(data: string): void {
    this.dataArray.push(data);
  }
  public totalCount(): number {
    return this.dataArray.length;
  }
  public getData(index: number): string {
    return this.dataArray[index];
  }
  registerDataChangeListener(listener: DataChangeListener): void {
  }
  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}
@Entry
@Component
struct GridExample {
  private datasource: MyDataSource = new MyDataSource();
  scroller: Scroller = new Scroller();
  aboutToAppear() {
    for (let i = 1; i <= 2000; i++) {
      this.datasource.pushData(i + '');
    }
  }
  build() {
    Column({ space: 5 }) {
      Text('使用columnStart,columnEnd设置GridItem大小').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller) {
        LazyForEach(this.datasource, (item: string, index: number) => {
          if ((index % 4) === 0) {
            GridItem() {
              TextItem({ item: item })
            }
            .columnStart(0).columnEnd(2)
          } else {
            GridItem() {
              TextItem({ item: item })
            }
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height('40%')
      Button('scrollToIndex:1900').onClick(() => {
        // Start some tasks.
        hiTraceMeter.startTrace('useColumnStartColumnEnd', 1);
        this.scroller.scrollToIndex(1900);
      })
    }.width('100%')
    .margin({ top: 5 })
  }
}
```

[Index.ets](https://gitcode.com/harmonyos_samples/BestPracticeSnippets/blob/master/GridComponentLoadSlow/entry/src/main/ets/pages/Index.ets#L17-L104)

**正例：**使用GridLayoutOptions设置GridItem大小，布局效果和反例保持一致。

```typescript
// Import performance dot modules
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
@Component
struct TextItem {
  @State item: string = '';
  build() {
    Text(this.item)
      .fontSize(16)
      .backgroundColor(0xF9CF93)
      .width('100%')
      .height(80)
      .textAlign(TextAlign.Center)
  }
  aboutToAppear() {
    // Finish the task
    hiTraceMeter.finishTrace('useGridLayoutOptions', 1);
  }
}
class MyDataSource implements IDataSource {
  private dataArray: string[] = [];
  public pushData(data: string): void {
    this.dataArray.push(data);
  }
  public totalCount(): number {
    return this.dataArray.length;
  }
  public getData(index: number): string {
    return this.dataArray[index];
  }
  registerDataChangeListener(listener: DataChangeListener): void {
  }
  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}
@Entry
@Component
struct GridExample2 {
  private datasource: MyDataSource = new MyDataSource();
  scroller: Scroller = new Scroller();
  private irregularData: number[] = [];
  layoutOptions: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: this.irregularData,
  };
  aboutToAppear() {
    for (let i = 1; i <= 2000; i++) {
      this.datasource.pushData(i + '');
      if ((i - 1) % 4 === 0) {
        this.irregularData.push(i - 1);
      }
    }
  }
  build() {
    Column({ space: 5 }) {
      Text('使用GridLayoutOptions设置GridItem大小')
        .fontColor(0xCCCCCC)
        .fontSize(9)
        .width('90%')
      Grid(this.scroller, this.layoutOptions) {
        LazyForEach(this.datasource, (item: string, index: number) => {
          GridItem() {
            TextItem({ item: item })
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height('40%')
      Button('scrollToIndex:1900').onClick(() => {
        // Start some tasks.
        hiTraceMeter.startTrace('useGridLayoutOptions', 1);
        this.scroller.scrollToIndex(1900);
      })
    }.width('100%')
    .margin({ top: 5 })
  }
}
```

[RightIndex.ets](https://gitcode.com/harmonyos_samples/BestPracticeSnippets/blob/master/GridComponentLoadSlow/entry/src/main/ets/pages/RightIndex.ets#L17-L108)

### 分析步骤

正反例采用相同的操作步骤，收集跳转过程中的性能参数并进行对比：

1.  打开Profiler工具，连接设备，选择对应的应用进程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/50/v3/nspCiMrjQXaAmvJaZ3ab6Q/zh-cn_image_0000002229450913.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=EB992921A5134D8B5C2CFE4140DE93F0F831DC2DEB04253567E7A4025D24F480)
    
2.  选择Frame，点击Create Session以开始数据测量。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/83/v3/jrqRFoh5Sz--_6MjqOTe-g/zh-cn_image_0000002194010628.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=EA6C5792634E2AB22D41AFBC4900D2C761EFF79F044AE0857964BE58A9C09D31)
    
3.  通过点击按钮，先使用startTrace开始性能打点跟踪，再调用scrollToIndex。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1f/v3/nn5TAR9kRn6oXA6eA3wu1Q/zh-cn_image_0000002194010644.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=DFA25F7D8EA4CCC6DD25C5913F76E1CD6DBC039D8999F4847ACACD27C097605A "点击放大")
    
4.  查看对应应用进程下的自定义打点事件，包括反例代码中定义的“useColumnStartColumnEnd”和正例代码中的“useGridLayoutOptions”下的trace图。
    
    说明
    
    **打点事件说明**：Grid查找到指定GridItem位置，准备渲染节点前，进入GridItem组件的生命周期回调aboutToAppear，使用finishTrace停止性能打点。通过startTrace标记调用scrollToIndex，finishTrace标记查找到指定位置后准备渲染首个GridItem节点，对比正反例场景下的耗时数据。关于性能打点的介绍，请参考[@ohos.hiTraceMeter (性能打点)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-hitracemeter)
    

### 结果对比

如图所示，使用columnStart和columnEnd设置GridItem大小的布局方式。从自定义打点标签“H:useColumnStartColumnEndGrid”可以看出，从调用scrollToIndex到查找到指定索引并准备构建GridItem节点耗时447ms。

**图2** 使用columnStart，columnEnd的打点信息

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/ZJlHsB_ATEK722C55HnGHw/zh-cn_image_0000002194010648.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=BA7E1E5455A9B9A6286C88CB09E41839FE30C4084B696302088FDC5ED44C6053 "点击放大")

如图3所示，使用GridLayoutOptions设置GridItem大小的布局方式。从自定义打点标签“H:useGridLayoutOptions”可以看出，从调用scrollToIndex到查找到指定Index并准备构建GridItem节点耗时12ms。

**图3** 使用GridLayoutOptions的打点信息

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4f/v3/3QhNXAsnTiifO-OVKW7NTA/zh-cn_image_0000002194010620.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=2B24ED697913396C259CB9E9469B36132783EC68AE7E58C517FAADD0975728DD "点击放大")

通过详细的trace分析可以发现，在“H:useColumnStartColumnEndGrid”打点标签时间段中，存在大量“H:Builder:BuildLazyItem”标签。这表明Grid在查找指定的Index 1900时，是通过依次遍历Index来实现的。

**图4** 使用columnStart，columnEnd的放大trace标签信息  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c7/v3/gf-HZBgqQem7D2C2NKAXeQ/zh-cn_image_0000002229450897.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=F67AB62429D31DB379FB5E0E16A846C63903CB92604C41C647E2B5BDEBBA1594 "点击放大")

在使用GridLayoutOptions的示例中，“H:useGridLayoutOptions”打点标签时间段内仅出现一个“H:Builder:BuildLazyItem”标签。这表明Grid在查找指定索引1900时，能够直接一次性找到指定索引。

**图5** 使用GridLayoutOptions的放大trace标签信息  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8b/v3/I2H6AYTEQS6y4cC0acsLxg/zh-cn_image_0000002229450909.png?HW-CC-KV=V1&HW-CC-Date=20260313T023430Z&HW-CC-Expire=86400&HW-CC-Sign=4319CC5F3DEEE3212DDD7CF2A6110B12B999E6D70971B2E36351FFC190E48B9D "点击放大")

在相同布局情况下，使用columnStart和columnEnd设置GridItem大小时，Grid在使用scrollToIndex查找指定索引时，会依次遍历GridItem节点，导致查找过程耗时较长。而使用GridLayoutOptions设置GridItem大小时，直接一次性计算找到指定索引，查找过程耗时较短。因此，使用GridLayoutOptions设置GridItem大小可以显著减少Grid加载时间，提升应用性能。

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-improve_grid_performance*