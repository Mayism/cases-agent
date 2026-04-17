---
title: ohpm-repo remove_instance
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-remove_instance
category: 指南
updated_at: 2026-03-13T03:54:45.616Z
---

# ohpm-repo remove_instance

删除本机实例信息。

## 前提条件

-   已成功执行[start 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-start)或者[restart 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restart)，ohpm-repo服务启动成功。
-   数据存储db模块的类型必须为mysql，文件存储store模块的类型必须为sftp或custom。

## 命令格式

```undefined
ohpm-repo remove_instance
```

## 功能描述

该命令会停止当前运行的ohpm-repo服务，同时删除本机在mysql和sftp中的实例信息。命令要求数据存储db模块必须使用mysql，文件存储store模块必须使用sftp或custom。

## 示例

执行以下命令：

```undefined
ohpm-repo remove_instance
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/38/v3/dZisSuStSsOFvq2XNjo_PA/zh-cn_image_0000002501068646.png?HW-CC-KV=V1&HW-CC-Date=20260313T035404Z&HW-CC-Expire=86400&HW-CC-Sign=0EF542AAF1D3F25968102CF395A16E7FEEEC2E58A0C331FF416DD1707C9C5904 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-remove_instance*