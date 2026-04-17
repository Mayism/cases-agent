---
title: hilog日志如何设置为只打印当前应用的日志
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-2
category: FAQ
updated_at: 2026-03-13T02:32:05.588Z
---

# hilog日志如何设置为只打印当前应用的日志

使用hilog命令行工具来过滤保留当前应用的日志。

```plaintext
hilog -T xxx 按tag过滤;
hilog –D xxx 按domain过滤;
hilog -e 对日志内容匹配，支持正则表达式。支持tag, domain, pid等多重过滤,组合过滤以及反向过滤;
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-2*