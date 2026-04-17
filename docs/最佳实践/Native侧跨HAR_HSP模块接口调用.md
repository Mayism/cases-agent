---
title: Native侧跨HAR/HSP模块接口调用
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-cross-module-reference
category: 最佳实践
updated_at: 2026-03-13T02:19:32.947Z
---

# Native侧跨HAR/HSP模块接口调用

## 概述

在大型应用开发中，应用通常会分为多个业务模块，业务模块常会以HSP或HAR包的形式提供SDK能力，这些SDK往往会提供Native接口给HAP模块的Native层直接调用，从而实现应用的复杂功能。而如何在Native侧跨HAR/HSP模块进行接口调用，是开发者经常遇到的问题。本文将介绍Native侧跨HAR/HSP模块调用两种典型场景，包括调用Native方法和调用ArkTS方法，以方便开发者更好的掌握Native侧跨模块调用的能力。

-   [Native侧跨HAR/HSP模块调用Native方法](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-cross-module-reference#section470062115417)
-   [Native侧跨HAR/HSP模块调用ArkTS方法](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-cross-module-reference#section1485574818153)

## 实现原理

如图1所示，Native侧跨HAR/HSP模块调用原理主要包括以下步骤。

1.  在Module1（HAP）模块中，ArkTS侧通过Node-API调用Native接口。
2.  Module1（HAP）模块Native侧调用Module2（HSP/HAR）模块Native方法。
    1.  被调用方
        1.  在Module2（HSP/HAR）模块中，创建头文件，并在build-profile.json5中配置头文件导出。
        2.  在Module2（HSP/HAR）模块的CMakeLists.txt中进行配置，将源文件配置到so中。
    2.  调用方
        1.  在Module1（HAP）模块的oh-package.json5文件配置引入Module2（HSP/HAR）模块。
        2.  在Module1（HAP）模块的CMakeLists.txt中，配置引入Module2的so文件。
        3.  引入Module2（HSP/HAR）模块的头文件后，就可以调用Module2（HSP/HAR）模块的Native方法。
3.  在Module2（HSP/HAR）模块中，Native侧通过Node-API接口进行模块加载，从而调用ArkTS方法。

**图1** Native侧跨HAR/HSP模块调用原理图  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/kwsMGuqUS_K7_KtCQJuBbQ/zh-cn_image_0000002229450825.png?HW-CC-KV=V1&HW-CC-Date=20260313T021925Z&HW-CC-Expire=86400&HW-CC-Sign=7BD9820B8E9DF07C1E9A776BFC7658DE36C77CC77BDC1FF53A8BA86F7453AD2E "点击放大")

## Native侧跨HAR/HSP模块调用Native方法

如下图所示，Native侧跨HAR/HSP模块调用Native方法的调用链路为Module1 ArkTS -> Module1 Native -> Module2 Native。在HarmonyOS项目中，Native侧跨模块调用Native方法实际就是C++侧调用，需要配置编译链接依赖。其实现的关键是在Module2（HSP/HAR）模块的build-profile.json5中，配置头文件导出，并在CMakeLists.txt中进行配置，将源文件配置到so中。

**图2** Native侧跨HAR/HSP模块调用Native方法  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7e/v3/lc9RbLOlRt-KWWCORsLu6g/zh-cn_image_0000002229450829.png?HW-CC-KV=V1&HW-CC-Date=20260313T021925Z&HW-CC-Expire=86400&HW-CC-Sign=D8FCFC1F5615EC7E2C241A6C26F5F5F3CC591447277578886E2E607D69A2CB96 "点击放大")

### 开发流程

Native侧跨HAR/HSP模块调用Native方法时，需要实现Module1（HAP）的ArkTS 侧调用Module1（HSP/HAR）的Native 侧、Module1（HAP）的Native 侧调用Module2（HSP/HAR）的Native 侧。在当前场景下，跨模块调用HAR模块和HSP模块的方式相同，当前以跨模块调用HAR模块为例，详细流程如下所示。

