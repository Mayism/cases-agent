---
title: ArkTS侧与Native侧如何进行map数据交互
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-6
category: FAQ
updated_at: 2026-03-13T03:17:00.940Z
---

# ArkTS侧与Native侧如何进行map数据交互

当前没有专门的接口用于在ArkTS侧与Native侧之间转换map。要实现map（二维数组）的数据交互，可以读取map中的数据并传递到Native侧进行重组。

参考代码如下：

在ArkTS中声明hashmap，获取数据并传递到Native侧。

```typescript
let hashmap: HashMap<string, number> = new HashMap()
hashmap.set("Abc", 123)
hashmap.set("Bcd", 234)
hashmap.set("Cde", 345)
for (let key of hashmap.keys()) {
  testNapi.mapDemo(key, hashmap.get(key))
  console.info(`key is ${key}, value is ${hashmap.get(key)}`)
}
```

[NativeMap.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/ets/pages/NativeMap.ets#L9-L16)

获取数据并重组为map。

```cpp
#define LOG_DOMAIN 0x3200 // Global domain macro, identifying the business domain
#define LOG_TAG "MY_TAG"  // Global tag macro, identifying module log tag
#include "NativeMap.h"
#include "hilog/log.h"
#include <map>
#include <string>
std::map<std::string, int> testmap;
napi_value NativeMap::MapDemo(napi_env env, napi_callback_info info) {
    size_t requireArgc = 2;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char str1[1024];
    size_t str1_len;
    napi_get_value_string_utf8(env, args[0], str1, 100, &str1_len);
    int num;
    napi_get_value_int32(env, args[1], &num);
    testmap.insert(std::make_pair(str1, num));
    for(auto e: testmap){
        OH_LOG_ERROR(LOG_APP, "key is: %{public}s, value is  %{public}d", (e.first).c_str(), e.second);
    }
    return nullptr;
}
```

[NativeMap.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/NativeMap/NativeMap.cpp#L25-L49)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-6*