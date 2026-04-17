---
title: 编译报错“Unrecognized archive format in parameterFile”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-157
category: FAQ
updated_at: 2026-03-13T05:45:31.129Z
---

# 编译报错“Unrecognized archive format in parameterFile”

**错误描述**

parameterFile中包含无法识别的格式。

**可能原因**

使用parameterFile参数化配置的本地依赖既不是目录，也不是.har或.tgz文件。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/62/v3/XGC2tQN5RLq9XfrKoyOgrg/zh-cn_image_0000002194318392.png?HW-CC-KV=V1&HW-CC-Date=20260313T054526Z&HW-CC-Expire=86400&HW-CC-Sign=5C73B6DDF9938264461CA893B5D07BD72C55CD0475B15873A32541CA137B4605)

**解决措施**

将本地依赖修改为模块目录或模块编译后的har/tgz文件。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-157*