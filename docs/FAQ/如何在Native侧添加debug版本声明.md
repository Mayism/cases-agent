---
title: 如何在Native侧添加debug版本声明
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-12
category: FAQ
updated_at: 2026-03-13T03:28:21.012Z
---

# 如何在Native侧添加debug版本声明

**问题详情**

尝试过在需要编译的库的build-profile.json5文件中，buildOptionSet字段中添加 { "name": "debug", "externalNativeOptions": { "arguments": "-DDEBUG=1" } } 或在buildOption.externalNativeOptions.arguments字段中设置"-DDEBUG=1"， 在使用debug模式运行时均不会执行#ifdef DEBUG中的语句。

**解决措施**

1.CMakeLists.txt文件中增加如下语句：

```plaintext
if(CMAKE_BUILD_TYPE STREQUAL Debug)
    add_definitions(-D_DEBUG)
endif()
```

[CMakeLists.txt](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/CMakeLists.txt#L10-L12)

2.C++文件中增加如下代码：

```cpp
#include "napi/native_api.h"
#include "hilog/log.h"
#define LOG_TAG "Pure"
static napi_value DefDebug(napi_env env, napi_callback_info info) {
#ifdef _DEBUG
    OH_LOG_INFO(LOG_APP, "debug enter Project");
#else
    OH_LOG_INFO(LOG_APP, "release enter Project");
#endif
    return nullptr;
}
```

[DefDebug.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/NativeCpp/DefDebug.cpp#L8-L19)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-12*