---
title: 构建报错“proxy data is duplicated”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-112
category: FAQ
updated_at: 2026-03-13T05:40:29.606Z
---

# 构建报错“proxy data is duplicated”

**问题现象**

打包APP时，出现“uri datashareproxy://bundleName/\*\* in proxy data is duplicated”的提示。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/96/v3/J6TjUenfTyKGfQKGm1UZvQ/zh-cn_image_0000002229758777.png?HW-CC-KV=V1&HW-CC-Date=20260313T054024Z&HW-CC-Expire=86400&HW-CC-Sign=92D4628AC6F98DA4B4B8280D909698177693747CCF3325DAF0B7120E658E02D1)

**解决措施**

proxyData 标识模块提供的数据代理列表，仅允许 entry 和 feature 配置，不同 proxyData 中配置的 URI 不得重复。遇到此问题，检查模块间是否配置了相同的 URI。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a0/v3/9cw3naO6RJGNg6b9o88CPw/zh-cn_image_0000002194158904.png?HW-CC-KV=V1&HW-CC-Date=20260313T054024Z&HW-CC-Expire=86400&HW-CC-Sign=AF3B468502D0E381D19773ADEB7CE7AB01E61556E6C6EB4DA807748B4C12A3AB)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-112*