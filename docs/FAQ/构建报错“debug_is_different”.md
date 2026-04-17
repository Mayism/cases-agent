---
title: 构建报错“debug is different”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-111
category: FAQ
updated_at: 2026-03-13T05:40:23.494Z
---

# 构建报错“debug is different”

**问题现象**

打包应用时，提示“debug is different”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9/v3/BvrqUU2kR5WNW-AFhe09eg/zh-cn_image_0000002229758605.png?HW-CC-KV=V1&HW-CC-Date=20260313T054018Z&HW-CC-Expire=86400&HW-CC-Sign=10D49D5F3FE958A6AA031E7D5B14F96ACF417229FF8DD33589393B62747B326B)

**解决措施**

根据报错日志的Warning信息提示的模块名称，检查模块间的debug字段是否一致，重点关注本地模块与外部引用模块。

1.该debug字段由编译构建工具自动生成，保存在HAP/HSP包的module.json文件中，如下图所示，首先确认各模块间该字段是否一致。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6c/v3/P-_vD2l5QiWKsN_jC8gZzA/zh-cn_image_0000002229604117.png?HW-CC-KV=V1&HW-CC-Date=20260313T054018Z&HW-CC-Expire=86400&HW-CC-Sign=852E5C8EF3803D34C1B0EE221993368E66907BD106D099D1C322A20CB7E1CDD9)

2.编译工具根据设置的Build Mode选项生成debug标识，如图所示，可以通过此处进行设置。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6f/v3/_dZY0f1LQLOTmnyRUnh7_w/zh-cn_image_0000002194318344.png?HW-CC-KV=V1&HW-CC-Date=20260313T054018Z&HW-CC-Expire=86400&HW-CC-Sign=88F96E69A1B074022B777E85BC4BB33718648B11936C17A2708D226B5E9A0423)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-111*