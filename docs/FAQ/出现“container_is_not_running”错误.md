---
title: 出现“container is not running”错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-4
category: FAQ
updated_at: 2026-03-13T06:02:35.268Z
---

# 出现“container is not running”错误

**问题现象**

在HarmonyOS设备上运行命令“hdc -n shell param set persist.ace.testmode.enabled 1”时，出现错误提示“container is not running”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ce/v3/jxl7fx0FQU2qKPTh1CjAIQ/zh-cn_image_0000002194318268.png?HW-CC-KV=V1&HW-CC-Date=20260313T060228Z&HW-CC-Expire=86400&HW-CC-Sign=6D2FADFAB74B1385BF10AF90A8DBB1E2B5F5A0A441F3B704901C1A2B65F25F96)

**解决措施**

在DevEco Studio中运行一个测试用例，推包到设备上，然后运行命令hdc -n shell param set persist.ace.testmode.enabled 1。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c7/v3/pQOfahbfRSSEBfz5gGScOQ/zh-cn_image_0000002194158644.png?HW-CC-KV=V1&HW-CC-Date=20260313T060228Z&HW-CC-Expire=86400&HW-CC-Sign=AFA8A907D5B640E3CC60D037D3BC42C41A4252FF0817CC207C4081C077F482A7)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-4*