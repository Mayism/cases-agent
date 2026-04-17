---
title: Target AOT编译，AP文件生成失败
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-29
category: FAQ
updated_at: 2026-03-13T05:32:20.799Z
---

# Target AOT编译，AP文件生成失败

**问题现象**

Target AOT编译，AP文件生成失败，并报错提示“errno: 13”表示权限不足，如下图所示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3/v3/n8yHE5U5RWyOFdPTmUsdCg/zh-cn_image_0000002229758617.png?HW-CC-KV=V1&HW-CC-Date=20260313T053214Z&HW-CC-Expire=86400&HW-CC-Sign=4FA46127EB1850A8BA11BC19A6CB7A66EF9FC6ECC100A8E070C965AA51104C80)

**解决措施**

errno: 13表示权限不足，请通过下述措施解决：

打开命令行工具，输入以下命令，关闭selinux权限管控。

```undefined
hdc shell
setenforce 0
```

以上设置重启将会失效，若设备重启请重新进行以上设置

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-29*