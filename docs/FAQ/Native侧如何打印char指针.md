---
title: Native侧如何打印char指针
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-47
category: FAQ
updated_at: 2026-03-13T03:32:24.260Z
---

# Native侧如何打印char指针

引入hilog库后直接打印。打印时需要加{public}。

OH\_LOG\_INFO(LOG\_APP, “%{public}s”,path); //可正常打印

OH\_LOG\_INFO(LOG\_APP, “%s”,path); //不可正常打印

示例代码如下：

```cpp
char *path = "abc";
OH_LOG_INFO(LOG_APP, "path: %{public}s", path);
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/napi_init.cpp#L12-L13)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-47*