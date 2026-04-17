---
title: 如何实现类似Java中的反射方法调用能力
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-62
category: FAQ
updated_at: 2026-03-13T03:00:31.943Z
---

# 如何实现类似Java中的反射方法调用能力

可以通过[动态import](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-dynamic-import#动态import实现方案介绍)的方式实现类似反射能力，具体实现可参考以下代码。

```typescript
import('./module').then(
  module => {
    const t = module.DataTable.tagName();
  });
```

[DynamicImport.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/DynamicImport.ets#L21-L24)

```typescript
export class DataTable {
  constructor() {
  }
  static tagName(){
    return 'data-table'
  }
}
```

[module.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/module.ets#L21-L27)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-62*