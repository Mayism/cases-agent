---
title: @Extend装饰器：定义扩展组件样式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-extend
category: 指南
updated_at: 2026-03-12T08:00:07.548Z
---

# @Extend装饰器：定义扩展组件样式

在前文的示例中，可以使用[@Styles](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-style)用于样式的重用，在@Styles的基础上，我们提供了@Extend，用于扩展组件样式。

说明

从API version 9开始支持。

从API version 9开始，该装饰器支持在ArkTS卡片中使用。

从API version 11开始，该装饰器支持在元服务中使用。

## 装饰器使用说明

### 语法

```typescript
@Extend(UIComponentName) function functionName { ... }
```

### 使用规则

-   和@Styles不同，@Extend支持封装指定组件的私有属性、私有事件和自身定义的全局方法。
    
    ```TypeScript
    // @Extend(Text)可以支持Text的私有属性fontColor
    @Extend(Text)
    function fancy() {
      .fontColor(Color.Red)
    }
    // superFancyText可以调用预定义的fancy
    @Extend(Text)
    function superFancyText(size: number) {
      .fontSize(size)
      .fancy()
    }
    ```
    
    [GlobalFunctionExtension.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/GlobalFunctionExtension.ets#L29-L42)
    
-   使用@Extend封装指定组件的私有属性、私有事件和自身定义的全局方法时，不支持和@Styles混用。
    
    ```TypeScript
    @Styles
    function fancy() {
      .backgroundColor(Color.Red)
    }
    // superFancyText不可以调用预定义的fancy
    @Extend(Text)
    function superFancyText(size: number) {
      .fontSize(size)
      .fancy()
    }
    ```
    
-   和@Styles不同，@Extend装饰的方法支持参数，开发者可以在调用时传递参数，调用遵循TS方法传值调用。
    
    ```TypeScript
    // xxx.ets
    @Extend(Text)
    function fancy(fontSize: number) {
      .fontColor(Color.Red)
      .fontSize(fontSize)
    }
    @Entry
    @Component
    struct FancyUse {
      build() {
        Row({ space: 10 }) {
          Text('Fancy')
            .fancy(16)
          Text('Fancy')
            .fancy(24)
        }
      }
    }
    ```
    
    [ExtendParameterUsage.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendParameterUsage.ets#L28-L48)
    
-   @Extend装饰的方法的参数可以为function，作为Event事件的句柄。
    
    ```TypeScript
    @Extend(Text)
    function makeMeClick(onClick: () => void) {
      .backgroundColor(Color.Blue)
      .onClick(onClick)
    }
    @Entry
    @Component
    struct FancyUse {
      @State label: string = 'Hello World';
      onClickHandler() {
        this.label = 'Hello ArkUI';
      }
      build() {
        Row({ space: 10 }) {
          Text(`${this.label}`)
            .makeMeClick(() => {
              this.onClickHandler();
            })
        }
      }
    }
    ```
    
    [ExtendFunctionHandle.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendFunctionHandle.ets#L29-L54)
    
-   @Extend的参数可以为[状态变量](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-state-management-overview)，当状态变量改变时，UI可以正常的被刷新渲染。
    
    ```TypeScript
    @Extend(Text)
    function fancy(fontSize: number) {
      .fontColor(Color.Blue)
      .fontSize(fontSize)
    }
    @Entry
    @Component
    struct FancyUse {
      @State fontSizeValue: number = 20;
      build() {
        Column({ space: 10 }) {
          Text('Fancy')
            .fancy(this.fontSizeValue)
            .onClick(() => {
              this.fontSizeValue = 30;
            })
        }
        .width('100%')
      }
    }
    ```
    
    [ExtendUIStateVariable.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendUIStateVariable.ets#L29-L51)
    

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bc/v3/d4d1idmmSqmO6W7PMAPoPg/zh-cn_image_0000002558044677.gif?HW-CC-KV=V1&HW-CC-Date=20260312T075943Z&HW-CC-Expire=86400&HW-CC-Sign=B7DAD024B915638AEBF4C9C601162B4720BBF4A7ABDB7A406ECDA2FE7DD744F2)

## 限制条件

-   和@Styles不同，@Extend仅支持在全局定义，不支持在组件内部定义。

说明

仅限在当前文件内使用，不支持导出。

如果要实现export功能，推荐使用[AttributeModifier](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-user-defined-extension-attributemodifier)。

【反例】

```typescript
@Entry
@Component
struct FancyUse {
  // 错误写法，@Extend仅支持在全局定义，不支持在组件内部定义
  @Extend(Text) function fancy (fontSize: number) {
    .fontSize(fontSize)
  }
  build() {
    Row({ space: 10 }) {
      Text('Fancy')
        .fancy(16)
    }
  }
}
```

【正例】

```TypeScript
// 正确写法
@Extend(Text)
function fancy(fontSize: number) {
  .fontSize(fontSize)
}
@Entry
@Component
struct FancyUse {
  build() {
    Row({ space: 10 }) {
      Text('Fancy')
        .fancy(16)
    }
  }
}
```

[ExtendPositiveExample.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendPositiveExample.ets#L29-L46)

## 使用场景

以下示例声明了3个Text组件，每个Text组件均设置了[fontStyle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-appendix-enums#fontstyle)、[fontWeight](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-appendix-enums#fontweight) 和[backgroundColor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-universal-attributes-background#backgroundcolor)样式。

```TypeScript
@Entry
@Component
struct FancyUse {
  @State label: string = 'Hello World';
  build() {
    Row({ space: 10 }) {
      Text(`${this.label}`)
        .fontStyle(FontStyle.Italic)
        .fontWeight(500)
        .backgroundColor(Color.Yellow)
      Text(`${this.label}`)
        .fontStyle(FontStyle.Italic)
        .fontWeight(600)
        .backgroundColor(Color.Pink)
      Text(`${this.label}`)
        .fontStyle(FontStyle.Italic)
        .fontWeight(700)
        .backgroundColor(Color.Orange)
    }.margin('20%')
  }
}
```

[ExtendUsageScenario.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendUsageScenario.ets#L29-L52)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/58/v3/3n8ADHPkTYGZ28xK7s4RMw/zh-cn_image_0000002526884866.png?HW-CC-KV=V1&HW-CC-Date=20260312T075943Z&HW-CC-Expire=86400&HW-CC-Sign=86EBD9510D4B96C9816142A200F31C7FA65D4C4F758A3B23BCAA8EF7439AE5AC)

使用@Extend将样式组合复用，示例如下。

```TypeScript
@Extend(Text)
function fancyText(weightValue: number, color: Color) {
  .fontStyle(FontStyle.Italic)
  .fontWeight(weightValue)
  .backgroundColor(color)
}
```

[ExtendUsageScenariotwo.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendUsageScenariotwo.ets#L29-L36)

通过@Extend组合样式后，使得代码更加简洁，增强可读性。

```TypeScript
@Entry
@Component
struct FancyUse {
  @State label: string = 'Hello World';
  build() {
    Row({ space: 10 }) {
      Text(`${this.label}`)
        .fancyText(100, Color.Blue)
      Text(`${this.label}`)
        .fancyText(200, Color.Pink)
      Text(`${this.label}`)
        .fancyText(300, Color.Orange)
    }.margin('20%')
  }
}
```

[ExtendUsageScenariotwo.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/ArkUISample/ParadigmStateManagement/entry/src/main/ets/pages/extend/ExtendUsageScenariotwo.ets#L37-L54)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-extend*