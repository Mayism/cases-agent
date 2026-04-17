---
title: ohpm-repo restore
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restore
category: 指南
updated_at: 2026-03-13T03:54:20.040Z
---

# ohpm-repo restore

将ohpm-repo pack打包产物替换<deploy\_root>目录下相应文件，重启服务。

## 前提条件

-   已成功执行[start 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-start)或者[restart 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restart)，ohpm-repo服务启动成功。
-   已获得由[pack 命令](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-pack)打包的.zip 文件。

## 命令格式

```cangjie
ohpm-repo restore <file_path>
```

## 功能描述

该命令会停止当前ohpm-repo服务，并用打包文件<file\_path>中的内容替换ohpm-repo部署根目录<deploy\_root>的相应文件，然后重启ohpm-repo服务。该命令执行前必须已执行过ohpm-repo实例启动命令ohpm-repo start。

说明

-   <file\_path>：由ohpm-repo pack命令得到的打包产物。

支持相对和绝对路径配置，当配置为相对路径时，以当前命令行工作路径为根目录。

-   <deploy\_root>：ohpm-repo部署根目录 执行install命令后，会创建一个名为OHPM\_REPO\_DEPLOY\_ROOT的环境变量，记录的是[ohpm-repo私仓部署目录](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-configuration#zh-cn_topic_0000001745376470_关于-deploy_root)。

## 参数

### <file\_path>

-   类型：String
-   必填参数

指定待解压的打包文件路径。

## 示例

执行以下命令：

```bash
ohpm-repo restore "D:\pack_1702625827995.zip"
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a3/v3/JCO804pbS_CQVhm8-Qz-4Q/zh-cn_image_0000002500908832.png?HW-CC-KV=V1&HW-CC-Date=20260313T035339Z&HW-CC-Expire=86400&HW-CC-Sign=9461CCF56A07D79715B8B414C4E37D73AA51B42091BE6A5DE735FEBC63797668 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo-restore*