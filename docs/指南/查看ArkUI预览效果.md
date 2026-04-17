---
title: 查看ArkUI预览效果
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-arkui
category: 指南
updated_at: 2026-03-13T04:49:48.522Z
---

# 查看ArkUI预览效果

ArkUI预览支持页面预览、组件预览和卡片预览，下图中左侧图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/86/v3/kPLLYnmwRwSu3hVFYpLYUg/zh-cn_image_0000002532670333.png?HW-CC-KV=V1&HW-CC-Date=20260313T044908Z&HW-CC-Expire=86400&HW-CC-Sign=78E1A16AC56ABE60D149A7AF48E99E5982A0D7D18316606182DB869A6C26D78E)为页面预览，右侧图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b7/v3/uOPz7Ie5Rb6nebzbQdMViQ/zh-cn_image_0000002532670329.png?HW-CC-KV=V1&HW-CC-Date=20260313T044908Z&HW-CC-Expire=86400&HW-CC-Sign=6FAF1F5E2A14820CD1D3E89B095B87833FD2013C4D03856B2F108EEC8B49288A)为组件预览，卡片预览在创建卡片文件后可直接预览。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/hqI_B-M-RgCMmQ_F6NPrLA/zh-cn_image_0000002500910412.png?HW-CC-KV=V1&HW-CC-Date=20260313T044908Z&HW-CC-Expire=86400&HW-CC-Sign=125026B382DE0CFE44FA7354EF3B4397FA17E844ABEF2E2064D1B8594854D574)

## 页面预览

ArkTS应用/元服务支持页面预览。页面预览通过在工程的ets文件头部添加@Entry实现。

@Entry的使用参考如下示例：

```typescript
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

## 组件预览

ArkTS应用/元服务支持组件预览。组件预览支持实时预览，不支持动态图和动态预览。组件预览通过在组件前添加注解@Preview实现，在单个源文件中，最多可以使用10个@Preview装饰自定义组件。

@Preview的使用参考如下示例：

```less
@Preview({
  title: 'ContentTable'
})
@Component
struct ContentTablePreview {
  build() {
    Flex() {
      ContentTable({ foodItem: getDefaultFoodData() })
    }
  }
}
```

以上示例的组件预览效果如下图所示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/66/v3/mvpCuDy7SjOhgE4BV0j2RQ/zh-cn_image_0000002501070258.gif?HW-CC-KV=V1&HW-CC-Date=20260313T044908Z&HW-CC-Expire=86400&HW-CC-Sign=CEC1B9796F0A41584099A29A650DCEB0F141B98A7D22940C916922247558C50B "点击放大")

组件预览默认的预览设备为Phone，若您想查看不同的设备，或者不同的屏幕形状，或者不同设备语言等情况下的组件预览效果，可以通过设置@Preview的参数，指定预览设备的相关属性。若不设置@Preview的参数，默认的设备属性如下所示：

```cangjie
@Preview({
  title: 'Component1',  //预览组件的名称
  deviceType: 'phone',  //指定当前组件预览渲染的设备类型，默认为Phone
  width: 1080,  //预览设备的宽度，单位：px
  height: 2340,  //预览设备的长度，单位：px
  colorMode: 'light',  //显示的亮暗模式，当前支持取值为light
  dpi: 480,  //预览设备的屏幕DPI值
  locale: 'zh_CN',  //预览设备的语言，如zh_CN、en_US等
  orientation: 'portrait',  //预览设备的横竖屏状态，取值为portrait或landscape
  roundScreen: false  //设备的屏幕形状是否为圆形
})
```

请注意，如果被预览的组件是依赖参数注入的组件，建议的预览方式是：定义一个组件片段，在该片段中声明将要预览的组件，以及该组件依赖的入参，并在组件片段上标注@Preview注解，以表明将预览该片段中的内容。例如，要预览如下组件：

```scss
@Component
struct Title {
  @Prop context: string;
  build() {
    Text(this.context)
  }
}
```

建议按如下方式预览：

```less
@Preview
@Component    //定义组件片段TitlePreview
struct TitlePreview {
  build() {
    Title({ context: 'MyTitle' })    //在该片段中声明将要预览的组件Title，以及该组件依赖的入参 {context: 'MyTitle'}
  }
}
```

## 卡片预览

创建卡片并选中卡片文件后，点击右侧边栏**Previewer**按钮即可预览卡片。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/Gag_D-iySUG-HBwcvI_Qog/zh-cn_image_0000002532750279.png?HW-CC-KV=V1&HW-CC-Date=20260313T044908Z&HW-CC-Expire=86400&HW-CC-Sign=B8E9DFC330FC153E124A86FA6CCCC6BB82B98A4E790E451B9819AC57E630D23B "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-previewer-arkui*