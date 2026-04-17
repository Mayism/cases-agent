---
title: Native调试堆栈可视化功能并行栈视图显示空白
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-56
category: FAQ
updated_at: 2026-03-13T05:59:04.222Z
---

# Native调试堆栈可视化功能并行栈视图显示空白

**问题现象**

使用Native调试堆栈可视化功能时，如果在任意两个页签之间来回切换，可能会遇到并行栈视图界面显示为空白的情况。

**解决措施**

导致该问题的原因可能是电脑GPU不兼容，或在云桌面的场景下使用DevEco Studio。

在DevEco Studio中**双击Shift**，在弹出的窗口中搜索**Registry**，**在Registry**页面中勾选**ide.browser.jcef.gpu.disable**项，关闭窗口并重启DevEco Studio即可。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e9/v3/Us617tj1R5qCOBkkh1nRzQ/zh-cn_image_0000002521308425.png?HW-CC-KV=V1&HW-CC-Date=20260313T055859Z&HW-CC-Expire=86400&HW-CC-Sign=B43B60DF5135A791A8212BEBB940B552A75A49BA64FE9800239B454281FA198A)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-56*