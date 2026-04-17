---
title: 编译通过，但是安装时失败报错“Error while Deploy Hap”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-103
category: FAQ
updated_at: 2026-03-13T05:39:27.460Z
---

# 编译通过，但是安装时失败报错“Error while Deploy Hap”

**问题描述**

在工程内打包的har包，编译通过，但在安装时失败。

```plaintext
04/10 14:01:54: Install Failed: error: failed to install bundle.
code:9568278
error: install version code not same.
$ hdc shell rm -rf data/local/tmp/f47e1222b8c64dbe92f86bc3b55cc3d2
Error while Deploy Hap
```

**可能原因**

该报错是由于需要安装的应用与系统已安装的应用中，app.json文件的versionCode字段不一致。

**解决措施**

方案一：开发者可能使用了DevEco Studio的debug按钮安装了该应用。之后，通过打包并使用hdc install命令安装。可以使用命令查看已安装应用的debug字段信息。

```lua
bm dump -n 应用bundleName | grep debug
```

普通应用的卸载与安装：

```shell
>hdc uninstall 应用bundleName
```

清空应用数据：

```undefined
hdc shell bm clean -d -n 应用bundleName
```

方案二：保存的数据应用版本与新安装的版本不一致可能导致问题。解决方法：进入“Run”>“Edit Configurations”>“Run/Debug Configuration”，取消选中“Keep Application Data”选项。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/85/v3/gs07s79eRRS_0Anrg4tRAw/zh-cn_image_0000002194159004.png?HW-CC-KV=V1&HW-CC-Date=20260313T053920Z&HW-CC-Expire=86400&HW-CC-Sign=98E17813B5A031C3110513B10A87BBA52A524FC10AE7B58CA9E04F1BA5857890)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-103*