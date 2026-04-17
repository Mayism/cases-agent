---
title: C/C++内存错误检测
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/debug-asan
category: 指南
updated_at: 2026-03-13T03:49:37.527Z
---

# C/C++内存错误检测

为追求C/C++的更优性能，编译器和OS(Windows/Linux/Mac)运行框架不会对内存操作进行安全检测。针对该场景，DevEco Studio集成ASan（Address-Sanitizer）为开发者提供面向C/C++的地址越界检测能力，并通过FaultLog展示错误的堆栈详情及导致错误的代码行。

关于ASan的使用说明请参见[C/C++内存错误检测](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-asan)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/debug-asan*