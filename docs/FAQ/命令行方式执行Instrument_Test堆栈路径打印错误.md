---
title: 命令行方式执行Instrument Test堆栈路径打印错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-7
category: FAQ
updated_at: 2026-03-13T06:02:53.064Z
---

# 命令行方式执行Instrument Test堆栈路径打印错误

**问题现象**

在5.0.3.400版本下，通过命令行执行Instrument Test，堆栈信息中的文件路径和位置有误，出现“|”而不是“/”，升级到5.0.3.401及以上版本仍然有误。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f2/v3/m0dwaIFjTUCO5LdSGaluMg/zh-cn_image_0000002194158620.png?HW-CC-KV=V1&HW-CC-Date=20260313T060248Z&HW-CC-Expire=86400&HW-CC-Sign=68524A580BB1BDB06E92C3FC818D984CE6F8507D5FED53E0D2FD5161A5078B45 "点击放大")

**原因**

在5.0.3.400版本下生成的.test文件和build文件夹未被同时删除，需要手动删除。

**解决措施**

删除5.0.3.400版本下生成的.test文件和build文件夹，然后重新执行测试用例。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c0/v3/gTBr9NZtQSmSZXbB5bJSIA/zh-cn_image_0000002194318232.png?HW-CC-KV=V1&HW-CC-Date=20260313T060248Z&HW-CC-Expire=86400&HW-CC-Sign=F6F6073B2DE44CA9045CE78E9E6C3B9E88DFCBA4F2894D62D91FE157D45E1C26 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-7*