---
title: 如何使用AOP接口实现重复插桩或替换
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-72
category: FAQ
updated_at: 2026-03-13T03:01:29.187Z
---

# 如何使用AOP接口实现重复插桩或替换

AOP提供的接口支持方法插桩或替换。

采用addBefore（编译前插桩）作为参考例子，重复插桩时，后插入的代码段先执行。

```typescript
import { util } from '@kit.ArkTS';
class Test {
  static data: string = "initData";
  static printData(): void {
    console.log("execute original printData");
  }
}
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            Test.printData();
            util.Aspect.addBefore(Test, "printData", true, (classObj: Test) => {
              console.log("execute before 1");
            });
            Test.printData();
            util.Aspect.addBefore(Test, "printData", true, (classObj: Test) => {
              console.log("execute before 2");
            });
            util.Aspect.addBefore(Test, "printData", true, (classObj: Test) => {
              console.log("execute before 3");
            });
            Test.printData();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[AddBefore.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/AddBefore.ets#L21-L61)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-72*