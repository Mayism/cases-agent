---
title: 如何解决编译报错“Property xxx does not exist on type 'typeof BuildProfile'”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-69
category: FAQ
updated_at: 2026-03-13T05:36:44.492Z
---

# 如何解决编译报错“Property xxx does not exist on type 'typeof BuildProfile'”

**问题场景一：**

编译时未出现异常，但编译构建失败，提示“Property xxx does not exist on type 'typeof BuildProfile'”，使用了自定义参数BuildProfile。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/55/v3/erQOZUTQQe-o2erLtXQdIA/zh-cn_image_0000002194158752.png?HW-CC-KV=V1&HW-CC-Date=20260313T053639Z&HW-CC-Expire=86400&HW-CC-Sign=89672970D1786D1A037A45D4947092FB4A33CC0B2EBDBFE6B733C7BAB1E03F56 "点击放大")

**解决方案：**

检查当前模块下build-profile.json5文件中的targets > buildProfileFields配置的自定义参数的key值是否一致。如果不一致，请将 targets内所有buildProfileFields的key值统一。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f9/v3/xUegQCqMQZytiWM_1XhmEA/zh-cn_image_0000002229604129.png?HW-CC-KV=V1&HW-CC-Date=20260313T053639Z&HW-CC-Expire=86400&HW-CC-Sign=0E86DB53007E2226354BC175BC1FC676C0A2C204BCDF6E81086EEEFC28C95F4E)

**问题场景二：**

HSP模块对外提供的接口中使用了HAP未定义的自定义参数buildProfileFields，导致编译失败，提示“Property 'XX' does not exist on type 'typeof BuildProfile'”。

**解决方案：**

解决该问题的两种方法：

1\. 在HAP中配置与HSP相同的自定义参数BuildProfileFields。

2\. 将与HSP相同的自定义参数buildProfileFields配置到工程级 build-profile.json5 中，这会使HSP中的自定义参数在全局生效。

**问题场景三：**

编译时标红，原因是使用了自定义参数BuildProfile，编译器提示“Property xxx does not exist on type 'typeof BuildProfile'”，导致构建失败。

**解决方案：**

请检查当前模块下的build-profile.json5文件中buildProfileFields内是否已添加所使用的自定义参数，确保该参数已配置在buildProfileFields内。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-69*