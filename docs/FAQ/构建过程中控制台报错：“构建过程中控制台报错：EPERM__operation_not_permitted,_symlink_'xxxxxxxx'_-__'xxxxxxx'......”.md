---
title: 构建过程中控制台报错：“构建过程中控制台报错：EPERM: operation not permitted, symlink 'xxxxxxxx' -> 'xxxxxxx'......”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-189
category: FAQ
updated_at: 2026-03-13T05:47:51.172Z
---

# 构建过程中控制台报错：“构建过程中控制台报错：EPERM: operation not permitted, symlink 'xxxxxxxx' -> 'xxxxxxx'......”

**问题现象**

在windows系统使用DevEco Studio在编译构建工程或module时，编译构建报错，控制台显示错误信息：EPERM: operation not permitted, symlink 'xxxxxxxx' -> 'xxxxxxx'......，如下图：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b3/v3/vnbRoKEuTkuBUiVo49Yotg/zh-cn_image_0000002466832505.png?HW-CC-KV=V1&HW-CC-Date=20260313T054746Z&HW-CC-Expire=86400&HW-CC-Sign=0F60B92807F3B6A0E48F9B0E42D8B42EEB027E134BAD8FEFC90928D31BAF1E41)

**可能原因**

在编译构建的过程中会有一些拷贝文件的操作，hvigor基于node会使用fse-extra模块的copySync接口执行拷贝操作。copySync接口在拷贝文件目录时，若源目录中存在文件目录软链接，默认会在目标目录下创建同样的软链接，但是在windows系统中默认没有创建文件目录软链接的权限，所以会执行失败，导致构建报错。

**解决措施**

1\. 在windows系统，打开设置->系统->开发者模式，打开之后会拥有创建文件目录软链接的权限。

2\. 以管理员身份运行构建命令，在管理员身份下，会拥有创建文件目录软链接的权限。

注：在方法2中，可以先关闭DevEco Studio再右键点击DevEco Studio图标，选择以管理员身份运行DevEco Studio；或者以管理员身份运行终端，在终端中先执行 hvigorw --stop-daemon-all，以避免已运行的daemon进程的影响，然后执行构建命令。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-189*