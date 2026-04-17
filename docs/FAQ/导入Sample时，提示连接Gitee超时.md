---
title: 导入Sample时，提示连接Gitee超时
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-2
category: FAQ
updated_at: 2026-03-13T05:22:43.738Z
---

# 导入Sample时，提示连接Gitee超时

**问题现象**

导入Sample时，如果连接gitee.com的443端口超时，会提示“Failed to connect to gitee.com port 443: Time out”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/42/v3/4S1a2p2TSImoRctsTh1nwQ/zh-cn_image_0000002229758801.png?HW-CC-KV=V1&HW-CC-Date=20260313T052238Z&HW-CC-Expire=86400&HW-CC-Sign=7503D5A8C0B3F2F16A3C4E57B7BC901133285EAA03AA8374074EECEE05022F08)

**解决措施**

该问题可能是由于网络受限导致的，请检查网络连接状态。如果确实受限，需要通过代理服务器访问网络，请按照以下步骤配置git代理信息。

1.  打开Git安装目录（默认为C:\\\\Program Files\\\\Git），双击运行“git-cmd.exe”文件。
2.  在打开的命令行窗口中，执行以下命令配置代理服务器信息（将proxyUsername、proxyPassword、proxyServer和port按照实际代理服务器进行修改）。
    
    说明
    
    如果密码中包含特殊字符，如 @、#、\* 等，可能导致配置不生效。建议将这些特殊字符替换为 ASCII 码，并在 ASCII 码前加百分号 %。常用符号替换为 ASCII 码的对照表如下：
    
    -   !：%21
    -   @：%40
    -   #：%23
    -   $：%24
    -   &：%26
    -   \*：%2A
    
    ```csharp
    git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
    ```
    
3.  执行完成后，请重新尝试导入Sample。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-environment-2*