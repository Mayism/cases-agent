---
title: ArkTS如何定义callback函数
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-138
category: FAQ
updated_at: 2026-03-13T03:08:54.711Z
---

# ArkTS如何定义callback函数

定义一个callback函数的样例，参考代码如下：

1.  定义回调函数
    
    ```typescript
    // Define 2 parameters on the page, return empty callback function
    myCallback: (a: number,b: string) => void = () => {}
    ```
    
    [DefineCallback.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/DefineCallback.ets#L23-L24)
    
2.  在使用时进行初始化赋值
    
    ```typescript
    aboutToAppear() {
      // Initialization of callback function
      this.myCallback = (a,b) => {
        console.info(`handle myCallback a=${a},b=${b}`)
      }
    }
    ```
    
    [DefineCallback.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/DefineCallback.ets#L27-L32)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-138*