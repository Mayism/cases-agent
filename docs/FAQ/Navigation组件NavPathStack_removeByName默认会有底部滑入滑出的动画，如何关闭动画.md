---
title: Navigation组件NavPathStack removeByName默认会有底部滑入滑出的动画，如何关闭动画
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-438
category: FAQ
updated_at: 2026-03-13T04:19:15.783Z
---

# Navigation组件NavPathStack removeByName默认会有底部滑入滑出的动画，如何关闭动画

开发者可设置NavPathStack上的接口[disableAnimation](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-navigation#disableanimation11)为true来关闭路由的跳转动画，disableAnimation同时控制removeByName等路由操作的动画开关。示例代码如下：

```typescript
this.pageStack.disableAnimation(true);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-438*