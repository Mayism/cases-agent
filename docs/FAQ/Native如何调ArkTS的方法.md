---
title: Native如何调ArkTS的方法
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-30
category: FAQ
updated_at: 2026-03-13T03:30:10.198Z
---

# Native如何调ArkTS的方法

1\. 在index.d.ts文件中提供 ArkTS 接口方法。

```typescript
export const nativeCallArkTS: (a: object) => number;
```

[Index.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/types/libentry/Index.d.ts#L11-L12)

2\. 实现Native侧的NativeCallArkTS接口，代码如下：

```cpp
static napi_value NativeCallArkTS(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    // Declaring parameter array ARG
    napi_value args[1] = { nullptr };
    // Retrieve the passed parameters and place them in the parameter array 'rgs'
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    // Create int as an input parameter for ArkTS
    napi_value argv = nullptr;
    napi_create_int32(env, 2, &argv );
    // Call the incoming callback and return the result
    napi_value result = nullptr;
    napi_call_function(env, nullptr, args[0], 1, &argv, &result);
    return result;
}
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/napi_init.cpp#L46-L63)

3\. 在ArkTS侧，通过nativeModule.nativeCallArkTS()方法传入回调函数。

entry/src/main/ets/pages/Index.ets

```typescript
// Introduce native capabilities through import.
import nativeModule from 'libentry.so'
@Entry
@Component
struct InvokeArkTSMethod {
  @State message: string = 'Test Node-API nativeCallArkTS result: ';
  build() {
    Row() {
      Column() {
        // Call the nativeCallArkTS method, corresponding to the Native NativeCallArkTS, and call the ArkTS function in Native.
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message += nativeModule.nativeCallArkTS((a: number) => {
              return a * 2;
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/ets/pages/Index.ets#L5-L32)

**参考链接**

[Node-API典型使用场景](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/napi-scenarios)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-30*