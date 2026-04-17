---
title: Profiler录制Launch，详情中Load ETS Files和TOP Redundant页签无数据
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-8
category: FAQ
updated_at: 2026-03-13T06:00:55.205Z
---

# Profiler录制Launch，详情中Load ETS Files和TOP Redundant页签无数据

**问题现象**

Profiler录制Launch，将ETS文件监控时长配置为20000，录制成功后，详情中Load ETS Files和TOP Redundant页签无数据。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9c/v3/zNgj7SaQQCalmbBeh4aG5g/zh-cn_image_0000002314311052.png?HW-CC-KV=V1&HW-CC-Date=20260313T060050Z&HW-CC-Expire=86400&HW-CC-Sign=EA0831166F5C5792D63D8FF1723B544F7B9AA2DB277498BC225D1F4C31101EBC "点击放大")

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e1/v3/Lv11ZpK5TWmOIYWZFZ78wA/zh-cn_image_0000002314151220.png?HW-CC-KV=V1&HW-CC-Date=20260313T060050Z&HW-CC-Expire=86400&HW-CC-Sign=054E448CDBE2667431E3CC92F2A824CB1A15A3458FEAD7BFA0F38B6D192E1340 "点击放大")

**问题原因**

ETS文件监控时长配置为20000，需要在拉起应用20000ms之后，才能生成对应的ETS冗余打点文件。

**解决措施**

将ETS文件监控时长配置为20000后，录制时长一定要大于配置时长。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-8*