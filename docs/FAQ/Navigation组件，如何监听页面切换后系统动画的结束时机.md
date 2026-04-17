---
title: Navigation组件，如何监听页面切换后系统动画的结束时机
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-410
category: FAQ
updated_at: 2026-03-13T04:16:56.078Z
---

# Navigation组件，如何监听页面切换后系统动画的结束时机

**问题描述**

业务需要在Navigation的pop动画结束时进行操作，Navigation是否有对应的动画结束时机。

**解决措施**

Navigation进行pop操作时，退场页面会在动画结束时执行onDisappear生命周期，开发者可以在onDisappear()中进行逻辑处理。

**参考链接**

[页面生命周期](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-navigation-navigation#页面生命周期)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-410*