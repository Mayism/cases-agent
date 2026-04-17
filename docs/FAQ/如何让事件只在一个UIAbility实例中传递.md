---
title: 如何让事件只在一个UIAbility实例中传递
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-notification-kit-2
category: FAQ
updated_at: 2026-03-13T05:20:43.340Z
---

# 如何让事件只在一个UIAbility实例中传递

在UIAbility中使用EventHub订阅事件，EventHub模块提供了事件中心，订阅、取消订阅、触发事件的能力。

参考代码如下：

```typescript
import { UIAbility } from '@kit.AbilityKit';
export default class EntryAbility extends UIAbility {
  onForeground() {
    this.context.eventHub.on('myEvent', this.eventFunc);
    // result：
    // eventFunc is called,undefined,undefined
    this.context.eventHub.emit('myEvent');
    // result：
    // eventFunc is called,1,undefined
    this.context.eventHub.emit('myEvent', 1);
    // result：
    // eventFunc is called,1,2
    this.context.eventHub.emit('myEvent', 1, 2);
  }
  eventFunc(argOne: number, argTwo: number) {
    console.log(\`eventFunc is called, ${argOne}, ${argTwo}\`);
  }
}
```

[EntryAbility2.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/Notificationkit/entry/src/main/ets/entryability/EntryAbility2.ets#L6-L25)

**参考链接**

[使用EventHub进行数据通信](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/uiability-data-sync-with-ui#使用eventhub进行数据通信)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-notification-kit-2*