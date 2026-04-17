---
title: fs.open读取应用沙盒路径失败
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-29
category: FAQ
updated_at: 2026-03-13T04:36:20.126Z
---

# fs.open读取应用沙盒路径失败

**问题现象**

获取到demo中的歌曲path，将其转换为uri发送给另一个app。通过context获取应用文件的应用沙箱路径后，将其传入fs.open时发现报错。

**解决措施**

进行文件共享时， 获取当前应用的uid/gid，使用fs.chown修改文件属主，将uid和gid更改为应用的。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-29*