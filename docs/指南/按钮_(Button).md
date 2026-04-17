---
title: 按钮 (Button)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-button
category: 指南
updated_at: 2026-03-12T08:44:15.106Z
---

# 按钮 (Button)

Button是按钮组件，通常用于响应用户的点击操作，其类型包括胶囊按钮、圆形按钮、普通按钮、圆角矩形按钮。Button作为容器使用时可以通过添加子组件实现包含文字、图片等元素的按钮。具体用法请参考[Button](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button)。

## 创建按钮

Button通过调用接口来创建，接口调用有以下两种形式：

-   通过label和[ButtonOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button#buttonoptions对象说明)创建不包含子组件的按钮。以ButtonOptions中的type和stateEffect为例。
    
    ```typescript
    Button(label?: ResourceStr, options?: { type?: ButtonType, stateEffect?: boolean })
    ```
    
    其中，label用来设置按钮文字，type用于设置Button类型，stateEffect属性设置Button是否开启点击效果。
    
    ```TypeScript
    Button('Ok', { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
    ```
    
    [CreateButton.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/CreateButton.ets#L36-L42)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/25/v3/5eZisSL3RH2IJD-Iel-2Gw/zh-cn_image_0000002558044953.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=1A61DBB2BF39EA939FE4FF442B45AFEC73BC6F343D51F6D0A2115A538C367E23)
    
-   通过[ButtonOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button#buttonoptions对象说明)创建包含子组件的按钮。以ButtonOptions中的type和stateEffect为例。
    
    ```typescript
    Button(options?: {type?: ButtonType, stateEffect?: boolean})
    ```
    
    只支持包含一个子组件，子组件可以是基础组件或者容器组件。
    
    ```TypeScript
    Button({ type: ButtonType.Normal, stateEffect: true }) {
      Row() {
        // 请将$r('app.media.loading')替换为实际资源文件
        Image($r('app.media.loading')).width(20).height(40).margin({ left: 12 })
        Text('loading').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
      }.alignItems(VerticalAlign.Center)
    }.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)
    ```
    
    [CreateButton.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/CreateButton.ets#L59-L67)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/32/v3/HFavH2cmSP2tSOHM5_A7vA/zh-cn_image_0000002526885142.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=AE342AD13F99FE9D52F0AC9CA0F5DB4E7C9F7BFB4A355A01381E3780DAC284B4)
    

## 设置按钮类型

Button有四种可选类型，分别为胶囊类型（Capsule）、圆形按钮（Circle）、普通按钮（Normal）和圆角矩形按钮（ROUNDED\_RECTANGLE），通过type进行设置。

-   胶囊按钮（默认类型）。
    
    此类型按钮的圆角自动设置为高度的一半，不支持通过borderRadius属性重新设置圆角。
    
    ```TypeScript
    Button('Disable', { type: ButtonType.Capsule, stateEffect: false })
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
    ```
    
    [SetButtonType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/SetButtonType.ets#L39-L44)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a5/v3/pFwZ7K3UTOq5c7krwhCibg/zh-cn_image_0000002557924989.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=A42E93187C132DB119147139C8838503D346FF6AD2C21A4524AC52FD8C1BB0BB)
    
-   圆形按钮。
    
    此类型按钮为圆形，不支持通过borderRadius属性重新设置圆角。
    
    ```TypeScript
    Button('Circle', { type: ButtonType.Circle, stateEffect: false })
      .backgroundColor(0x317aff)
      .width(90)
      .height(90)
    ```
    
    [SetButtonType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/SetButtonType.ets#L57-L62)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e/v3/0KUYJGykQrua_GiohWKQgw/zh-cn_image_0000002527045074.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=268AA8B7B47EDF46137D0C564997AE64FAA3F1EEE9F4CCB7E8F08D89D773BB82)
    
-   普通按钮。
    
    此类型的按钮默认圆角为0，支持通过borderRadius属性重新设置圆角。
    
    ```TypeScript
    Button('Ok', { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
    ```
    
    [SetButtonType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/SetButtonType.ets#L74-L80)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/28/v3/6DabI-2SRwuNf6Ck65pnpQ/zh-cn_image_0000002558044955.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=E88CE85A6C65A9E9FE6AB3A1FD8257E8399EA9D6D22DDB4ECCFA22F63AE6258F)
    
-   圆角矩形按钮。
    
    当[controlSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button#controlsize11)为NORMAL时，默认圆角大小为20vp，[controlSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button#controlsize11)为SMALL时，圆角大小为14vp，支持通过borderRadius属性重新设置圆角。
    
    ```TypeScript
    Button('Disable', { type: ButtonType.ROUNDED_RECTANGLE, stateEffect: true })
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
    ```
    
    [SetButtonType.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/SetButtonType.ets#L90-L95)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/07/v3/NzcQeaVYQkCm1mizUmW61w/zh-cn_image_0000002557924989.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=1EA77E6D1DCD30BF580108942BE60D523328CE663C6CD68BEB90E93F23025B4B)
    

## 自定义样式

-   设置边框弧度。
    
    使用通用属性来自定义按钮样式。例如通过borderRadius属性设置按钮的边框弧度。
    
    ```TypeScript
    Button('circle border', { type: ButtonType.Normal })
      .borderRadius(20)
      .height(40)
    ```
    
    [ButtonCustomStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCustomStyle.ets#L40-L44)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a0/v3/jZnkXmJDRweCOE6I9hUPiw/zh-cn_image_0000002526885144.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=CB7EA0B4278C087F99D71BAD0B841F8ED2C54523EDD033A3C12555FD7FACE8C1)
    
-   设置文本样式。
    
    通过添加文本样式设置按钮文本的展示样式。
    
    ```TypeScript
    Button('font style', { type: ButtonType.Normal })
      .fontSize(20)
      .fontColor(Color.Pink)
      .fontWeight(800)
    ```
    
    [ButtonCustomStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCustomStyle.ets#L58-L63)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5f/v3/qrlysxNmTO29GyaZewqewQ/zh-cn_image_0000002557924991.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=C88493D55AB6746451C806386381E2F7438739995E30B70AA96FA1785F6E9C60)
    
-   设置背景颜色。
    
    添加backgroundColor属性设置按钮的背景颜色。
    
    ```TypeScript
    Button('background color').backgroundColor(0xF55A42)
    ```
    
    [ButtonCustomStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCustomStyle.ets#L74-L76)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/7jP1zaMQTT2RGjWwjC91hA/zh-cn_image_0000002527045076.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=91065FF7B7DD13E5CD850D08D094A57166766C5E60EB097D3FF51CCAB8F8EBEE)
    
-   创建功能型按钮。
    
    创建删除操作的按钮。
    
    ```TypeScript
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      // 请将$r('app.media.ic_public_delete_filled3')替换为实际资源文件
      Image($r('app.media.ic_public_delete_filled')).width(30).height(30)
    }.width(55).height(55).margin({ 'left': 20 }).backgroundColor(0xF55A42)
    ```
    
    [ButtonCustomStyle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCustomStyle.ets#L83-L88)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/06/v3/ejpCLyBbRbevFxVjhm8_9g/zh-cn_image_0000002558044957.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=902BDCA457C5FE542F0E05CC3A01EF5200C44CAEFD1928FB9F6E0A2E7A75F121)
    

## 添加事件

Button组件通常用于触发某些操作，可以绑定onClick事件来响应点击操作后的自定义行为。

```TypeScript
Button('Ok', { type: ButtonType.Normal, stateEffect: true })
  .onClick(()=>{
    hilog.info(DOMAIN, 'testTag', 'Button onClick');
  }).margin(10)
```

[ButtonCaseLogin.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCaseLogin.ets#L34-L39)

## 场景示例

-   用于启动操作。
    
    可以用按钮启动任何用户界面元素，按钮会根据用户的操作触发相应的事件。例如，在List容器里通过点击按钮进行页面跳转。
    
    ```TypeScript
    const DOMAIN = 0x0000;
    // xxx.ets
    @Entry
    @Component
    export struct ButtonCaseTouch {
      pathStack: NavPathStack = new NavPathStack();
      @Builder
      PageMap(name: string) {
        if (name === 'first_page') {
          pageOneTmp()
        } else if (name === 'second_page') {
          pageTwoTmp()
        } else if (name === 'third_page') {
          pageThreeTmp()
        }
      }
      build() {
        NavDestination() {
          Navigation(this.pathStack) {
            List({ space: 4 }) {
              ListItem() {
                Button('First').onClick(() => {
                  this.pathStack.pushPath({ name: 'first_page' });
                })
                  .width('100%')
              }
              ListItem() {
                Button('Second').onClick(() => {
                  this.pathStack.pushPath({ name: 'second_page' });
                })
                  .width('100%')
              }
              ListItem() {
                Button('Third').onClick(() => {
                  this.pathStack.pushPath({ name: 'third_page' });
                })
                  .width('100%')
              }
            }
            .listDirection(Axis.Vertical)
            .backgroundColor(0xDCDCDC).padding(20)
          }
          .mode(NavigationMode.Stack)
          .navDestination(this.PageMap)
        }
      }
    }
    // pageOne
    @Component
    export struct pageOneTmp {
      pathStack: NavPathStack = new NavPathStack();
      build() {
        NavDestination() {
          Column() {
            Text('first_page')
          }.width('100%').height('100%')
        }.title('pageOne')
        .onBackPressed(() => {
          const popDestinationInfo = this.pathStack.pop(); // 弹出路由栈栈顶元素
          // 请将$r('app.string.return_value')替换为实际资源文件，在本示例中该资源文件的value值为"返回值"
          hilog.info(DOMAIN, 'testTag', 'pop' + $r('app.string.return_value') + JSON.stringify(popDestinationInfo));
          return true;
        })
        .onReady((context: NavDestinationContext) => {
          this.pathStack = context.pathStack;
        })
      }
    }
    // pageTwo
    @Component
    export struct pageTwoTmp {
      pathStack: NavPathStack = new NavPathStack();
      build() {
        NavDestination() {
          Column() {
            Text('second_page')
          }.width('100%').height('100%')
        }.title('pageTwo')
        .onBackPressed(() => {
          const popDestinationInfo = this.pathStack.pop(); // 弹出路由栈栈顶元素
          // 请将$r('app.string.return_value')替换为实际资源文件，在本示例中该资源文件的value值为"返回值"
          hilog.info(DOMAIN, 'testTag', 'pop' + $r('app.string.return_value') + JSON.stringify(popDestinationInfo));
          return true;
        })
        .onReady((context: NavDestinationContext) => {
          this.pathStack = context.pathStack;
        })
      }
    }
    // pageThree
    @Component
    export struct pageThreeTmp {
      pathStack: NavPathStack = new NavPathStack();
      build() {
        NavDestination() {
          Column() {
            Text('third_page')
          }.width('100%').height('100%')
        }.title('pageThree')
        .onBackPressed(() => {
          const popDestinationInfo = this.pathStack.pop(); // 弹出路由栈栈顶元素
          /// 请将$r('app.string.return_value')替换为实际资源文件，在本示例中该资源文件的value值为"返回值"
          hilog.info(DOMAIN, 'testTag', 'pop' + $r('app.string.return_value') + JSON.stringify(popDestinationInfo));
          return true;
        })
        .onReady((context: NavDestinationContext) => {
          this.pathStack = context.pathStack;
        })
      }
    }
    ```
    
    [ButtonCaseTouch.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCaseTouch.ets#L17-L138)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1c/v3/aQoSLOi_QTKf9gqD7wbMbg/zh-cn_image_0000002526885146.gif?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=536A3B7196BB527C08FF4232E724199D0875B5BB9C435CC9F172EF68AED47825)
    
-   用于提交表单。
    
    在用户登录/注册页面，使用按钮进行登录或注册操作。
    
    ```TypeScript
    // xxx.ets
    const DOMAIN = 0x0000;
    @Entry
    @Component
    export struct ButtonCaseLogin {
      build() {
        NavDestination() {
          Column() {
            TextInput({ placeholder: 'input your username' }).margin({ top: 20 })
            TextInput({ placeholder: 'input your password' }).type(InputType.Password).margin({ top: 20 })
            Button('Register').width(300).margin({ top: 20 })
              .onClick(() => {
                // 需要执行的操作
              })
            // ···
          }.padding(20)
        }
      }
    }
    ```
    
    [ButtonCaseLogin.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/ButtonCaseLogin.ets#L17-L45)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/79/v3/DGplmoxeRu-G4Rq7n_cRgQ/zh-cn_image_0000002557924993.png?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=5883BF806CEF6BF544A05126D2DA877DF6640F833C04AD019BCA16AC48BF1424)
    
-   悬浮按钮。
    
    在可以滑动的界面，滑动时按钮始终保持悬浮状态。
    
    ```TypeScript
    // xxx.ets
    @Entry
    @Component
    export struct HoverButtonExample {
      private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      build() {
        NavDestination() {
          Stack() {
            List({ space: 20, initialIndex: 0 }) {
              ForEach(this.arr, (item: number) => {
                ListItem() {
                  Text('' + item)
                    .width('100%')
                    .height(100)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(0xFFFFFF)
                }
              }, (item: number) => item.toString())
            }.width('90%')
            Button() {
              // 请将$r('app.media.ic_public_add')替换为实际资源文件
              Image($r('app.media.ic_public_add'))
               .width(50)
               .height(50)
            }
            .width(60)
            .height(60)
            .position({ x: '80%', y: 600 })
            .shadow({ radius: 10 })
            .onClick(() => {
              // 需要执行的操作
            })
          }
          .width('100%')
          .height('100%')
          .backgroundColor(0xDCDCDC)
          .padding({ top: 5 })
        }
      }
    }
    ```
    
    [HoverButtonExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ChooseComponent/entry/src/main/ets/pages/button/HoverButtonExample.ets#L16-L60)
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/54/v3/Gh5o5NSgQDKVtVJYJ4VUmA/zh-cn_image_0000002527045078.gif?HW-CC-KV=V1&HW-CC-Date=20260312T084349Z&HW-CC-Expire=86400&HW-CC-Sign=986AE0CF405D4C0DE7CCBE11974CD982F65A21DBE15E3F48E465BD59DC06DB13)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-button*