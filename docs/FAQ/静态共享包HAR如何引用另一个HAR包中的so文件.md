---
title: 静态共享包HAR如何引用另一个HAR包中的so文件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-56
category: FAQ
updated_at: 2026-03-13T05:35:36.570Z
---

# 静态共享包HAR如何引用另一个HAR包中的so文件

可以将so库导出并放置在libs目录下，然后在CMakeLists.txt中添加以下代码，将libnativeSub.so添加到har包中。

```plaintext
target_link_directories(entry PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../../libs/${OHOS_ARCH}/)
target_link_libraries(entry PUBLIC libace_napi.z.so libc++.a libnativeSub.so)
```

[CMakeLists.txt](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/cpp/CMakeLists.txt#L3-L4)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-56*