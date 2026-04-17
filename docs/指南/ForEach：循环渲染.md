---
title: ForEach：循环渲染
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach
category: 指南
updated_at: 2026-03-12T08:27:27.877Z
---

# ForEach：循环渲染

ForEach接口基于数组循环渲染，需要与容器组件配合使用，且接口返回的组件应当是允许包含在ForEach父容器组件中的子组件。例如，ListItem组件要求ForEach的父容器组件必须为[List组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-list)。

API参数说明见：[ForEach API参数说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-rendering-control-foreach)。

说明

从API version 9开始，该接口支持在ArkTS卡片中使用。

## 键值生成规则

在ForEach循环渲染过程中，系统会为每个数组元素生成一个唯一且持久的键值，用于标识对应的组件。当键值变化时，ArkUI框架会视为该数组元素已被替换或修改，并会基于新的键值创建一个新的组件。

ForEach提供了一个名为keyGenerator的参数，这是一个函数，开发者可以通过它自定义键值的生成规则。如果开发者没有定义keyGenerator函数，则ArkUI框架会使用默认的键值生成函数，即(item: Object, index: number) => { return index + '\_\_' + JSON.stringify(item); }。

ArkUI框架对于ForEach的键值生成有一套特定的判断规则，这主要与itemGenerator函数和keyGenerator函数的第二个参数index有关。具体的键值生成规则判断逻辑如下图所示。

**图1** ForEach键值生成规则

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/af/v3/jbpA8oIhSNGFfbsijKSgXg/zh-cn_image_0000002527044856.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=2F60A655851FBD631F372DD3A2916589B9F3EE24AF8611CF6E1D8B0C69FF5941)

说明

1.  ArkUI框架会对重复的键值发出运行时警告。在UI更新时，如果出现重复的键值，框架可能无法正常工作，具体请参见[渲染结果非预期](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染结果非预期)。
2.  不建议在键值中包含数据项索引index，这可能会导致[渲染结果非预期](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染结果非预期)和[渲染性能降低](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染性能降低)。
3.  如果开发者在itemGenerator函数中声明了index参数，但未在keyGenerator函数中声明index参数，框架会在keyGenerator函数返回值的基础上拼接index，作为最终的键值，这将会引发上述第二点中的问题。为避免此现象，请在keyGenerator函数中声明index参数。

键值生成示例:

```typescript
interface ChildItemType {
  str: string;
  num: number;
}
@Entry
@Component
struct Index {
  @State simpleList: Array<ChildItemType> = [
    { str: 'one', num: 1 },
    { str: 'two', num: 2 },
    { str: 'three', num: 3 }
  ];
  build() {
    Row() {
      Column() {
        ForEach(this.simpleList, (item: ChildItemType, index: number) => {
          ChildItem({ str: item.str, num: index }) // 组件生成函数中使用index参数
        }, (item: ChildItemType, index: number) => {
          return item.str; // 建议在键值生成函数中使用与UI界面相关的数据属性str
        })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct ChildItem {
  @Prop str: string = '';
  @Prop num: number = 0;
  build() {
    Text(this.str)
      .fontSize(50)
  }
}
```

在上述示例中，当组件生成函数声明index时，建议键值生成函数也声明index参数，以避免渲染性能降低和渲染结果非预期。同时建议在键值生成函数实现中使用与UI相关的数据属性，在本示例中，数据属性str与UI界面显示相关，因此建议将其作为键值生成函数的返回值。

## 组件创建规则

