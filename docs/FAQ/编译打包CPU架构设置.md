---
title: 编译打包CPU架构设置
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-86
category: FAQ
updated_at: 2026-03-13T05:37:59.314Z
---

# 编译打包CPU架构设置

**问题描述**

在编译打包时，若需移除v7a，可以参考以下配置文档。

**解决方案**

可参考 [bm工具](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/bm-tool)

```json
"externalNativeOptions": {
  "path": "./src/main/cpp/CMakeLists.txt",
  //CMake configuration file, providing CMake build scripts
  "arguments": "",
  //Optional compilation parameters passed to CMake
  "abiFilters": [
    "x86_64",
    "arm64-v8a"
  ],
  //Used to set up the local ABI compilation environment
  "cppFlags": ""
  //Set optional parameters for the C++ compiler
},
```

[build-profile.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/library1/build-profile.json5#L6-L18)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-86*