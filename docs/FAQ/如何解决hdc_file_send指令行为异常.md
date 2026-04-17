---
title: 如何解决hdc file send指令行为异常
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-74
category: FAQ
updated_at: 2026-03-13T05:37:17.492Z
---

# 如何解决hdc file send指令行为异常

**问题现象**

使用hdc file send向手机发送hap包和hsp包，文件变成3.4k的文件夹。执行install命令时提示解析错误。点击DevEco Studio右上角的绿色小三角按钮，当应用构建成功后，在项目根目录下执行hdc file send "./entry/build/default/outputs/default/entry-default-signed.hap" "data/local/tmp/app/entry-default-signed.hap"命令，最终推送到手机上的仍然不是单个hap包。目录结构如图：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/47/v3/TmdWxnbmSKiGfOxWWjTGkA/zh-cn_image_0000002229758677.png?HW-CC-KV=V1&HW-CC-Date=20260313T053710Z&HW-CC-Expire=86400&HW-CC-Sign=DB80273C27F792D34F6081039539AED6E3B21A844E5A498BBC6572DA223D8117 "点击放大")

**解决措施**

路径只能使用\\\\绝对路径，不能使用/相对路径。

绝对路径在DevEco Studio中复制。复制方法：

选中需要发送的文件，右键选择Copy Path/Reference... ->Absolute Path 或者选中文件后按快捷键Ctrl+Shift+C

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-74*