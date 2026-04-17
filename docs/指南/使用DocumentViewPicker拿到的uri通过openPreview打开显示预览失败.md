---
title: 使用DocumentViewPicker拿到的uri通过openPreview打开显示预览失败
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/preview-faq-2
category: 指南
updated_at: 2026-03-13T00:48:56.534Z
---

# 使用DocumentViewPicker拿到的uri通过openPreview打开显示预览失败

DocumentViewPicker拿到的文件uri应用仅有临时权限，该权限无法分享给预览，导致预览失败。可先对uri[持久化权限](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/file-persistpermission)，然后再采用openPreview打开文件；或者可以先将文件拷贝至应用沙箱内，再通过传入拷贝的沙箱文件的uri来进行预览。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/preview-faq-2*