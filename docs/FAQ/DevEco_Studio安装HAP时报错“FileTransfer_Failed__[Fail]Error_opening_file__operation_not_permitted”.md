---
title: DevEco Studio安装HAP时报错“FileTransfer Failed: [Fail]Error opening file: operation not permitted”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-61
category: FAQ
updated_at: 2026-03-13T05:58:43.209Z
---

# DevEco Studio安装HAP时报错“FileTransfer Failed: [Fail]Error opening file: operation not permitted”

**问题现象**

DevEco Studio安装HAP时报错“FileTransfer Failed: \[Fail\]Error opening file: operation not permitted”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b8/v3/XFt9U-PqSreIV2mpGdApSQ/zh-cn_image_0000002557334391.png?HW-CC-KV=V1&HW-CC-Date=20260313T055838Z&HW-CC-Expire=86400&HW-CC-Sign=05376AD476C846351A45131BF4003A5BE5561AC550A601DA30B3BFDDC939EEEE)

**解决措施**

出现该问题的原因是安装包HAP所在路径没有权限。

1、Windows系统建议将工程移出C盘，然后重新运行。

2、MAC系统为DevEco Studio获取完全磁盘访问权，请进入**“系统设置”>“隐私与安全性”>“完全磁盘访问权限”**，在列表中勾选DevEco Studio软件并重启。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-61*