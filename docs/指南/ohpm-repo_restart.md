---
title: ohpm-repo restart
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restart
category: 指南
updated_at: 2026-03-13T03:53:33.795Z
---

# ohpm-repo restart

重新启动ohpm-repo服务。

## 前提条件

已成功执行[install命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-install)，并按要求刷新环境变量。

## 命令格式

```undefined
ohpm-repo restart
```

## 功能描述

停止当前ohpm-repo服务，重新启动一个新的ohpm-repo服务。

说明

启动时将ohpm-repo服务的pid存放到<deploy\_root>/runtime/.pid文件，其中<deploy\_root>为[ohpm-repo私仓部署目录](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-configuration#zh-cn_topic_0000001745376470_关于-deploy_root)。

## 示例

执行以下命令：

```undefined
ohpm-repo restart
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/93/v3/Kx96Gdk-SSqidXusBjTdiQ/zh-cn_image_0000002532668823.png?HW-CC-KV=V1&HW-CC-Date=20260313T035252Z&HW-CC-Expire=86400&HW-CC-Sign=2D070BF1A486D49C8567D28570B0B58DD5C12AA612003A0A08C666CB1E8682AF "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restart*