---
title: 编译报错“Duplicate 'routerMap' object names detected.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-161
category: FAQ
updated_at: 2026-03-13T05:45:57.039Z
---

# 编译报错“Duplicate 'routerMap' object names detected.”

**错误描述**

routerMap配置中存在重复名称。

**可能原因**

当前模块的router\_map.json文件中存在name重复的routerMap配置，或者当前模块与依赖模块之间存在name重复的routerMap配置。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bc/v3/PbZg9NZPSVO1w6iH7pnhkg/zh-cn_image_0000002229603813.png?HW-CC-KV=V1&HW-CC-Date=20260313T054552Z&HW-CC-Expire=86400&HW-CC-Sign=2956D66DC7BF886219E0BEF1D16F28D45A49BFEA0CA97786D5488CC27D1C3BC9)

**解决措施**

修改router\_map.json文件中的name字段，确保其值唯一。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-161*