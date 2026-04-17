---
title: 工程编译告警提示“ArkTS:WARN: For details about ArkTS syntax errors”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-30
category: FAQ
updated_at: 2026-03-13T05:32:27.725Z
---

# 工程编译告警提示“ArkTS:WARN: For details about ArkTS syntax errors”

**问题现象**

工程构建时，出现ArkTS语法告警提示，详情请参见FAQ。

报错信息：

1.  ERROR: ArkTS:ERROR File: C:/Users/... ,Use "let" instead of "var" (arkts-no-var)
2.  ERROR: ArkTS:ERROR File: D:/DTS/MyApplicationAPI12/... ,The "@Sendable" decorator can only be used on "class", "function" and "typeAlias" (arkts-sendable-decorator-limited)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d0/v3/SQpxEqsCSH6cd1ErLMlk_Q/zh-cn_image_0000002429325678.png?HW-CC-KV=V1&HW-CC-Date=20260313T053221Z&HW-CC-Expire=86400&HW-CC-Sign=8E49898CBDBD79769198D66E0956AEE0137D0FB259AF989C9899D738702AD86F)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9c/v3/l0MmJWKARTWbubYLK9DlUg/zh-cn_image_0000002429485750.png?HW-CC-KV=V1&HW-CC-Date=20260313T053221Z&HW-CC-Expire=86400&HW-CC-Sign=98DBA96E6619DD2054FFF53ABBDF9763F8BEDE04E6B78B538C47170B6D46FCBC)

**解决措施**

该告警表明工程中存在不符合ArkTS语法规范的代码，请根据ERROR报错中的报错信息进行修改，或根据提示的语法规则(如arkts-no-var、arkts-sendable-decorator-limited等)，在本网站搜索对应的说明，修改为ArkTS规范写法。ArkTS语言相关介绍请查看[ArkTS（方舟编程语言）](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-30*