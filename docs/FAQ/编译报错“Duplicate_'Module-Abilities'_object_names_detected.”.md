---
title: 编译报错“Duplicate 'Module-Abilities' object names detected.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-167
category: FAQ
updated_at: 2026-03-13T05:46:33.203Z
---

# 编译报错“Duplicate 'Module-Abilities' object names detected.”

**错误描述**

Module-Abilities对象名称重复。

**可能原因**

依赖的HAR模块中module.json5的abilities数组中存在重复的ability对象名称。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/7f/v3/DFQGK0FXTVaw0T27ojMqwg/zh-cn_image_0000002194158504.png?HW-CC-KV=V1&HW-CC-Date=20260313T054628Z&HW-CC-Expire=86400&HW-CC-Sign=85D138CB50D05E4D3CD44D0714179BE6DBA663863C5D8AC648E96DE99B135686)

**解决措施**

检查依赖的HAR模块在module.json5文件中的abilities字段，确保每个ability的name唯一。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-167*