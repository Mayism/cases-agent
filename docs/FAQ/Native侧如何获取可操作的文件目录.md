---
title: Native侧如何获取可操作的文件目录
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-38
category: FAQ
updated_at: 2026-03-13T03:31:05.430Z
---

# Native侧如何获取可操作的文件目录

当前native侧暂无可直接获取文件目录的接口，可以通过ArkTS侧获取相关路径信息，然后传递到native侧使用。

ArkTS侧获取路径信息代码示例：

```typescript
import { common } from '@kit.AbilityKit';
const context = AppStorage.get("context") as UIContext;
let hostContext = context.getHostContext() as common.UIAbilityContext;
let filesDir = hostContext.filesDir;
```

[NativeSideOperableFileDirectory.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/ets/pages/NativeSideOperableFileDirectory.ets#L21-L25)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-38*