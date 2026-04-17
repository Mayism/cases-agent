---
title: ArkTS卡片使用自定义字体
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-load-custom-font
category: 指南
updated_at: 2026-03-12T11:57:54.505Z
---

# ArkTS卡片使用自定义字体

API version 22开始新增了[ohos.graphics.text.FontCollection.getLocalInstance](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-graphics-text#getlocalinstance22)接口获取本地字体集实例，应用可以通过这个本地实例为卡片加载自定义字体。

## 开发步骤

1.  创建动态卡片：按照[创建ArkTS卡片](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-creation)里的描述创建动态卡片。
    
2.  在项目entry\\src\\main\\resources\\rawfile目录下添加自定义字体文件xxx.ttf。
    
3.  页面布局代码实现entry/src/main/ets/widget/pages/WidgetCard.ets。
    
    在卡片页面中布局两个按钮，点击按钮load font或按钮unload font，调用本地字体集实例的loadFontSync、unloadFontSync进行字体的加载、卸载。
    

```typescript
// entry/src/main/ets/widget/pages/WidgetCard.ets
import { text } from '@kit.ArkGraphics2D';
@Entry
@Component
struct loadFontSyncCard {
  // 在这里使用getLocalInstance访问本地字体集实例
  private fc: text.FontCollection = text.FontCollection.getLocalInstance();
  @State content: string = '默认字体';
  build() {
    Column({ space: 10 }) {
      Text(this.content)
        .fontFamily('custom') // 在此处声明组件使用自定义字体
      Button('load font')
        .onClick(() => {
          // 在此处加载自定义字体文件
          this.fc.loadFontSync('custom', $rawfile('xxx.ttf'));
          this.content = '自定义字体';
        })
      Button('unload font')
        .onClick(() => {
          this.fc.unloadFontSync('custom');
          this.content = '默认字体';
        })
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
```

说明

-   本地字体集可加载多个自定义字体，内存限制最多可加载20MB的字体。
    
-   同一应用的所有卡片共用一个本地字体集实例。加载或卸载自定义字体后，所有卡片的字体显示会同步更新。
    

### 运行结果

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/40/v3/YyGS-Nw8Q_mNqmrPSY_uTA/zh-cn_image_0000002527216974.gif?HW-CC-KV=V1&HW-CC-Date=20260312T115710Z&HW-CC-Expire=86400&HW-CC-Sign=87F0021D8D275049FD1716D357152BDEA6F2F62BAEF91F852321108283745319)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-ui-widget-load-custom-font*