1.  开发者需要创建Module2（HAR）模块staticModule，详细创建流程可以参考[创建库模块](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-har#section643521083015)。

2.  在Module2中新建C++文件napi\_har.cpp，再新建其头文件napi\_har.h，并定义Native方法。
    
    napi\_har.cpp代码如下所示。
    
    ```cpp
    #include "napi/native_api.h"
    #include "napi_har.h"
    double harNativeAdd(double a, double b) {
        return a + b;
    }
    ```
    
    [napi\_har.cpp](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/staticModule/src/main/cpp/napi_har.cpp#L16-L21)
    
    napi\_har.h代码如下所示。
    
    ```cpp
    // staticModule\src\main\cpp\napi_har.h
    #ifndef CROSSMODULEREFERENCE_NAPI_HAR_H
    #define CROSSMODULEREFERENCE_NAPI_HAR_H
    #include <js_native_api_types.h>
    // ...
    double harNativeAdd(double a, double b);
    napi_value harArkTSAdd(double a, double b);
    #endif //CROSSMODULEREFERENCE_NAPI_HAR_H
    ```
    
    [napi\_har.h](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/staticModule/src/main/cpp/napi_har.h#L16-L28)
    

3.  在Module2中的build-profile.json5中配置头文件导出。如果不做当前headerPath的配置，会导致Module1引用不到Module2的头文件。
    
    ```json
    {
      "apiType": "stageMode",
      "buildOption": {
        "externalNativeOptions": {
          "path": "./src/main/cpp/CMakeLists.txt",
          "arguments": "",
          "cppFlags": "",
          "abiFilters": ["x86_64", "arm64-v8a"]
        },
        "nativeLib": {
          "headerPath": "./src/main/cpp"
        },
        // ...
    }
    ```
    
    [build-profile.json5](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/staticModule/build-profile.json5#L3-L61)
    

4.  在Module2的CMakeLists.txt中配置将源文件打包到so。
    
    ```scss
    # staticModule\src\main\cpp\CMakeLists.txt
    add_library(add SHARED napi_init.cpp napi_har.cpp)
    ```
    
    [CMakeLists.txt](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/staticModule/src/main/cpp/CMakeLists.txt#L15-L16)
    

5.  在Module2模块创建后，需要在Module1的oh-package.json5文件中配置对应的依赖。如下所示，staticModule为新创建的HAR模块的文件名，static\_module为HAR模块的名称。
    
    ```json
    {
      "name": "entry",
      "version": "1.0.0",
      "description": "Please describe the basic information.",
      "main": "",
      "author": "",
      "license": "",
      "dependencies": {
        "libentry.so": "file:./src/main/cpp/types/libentry",
        "static_module": "file:../staticModule",
        // ...
      }
    }
    ```
    
    [oh-package.json5](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/entry/oh-package.json5#L2-L16)
    

6.  在Module1中的CMakeLists.txt中配置so依赖。
    
    ```cangjie
    # entry\src\main\cpp\CMakeLists.txt
    target_link_libraries(entry PUBLIC libace_napi.z.so static_module::add shared_module::calc)
    ```
    
    [CMakeLists.txt](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/entry/src/main/cpp/CMakeLists.txt#L17-L18)
    
    说明
    
    static\_module::add中第一个参数static\_module是module2的模块名称，第二个参数add是module2编译出来的so名称（不需要带上lib）。默认情况下，module2的模块名称与so名称相同，为了方便说明，在本案例中将so名称修改成了add。
    

7.  在Module1的napi\_init.cpp中导入Module2的头文件napi\_har.h，并调用其Native方法harNativeAdd()。

8.  在Module1的Native侧调用Module2的invokeHarNative()方法。
    
    ```cpp
    // entry\src\main\cpp\napi_init.cpp
    static napi_value invokeHarNative(napi_env env, napi_callback_info info)
    {
        size_t argc = 2;
        napi_value args[2] = {nullptr};
        napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
        napi_valuetype valuetype0;
        napi_typeof(env, args[0], &valuetype0);
        napi_valuetype valuetype1;
        napi_typeof(env, args[1], &valuetype1);
        double value0;
        napi_get_value_double(env, args[0], &value0);
        double value1;
        napi_get_value_double(env, args[1], &value1);
        napi_value sum;
        napi_create_double(env, harNativeAdd(value0, value1), &sum);
        return sum;
    }
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/entry/src/main/cpp/napi_init.cpp#L46-L71)
    

9.  在Module1的ArkTS侧调用Native侧的invokeHarNative()方法。
    
    ```typescript
    Button($r('app.string.call_har_native_method'))
      .fontSize(16)
      .width('100%')
      .margin({ top: 12 })
      .onClick(() => {
        this.getUIContext().getPromptAction().showToast({
          message: 'HarNative method call succeed, result is ' + napi.invokeHarNative(2, 3).toString()
        });
      })
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/entry/src/main/ets/pages/Index.ets#L43-L51)
    

### 实现效果

**图3** Native侧调用HAR模块的Native方法  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/08x2L8QnS66d7T9qOHwDtQ/zh-cn_image_0000002229450809.gif?HW-CC-KV=V1&HW-CC-Date=20260313T021925Z&HW-CC-Expire=86400&HW-CC-Sign=8DD6DFBB9D94C2D43C70A3CE9D28E1A2115BF233AFE908EA91E225A4B500BB65 "点击放大")

## Native侧跨HAR/HSP模块调用ArkTS方法

如下图所示，Native侧跨HAR/HSP模块调用ArkTS方法是[Native侧跨HAR/HSP模块调用Native方法](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-cross-module-reference#section470062115417)的基础上调用ArkTS方法。其关键是在Module2中获取Module1中的上下文napi\_env，并根据上下文napi\_env加载模块、调用对应的ArkTS方法。

**图4** Native侧跨HAR/HSP模块调用ArkTS方法

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c8/v3/AR1S3f0bQmuWn1HKS648rw/zh-cn_image_0000002194010544.png?HW-CC-KV=V1&HW-CC-Date=20260313T021925Z&HW-CC-Expire=86400&HW-CC-Sign=4AC342B912C19E39C013F46403751B4D27057A2679983D57721585D91A33E248 "点击放大")

### 开发流程

Native侧跨HAR/HSP模块调用ArkTS方法具体实现方法如下所示。

1.  在完成[Native侧跨HAR/HSP模块调用Native方法](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-cross-module-reference#section470062115417)后，在Module1中新增invokeHarArkTS()方法以准备调用HAR模块的ArkTS方法。
2.  在Module2的Native侧，新增setHarEnv()方法，用以传递napi\_env，并在头文件中进行配置，代码如下所示。
    
    napi\_har.h代码如下所示。
    
    ```cpp
    // staticModule\src\main\cpp\napi_har.h
    #ifndef CROSSMODULEREFERENCE_NAPI_HAR_H
    #define CROSSMODULEREFERENCE_NAPI_HAR_H
    #include <js_native_api_types.h>
    napi_env g_main_env;
    void setHarEnv(napi_env env);
    double harNativeAdd(double a, double b);
    napi_value harArkTSAdd(double a, double b);
    #endif //CROSSMODULEREFERENCE_NAPI_HAR_H
    ```
    
    [napi\_har.h](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/staticModule/src/main/cpp/napi_har.h#L17-L27)
    
    napi\_har.cpp代码如下所示。
    
    ```cpp
    // staticModule\src\main\cpp\napi_har.cpp
    void setHarEnv(napi_env env) {
        g_main_env = env;
    }
    ```
    
    [napi\_har.cpp](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/staticModule/src/main/cpp/napi_har.cpp#L25-L28)
    

3.  在Module1中的napi\_init.cpp中的Init()方法中调用setHarEnv()方法将Module1中的napi\_env传递到Module2中。
    
    ```cpp
    // entry\src\main\cpp\napi_init.cpp
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports)
    {
        napi_property_descriptor desc[] = {
            { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
            { "invokeHarNative", nullptr, invokeHarNative, nullptr, nullptr, nullptr, napi_default, nullptr },
            { "invokeHarArkTS", nullptr, invokeHarArkTS, nullptr, nullptr, nullptr, napi_default, nullptr },
            { "invokeHspNative", nullptr, invokeHspNative, nullptr, nullptr, nullptr, napi_default, nullptr },
            { "invokeHspArkTS", nullptr, invokeHspArkTS, nullptr, nullptr, nullptr, napi_default, nullptr }
        };
        napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
        setHarEnv(env);
         // ...
        return exports;
    }
    EXTERN_C_END
    ```
    
    [napi\_init.cpp](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/entry/src/main/cpp/napi_init.cpp#L148-L166)
    

4.  在Module2中创建ArkTS方法，提供给Module2的Native侧调用。
    
    ```typescript
    // staticModule\src\main\ets\utils\Util.ets
    export function add(a: number, b: number): number {
      return a + b;
    }
    ```
    
    [Util.ets](https://gitcode.com/HarmonyOS_Samples/CrossModuleReference/blob/master/staticModule/src/main/ets/utils/Util.ets#L17-L20)
    

5.  在Module2模块的build-profile.json5文件中进行以下配置。
    
    ```json
    {
      "apiType": "stageMode",
      "buildOption": {
        // ...
        "arkOptions" : {
          "runtimeOnly" : {
            "sources": [
              "./src/main/ets/utils/Util.ets"
            ]
          }
        }
      },
      // ...
    }
    ```
    
    [build-profile.json5](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/staticModule/build-profile.json5#L2-L62)
    

6.  在Module2的Native侧调用ArkTS方法，并配置到头文件中。详细步骤如下所示。
    
    1.  通过napi\_load\_module\_with\_info()加载模块，其中，第二个参数是待加载的ets文件的路径，第三个参数是bundleName+模块名。
    2.  使用napi\_get\_named\_property()获取模块导出的add()方法。
    3.  使用napi\_call\_function()调用add()方法。
    
    napi\_har.cpp代码如下所示。
    
    ```cpp
    // staticModule\src\main\cpp\napi_har.cpp
    napi_value harArkTSAdd(double a, double b) {
        napi_env env = g_main_env;
        napi_value module;
        napi_status status = napi_load_module_with_info(env, "static_module/src/main/ets/utils/Util", "com.example.crossmodulereference/entry", &module);
        if (napi_ok != status) {
            return 0;
        }
        napi_value addFunc;
        napi_get_named_property(env, module, "add", &addFunc);
        napi_value addResult;
        napi_value argv[2] = {nullptr, nullptr};
        napi_create_double(env, a, &argv[0]);
        napi_create_double(env, b, &argv[1]);
        napi_call_function(env, module, addFunc, 2, argv, &addResult);
        return addResult;
    }
    ```
    
    [napi\_har.cpp](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/staticModule/src/main/cpp/napi_har.cpp#L32-L51)
    

7.  在module1的Native侧调用module2的harArkTSAdd()方法。
    
    ```cpp
    // entry\src\main\cpp\napi_init.cpp
    static napi_value invokeHarArkTS(napi_env env, napi_callback_info info)
    {
        size_t argc = 2;
        napi_value args[2] = {nullptr};
        napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
        napi_valuetype valuetype0;
        napi_typeof(env, args[0], &valuetype0);
        napi_valuetype valuetype1;
        napi_typeof(env, args[1], &valuetype1);
        double value0;
        napi_get_value_double(env, args[0], &value0);
        double value1;
        napi_get_value_double(env, args[1], &value1);
        return harArkTSAdd(value0, value1);
    }
    ```
    
    [napi\_init.cpp](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/entry/src/main/cpp/napi_init.cpp#L75-L96)
    

8.  在Module1的ArkTS侧调用Native侧的invokeHarArkTS()方法。
    
    ```typescript
    Button($r('app.string.call_har_ArkTS_method'))
      .fontSize(16)
      .width('100%')
      .margin({ top: 12 })
      .onClick(() => {
        this.getUIContext().getPromptAction().showToast({ message: 'HarArkTS method call succeed, result is '
          + napi.invokeHarArkTS(2, 3).toString() });
      })
    ```
    
    [Index.ets](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/entry/src/main/ets/pages/Index.ets#L55-L62)
    

### 实现效果

**图5** Native侧调用HAR模块的ArkTS方法  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/80/v3/WEpJmRl3SEWcbnjpxNQh8g/zh-cn_image_0000002194010540.gif?HW-CC-KV=V1&HW-CC-Date=20260313T021925Z&HW-CC-Expire=86400&HW-CC-Sign=4E01243E74E87AAF836A0F8AD4B7F154F6473B49F4AB7B5B0FF4D56A286F1091 "点击放大")

## 常见问题

### 跨HSP模块调用和跨HAR模块调用的区别

HSP模块和HAR模块被调用时，主要的区别在Module2 Native调用Module2 ArkTS中，在调用napi\_load\_module\_with\_info加载模块时的入参有一些区别，其他的流程都是一样的。

1.  被调用模块Module2是HAR

如图所示，编译构建后，HAR模块被打包到各个模块之中，所以其入口模块仍然是HAP模块，napi\_load\_module\_with\_info中第2个参数的模块名称要填HAP模块中oh-package.json5中定义的依赖HAR的名称，而不是HAR模块的实际名称。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f1/v3/qJlFMODLTg-6q3qazZnX5Q/zh-cn_image_0000002194010548.png?HW-CC-KV=V1&HW-CC-Date=20260313T021925Z&HW-CC-Expire=86400&HW-CC-Sign=E248417F0BC57E2B1D7D519597850058D5B81BC8B5D21E5BDD520BFED532204E "点击放大")

2.  被调用模块Module2是HSP

当被调用模块Module2是HSP，HSP是独立的模块，其入口模块就是HSP本模块，所以napi\_load\_module\_with\_info第2个参数的模块名就是它自己的模块名。

### 是否支持直接依赖HAR模块和HSP模块的三方so（即依赖传递问题）？

当前HAR模块和HSP模块都不支持依赖传递。

### 多包依赖同一so时，最终打包后的so有多少份？

如果多个HAR模块同时依赖commonHar的so，同一模块的同名so在打包后可以通过覆盖策略只保留一份。

如果多个HSP模块同时依赖commonHar的so，在编译构建时，会将依赖的so编译打包到最终的编译产物里，所以每一个.hsp文件都会有一个so。

### 报错找不到HAR/HSP模块的ArkTS文件

**问题现象**

调用HAR/HSP模块的ArkTS文件时，可能会遇到以下报错：

```cangjie
Error message:Cannot find module 'staticModule/src/main/ets/utils/Util' imported from 'com.xxxx.crossmodulereference/entry'.
```

**可能原因**

可能原因是工程级的build-profile.json5中的useNormalizedOHMUrl设置参数为false。

**解决措施**

在调用模块Module1的build-profile.json5里面添加如下配置。

```json
// ...
  "buildOption": {
    // ...
    "arkOptions" : {
      "runtimeOnly" : {
        "packages": [
          "static_module"
        ]
      }
    }
  },
  // ...
```

[build-profile.json5](https://gitcode.com/harmonyos_samples/CrossModuleReference/blob/master/entry/build-profile.json5#L2-L54)

## 示例代码

-   [Native侧跨HAR/HSP模块调用](https://gitcode.com/harmonyos_samples/CrossModuleReference)

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-cross-module-reference*