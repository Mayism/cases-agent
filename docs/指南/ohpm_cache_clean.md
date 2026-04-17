---
title: ohpm cache clean
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-cache
category: 指南
updated_at: 2026-03-13T05:21:46.492Z
---

# ohpm cache clean

清理 ohpm 缓存文件夹。

从ohpm 6.0.2.636版本开始，命令后支持配置log\_level和debug参数，用于查看日志级别和指定执行当前命令的日志级别。

## 命令格式

```css
ohpm cache clean [options]
```

## 功能描述

用于清理 ohpm 缓存文件夹。

## Options

### log\_level

-   默认值：无
-   类型： String

可以在命令后配置--log\_level <string>参数，指定执行当前命令的日志级别（info、debug、warn、error），如果未指定该值则日志级别为.ohpmrc中配置的log\_level的级别。

### debug

-   默认值：false
-   类型： Boolean

可以在命令后配置--debug参数，指定执行当前命令的日志级别为debug，该配置仅在当前命令行生效，不修改.ohpmrc中的日志级别，如果未指定该值则日志级别为.ohpmrc中配置的log\_level的级别。

## 示例

清理 ohpm 缓存文件夹，可执行以下命令：

```undefined
ohpm cache clean
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0a/v3/pX_PHgLvQdC9cU4bUFtpew/zh-cn_image_0000002500910284.png?HW-CC-KV=V1&HW-CC-Date=20260313T052106Z&HW-CC-Expire=86400&HW-CC-Sign=2E2B690891827A27948C2402D842E947EDF2FCBF1AFEF1EE2BFEC96CFB9AC333)

### 关于缓存设计的说明

ohpm 将缓存数据存储在配置的 cache 目录下名为 content-v1 的文件夹中，存储所有通过 http 请求获取的 HAR 包数据。包的路径使用包的 sha512 哈希值分割成 3 段，第 1、2 位作为第一级目录，哈希值第 3、4 位作为第二级目录，哈希值第 5 位到结尾的所有字符作为文件名。使用哈希值可以将文件较均匀地分布在各个目录下，分成 3 层目录结构避免一个目录下文件数量过多，可以提升文件索引效率。

### 配置

缓存的配置方式见 [ohpmrc](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpmrc) 。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-cache*