在确定键值生成规则后，ForEach的第二个参数itemGenerator函数会根据键值生成规则为数据源的每个数组项创建组件。组件的创建包括两种情况：[ForEach首次渲染](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#首次渲染)和[ForEach非首次渲染](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#非首次渲染)。

### 首次渲染

在ForEach首次渲染时，会根据前述键值生成规则为数据源的每个数组项生成唯一键值，并创建相应的组件。

```TypeScript
@Entry
@Component
struct ForEachFirstRender {
  @State simpleList: Array<string> = ['one', 'two', 'three'];
  build() {
    Row() {
      Column() {
        ForEach(this.simpleList, (item: string) => {
          ForEachChildItem({ item: item })
        }, (item: string) => item) // 需要保证key唯一
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct ForEachChildItem {
  @Prop item: string;
  build() {
    Text(this.item)
      .fontSize(50)
  }
}
```

[ForEach1.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ForEach1.ets#L16-L48)

运行效果如下图所示。

**图2** ForEach数据项不存在相同键值案例首次渲染运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/53/v3/-dtAi-puQAmovdGY--0-zQ/zh-cn_image_0000002558044737.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=2948EEF01451310AC596866F68C30CBCBE9432E704EA4127A127DBCC5DEC9CCB)

在上述代码中，keyGenerator函数的返回值是item。在ForEach渲染循环时，为数组项依次生成键值one、two和three，并创建对应的ForEachChildItem组件渲染到界面上。

当不同数组项生成的键值相同时，框架的行为是未定义的。例如，在以下代码中，ForEach渲染相同的数据项two时，只创建了一个SameKeyChildItem组件，而没有创建多个具有相同键值的组件。

```TypeScript
@Entry
@Component
struct ForEachSameKey {
  @State simpleList: Array<string> = ['one', 'two', 'two', 'three'];
  build() {
    Row() {
      Column() {
        ForEach(this.simpleList, (item: string) => {
          SameKeyChildItem({ item: item })
        }, (item: string) => item)
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct SameKeyChildItem {
  @Prop item: string;
  build() {
    Text(this.item)
      .fontSize(50)
  }
}
```

[ForEach2.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ForEach2.ets#L16-L46)

运行效果如下图所示。

**图3** ForEach数据源存在相同值案例首次渲染运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b2/v3/jY0UkAugQ9SUHox04QGXRQ/zh-cn_image_0000002526884926.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=82705F3093CB798ECA6C153129443D3BC701814BD8C7313572CB5EE5AF192DE1)

在该示例中，最终键值生成规则为item。当ForEach遍历数据源simpleList，遍历到索引为1的two时，创建键值为two的组件并记录。当遍历到索引为2的two时，当前项的键值也为two，此时不再创建新的组件。

### 非首次渲染

在ForEach组件进行非首次渲染时，它会检查新生成的键值是否在上次渲染中已经存在。如果键值不存在，则会创建一个新的组件；如果键值存在，则不会创建新的组件，而是直接渲染该键值所对应的组件。例如，在以下的代码示例中，通过点击事件修改了数组的第三项值为"new three"，这将触发ForEach组件进行非首次渲染。

```TypeScript
@Entry
@Component
struct ForEachNotFirstRender {
  @State simpleList: Array<string> = ['one', 'two', 'three'];
  build() {
    Row() {
      Column() {
        Text('Click to change the value of the third array item')
          .fontSize(24)
          .fontColor(Color.Red)
          .onClick(() => {
            this.simpleList[2] = 'new three';
          })
        ForEach(this.simpleList, (item: string) => {
          NotFirstRenderChildItem({ item: item })
            .margin({ top: 20 })
        }, (item: string) => item)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct NotFirstRenderChildItem {
  @Prop item: string;
  build() {
    Text(this.item)
      .fontSize(30)
  }
}
```

[ForEach3.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ForEach3.ets#L16-L55)

运行效果如下图所示。

**图4** ForEach非首次渲染案例运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/40/v3/UAXLB2LvRLCXu76qFNTvgw/zh-cn_image_0000002557924773.gif?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=C70815D3EEECE62572BB9EF094776D5D2DE863149D3D151815EA5C7F7B4503CE)

从本例可以看出[@State](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-state)能够监听到简单数据类型数组simpleList数组项的变化。

1.  当simpleList数组项发生变化时，会触发ForEach重新渲染。
2.  ForEach遍历新的数据源\['one', 'two', 'new three'\]，并生成对应的键值one、two和new three。
3.  其中，键值one和two在上次渲染中已经存在，所以 ForEach 复用了对应的组件并进行了渲染。对于第三个数组项 "new three"，由于其通过键值生成规则 item 生成的键值new three在上次渲染中不存在，因此 ForEach 为该数组项创建了一个新的组件。

## 使用场景

ForEach组件在开发过程中的主要应用场景包括：[数据源不变](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#数据源不变)、[数据源数组项发生变化](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#数据源数组项发生变化)（如插入、删除操作）、[数据源数组项子属性变化](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#数据源数组项子属性变化)。

### 数据源不变

在数据源保持不变的场景中，数据源可以直接采用基本数据类型。例如，页面加载状态时，可以使用骨架屏列表进行渲染展示。

```TypeScript
@Entry
@Component
struct ArticleList {
  @State simpleList: Array<number> = [1, 2, 3, 4, 5];
  build() {
    Column() {
      ForEach(this.simpleList, (item: number) => {
        ArticleSkeletonView()
          .margin({ top: 20 })
      }, (item: number) => item.toString())
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}
@Builder
function textArea(width: number | Resource | string = '100%', height: number | Resource | string = '100%') {
  Row()
    .width(width)
    .height(height)
    .backgroundColor('#FFF2F3F4')
}
@Component
struct ArticleSkeletonView {
  build() {
    Row() {
      Column() {
        textArea(80, 80)
      }
      .margin({ right: 20 })
      Column() {
        textArea('60%', 20)
        textArea('50%', 20)
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceAround)
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

[ArticleSkeletonView.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ArticleSkeletonView.ets#L16-L68)

运行效果如下图所示。

**图5** 骨架屏运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/03/v3/x1iCDZNRS1SYa2Wz96ngiQ/zh-cn_image_0000002527044858.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=3438E97493AA1D7F4DF3231D8331D76DD1E585351355EAEAC46F6C24FDD5C348)

在本示例中，采用数据项item作为键值生成规则，由于数据源simpleList的数组项各不相同，因此能够保证键值的唯一性。

### 数据源数组项发生变化

在数据源数组项发生变化的场景下，如数组插入、删除操作或者数组项索引位置交换时，数据源应为对象数组类型，并使用对象的唯一ID作为键值。

```TypeScript
class ArticleChangeSource {
  public id: string;
  public title: string;
  public brief: string;
  constructor(id: string, title: string, brief: string) {
    this.id = id;
    this.title = title;
    this.brief = brief;
  }
}
@Entry
@Component
struct ArticleListViewChangeSource {
  isListReachEnd: boolean = false;
  @State articleList: Array<ArticleChangeSource> = [
    new ArticleChangeSource('001', 'Article 1', 'Abstract'),
    new ArticleChangeSource('002', 'Article 2', 'Abstract'),
    new ArticleChangeSource('003', 'Article 3', 'Abstract'),
    new ArticleChangeSource('004', 'Article 4', 'Abstract'),
    new ArticleChangeSource('005', 'Article 5', 'Abstract'),
    new ArticleChangeSource('006', 'Article 6', 'Abstract')
  ];
  loadMoreArticles() {
    this.articleList.push(new ArticleChangeSource('007', 'New Article', 'Abstract'));
  }
  build() {
    Column({ space: 5 }) {
      List() {
        ForEach(this.articleList, (item: ArticleChangeSource) => {
          ListItem() {
            ArticleCardChangeSource({ article: item })
              .margin({ top: 20 })
          }
        }, (item: ArticleChangeSource) => item.id)
      }
      .onReachEnd(() => {
        this.isListReachEnd = true;
      })
      .parallelGesture(
        PanGesture({ direction: PanDirection.Up, distance: 80 })
          .onActionStart(() => {
            if (this.isListReachEnd) {
              this.loadMoreArticles();
              this.isListReachEnd = false;
            }
          })
      )
      .padding(20)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct ArticleCardChangeSource {
  @Prop article: ArticleChangeSource;
  build() {
    Row() {
      // 此处'app.media.startIcon'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
      Image($r('app.media.startIcon'))
        .width(80)
        .height(80)
        .margin({ right: 20 })
      Column() {
        Text(this.article.title)
          .fontSize(20)
          .margin({ bottom: 8 })
        Text(this.article.brief)
          .fontSize(16)
          .fontColor(Color.Gray)
          .margin({ bottom: 8 })
      }
      .alignItems(HorizontalAlign.Start)
      .width('80%')
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

[ArticleListView.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ArticleListView.ets#L16-L110)

初始运行效果（左图）和手势上滑加载后效果（右图）如下图所示。

**图6** 数据源数组项变化案例运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/de/v3/uRnvMormQ32u82FjWSlkyw/zh-cn_image_0000002558044739.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=852025CC1EE528583288A386364577E13201B7CDADB4C762B04CE072E380236D)

在本示例中，ArticleCardChangeSource组件作为ArticleListViewChangeSource组件的子组件，通过[@Prop](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-prop)装饰器接收一个ArticleChangeSource对象，用于渲染文章卡片。

1.  当列表滚动到底部且手势滑动距离超过80vp时，触发loadMoreArticles()函数。此函数在articleList数据源尾部添加新数据项，增加数据源长度。
2.  数据源被@State装饰器修饰，ArkUI框架能够感知数据源长度的变化并触发ForEach进行重新渲染。

### 数据源数组项子属性变化

当数据源的数组项为对象数据类型，并且只修改某个数组项的属性值时，由于数据源为复杂数据类型，ArkUI框架无法监听到@State装饰器修饰的数据源数组项的属性变化，从而无法触发ForEach的重新渲染。为实现ForEach子组件重新渲染，需要结合[@Observed和@ObjectLink](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-observed-and-objectlink)装饰器使用。例如，在文章列表卡片上点击“点赞”按钮，从而修改文章的点赞数量。

```TypeScript
@Observed
class ArticleChangeChild {
  public id: string;
  public title: string;
  public brief: string;
  public isLiked: boolean;
  public likesCount: number;
  constructor(id: string, title: string, brief: string, isLiked: boolean, likesCount: number) {
    this.id = id;
    this.title = title;
    this.brief = brief;
    this.isLiked = isLiked;
    this.likesCount = likesCount;
  }
}
@Entry
@Component
struct ArticleListChangeView {
  @State articleList: Array<ArticleChangeChild> = [
    new ArticleChangeChild('001', 'Article 0', 'Abstract', false, 100),
    new ArticleChangeChild('002', 'Article 1', 'Abstract', false, 100),
    new ArticleChangeChild('003', 'Article 2', 'Abstract', false, 100),
    new ArticleChangeChild('004', 'Article 4', 'Abstract', false, 100),
    new ArticleChangeChild('005', 'Article 5', 'Abstract', false, 100),
    new ArticleChangeChild('006', 'Article 6', 'Abstract', false, 100),
  ];
  build() {
    List() {
      ForEach(this.articleList, (item: ArticleChangeChild) => {
        ListItem() {
          ArticleCardChangeChild({
            article: item
          })
            .margin({ top: 20 })
        }
      }, (item: ArticleChangeChild) => item.id)
    }
    .padding(20)
    .scrollBar(BarState.Off)
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct ArticleCardChangeChild {
  @ObjectLink article: ArticleChangeChild;
  handleLiked() {
    this.article.isLiked = !this.article.isLiked;
    this.article.likesCount = this.article.isLiked ? this.article.likesCount + 1 : this.article.likesCount - 1;
  }
  build() {
    Row() {
      // 此处'app.media.startIcon'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
      Image($r('app.media.startIcon'))
        .width(80)
        .height(80)
        .margin({ right: 20 })
      Column() {
        Text(this.article.title)
          .fontSize(20)
          .margin({ bottom: 8 })
        Text(this.article.brief)
          .fontSize(16)
          .fontColor(Color.Gray)
          .margin({ bottom: 8 })
        Row() {
          // 此处app.media.iconLiked'，'app.media.iconUnLiked'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
          Image(this.article.isLiked ? $r('app.media.iconLiked') : $r('app.media.iconUnLiked'))
            .width(24)
            .height(24)
            .margin({ right: 8 })
          Text(this.article.likesCount.toString())
            .fontSize(16)
        }
        .onClick(() => this.handleLiked())
        .justifyContent(FlexAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)
      .width('80%')
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

[ArticleListView2.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ArticleListView2.ets#L16-L113)

上述代码的初始运行效果（左图）和点击第1个文章卡片上的点赞图标后的运行效果（右图）如下图所示。

**图7** 数据源数组项子属性变化案例运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ee/v3/0eY0yjv5TZ2qq6RvmAtrUg/zh-cn_image_0000002526884928.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=799F89D67BC1C32EAD4A7192AEC860992ECE9741A8E4D7086A3CEF5A1F93165A)

在本示例中，ArticleChangeChild类被@Observed装饰器修饰。父组件ArticleListChangeView传入ArticleChangeChild对象实例给子组件ArticleCardChangeChild，子组件使用@ObjectLink装饰器接收该实例。

1.  当点击第1个文章卡片上的点赞图标时，会触发ArticleCardChangeChild组件的handleLiked函数。该函数修改第1个卡片对应组件里ArticleChangeChild实例的isLiked和likesCount属性值。
2.  ArticleChangeChild实例是@ObjectLink装饰的状态变量，其属性值变化，会触发ArticleCardChangeChild组件渲染，此时读取的isLiked和likesCount为修改后的新值。

### 拖拽排序

在List组件下使用ForEach，并设置[onMove](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-drag-sorting#onmove)事件，每次迭代生成一个ListItem时，可以使能拖拽排序。拖拽排序离手后，如果组件位置发生变化，将触发onMove事件，上报组件移动原始索引号和目标索引号。在onMove事件中，需要根据上报的起始索引号和目标索引号修改数据源。数据源修改前后，要保持每个数据的键值不变，只是顺序发生变化，才能保证落位动画正常执行。

```TypeScript
@Entry
@Component
struct ForEachSort {
  @State arr: Array<string> = [];
  build() {
    Column() {
      // 点击此按钮会触发ForEach重新渲染
      Button('Add one item')
        .onClick(() => {
          this.arr.push('10');
        })
        .width(300)
        .margin(10)
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item.toString())
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .size({ height: 100, width: '100%' })
          }.margin(10)
          .borderRadius(10)
          .backgroundColor('#FFFFFFFF')
        }, (item: string) => item)
          .onMove((from: number, to: number) => {
            // 以下两行代码是为了确保拖拽后屏幕上组件的顺序与数组arr中每一项的顺序保持一致。
            // 若注释以下两行，第一步拖拽排序，第二步在arr末尾插入一项，触发ForEach渲染，此时屏上组件的顺序会跟数组arr中每一项的顺序一致，而不是维持第一步拖拽后的顺序，意味着拖拽排序在ForEach渲染后失效了。
            let tmp = this.arr.splice(from, 1);
            this.arr.splice(to, 0, tmp[0]);
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFDCDCDC')
    }
  }
  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i.toString());
    }
  }
}
```

[ForEachSort.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ForEachSort.ets#L16-L62)

**图8** ForEach拖拽排序效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8f/v3/F_1wv7k-RGqBt-1wNgIIbQ/zh-cn_image_0000002557924775.gif?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=2B5D608C81B1F82CD0D64955CB3A4027ABE916BF803EC48DA76EED615CF667E8)

注释掉onMove事件调用中的两行代码，点击Add one item触发渲染后的效果如下图所示。

**图9** ForEach拖拽排序效果在重新渲染后没有保留

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/be/v3/8v0l0xxZT9mk42Ed6FIRFg/zh-cn_image_0000002527044860.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=35DF1BBDAD9B85F5323D0AA57DBFE6008EDEFF9478461543360AE9B04331F7CF)

## 使用建议

-   为满足键值的唯一性，对于对象数据类型，建议使用对象数据中的唯一id作为键值。
-   不建议在键值中包含数据项索引index，可能会导致[渲染结果非预期](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染结果非预期)和[渲染性能降低](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染性能降低)。如果确实需要使用index，例如列表通过index进行条件渲染，开发者需接受ForEach在数据源变更后重新创建组件导致的性能损耗。
-   基本类型数组的数据项没有唯一ID属性。如果使用数据项作为键值，必须确保数据项无重复。对于数据源会变化的场景，建议将基本类型数组转换为具有唯一ID属性的Object类型数组，再使用唯一ID属性作为键值。
-   对于以上限制规则，index参数存在的意义为：index是开发者保证键值唯一性的最终手段；对数据项进行修改时，由于itemGenerator中的item参数是不可修改的，所以须用index索引值对数据源进行修改，进而触发UI重新渲染。
-   ForEach在滚动容器组件 [List](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-list)、[Grid](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-grid)、[Swiper](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-swiper)以及[WaterFlow](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-waterflow) 内使用的时候，不建议与[LazyForEach](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-lazyforeach) 同时使用。
-   在大量子组件的场景下，ForEach可能会导致卡顿。请考虑使用[LazyForEach](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-lazyforeach)替代。最佳实践请参考[使用懒加载优化性能](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-lazyforeach-optimization)。
-   当数组项为对象类型时，不建议用内容相同的数组项替换旧项。若数组项发生变更但键值未变，会导致[数据变化不渲染](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#数据变化不渲染)。

## 常见问题

对ForEach键值的错误使用会导致功能和性能问题。详见案例[渲染结果非预期](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染结果非预期)和[渲染性能降低](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#渲染性能降低)。

### 渲染结果非预期

在本示例中，通过设置ForEach的第三个参数KeyGenerator函数，自定义键值生成规则为数据源的索引index的字符串类型值。当点击父组件ForEachAbnormal中“Insert Item After First Item”文本组件后，界面会出现非预期的结果。

```TypeScript
@Entry
@Component
struct ForEachAbnormal {
  @State simpleList: Array<string> = ['one', 'two', 'three'];
  build() {
    Column() {
      Button() {
        Text('Insert Item After First Item').fontSize(30)
      }
      .onClick(() => {
        this.simpleList.splice(1, 0, 'new item');
      })
      ForEach(this.simpleList, (item: string) => {
        ForEachAbnormalChildItem({ item: item })
      }, (item: string, index: number) => index.toString())
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct ForEachAbnormalChildItem {
  @Prop item: string;
  build() {
    Text(this.item)
      .fontSize(30)
  }
}
```

[AbnormalExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/AbnormalExample.ets#L16-L51)

上述代码的初始渲染效果和点击“在第1项后插入新项”文本组件后的渲染效果如下图所示。

**图10** 渲染结果非预期运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ec/v3/S-tRcwR5RE6FrR1oDYzn4g/zh-cn_image_0000002558044741.gif?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=314BE68EF4A2FA94046D7B163B8E99357579EDCEE517064D0C57AD020360BCCF)

ForEach在首次渲染时，创建的键值依次为"0"、"1"、"2"。

插入新项后，数据源simpleList变为\['one', 'new item', 'two', 'three'\]，框架监听到@State装饰的数据源长度变化触发ForEach重新渲染。

ForEach依次遍历新数据源，遍历数据项"one"时生成键值"0"，存在相同键值，因此不创建新组件。继续遍历数据项"new item"时生成键值"1"，存在相同键值，因此不创建新组件。继续遍历数据项"two"生成键值"2"，存在相同键值，因此不创建新组件。最后遍历数据项"three"时生成键值"3"，不存在相同键值，创建内容为"three"的新组件并渲染。

从以上可以看出，当键值包含数据项索引index时，期望的界面渲染结果为\['one', 'new item', 'two', 'three'\]，而实际的渲染结果为\['one', 'two', 'three', 'three'\]，不符合开发者预期。因此，开发者在使用ForEach时应避免键值包含索引index。

### 渲染性能降低

在本示例中，ForEach的第三个参数KeyGenerator函数缺省。根据上述[键值生成规则](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach#键值生成规则)，此例使用框架默认的键值，即最终键值为字符串index + '\_\_' + JSON.stringify(item)。点击文本组件“在第1项后插入新项”后，ForEach将为第2个数组项及后面的所有数据项重新创建组件。

```TypeScript
import { hilog } from '@kit.PerformanceAnalysisKit';
const TAG = '[Sample_RenderingControl]';
const DOMAIN = 0xF811;
@Entry
@Component
struct ReducedRenderingPerformance {
  @State simpleList: Array<string> = ['one', 'two', 'three'];
  build() {
    Column() {
      Button() {
        Text('Insert Item After First Item').fontSize(30)
      }
      .onClick(() => {
        this.simpleList.splice(1, 0, 'new item');
        hilog.info(DOMAIN, 'testTag', '[onClick]: simpleList is [${this.simpleList.join(', ')}]');
      })
      ForEach(this.simpleList, (item: string) => {
        ReducedChildItem({ item: item })
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct ReducedChildItem {
  @Prop item: string;
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, '[aboutToAppear]: item is ${this.item}');
  }
  build() {
    Text(this.item)
      .fontSize(50)
  }
}
```

[BadPerformance.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/BadPerformance.ets#L16-L60)

以上代码的初始渲染效果和点击"Insert Item After First Item"文本组件后的渲染效果如下图所示。

**图11** 渲染性能降低案例运行效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/71/v3/fAxvuUpvSa6uYLsbWRV5xA/zh-cn_image_0000002526884930.gif?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=C70FBE632C0DEDA202BA931237F7EE1126C8531E04D3C5E64DF2338CB93666BB)

点击“Insert Item After First Item”文本组件后，DevEco Studio的日志打印结果如下所示。

**图12** 渲染性能降低案例日志打印图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c4/v3/20Gwj7s8Q-uqxLqImQBXkQ/zh-cn_image_0000002557924777.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=ABFF08A5AFD70003ABDFADA1BFBBBA05C32AF9D9FCC4E203CF940B7D604E7484)

插入新项后，ForEach为new item、 two、 three三个数组项创建了对应的ReducedChildItem组件，并执行了组件的[aboutToAppear()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-custom-component-lifecycle#abouttoappear)生命周期函数。这是因为：

1.  ForEach首次渲染时，生成的键值依次为0\_\_one、1\_\_two和2\_\_three。
2.  插入新项后，数据源simpleList变为\['one', 'new item', 'two', 'three'\]，ArkUI框架监听到@State装饰的数据源长度变化触发ForEach重新渲染。
3.  ForEach依次遍历新数据源，遍历数据项one时生成键值0\_\_one，键值已存在，因此不创建新组件。继续遍历数据项new item时生成键值1\_\_new item，不存在相同键值，创建内容为new item的新组件并渲染。继续遍历数据项two生成键值2\_\_two，不存在相同键值，创建内容为two的新组件并渲染。最后遍历数据项three时生成键值3\_\_three，不存在相同键值，创建内容为three的新组件并渲染。

尽管本例中界面渲染结果符合预期，但在每次向数组中间插入新数组项时，ForEach会为该数组项及其后面的所有数组项重新创建组件。当数据源数据量较大或组件结构复杂时，组件无法复用会导致性能下降。因此，不建议省略第三个参数KeyGenerator函数，也不建议在键值中使用数据项索引index。

正确渲染并保证效率的ForEach写法是：

```TypeScript
ForEach(this.simpleList, (item: string) => {
  ForEachChildItem({ item: item })
}, (item: string) => item) // 需要保证key唯一
```

[ForEach1.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ForEach1.ets#L25-L29)

提供了第三个参数KeyGenerator，在这个例子中，对数据源的不同数据项生成不同的key，并且对同一个数据项每次生成相同的key。

### 数据变化不渲染

点击按钮Like/UnLike first article，第一个组件会切换点赞手势和后面的点赞数量，但是点击按钮Replace first article之后再点击按钮Like/UnLike first article就不生效了。原因是替换articleList\[0\]之后，articleList状态变量发生变化，触发ForEach重新渲染，但是新的articleList\[0\]生成的key没有变，ForEach不会将数据更新同步给子组件，因此第一个组件仍然绑定旧的articleList\[0\]。新articleList\[0\]的属性发生变更，第一个组件感知不到，不会重新渲染。点击点赞手势，会触发渲染。因为变更的是跟组件绑定的数组项的属性，组件会感知并重新渲染。

```TypeScript
@Observed
class ArticleChangeData {
  public id: string;
  public title: string;
  public brief: string;
  public isLiked: boolean;
  public likesCount: number;
  constructor(id: string, title: string, brief: string, isLiked: boolean, likesCount: number) {
    this.id = id;
    this.title = title;
    this.brief = brief;
    this.isLiked = isLiked;
    this.likesCount = likesCount;
  }
}
@Entry
@Component
struct ArticleListChangeData {
  @State articleList: Array<ArticleChangeData> = [
    new ArticleChangeData('001', 'Article 0', 'Abstract', false, 100),
    new ArticleChangeData('002', 'Article 1', 'Abstract', false, 100),
    new ArticleChangeData('003', 'Article 2', 'Abstract', false, 100),
    new ArticleChangeData('004', 'Article 4', 'Abstract', false, 100),
    new ArticleChangeData('005', 'Article 5', 'Abstract', false, 100),
    new ArticleChangeData('006', 'Article 6', 'Abstract', false, 100),
  ];
  build() {
    Column() {
      Button('Replace first article')
        .onClick(() => {
          this.articleList[0] = new ArticleChangeData('001', 'Article 0', 'Abstract', false, 100);
        })
        .width(300)
        .margin(10)
      Button('Like/Unlike first article')
        .onClick(() => {
          this.articleList[0].isLiked = !this.articleList[0].isLiked;
          this.articleList[0].likesCount =
            this.articleList[0].isLiked ? this.articleList[0].likesCount + 1 : this.articleList[0].likesCount - 1;
        })
        .width(300)
        .margin(10)
      List() {
        ForEach(this.articleList, (item: ArticleChangeData) => {
          ListItem() {
            ArticleCardChangeData({
              article: item
            })
              .margin({ top: 20 })
          }
        }, (item: ArticleChangeData) => item.id)
      }
      .padding(20)
      .scrollBar(BarState.Off)
      .backgroundColor(0xF1F3F5)
    }
  }
}
@Component
struct ArticleCardChangeData {
  @ObjectLink article: ArticleChangeData;
  handleLiked() {
    this.article.isLiked = !this.article.isLiked;
    this.article.likesCount = this.article.isLiked ? this.article.likesCount + 1 : this.article.likesCount - 1;
  }
  build() {
    Row() {
      // 此处'app.media.startIcon'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
      Image($r('app.media.startIcon'))
        .width(80)
        .height(80)
        .margin({ right: 20 })
      Column() {
        Text(this.article.title)
          .fontSize(20)
          .margin({ bottom: 8 })
        Text(this.article.brief)
          .fontSize(16)
          .fontColor(Color.Gray)
          .margin({ bottom: 8 })
        Row() {
          // 此处app.media.iconLiked'，'app.media.iconUnLiked'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
          Image(this.article.isLiked ? $r('app.media.iconLiked') : $r('app.media.iconUnLiked'))
            .width(24)
            .height(24)
            .margin({ right: 8 })
          Text(this.article.likesCount.toString())
            .fontSize(16)
        }
        .onClick(() => this.handleLiked())
        .justifyContent(FlexAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)
      .width('80%')
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

[ArticleListView3.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/ArticleListView3.ets#L16-L131)

**图13** 数据变化不渲染

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/79/v3/j3d25I20Qgif39yzdD3w5g/zh-cn_image_0000002527044862.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=E115FEF80EB825D2401CAD4896A6713A1CD49F55563394A31326564F110DD58B)

### 非必要内存消耗

如果开发者没有定义keyGenerator函数，则ArkUI框架会使用默认的键值生成函数，即(item: Object, index: number) => { return index + '\_\_' + JSON.stringify(item); }。当item是复杂对象时，将其JSON序列化会得到长字符串，占用更多的内存。

```TypeScript
class MemoryData {
  public longStr: string;
  public key: string;
  constructor(longStr: string, key: string) {
    this.longStr = longStr;
    this.key = key;
  }
}
@Entry
@Component
struct NonNecessaryMemory {
  @State simpleList: Array<MemoryData> = [];
  aboutToAppear(): void {
    let longStr = '';
    for (let i = 0; i < 2000; i++) {
      longStr += i.toString();
    }
    for (let index = 0; index < 3000; index++) {
      let data: MemoryData = new MemoryData(longStr, 'a' + index.toString());
      this.simpleList.push(data);
    }
  }
  build() {
    List() {
      ForEach(this.simpleList, (item: MemoryData) => {
        ListItem() {
          Text(item.key)
        }
      }
        // 如果不定义下面的keyGenerator函数，则ArkUI框架会使用默认的键值生成函数
        , (item: MemoryData) => {
          return item.key;
        }
      )
    }.height('100%')
    .width('100%')
  }
}
```

[NonNecessaryMem.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/NonNecessaryMem.ets#L16-L59)

对比自定义keyGenerator函数和使用默认键值生成函数两种情况下的内存占用（通过DevEco->Profiler->Realtime Monitor工具，可以获取相关进程的内存数据）。自定义keyGenerator函数，这个示例代码的内存占用降低了约70MB。

**图14** 使用默认键值生成函数下的内存占用

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/M-yHRgSsSSKHlIrxbWDrhw/zh-cn_image_0000002558044743.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=EADA6E4D3714ACD917DAF9AD0599AD66DCD6F07BDE6306F76452203C7F7AA9CF)

**图15** 自定义键值生成函数下的内存占用

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/aa/v3/awPeN_7LRea-PUU2p-JlHA/zh-cn_image_0000002526884932.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=28EB5D706A5F5EAB4A2052750BE4EF3872A4C09022D04B4466A4357CB458DDA1)

### 键值生成失败

如果开发者没有定义keyGenerator函数，则ArkUI框架会使用默认的键值生成函数，即(item: Object, index: number) => { return index + '\_\_' + JSON.stringify(item); }。然而，JSON.stringify序列化在某些数据结构上会失败，导致应用发生jscrash并退出。例如，bigint无法被JSON.stringify序列化：

```TypeScript
class KeyData {
  public content: bigint;
  constructor(content: bigint) {
    this.content = content;
  }
}
@Entry
@Component
struct GenerationKeyExample {
  @State simpleList: Array<KeyData> = [new KeyData(1234567890123456789n), new KeyData(2345678910987654321n)];
  build() {
    Row() {
      Column() {
        ForEach(this.simpleList, (item: KeyData) => {
          GenerationKeyChildItem({ item: item.content.toString() })
        }
          // 如果不定义下面的keyGenerator函数，则ArkUI框架会使用默认的键值生成函数
          // KeyData中的content: bigint在JSON序列化时失败
          , (item: KeyData) => item.content.toString()
        )
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}
@Component
struct GenerationKeyChildItem {
  @Prop item: string;
  build() {
    Text(this.item)
      .fontSize(50)
  }
}
```

[CrashNormalExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/RenderingControl/entry/src/main/ets/pages/RenderingForeach/CrashNormalExample.ets#L16-L58)

开发者定义keyGenerator函数，应用正常启动：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4a/v3/4ooP4hs_TkCu9Y7PnK0m5g/zh-cn_image_0000002557924779.png?HW-CC-KV=V1&HW-CC-Date=20260312T082702Z&HW-CC-Expire=86400&HW-CC-Sign=98B5E1EF0D0AD66A85C0D2E9AF7D7B43F675E333C9393A4C45E809C50CA55B81)

使用默认的键值生成函数，应用发生jscrash：

```javascript
Error message:@Component 'Parent'[4]: ForEach id 7: use of default id generator function not possible on provided data structure. Need to specify id generator function (ForEach 3rd parameter). Application Error!
Stacktrace:
    ...
    at anonymous (entry/src/main/ets/pages/Index.ets:18:52)
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-foreach*