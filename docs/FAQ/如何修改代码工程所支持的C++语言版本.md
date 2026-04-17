---
title: 如何修改代码工程所支持的C++语言版本
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-9
category: FAQ
updated_at: 2026-03-13T03:17:14.461Z
---

# 如何修改代码工程所支持的C++语言版本

**问题详情**

如何修改C++语言版本？当前支持的C++标准有哪些？

**解决措施**

-   libc++版本
    
    HarmonyOS 3.0开始使用clang/llvm 10.0.1版本的libc++。
    
    HarmonyOS 3.2开始使用clang/llvm 12.0.1版本的libc++。
    
    HarmonyOS NEXT Developer Preview0开始使用clang/llvm 15.0.4版本的libc++。
    
-   C++语言支持能力
    
    C++11和C++14标准已完全支持，C++17和C++20标准正在逐步完善。
    
-   如何修改C++语言版本
    
    SDK默认的C++版本为14。如果需要修改，请参考以下两种方式：
    
    -   在CMakelists.txt文件中设置版本。
        
        set(NATIVERENDER\_ROOT\_PATH ${CMAKE\_CURRENT\_SOURCE\_DIR})
        
        \# 添加以下行
        
        set(CMAKE\_CXX\_STANDARD 17)# 设置C++标准为17
        
    -   修改模块级的build-profile.json5文件，添加“"cppFlags": "--std=c++17"”。
        
        ```json
        "buildOption": {
          "externalNativeOptions": {
            "path": "./src/main/cpp/CMakeLists.txt",
            "arguments": "",
            // Modify the following line
            "cppFlags": "--std=c++17"
          },
        },
        ```
        
        [build-profile.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/build-profile.json5#L5-L12)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-9*