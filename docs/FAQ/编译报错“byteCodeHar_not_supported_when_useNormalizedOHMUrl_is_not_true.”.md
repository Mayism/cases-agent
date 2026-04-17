---
title: 编译报错“byteCodeHar not supported when useNormalizedOHMUrl is not true.”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-166
category: FAQ
updated_at: 2026-03-13T05:46:27.590Z
---

# 编译报错“byteCodeHar not supported when useNormalizedOHMUrl is not true.”

**错误描述**

当useNormalizedOHMUrl配置为false时，不支持编译字节码HAR。

**可能原因**

当HAR模块的build-profile.json5文件中的byteCodeHar字段配置为true时，工程级build-profile.json5文件中的useNormalizedOHMUrl字段未配置为true。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/NzWM7fGUQ-uKMi1XCXn1JQ/zh-cn_image_0000002194318416.png?HW-CC-KV=V1&HW-CC-Date=20260313T054622Z&HW-CC-Expire=86400&HW-CC-Sign=A9AEC0B6A6D61CB730F5F9DEC7712447625D0F859012294425164028BDCC04B1)

**解决措施**

当HAR模块的build-profile.json5文件中byteCodeHar字段配置为true时，工程级build-profile.json5文件中的useNormalizedOHMUrl字段也必须配置为true。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/89/v3/Pqu57pZjQ1yAaGWSk-z-Gg/zh-cn_image_0000002308297297.png?HW-CC-KV=V1&HW-CC-Date=20260313T054622Z&HW-CC-Expire=86400&HW-CC-Sign=0210F8E0757E0964C530605DA6A44E4AC80E489BD4A5C06AFD9DF2D23B2CE96C)

**参考链接**

[strictMode](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-profile-app#section13181758123312)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-166*