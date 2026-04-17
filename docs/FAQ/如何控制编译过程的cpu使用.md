---
title: 如何控制编译过程的cpu使用
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-60
category: FAQ
updated_at: 2026-03-13T05:36:02.713Z
---

# 如何控制编译过程的cpu使用

在模块级 build-profile.json5 的 buildOption.arguments 中添加相关配置，指定 CMake 编译参数。示例如下：

```json
{
  "buildOption": {
    "arguments": [
      "-DCMAKE_BUILD_PARALLEL_LEVEL=2",
      "-DCMAKE_LINK_PARALLEL_LEVEL=2"
    ]
  }
}
```

此配置指定编译和链接分别使用 2 个处理器。

```json
"buildOption": {
  "externalNativeOptions": {
    "path": "../cpp/CMakeLists.txt",
    "arguments": "-DCMAKE_JOB_POOL_COMPILE:STRING=compile -DCMAKE_JOB_POOL_LINK:STRING=link -DCMAKE_JOB_POOLS:STRING=compile=2;link=2",
    "cppFlags": "",
    "abiFilters": [
      "x86_64",
      "arm64-v8a"
    ]
  }
},
```

[build-profile.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/build-profile.json5#L6-L16)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-60*