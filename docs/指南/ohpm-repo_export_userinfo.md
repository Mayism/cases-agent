---
title: ohpm-repo export_userinfo
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-export-userinfo
category: 指南
updated_at: 2026-03-13T03:55:26.033Z
---

# ohpm-repo export_userinfo

导出用户必要的DB数据。

## 命令格式

```undefined
ohpm-repo export_userinfo
```

## 功能描述

在当前的工作目录导出记录了DB数据的export\_userInfo\_xxx.zip文件，其中包含加密组件和下面的10张数据表。

-   user
-   group\_member
-   public\_key
-   access\_token
-   uplink
-   uplink\_proxy
-   repo
-   repo\_permission
-   validation\_config
-   system\_security

## 示例

执行以下命令：

```undefined
ohpm-repo export_userinfo
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/10/v3/tGBlHtNPReyGHJJ5tt4qwQ/zh-cn_image_0000002500908828.png?HW-CC-KV=V1&HW-CC-Date=20260313T035446Z&HW-CC-Expire=86400&HW-CC-Sign=FBBCDC47D038F2A9E23E0EBBB9A12CEEF7BFF03C2B0F6E7AB4A67287816E1BD9)

```csharp
PS D:\> ohpm-repo export_userinfo
[2025-08-09T19:14:16.721] [INFO] default - initialize "file database" successfully.
[2025-08-09T19:14:16.724] [INFO] default - export the "user" table done.
[2025-08-09T19:14:16.726] [INFO] default - export the "group_member" table done.
[2025-08-09T19:14:16.728] [INFO] default - export the "access_token" table done.
[2025-08-09T19:14:16.728] [INFO] default - export the "public_key" table done.
[2025-08-09T19:14:16.730] [INFO] default - export the "repo" table done.
[2025-08-09T19:14:16.730] [INFO] default - export the "repo_permission" table done.
[2025-08-09T19:14:16.731] [INFO] default - export the "uplink" table done.
[2025-08-09T19:14:16.732] [INFO] default - export the "uplink_proxy" table done.
[2025-08-09T19:14:16.733] [INFO] default - export the "validation_config" table done.
[2025-08-09T19:14:16.734] [INFO] default - export the "system_security" table done.
[2025-08-09T19:14:16.761] [INFO] default - userinfo exported completed, save the .zip file to : "D:\export_userInfo_1754738056722.zip".
```

```lua
export_userInfo_1754738056722.zip文件结构
|   access_token.json
|   group_member.json
|   public_key.json
|   repo.json
|   repo_permission.json
|   system_security.json
|   uplink.json
|   uplink_proxy.json
|   user.json
|   validation_config.json
\---meta
    |   version.txt
    +---ac
    +---ce
    \---fd
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-export-userinfo*