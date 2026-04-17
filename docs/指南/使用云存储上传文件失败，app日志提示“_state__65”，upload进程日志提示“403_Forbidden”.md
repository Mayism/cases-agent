---
title: 使用云存储上传文件失败，app日志提示“"state":65”，upload进程日志提示“403 Forbidden”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cloudfoundation-faq-2
category: 指南
updated_at: 2026-03-12T21:30:24.526Z
---

# 使用云存储上传文件失败，app日志提示“"state":65”，upload进程日志提示“403 Forbidden”

**问题现象**

使用云存储上传文件失败，出现如下错误提示：

-   app日志提示“"state":65”
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/79/v3/rNU9ILm8T2qqIw_BAbRp4Q/zh-cn_image_0000002474214289.png?HW-CC-KV=V1&HW-CC-Date=20260312T212841Z&HW-CC-Expire=86400&HW-CC-Sign=282CA2F41FAEAE39E9BA1085E8127A708DB576652D8F6F4E0112971ACE8211DC)
    
-   upload进程的日志提示“403 Forbidden”（通过设置“No filters”模式、过滤“C01C50”关键字查找）
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f9/v3/Cv95n7HmR4-k50HjXNpMUA/zh-cn_image_0000002440774452.png?HW-CC-KV=V1&HW-CC-Date=20260312T212841Z&HW-CC-Expire=86400&HW-CC-Sign=42F2AB33EF988C007347E5D9117D0D18197BCAB98E5E0A72246DA21C2C134902)
    

**解决措施**

出现此问题，可按照如下步骤排查和解决：

1.  请确认应用的签名方式正确。当前Cloud Foundation Kit支持[关联注册应用进行自动签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section20943184413328)和[手动签名](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233)两种方式。
2.  请确认已通过[AuthProvider](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/cloudfoundation-cloudcommon#section136610231214)获取用户凭据。未配置用户凭据的情况下，服务端会返回“403 Forbidden”错误。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/cloudfoundation-faq-2*