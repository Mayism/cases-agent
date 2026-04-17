---
title: 调用云存储业务接口失败，app日志提示“"state":65”，upload进程日志提示“404 Not Found”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cloudfoundation-faq-6
category: 指南
updated_at: 2026-03-12T21:31:32.095Z
---

# 调用云存储业务接口失败，app日志提示“"state":65”，upload进程日志提示“404 Not Found”

**问题现象**

通过“使用指定的实例”方式初始化云存储实例时，调用业务接口（如调用uploadFile接口上传文件）失败，出现如下错误提示：

-   app日志提示“"state":65”
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/6qx2Od1NSaalnAdeNXO9VQ/zh-cn_image_0000002474214461.png?HW-CC-KV=V1&HW-CC-Date=20260312T212950Z&HW-CC-Expire=86400&HW-CC-Sign=8986B30FDBC232A7DD3FA6B5A5CE4E0D70534451F41BD39A266E8DF4793DDF7B)
    
-   upload进程的日志提示“404 Not Found”（通过设置“No filters”模式、过滤“C01C50”关键字查找）
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/gPTm62fERH-7veDtpQqvmw/zh-cn_image_0000002440774624.png?HW-CC-KV=V1&HW-CC-Date=20260312T212950Z&HW-CC-Expire=86400&HW-CC-Sign=AF9F2FCB9278067C549B1A37E5E061753F0E136050CD73D97A5639DBB0796F58 "点击放大")
    

**解决措施**

出现此问题，原因是当前云侧不存在该存储实例，或传入的存储实例名称错误。

请检查您传入的存储实例名称，确保云侧存在该存储实例，且传入的存储实例名称与云侧存储实例名称完全一致。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cloudfoundation-faq-6*