---
title: ohpm root
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-root
category: 指南
updated_at: 2026-03-13T05:21:42.990Z
---

# ohpm root

在标准输出中打印有效的 oh\_modules 目录路径信息。

从ohpm 6.0.2.636版本开始，命令后支持配置log\_level和debug参数，用于查看日志级别和指定执行当前命令的日志级别。

## 命令格式

```undefined
ohpm root
```

## 功能描述

可以在模块的任意子目录下执行，用于打印命令工作路径下所在包的有效 oh\_modules 目录路径信息。

## Options

### prefix

-   默认值：""
-   类型： string

可以在 root 命令后面配置 --prefix <string> 参数，用来指定包的根目录，该目录下必须存在 oh-package.json5 文件，将会打印该根目录中有效的 oh\_modules 目录路径信息。

### log\_level

-   默认值：无
-   类型： String

可以在 root 命令后配置--log\_level <string>参数，指定执行当前命令的日志级别（info、debug、warn、error），如果未指定该值则日志级别为.ohpmrc中配置的log\_level的级别。

### debug

-   默认值：false
-   类型： Boolean

可以在命令后配置--debug参数，指定执行当前命令的日志级别为debug，该配置仅在当前命令行生效，不修改.ohpmrc中的日志级别，如果未指定该值则日志级别为.ohpmrc中配置的log\_level的级别。

## 示例

项目结构为：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c1/v3/Kgf04H7hQ1C7sUbAJxpPnA/zh-cn_image_0000002532669797.png?HW-CC-KV=V1&HW-CC-Date=20260313T052102Z&HW-CC-Expire=86400&HW-CC-Sign=A749072F8F9F853D2FDB0261898B28D8EA162304455864DCB68EC8442B010F3C)

在entry模块的src目录下执行：

```undefined
ohpm root
```

结果示例：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/16/v3/hluDo97hQjmb9coFz6f8vA/zh-cn_image_0000002501069734.png?HW-CC-KV=V1&HW-CC-Date=20260313T052102Z&HW-CC-Expire=86400&HW-CC-Sign=FFF51D7AA2C29A9078CB206F4EB16A4DBBEBF89ADBF6E3A24F59BBDDCAB899CA)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-root*