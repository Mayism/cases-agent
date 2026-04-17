---
title: 如何解决调用两次fs接口写文件，但第二次写入的内容未完全覆盖第一次写入的内容的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-25
category: FAQ
updated_at: 2026-03-13T04:36:08.328Z
---

# 如何解决调用两次fs接口写文件，但第二次写入的内容未完全覆盖第一次写入的内容的问题

清除写文件时必须要设置OpenMode.TRUNC，默认覆盖模式(WRITE\_ONLY)只是覆盖不会清除,TRUNC模式会先清空文件内容。参考代码如下：

```typescript
fs.openSync(dst, fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC | fs.OpenMode.CREATE);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-25*