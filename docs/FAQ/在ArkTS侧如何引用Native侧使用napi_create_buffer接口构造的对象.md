---
title: 在ArkTS侧如何引用Native侧使用napi_create_buffer接口构造的对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-58
category: FAQ
updated_at: 2026-03-13T03:34:00.065Z
---

# 在ArkTS侧如何引用Native侧使用napi_create_buffer接口构造的对象

**问题现象**

使用napi\_create\_buffer接口创建缓冲区，并在ArkTS与Native之间传递构建结果的步骤如下：

**解决措施**

可以参考以下代码示例：

1.  Native侧构造buffer并写入数据。
    
    ```cpp
    #include "CreateBuffer.h"
    napi\_value CreateBuffer::TestBuffer(napi\_env env, napi\_callback\_info) {
        size\_t length = 100;
        char \*data = nullptr;
        napi\_value result = nullptr;
        napi\_create\_buffer(env, length, reinterpret\_cast<void \*\*>(&data), &result);
        char buf\[50\] = {0};
        for (int i = 0; i < 50; i++) {
            buf\[i\] = i + 2;
        }
        napi\_create\_buffer\_copy(env, 50, buf, reinterpret\_cast<void \*\*>(&data), &result);
        return result;
    }
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSCallNativeNapiCreateBuffer/src/main/cpp/napi_init.cpp#L22-L36)
    
2.  index.d.ts文件中声明接口。
    
    ```typescript
    export const testBuffer: () => ArrayBuffer;
    ```
    
    [Index.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSCallNativeNapiCreateBuffer/src/main/cpp/types/libarktscallnativenapicreatebuffer/Index.d.ts#L20-L20)
    
3.  ArkTS侧获取buffer信息。
    
    ```typescript
    import testNapi from 'libentry.so';
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
                let arr = testNapi.testBuffer();
                let result = new Uint8Array(arr);
                for (let index = 0; index < result.byteLength; index++) {
                  console.info(\`res\[${index}\] = ${result\[index\]}\`)
                }
              })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSCallNativeNapiCreateBuffer/src/main/ets/pages/Index.ets#L20-L47)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-58*