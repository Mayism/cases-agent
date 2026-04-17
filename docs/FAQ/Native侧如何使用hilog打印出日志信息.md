---
title: Native侧如何使用hilog打印出日志信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-35
category: FAQ
updated_at: 2026-03-13T03:30:42.172Z
---

# Native侧如何使用hilog打印出日志信息

1.在CMakeLists.txt中新增libhilog\_ndk.z.so链接：

```plaintext
target_link_libraries(entry PUBLIC libhilog_ndk.z.so)
```

[CMakeLists.txt](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/CMakeLists.txt#L27-L27)

2.在源文件中包含hilog头文件, 并定义domain、tag宏：

```cpp
#include "hilog/log.h"
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // Global domain macro, identifying the business domain
#define LOG_TAG "MY_TAG"  // Global tag macro, identifying module log tags
```

[napi\_hilog.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/NativeCpp/napi_hilog.cpp#L9-L13)

3.打印日志，以打印ERROR级别的日志为例：

注意，需要加上{public}才会显示打印内容，不添加默认是{private}

```cpp
int a = 5, b = 10;
OH_LOG_ERROR(LOG_APP, "Pure a:%{public}d b:%{private}d.", a, b);
```

[napi\_hilog.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/NativeCpp/napi_hilog.cpp#L18-L19)

结果展示：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e0/v3/prET6LibSFusYZ9YRdKZdQ/zh-cn_image_0000002194318320.png?HW-CC-KV=V1&HW-CC-Date=20260313T033035Z&HW-CC-Expire=86400&HW-CC-Sign=4699921228183DD183634D366BFC002C828F30FC92CC49658909C747366E1F36 "点击放大")

**参考链接：**

[使用HiLog打印日志(C/C++)](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hilog-guidelines-ndk)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-35*