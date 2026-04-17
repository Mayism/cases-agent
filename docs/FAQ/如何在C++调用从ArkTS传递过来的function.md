---
title: 如何在C++调用从ArkTS传递过来的function
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-26
category: FAQ
updated_at: 2026-03-13T03:36:59.937Z
---

# 如何在C++调用从ArkTS传递过来的function

1.  在index.d.ts文件中，提供ArkTS侧的接口方法。
    
    ```typescript
    export const nativeCallArkTS: (a: object) => number;
    ```
    
    [Index.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/Index.d.ts#L21-L21)
    
2.  实现Native侧的NativeCallArkTS接口，具体代码如下：
    
    ```
    static napi\_value NativeCallArkTS(napi\_env env, napi\_callback\_info info)
    {
        size\_t argc = 1;
        // Declare parameter array
        napi\_value args\[1\] = {nullptr};
        // Retrieve the incoming parameters and sequentially place them into the parameter array
        napi\_get\_cb\_info(env, info, &argc, args , nullptr, nullptr);
        // Create an int as a parameter for ArkTS
        napi\_value argv = nullptr;
        napi\_create\_int32(env, 2, &argv );
        // Call the incoming callback and return its result
        napi\_value result = nullptr;
        napi\_call\_function(env, nullptr, args\[0\], 1, &argv, &result);
        return result;
    }
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/CPlusCallArkTSFunc/src/main/cpp/napi_init.cpp#L22-L39)
    
3.  在ArkTS侧，通过nativeModule.nativeCallArkTS()方法传入回调函数。
    
    ```typescript
    // entry/src/main/ets/pages/Index.ets
    // Introduce native capabilities through import.
    import nativeModule from 'libentry.so'
    @Entry
    @Component
    struct Index {
      @State message: string = 'Test Node-API nativeCallArkTS result: ';
      build() {
        Row() {
          Column() {
            // Call the nativeCallArkTS method, corresponding to the Native NativeCallArkTS, and call the ArkTS function in Native.
            Text(this.message)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.message += nativeModule.nativeCallArkTS((a: number)=> {
                  return a \* 2;
                });
              })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/CPlusCallArkTSFunc/src/main/ets/pages/Index.ets#L20-L45)
    

**参考链接**

[Native侧方法的实现](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/use-napi-process#native侧方法的实现)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-26*