---
title: 如何避免使用AppAnalyzer后使用git提示需要版本化
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-11
category: FAQ
updated_at: 2026-03-13T06:01:30.105Z
---

# 如何避免使用AppAnalyzer后使用git提示需要版本化

**问题现象**

1.  使用AppAnalyzer进行应用/元服务体检后，使用git提示需要版本化。
2.  提示的文件在工程根目录/.appanalyzer下。

**问题原因**

AppAnalyzer会在体检完成后生成需要展示的数据用于最终报告展示，这类文件会保存在工程根目录/.appanalyzer下。

**解决措施**

在.gitignore文件下配置如下目录：

```plaintext
/.appanalyzer
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-11*