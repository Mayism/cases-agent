---
title: 如何确认延迟任务WorkSchedulerExtensionAbility回调方法onWorkStart、onWorkStop实现是否正确、是否可以成功回调
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-background-tasks-8
category: FAQ
updated_at: 2026-03-13T02:56:05.371Z
---

# 如何确认延迟任务WorkSchedulerExtensionAbility回调方法onWorkStart、onWorkStop实现是否正确、是否可以成功回调

延迟任务申请成功之后，需要等到条件满足后才可以执行延迟任务回调，为了快速验证延迟任务回调功能是否正确，可以通过以下hidumper命令手动触发延迟任务执行回调。

```bash
hdc shell hidumper -s 1904 -a '-t com.hmos.workschedulerdemo MyWorkSchedulerExtensionAbility'
```

com.hmos.workschedulerdemo、MyWorkSchedulerExtensionAbility需要替换为需要查询应用的bundleName和abilityName。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ce/v3/HV0G_Q-iS6OjUjCMX2_8FQ/zh-cn_image_0000002194317960.png?HW-CC-KV=V1&HW-CC-Date=20260313T025600Z&HW-CC-Expire=86400&HW-CC-Sign=5C3898F16BA204936AEDF4E8DD3339F157B3C3EC2F3B69D8C46ACD3F80959323 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-background-tasks-8*