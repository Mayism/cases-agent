---
title: Profiler窗口无法加载
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-6
category: FAQ
updated_at: 2026-03-13T06:00:43.208Z
---

# Profiler窗口无法加载

**问题现象**

Profiler窗口提示“There is already a Profiler running.”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/19/v3/TuVpF0WETOis-qnMlUnY7A/zh-cn_image_0000002273437384.png?HW-CC-KV=V1&HW-CC-Date=20260313T060038Z&HW-CC-Expire=86400&HW-CC-Sign=7A41956945C4B380A11B85E8ABCFFF88F6E50F98C76034164ECE20B86C82B831 "点击放大")

**问题原因**

Profiler仅支持单例模式，即同时打开多个DevEco Studio只支持运行一个Profiler。

**解决措施**

-   关闭当前的DevEco Studio，使用能够正常展示Profiler界面的DevEco Studio。
    
-   关闭其他的DevEco Studio，然后点击当前DevEco Studio中“There is already a Profiler running.”提示，等待Profiler界面重新刷新。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-profiler-6*