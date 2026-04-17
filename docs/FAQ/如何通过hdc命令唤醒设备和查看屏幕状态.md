---
title: 如何通过hdc命令唤醒设备和查看屏幕状态
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-52
category: FAQ
updated_at: 2026-03-13T02:36:16.736Z
---

# 如何通过hdc命令唤醒设备和查看屏幕状态

唤醒设备：hdc shell power-shell wakeup。

查看屏幕状态：hdc shell hidumper -s 3301 -a

查询手机IMEI：首先，进入fastboot模式（hdc target boot bootloader），然后使用fastboot命令查询（fastboot oem get-psid）。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-performance-analysis-kit-52*