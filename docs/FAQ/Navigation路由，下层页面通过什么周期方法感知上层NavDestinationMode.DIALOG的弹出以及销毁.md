---
title: Navigation路由，下层页面通过什么周期方法感知上层NavDestinationMode.DIALOG的弹出以及销毁
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-407
category: FAQ
updated_at: 2026-03-13T04:16:42.080Z
---

# Navigation路由，下层页面通过什么周期方法感知上层NavDestinationMode.DIALOG的弹出以及销毁

开发者可以使用observer对navDestination的生命周期进行统一管理，可参考：[on('navDestinationUpdate')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-uicontext-uiobserver#onnavdestinationupdate11)。

从API17开始，新增[onActive](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-navdestination#onactive17)、[onInactive](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-navdestination#oninactive17)生命周期，dialog销毁、弹出时会分别触发下层页面的onActive、onInactive生命周期。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-407*