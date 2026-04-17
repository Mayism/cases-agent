---
title: ohpm-repo start
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-start
category: 指南
updated_at: 2026-03-13T03:53:25.020Z
---

# ohpm-repo start

启动ohpm-repo服务。

## 前提条件

已成功执行[install命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-install)，并按要求刷新环境变量。

## 命令格式

```sql
ohpm-repo start
```

## 功能描述

用于启动ohpm-repo服务，创建一个ohpm-repo实例。

说明

启动时将ohpm-repo服务的pid存放到<deploy\_root>/runtime/.pid文件中，其中<deploy\_root>为[ohpm-repo私仓部署目录](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-configuration#zh-cn_topic_0000001745376470_关于-deploy_root)。

## 示例

执行以下命令：

```sql
ohpm-repo start
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1d/v3/7VZzC3P4T_GoStQG3WB5XA/zh-cn_image_0000002500908840.png?HW-CC-KV=V1&HW-CC-Date=20260313T035242Z&HW-CC-Expire=86400&HW-CC-Sign=3FA7DBC06A526DF7DB130A3C3B0BFEE2D999637B4326A74A4CAC3100F90E61AC "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-start*