---
title: ArkTS是否支持调用js文件中的方法
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-146
category: FAQ
updated_at: 2026-03-13T03:09:43.395Z
---

# ArkTS是否支持调用js文件中的方法

**问题描述**

ArkTS是否支持调用js文件中的方法，如果支持，能否提供一下ArkTS与js交互的代码样例?

**解决措施**

ets文件调用js文件和正常ts/ets模块一样，import然后调用就行。

```typescript
import {jsFunc} from './JsLib';
@Entry
@Component
struct Index {
  build() {
    Column({ space: 20 }) {
      Text("Import Js Demo")
      Button("Call Js")
        .onClick(() => {
          jsFunc(); // Call jsFunc from js file
        })
    }
    .width("100%")
    .height("100%")
    .padding(10)
  }
}
```

[ImportJs.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/ImportJs.ets#L21-L38)

JsLib.js文件中的demo如下：

```javascript
export function jsFunc(){
    console.info("this is a js function");
}
```

[JsLib.js](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/JsLib.js#L20-L22)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-146*