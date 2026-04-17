---
title: 跨设备互通（RichEditor控件）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/servicecollaboration-richeditor-title
category: 指南
updated_at: 2026-03-12T13:46:15.121Z
---

# 跨设备互通（RichEditor控件）

富文本控件已经集成跨设备互通能力，通过使用富文本控件[RichEditor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-richeditor)的右键菜单即可使用跨设备互通能力。跨设备互通提供跨设备的相机、扫描、通过图库访问图片的能力，平板或2in1设备可以调用手机的相机、扫描、图库等功能。

## 场景介绍

您通过此能力实现跨设备交互，可以使用其他设备的相机、扫描和图库功能。

## 约束与限制

需同时满足以下条件，才能使用该功能：

-   **设备限制**
    -   本端设备：HarmonyOS版本为HarmonyOS NEXT及以上的平板或2in1设备。
    -   远端设备：HarmonyOS版本为HarmonyOS NEXT及以上、具有相机能力的手机或平板设备。
-   **使用限制**
    -   双端设备需要登录同一华为账号。
    -   跨设备互通API支持根据特定调用策略调用设备。调用策略：2in1设备可以调用平板和手机，平板可以调用手机，同类型设备不可调用。
    -   双端设备需要打开WLAN和蓝牙开关。
        
        条件允许时，建议双端设备接入同一个局域网，可提升唤醒相机的速度。
        

## 开发步骤

-   添加[RichEditor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-richeditor)富文本组件，即可在富文本组件中右键中选择其他设备进行导入，通过onWillChange属性对回传的照片进行处理。
    
    ```cangjie
    @Entry
    @Component
    struct Index {
      controller: RichEditorController = new RichEditorController()
      options: RichEditorOptions = { controller: this.controller }
      build() {
        Column() {
          Column() {
            RichEditor(this.options)
              .onWillChange((value: RichEditorChangeValue) => {
                if (value?.replacedImageSpans[0]?.imageStyle?.objectFit != 0) {
                  return true;
                }
                for(let item of value.replacedImageSpans) {
                  this.controller.addImageSpan(item.valuePixelMap, {
                    imageStyle: {
                      size: ["500px", "500px"],
                      layoutStyle: {
                        borderRadius: '10px',
                      }
                    }
                  })
                }
                return false;
              })
              .borderWidth(1)
              .borderColor(Color.Green)
              .width("100%")
              .height("100%")
          }
          .borderWidth(1)
          .borderColor(Color.Red)
          .width("100%")
          .height("70%")
        }
      }
    }
    ```
    

使用流程如下：

1.在富文本区域右键。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c9/v3/KBiZj73QRMubpHcMrg2jRQ/zh-cn_image_0000002453064537.png?HW-CC-KV=V1&HW-CC-Date=20260312T134537Z&HW-CC-Expire=86400&HW-CC-Sign=CC84918A69E6DCF66FF2742E7DAA42356C1F544C4B71E53569C37477F623DF21)

2.选择想要使用的能力。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/DhySb2EJTlSIbaaFJG668w/zh-cn_image_0000002419505708.png?HW-CC-KV=V1&HW-CC-Date=20260312T134537Z&HW-CC-Expire=86400&HW-CC-Sign=5C3CF771E7E9DE8932A854A8D6A89D1E2B5D9C601B470681105F3D6ACE266B31)

3.等待对端设备拍照回传。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/fc/v3/m37LTVUIQHe5ONPL9BeWiw/zh-cn_image_0000002453064721.png?HW-CC-KV=V1&HW-CC-Date=20260312T134537Z&HW-CC-Expire=86400&HW-CC-Sign=AEAA3AFFEED4ED9A1FEE9A69C3059BA90E4D761D161B7587A395F8C6081EEEE7)

4.图片回传后

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ff/v3/tOjo5HRYRcqqF4uFT3FmXg/zh-cn_image_0000002361551566.png?HW-CC-KV=V1&HW-CC-Date=20260312T134537Z&HW-CC-Expire=86400&HW-CC-Sign=32BBF72A63376899F55C60166198B4AE605FF610FCE02D312DD09A060727B010)

## 关闭富文本跨设备互通能力

如果需要关闭富文本右键菜单跨设备互通能力，可通过editMenuOptions属性自定义菜单内容去除跨设备互通菜单项即可规避，示例如下：

```less
@Entry
@Component
struct Index {
  controller: RichEditorController = new RichEditorController()
  options: RichEditorOptions = { controller: this.controller }
  build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .editMenuOptions({
            onCreateMenu: (menuItems: Array<TextMenuItem>) => {
              if (menuItems.length === 0) {
                return menuItems;
              }
              let newMenuItems: TextMenuItem[] = [];
              menuItems.forEach((item, index) => {
                if(!item.id.equals(TextMenuItemId.COLLABORATION_SERVICE)) {
                  newMenuItems.push(item);
                }
              })
              return newMenuItems;
            },
            onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
              return false;
            }
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height("100%")
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("70%")
    }
  }
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/servicecollaboration-richeditor-title*