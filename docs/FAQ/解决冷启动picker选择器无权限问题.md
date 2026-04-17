---
title: 解决冷启动picker选择器无权限问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-46
category: FAQ
updated_at: 2026-03-13T04:37:55.019Z
---

# 解决冷启动picker选择器无权限问题

在APP冷启动后，由于没有uri的读取权限，可以通过保存草稿操作将对应的文件复制到沙箱路径下，然后在冷启动时获取这些文件。

**参考链接**

[fs.copyFile](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-file-fs#fscopyfile)

[应用沙箱目录](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/app-sandbox-directory)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-46*