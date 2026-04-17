---
title: 启动DataAbility
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/start-dataability
category: 指南
updated_at: 2026-03-12T03:43:27.360Z
---

# 启动DataAbility

启动DataAbility会获取一个工具接口类对象（DataAbilityHelper）。启动DataAbility的示例代码如下：

```typescript
import featureAbility from '@ohos.ability.featureAbility';
import ability from '@ohos.ability.ability';
let uri: string = 'dataability:///com.samples.famodelabilitydevelop.DataAbility';
let DAHelper: ability.DataAbilityHelper = featureAbility.acquireDataAbilityHelper(uri);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/start-dataability*