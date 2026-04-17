---
title: 原有工程使用新的DevEco Studio版本打开，运行测试用例失败
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-6
category: FAQ
updated_at: 2026-03-13T06:02:47.251Z
---

# 原有工程使用新的DevEco Studio版本打开，运行测试用例失败

**问题现象**

如果工程是在DevEco Studio 3.1.0.400之前版本创建的，升级DevEco Studio至3.1.0.400及以上版本后，原有工程运行测试用例会失败，并提示“A page configured in 'test\_pages.json' must have one and only one '@Entry' decorator”。

**图1**  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/23/v3/1xscDrMCQhWXyx3TDoDnfA/zh-cn_image_0000002229604113.png?HW-CC-KV=V1&HW-CC-Date=20260313T060242Z&HW-CC-Expire=86400&HW-CC-Sign=B5912631EA98E4E198CEDD1F9F9067E6750916F6EB0FC62F08E3CA1B4737BB19 "点击放大")

**解决措施**

将TestRunner、TestAbility目录改为小写testrunner、testability，再次运行测试用例。

**图2**  
![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ab/v3/GJ1EaUbJR7iVceS4A2JcNg/zh-cn_image_0000002194158732.png?HW-CC-KV=V1&HW-CC-Date=20260313T060242Z&HW-CC-Expire=86400&HW-CC-Sign=F5217FB012A1EE67A7FAAABE478C802B94E3BCF86FF44AC4F14F5472606E6BEF "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-6*