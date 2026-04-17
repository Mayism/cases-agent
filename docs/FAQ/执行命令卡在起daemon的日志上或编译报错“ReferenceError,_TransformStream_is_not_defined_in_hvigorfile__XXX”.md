---
title: 执行命令卡在起daemon的日志上或编译报错“ReferenceError, TransformStream is not defined in hvigorfile: XXX”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-183
category: FAQ
updated_at: 2026-03-13T05:47:12.311Z
---

# 执行命令卡在起daemon的日志上或编译报错“ReferenceError, TransformStream is not defined in hvigorfile: XXX”

**问题现象**

流水线或命令行中执行命令后在起daemon的日志上：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/sRx84EfyQ96zYiYxdc0lkw/zh-cn_image_0000002345811941.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=2A2CA3850C398BBBF5EBB5E30071AF678A6B4B04D7CE0D18CB9775F158424425)

或者是流水线或命令行中编译报错：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1b/v3/jPEWoNgDS-K5HfCuD1IewA/zh-cn_image_0000002312015854.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=1587588F8027BC7CA247E216BA9889F50147923461D6A8A1C73E65CA0023539B)

**问题原因**

编译不支持低于v18.0.0的Node.js版本。相关配置查看[配置Node.js环境变量](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-command-line-building-app#section159168531288)。

**解决措施**

1.确认流水线或计算机配置的Node.js的版本。

Windows通过cmd或Powershell运行， Mac或Linux系统通过终端（Terminal）运行：

```undefined
node -v
```

查看输出：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5a/v3/GcQaZ1QzQWOnb3p3c6wM5A/zh-cn_image_0000002284561689.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=A1DFB1A5909AC565E808C429FD64B84BA611089F91BAF02743896C10DF985027)

2.如果流水线或计算机配置的Node.js的版本低于v18.0.0，推荐使用DevEco Studio或Command Line Tools自带的Node.js包来配置系统变量。

Windows系统打开环境变量的配置，将DevEco或Command Line Tool自带的Node.js包的路径添加进系统变量的Path中。如果是通过NODE\_HOME配置的，可以直接修改NODE\_HOME配置的路径。若系统中已存在其他Node.js版本，需将工具自带的Node.js路径添加至Path变量的最前端，确保优先使用该版本；通过NODE\_HOME配置时，需检查Path中是否包含%NODE\_HOME%/bin（Windows）或$NODE\_HOME/bin（Mac/Linux）以确保生效。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bc/v3/2ZQvcs3ZQFizOpr9UYHENw/zh-cn_image_0000002284693797.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=3F7C51BBD7C6BAAA9387AFD00B20DB1AE15CE2396EF68978998E92D285F97B01)

Mac或Linux系统参考[配置Node.js环境变量](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-command-line-building-app#section159168531288)。

DevEco Studio的自带的Node.js的路径为DevEco Studio安装目录/DevEco Studio/tools/node。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/13/v3/rrYP1xlzT7CZ9EqcoOF_1g/zh-cn_image_0000002284546061.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=1D1B823EBFE7B39B8CCA87AA6E1C530975BA206CAA2FAF13095E35DE242FE659)

Command Line Tools自带的Node.js的路径为Command Line Tools安装路径/command-line-tools/tool/node。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ac/v3/Tb81R3hcRciiOHEZWPs9FQ/zh-cn_image_0000002284672673.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=2EE267351E82CD292FEB0E88DA1D573440D5258DB7071C32405E8C122238F6EE "点击放大")

3.将自定义的Node.js版本升级为与DevEco Studio或Command Line Tools自带的Node.js版本一致。通过上述路径运行node -v查看版本，然后在Node.js官方网站中下载对应版本。下载地址为：https://nodejs.org/dist/v18.20.1/。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0/v3/mizNBSyUTz-ibm957eD2ig/zh-cn_image_0000002277140989.png?HW-CC-KV=V1&HW-CC-Date=20260313T054705Z&HW-CC-Expire=86400&HW-CC-Sign=21008D587E49B487A651B360EAF7781B1B905BEABF7D87EB879E1355AE7F7826)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-183*