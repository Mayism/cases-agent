---
title: 如何获取UI组件的显示或隐藏状态
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-30
category: FAQ
updated_at: 2026-03-13T03:41:36.148Z
---

# 如何获取UI组件的显示或隐藏状态

-   方法1：使用if条件渲染，通过变量控制组件的显隐。使用@Watch监听变量，可以判断组件的显示状态。
-   方法2：组件显示或隐藏时，生命周期方法 aboutToAppear() 和 aboutToDisappear() 会生效，可以感知组件的显示状态。

具体可参考示例代码：

```typescript
@Component
struct ComponentA {
  aboutToAppear(): void {
    // Perception components are visible and hidden
    console.log('Component A display');
  }
  aboutToDisappear(): void {
    // Perception components are visible and hidden
    console.log('Component A hidden');
  }
  build() {
    Column() {
      Text('Component A').fontSize(16).fontColor(Color.Black);
    }
    .width(100)
    .height(50)
  }
}
@Entry
@Component
struct ComponentB {
  @State @Watch('onCompAShowStatusChange') isShowA: boolean = false;
  onCompAShowStatusChange() {
    // Perception components are visible and hidden
    console.log('Monitor component A：' + `${this.isShowA ? 'display' : 'hide'}`);
  }
  build() {
    Column() {
      Button('Switch between visible and hidden').type(ButtonType.Normal).width(100).height(50).onClick(() => {
        this.isShowA = !this.isShowA;
      })
      if (this.isShowA) {
        ComponentA();
      }
    }
  }
}
```

[GetUIComponentStatus.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/GetUIComponentStatus.ets#L21-L61)

**参考链接**

[@Watch装饰器：状态变量更改通知](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-watch)、[if/else：条件渲染](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-rendering-control-ifelse)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-30*