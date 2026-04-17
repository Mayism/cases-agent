---
title: ohpm-repo pack
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-pack
category: 指南
updated_at: 2026-03-13T03:54:03.845Z
---

# ohpm-repo pack

打包ohpm-repo部署目录文件。

## 前提条件

已成功执行[start 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-start)或者[restart 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restart)，ohpm-repo服务启动成功。

## 命令格式

```cangjie
ohpm-repo pack <deploy_root>
```

## 功能描述

用于打包ohpm-repo部署目录[deploy\_root](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-configuration#zh-cn_topic_0000001745376470_关于-deploy_root)下的conf ，db和meta目录。

说明：

-   如果数据存储db模块使用的是mysql，则命令只会打包conf和meta目录全部内容。
-   如果数据存储db模块使用的是filedb，则命令打包conf，db和meta目录全部，且在命令执行过程中，会先将ohpm-repo服务设置为只读模式，等打包完成以后，再将ohpm-repo服务重置为读写模式。
-   打包产物可通过ohpm-repo restore命令自动解压至<deploy\_root>目录。

## 参数

### <deploy\_root>

-   类型： String
-   必填参数

必须在pack命令后面配置<deploy\_root>参数，指定待打包的[ohpm-repo私仓部署目录](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-configuration#zh-cn_topic_0000001745376470_关于-deploy_root)。

## 示例

执行以下命令：

```cangjie
ohpm-repo pack D:\ohpm-repo
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/41/v3/rW4b7lTlTe2uORedUudnFg/zh-cn_image_0000002532748669.png?HW-CC-KV=V1&HW-CC-Date=20260313T035326Z&HW-CC-Expire=86400&HW-CC-Sign=90DD0F86042ABCD96F740C6EA7C55B3A871C92A16C37CFA156E1A6BD178F23F8 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-pack*