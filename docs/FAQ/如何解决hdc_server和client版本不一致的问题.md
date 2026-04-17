---
title: 如何解决hdc server和client版本不一致的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-38
category: FAQ
updated_at: 2026-03-13T02:34:12.090Z
---

# 如何解决hdc server和client版本不一致的问题

**问题现象**

hdc.log 中的报错信息为“Daemon Session Handshake failed”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1b/v3/yNAN50RvQ_GFcqr4Zf0wmw/zh-cn_image_0000002194318252.png?HW-CC-KV=V1&HW-CC-Date=20260313T023405Z&HW-CC-Expire=86400&HW-CC-Sign=04D3B6BDD84214FC33B747F3C98A1219EA2069ADEF242F1CF58AA51A26EEC783 "点击放大")

**解决措施**

1.  通过以下命令检查server和client的版本是否匹配。
    
    hdc checkserver
    
2.  执行以下命令，终止其他版本的服务器。
    
    hdc kill

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-38*