---
title: 如何查看ArkCompiler出现Error日志时，具体的异常调用栈信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-29
category: FAQ
updated_at: 2026-03-13T02:33:50.923Z
---

# 如何查看ArkCompiler出现Error日志时，具体的异常调用栈信息

Native抛异常，如需查看backtrace，运行以下命令。

打开异常栈：

```bash
hdc shell param set persist.ark.properties 0x125c
hdc shell reboot
```

恢复默认值：

```bash
hdc shell param set persist.ark.properties 0x105c
hdc shell reboot
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-29*