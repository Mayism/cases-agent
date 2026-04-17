---
title: 设置overlay模式的侧边栏
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-design-sidebar-overlay-mode
category: 指南
updated_at: 2026-03-12T12:09:47.749Z
---

# 设置overlay模式的侧边栏

## 场景介绍

从6.0.0(20) Beta1版本开始，新增支持设置overlay模式的侧边栏。

[HdsSideBar](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ui-design-hdssidebar)提供可以显示和隐藏的侧边栏容器，通过子组件定义侧边栏和内容区，第一个子组件表示侧边栏，第二个子组件表示内容区，通过设置sideBarContainerType的值为[SideBarContainerType.Overlay](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-sidebarcontainer#sidebarcontainertype枚举说明)，使得当前HdsSideBar为悬浮样式。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2f/v3/YZ57pkIERWO_fRhlGG9Aow/zh-cn_image_0000002500304238.png?HW-CC-KV=V1&HW-CC-Date=20260312T120907Z&HW-CC-Expire=86400&HW-CC-Sign=0048C45A7FC07F62730A2E3BD044C9148F5CECAD4F33E33CAFBBBA951C02CB8C "点击放大")

## 开发步骤

1.  导入相关模块。
    
    ```typescript
    import { HdsSideBar } from '@kit.UIDesignKit';
    ```
    
2.  设置图片。
    
    将图片资源，放到entry/src/main/resources/base/media下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/JUkWi4RdQq6LqphXsfMPSg/zh-cn_image_0000002500424086.png?HW-CC-KV=V1&HW-CC-Date=20260312T120907Z&HW-CC-Expire=86400&HW-CC-Sign=C2C34AE2F0CD5E0F9A6B1D57D393EB8632A5DFE3ECF1541204D0D2355E39CB46 "点击放大")
    
3.  创建HdsSideBar侧边栏组件，设置展开模式为overlay。
    
    ```typescript
    @Entry
    @ComponentV2
    struct Index {
      @Local isSideBarContainerMask: boolean = true;
      @Local blankHeight: number = 48;
      @Local isAutoHide: boolean = false;
      @Local isShowSidebar: boolean = true;
      @Local triggerValueReplace: number = 0;
      //左侧侧边栏区
      @Builder
      SideBarPanelBuilder() {
        Column() {
          Blank().height(this.blankHeight)
          Text('HdsSideBar Menu 1')
            .fontSize(14)
          Text('HdsSideBar Menu 2')
            .fontSize(14)
        }
        .width('100%')
        .height('100%')
      }
      //右侧内容区
      @Builder
      ContentPanelBuilder() {
        Column(){
          Blank().height(this.blankHeight)
          Image($r('app.media.view')) // view为自定义资源，开发者需替换本地资源
            .width('80%')
            .height('50%')
            .margin({ top: 8 })
            .padding({
              right: '16vp',
              left: '16vp',
              bottom: '16vp',
            })
            .borderRadius(8)
          Column() {
            Text('HdsSideBar content text1')
              .fontSize(14)
            Text('HdsSideBar content text2')
              .fontSize(14)
          }
          Button() {
            SymbolGlyph(this.isShowSidebar ? $r('sys.symbol.open_sidebar') : $r('sys.symbol.close_sidebar'))
              .fontWeight(FontWeight.Normal)
              .fontSize($r('sys.float.ohos_id_text_size_headline7'))
              .fontColor([$r('sys.color.ohos_id_color_titlebar_icon')])
              .hitTestBehavior(HitTestMode.None)
          }
          .id('side_bar_button')
          .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
          .height(24)
          .width(24)
          .animation({ curve: Curve.Sharp, duration: 100 })
          .onClick(() => {
            this.isShowSidebar = !this.isShowSidebar;
          })
        }
      }
      @BuilderParam contentBuilder: () => void = this.ContentPanelBuilder
      @BuilderParam sideBarBuilder: () => void = this.SideBarPanelBuilder
      @Builder
      HDSSideBarBuilder() {
        HdsSideBar({
          sideBarPanelBuilder: (): void => {
            this.sideBarBuilder()
          },
          contentPanelBuilder: (): void => {
            this.contentBuilder()
          },
          autoHide: this.isAutoHide,
          contentAreaMask: this.isSideBarContainerMask,
          sideBarContainerType: SideBarContainerType.Overlay,
          isShowSideBar: this.isShowSidebar,
          $isShowSideBar: (isShowSidebar: boolean) => {
            this.isShowSidebar = !isShowSidebar
          },
        })
      }
      @Builder
      build() {
        Stack() {
          this.HDSSideBarBuilder()
        }
      }
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ui-design-sidebar-overlay-mode*