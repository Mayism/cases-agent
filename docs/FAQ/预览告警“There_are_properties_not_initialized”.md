---
title: 预览告警“There are properties not initialized”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-previewer-operating-4
category: FAQ
updated_at: 2026-03-13T05:29:25.734Z
---

# 预览告警“There are properties not initialized”

**问题现象**

启动预览后，预览窗口白屏，并显示错误信息：“Preview failed. View details in the PreviewerLog window.”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f0/v3/HpSd89IYQvOe8rBLkooLAg/zh-cn_image_0000002194317976.png?HW-CC-KV=V1&HW-CC-Date=20260313T052920Z&HW-CC-Expire=86400&HW-CC-Sign=AA064BB51E735D2C28D5C0A921F28D836BB0F06D25430F0A94DDC811898586B3 "点击放大")

此时下方PreviewLog窗口出现告警信息：“There are properties not initialized.”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a5/v3/l56f1cL2TIC-w3-HsAK9OQ/zh-cn_image_0000002194158356.png?HW-CC-KV=V1&HW-CC-Date=20260313T052920Z&HW-CC-Expire=86400&HW-CC-Sign=45C5844E0B325FC72B4E98792BBECBAA831241A5BDF0DD4648F566E198DC52A5)

**解决措施**

预览页面或组件中存在未初始化成功的成员变量，调用这些成员变量的属性或方法时会导致错误，预览界面显示空白。导致该问题的常见原因包括：

场景一：使用AppStorage等方法设置全局变量。

场景二：使用router.getParams()获取路由参数。

使用自定义的Mock。

1.  在 oh-package.json5 中添加以下依赖。
    
    ```json
    "dependencies": {
      // The version number needs to be modified according to the relationship between hvigor and the SDK
      "@ohos/hamock": "1.0.0"
    }
    ```
    
    [oh-package.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/InterfacePreviewKit/entry/oh-package.json5#L11-L14)
    
2.  预览页面中导入mock依赖。
    
    ```typescript
    import { MockSetup } from '@ohos/hamock';
    ```
    
    [GlobalData.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/InterfacePreviewKit/entry/src/main/ets/pages/GlobalData.ets#L22-L22)
    
3.  设置mock数据。
    
    ```typescript
    @MockSetup
    mock(){
      this.fruit = new Fruit("apple");
    }
    ```
    
    [GlobalData.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/InterfacePreviewKit/entry/src/main/ets/pages/GlobalData.ets#L44-L47)
    

场景一：使用AppStorage等方法设置的全局变量，修改后的示例代码如下：

```typescript
import { MockSetup } from '@ohos/hamock';
export default class Fruit{
  public name: string;
  getName(): string{
    return this.name;
  }
  constructor(name: string) {
    this.name = name;
  }
}
@Entry
@Component
struct GlobalData {
  @State fruit:Fruit = AppStorage.get("fruit") as Fruit;
  @MockSetup
  mock(){
    this.fruit = new Fruit("apple");
  }
  build() {
    Row() {
      Column() {
        Text(this.fruit.name)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[GlobalData.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/InterfacePreviewKit/entry/src/main/ets/pages/GlobalData.ets#L21-L61)

场景二：使用路由参数，修改后的示例代码如下：

```typescript
import { MockSetup } from '@ohos/hamock';
@Entry
@Component
struct Page {
  @State params: object = this.getUIContext().getRouter().getParams();
  @MockSetup
  mock(){
    this.params = [];
    this.params["path"] = "path";
  }
  build() {
    Row() {
      Column() {
        Text(this.params['path'])
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[InterfacePreviewNotInitialized.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/InterfacePreviewKit/entry/src/main/ets/pages/InterfacePreviewNotInitialized.ets#L21-L45)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-previewer-operating-4*