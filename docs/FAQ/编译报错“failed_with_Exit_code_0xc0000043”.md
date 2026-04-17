---
title: 编译报错“failed with:Exit code 0xc0000043”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-194
category: FAQ
updated_at: 2026-03-13T05:48:23.259Z
---

# 编译报错“failed with:Exit code 0xc0000043”

**问题现象**

编译构建Native C++模块时，出现报错“failed with:Exit code 0xc0000043”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bb/v3/qF7MvRIhRge_vboVMXgoaA/zh-cn_image_0000002547275017.png?HW-CC-KV=V1&HW-CC-Date=20260313T054816Z&HW-CC-Expire=86400&HW-CC-Sign=F0CA7CA0C9E6EBCBC784A63D3B058DEFC87C9578056C1333A6D97C8D71EA8C0C)

**问题原因**

该报错是Windows系统下的一个NTSTATUS错误码，出现该报错的原因可能是使用了损坏或不完整的可执行文件，也可能是杀毒软件/防火墙拦截了ninja.exe文件的加载。

**解决措施**

1、在报错的ninja.exe文件所在目录中打开命令行工具，执行命令ninja.exe --version，若无法正常输出版本信息，可能为文件损坏或丢失，建议重新安装DevEco Studio。

2、尝试暂时关闭杀毒软件，或手动将ninja.exe文件添加到杀毒软件的白名单中，然后重新执行编译构建。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-194*