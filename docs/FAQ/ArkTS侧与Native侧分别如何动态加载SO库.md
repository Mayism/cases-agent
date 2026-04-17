---
title: ArkTS侧与Native侧分别如何动态加载SO库
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-4
category: FAQ
updated_at: 2026-03-13T03:16:47.907Z
---

# ArkTS侧与Native侧分别如何动态加载SO库

**解决措施**

1.ArkTS 可以通过动态 import 加载 so 库。

2.Native侧可以使用dlopen动态加载so库。

参考代码如下：

1.ArkTS 通过动态 import 加载 so 库。添加异步函数，在异步函数中通过let testNapi = await import ("libentry.so")实现动态加载so库。

```typescript
import { hilog } from '@kit.PerformanceAnalysisKit';
// import testNapi from 'libentry.so';
@Entry
@Component
struct LoadSoLibrary {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(async() => {
            let testNapi = await import("libentry.so")            // Load so library
            hilog.info(0x0000, 'testTag', 'Test NAPI 2 + 3 = %{public}d', testNapi.default.add(2, 3));   // Call library functions by default
            // hilog.info(0x0000, 'testTag', 'Test NAPI 2 + 3 = %{public}d', testNapi.add(2, 3));
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

[ImportSo.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/ets/pages/ImportSo.ets#L5-L29)

2.Native侧使用dlopen动态加载so库。

需要调用liba.so中的add函数。

-   将liba.so文件放到libs/arm64-v8a/路径下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/8d/v3/s4TvrcZ6TzyfASPllKio0g/zh-cn_image_0000002229603757.png?HW-CC-KV=V1&HW-CC-Date=20260313T031641Z&HW-CC-Expire=86400&HW-CC-Sign=9654C94D2CA3CDF8A25F47B057C7FAE871BF9D623E988D437460606BE2988DBB "点击放大")
    
-   需要在ArkTS侧传递so库路径信息到Native侧。
    
    ```typescript
    import { hilog } from '@kit.PerformanceAnalysisKit';
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
                let path = this.getUIContext().getHostContext()!.bundleCodeDir;     // Get project path
                hilog.info(0x0000, 'testTag', 'Test NAPI 2 + 3 = %{public}d', testNapi.addByLibPath(2, 3, path + '/libs/arm64/liba.so'));   // Transfer parameter path information to the native side
              })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/dynamicallyload/src/main/ets/pages/Index.ets#L5-L28)
    
-   在Native侧通过dlopen函数动态加载so库。
    
    ```cpp
    #include "napi/native_api.h"
    #include <dlfcn.h>
    typedef double (*FUNC_ADD)(int, int);
    static napi_value AddByLibPath(napi_env env, napi_callback_info info) {
        size_t requireArgc = 3;
        size_t argc = 3;
        napi_value args[3] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        double value0;
        napi_get_value_double(env, args[0], &value0);
        double value1;
        napi_get_value_double(env, args[1], &value1);
        char path[255];
        size_t size = 255;
        napi_get_value_string_utf8(env, args[2], path, 255, &size); // Obtain dynamic library path information
        void *handle = dlopen(path, RTLD_LAZY);                     // Open a dynamic link library, The path is "path".
        dlerror();
        FUNC_ADD add_func = (FUNC_ADD)dlsym(handle, "add"); // Retrieve the function named "add"
        if (dlerror()) {
            return nullptr;
        }
        double res = add_func(value0, value1);              // Call add and pass the parameter information
        dlclose(handle);                                    // Close the dynamic library
        napi_value sum;
        napi_create_double(env, res, &sum);
        return sum;
    }
    // ...
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/dynamicallyload/src/main/cpp/napi_init.cpp#L5-L32)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-4*