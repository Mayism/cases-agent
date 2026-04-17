---
title: 如何获取指定bundleFlags的Ability信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-72
category: FAQ
updated_at: 2026-03-13T02:51:12.229Z
---

# 如何获取指定bundleFlags的Ability信息

bundleManager.getBundleInfoForSelf :getBundleInfoForSelf(bundleFlags: number): Promise<BundleInfo>;

根据给定的bundleFlags，异步获取当前应用的BundleInfo，返回结果使用Promise形式。参考示例代码如下：

```typescript
// Get appInfo with metadataArray information
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
try {
  bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
    hilog.info(0x0000, 'testTag', 'getBundleInfoForSelf successfully. Data: %{public}s', JSON.stringify(data));
  }).catch((err: BusinessError) => {
    hilog.error(0x0000, 'testTag', 'getBundleInfoForSelf failed. Cause: %{public}s', err.message);
  });
} catch (err) {
  let message = (err as BusinessError).message;
  hilog.error(0x0000, 'testTag', 'getBundleInfoForSelf failed: %{public}s', message);
}
```

[BundleFlags.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AbilityKit/entry/src/main/ets/pages/BundleFlags.ets#L21-L36)

**参考链接**

[bundleManager.getBundleInfoForSelf](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-bundlemanager#bundlemanagergetbundleinfoforself)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-72*