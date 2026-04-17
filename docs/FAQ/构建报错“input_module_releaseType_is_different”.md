---
title: 构建报错“input module releaseType is different”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-110
category: FAQ
updated_at: 2026-03-13T05:40:17.639Z
---

# 构建报错“input module releaseType is different”

**问题现象**

在打包APP时，如果提示“input module releaseType is different”，请检查输入模块的发布类型是否一致。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/69/v3/O8rq8ApgTdme3JzP1gJdKg/zh-cn_image_0000002194318432.png?HW-CC-KV=V1&HW-CC-Date=20260313T054011Z&HW-CC-Expire=86400&HW-CC-Sign=F043E5B736497E14A725838577469836C410909D4FAD88BD98AF3CA03DCC2098)

**解决措施**

根据报错日志中的Warning信息提示的模块名称，检查模块间的apiReleaseType字段是否一致。

apiReleaseType字段由编译构建工具自动生成并保存在HAP/HSP包的module.json文件中。请确认各模块间该字段是否一致。如果存在不一致，需使用相同版本的SDK重新打包应用的各个模块，然后重新打包APP。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/88/v3/ufpIJCqdROuWihUmvEDSCA/zh-cn_image_0000002229604205.png?HW-CC-KV=V1&HW-CC-Date=20260313T054011Z&HW-CC-Expire=86400&HW-CC-Sign=F0E204838EADA386A2B10B80BD36D4B4DB38F409265A4B0D490C055AA3FAE324)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-110*