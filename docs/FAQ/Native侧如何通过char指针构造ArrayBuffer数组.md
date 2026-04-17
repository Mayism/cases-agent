---
title: Native侧如何通过char指针构造ArrayBuffer数组
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-59
category: FAQ
updated_at: 2026-03-13T03:34:07.300Z
---

# Native侧如何通过char指针构造ArrayBuffer数组

可以通过napi\_create\_arraybuffer接口实现。

```cpp
#include "CharToArrBuffer.h"
napi_value CharToArrBuffer::TestCharBuf(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    char *buf = nullptr;
    // Create an Array buffer
    napi_create_arraybuffer(env, 100, reinterpret_cast<void **>(&buf), &result);
    // Assign an ArrayBuffer
    for (int i = 0; i < 100; i++) {
        buf[i] = i + 2;
    }
    return result;
}
```

[CharToArrBuffer.cpp](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/Ndk/Ndk2/entry/src/main/cpp/CharToArrBuffer/CharToArrBuffer.cpp#L19-L30)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-59*