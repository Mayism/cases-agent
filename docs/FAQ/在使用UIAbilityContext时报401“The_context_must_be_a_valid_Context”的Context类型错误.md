---
title: 在使用UIAbilityContext时报401“The context must be a valid Context”的Context类型错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-76
category: FAQ
updated_at: 2026-03-13T02:51:40.803Z
---

# 在使用UIAbilityContext时报401“The context must be a valid Context”的Context类型错误

401错误表示上下文无效，需要使用UIAbility的上下文。获取[UIAbilityContext](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-inner-application-uiabilitycontext)的方式如下：

```typescript
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    let uiAbilityContext = this.context;
    // ...
  }
}
```

[GetUIAbilityContext.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AbilityKit/entry/src/main/ets/pages/GetUIAbilityContext.ets#L21-L28)

**参考链接**

[应用上下文Context](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-context-stage)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-76*