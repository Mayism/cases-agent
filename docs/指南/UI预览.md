---
title: UI预览
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-ide-previewer
category: 指南
updated_at: 2026-03-12T10:00:48.019Z
---

# UI预览

DevEco Studio为开发者提供了UI预览功能，方便查看UI效果并随时调整页面布局。预览支持页面预览和组件预览。图1中左侧图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b5/v3/Ff80z_bRQFa4_LsC-w0igg/zh-cn_image_0000002558376721.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=FC2893D6E0D3C563BCBC5ABA9BC6D48C4C3A7D43F1422C6A4D5114CF24F6D7EF)表示页面预览，右侧图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/50/v3/3To3WhXWTGeTuFPHcfjY3Q/zh-cn_image_0000002527376840.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=57D0DF9A987B9AC98B8756000487D41C366B61E524DAB08AF13F636F8642AEFB)表示组件预览。

说明

操作系统和真机设备的差异可能导致预览效果与真机效果不同。预览效果仅作参考，实际效果以真机为准。

**图1** 预览图标

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/qfw2s-6GR5276LVD4FEm_Q/zh-cn_image_0000002558536619.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=7B2822EC6256AB4091071D33A59BE96CBD8CB8EE57104900DCB0BED995F1545F)

## 页面预览

ArkTS应用/元服务均支持页面预览。页面预览通过在工程的ets文件中，给自定义组件添加[@Entry](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-create-custom-components#entry)装饰器，即可以查看当前UI页面效果。

-   启动方式：选中需要预览的ets页面，点击右侧侧边栏的Previewer按钮，启动页面预览。
    
-   热加载：在启动页面预览的前提下，添加、删除或修改UI组件后，通过Ctrl+S保存，预览器会同步刷新预览效果，无需重新启动预览。
    
-   路由能力：支持通过路由能力进行页面切换查看其它页面预览效果。
    

在页面预览的基础上，提供了极速预览和Inspector双向预览两种特性。下面将详细说明这两种特性。

### 极速预览

支持在修改组件的属性时，无需使用Ctrl+S进行保存，可以直接观察到修改后的预览效果。极速预览默认开启，若需关闭，点击预览器右上角按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a9/v3/a6aHoVgiTNu_MT1jZMCxiA/zh-cn_image_0000002527216888.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=0A4BE94B24C6A78F56FD96763575582AD4525CA93A37250456D8A891023887DF)即可。

注意

部分应用场景不支持极速预览：

-   不显示的组件。
-   新增或删除组件。
-   包含private变量或无类型的controller的组件。
-   使用了[@Builder](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-builder)、[@Style](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-style)、[@Extend](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-extend)等装饰器的组件。
-   修改使用import导入外部组件/模块的组件。
-   修改状态变量。

效果如图2所示：

**图2** 极速预览演示图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8a/v3/V79aCvjSQmeS0XlZkjwH2g/zh-cn_image_0000002558376723.gif?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=51A0B3E49A781975AB02C95E2207D3EABD4750362AC0914CBB1B8095657896F1)

### inspector双向预览

支持ets文件与预览器的双向预览。使用时，点击预览器界面图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1e/v3/PqTgWME0RpeehaHbQHWRQw/zh-cn_image_0000002527376842.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=511B5899CC52A77B8C587A21529A23AB3F8E07604FB15A79F777FB4C7052A444)开启双向预览功能。

开启双向预览功能后，支持代码编辑器、UI界面和组件树之间的联动：

1.  选中预览器界面中的组件，组件树上对应的组件将被选中，同时代码编辑器中的布局文件中对应的代码块高亮显示。
    
2.  选中布局文件中的代码块，预览器界面将高亮显示，组件树上的组件节点将呈现被选中的状态。
    
3.  选中组件树中的组件，对应的代码块和预览器界面将高亮显示。
    
4.  在预览界面，通过组件的属性面板修改可修改的属性或样式。预览界面的修改会自动同步到代码编辑器中，并实时刷新预览器界面。代码编辑器中的源码修改也会实时刷新预览器界面，并更新组件树信息及组件属性。
    

效果如图3所示：

**图3** inspector双向预览演示图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/Cc59fFrBT2CnOcOVu1nI3g/zh-cn_image_0000002558536621.gif?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=AD821D1794D70DC8EEE7697E1AAFEAD794AB9AEF61C24C823B0B5DF31893A835)

## 组件预览

ArkTS应用/元服务支持组件预览功能。组件预览通过在自定义组件前添加[@Preview](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-component-previewer#preview装饰器)装饰器实现。在单个源文件中，最多可以使用10个@Preview装饰自定义组件。启动方式：

-   当组件被@Entry和@Preview装饰时，点击右侧侧边栏的Previewer按钮，启动页面预览，页面加载成功后，点击![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1c/v3/eMjrIzexRCGLAQ8z9vbLng/zh-cn_image_0000002527376840.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=51C3FE0DE363B04A70F3537B57E5CAB0A715C8C8C0849AB7CAAE9191348AA97B)，切换到组件预览。
-   当组件仅被@Preview装饰时，点击右侧侧边栏的Previewer按钮，则默认为组件预览。

组件预览时，使用@Preview装饰器的默认属性（请参考[@Preview装饰器](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-component-previewer#previewparams9)）进行效果显示。可以通过设置@Preview的参数，指定预览设备的相关属性，包括设备类型、屏幕形状等。

@Preview的使用参考如下示例：

```typescript
@Entry
@Preview
@Component
struct ComponentPreviewOne {
  build() {
    Column() {
      Text('this is component previewer One')
        .height(80)
        .fontSize(30)
      // $r('app.media.startIcon')需要替换为开发者所需的图像资源文件
      Image($r('app.media.startIcon'))
        .height(300)
        .width(300)
    }
  }
}
@Preview
@Component
struct ComponentPreviewTwo {
  build() {
    Column() {
      Text('this is component previewer Two')
        .height(80)
        .fontSize(30)
        .fontColor(Color.Pink)
      // $r('app.media.startIcon')需要替换为开发者所需的图像资源文件
      Image($r('app.media.startIcon'))
        .height(300)
        .width(300)
    }
  }
}
```

效果如图4所示：

**图4** 组件预览效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fb/v3/f1Ju-jsERBCwvb5xU_-2MA/zh-cn_image_0000002527216890.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=F30C44933B1B5210370D31B47FC6744F347E0492D9CBE575592F1D6FC907F9F8)

## 动态修改分辨率

同一个应用/元服务可以运行在多个设备上，因不同设备的屏幕分辨率、形状、大小等不同，开发者需要在不同的设备上查看应用/元服务的UI布局和交互效果。预览支持动态修改分辨率，方便开发者随时查看不同设备上的页面显示效果。启动方式：启动页面预览后，点击右上角![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f5/v3/20oWfEaXRFuaCgjXhxKkpg/zh-cn_image_0000002558376725.png?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=E414DBB1DD5BDEE142B715DFA8BAAB50BCCA98EDAA719A5F62DF9C368B9E6E17)，即可拖动页面选中框动态修改当前设备的屏幕大小。

效果如图5所示：

**图5** 动态修改分辨率效果图

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/CRS_erhvTC-eDu5VgQ7OXw/zh-cn_image_0000002527376844.gif?HW-CC-KV=V1&HW-CC-Date=20260312T100026Z&HW-CC-Expire=86400&HW-CC-Sign=244495112354D5D9E7CBBF53F6E55E5D9ADFDE69566A336F05F70C22656B3AF0)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-ide-previewer*