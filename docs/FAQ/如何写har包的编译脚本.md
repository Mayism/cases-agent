---
title: 如何写har包的编译脚本
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-64
category: FAQ
updated_at: 2026-03-13T05:36:24.089Z
---

# 如何写har包的编译脚本

在har包目录下的hvigorfile.ts文件中编写代码如下：

```typescript
import { harTasks } from '@ohos/hvigor-ohos-plugin';
function harTask(): HvigorPlugin {
    return {
        pluginId: 'harTask',
        apply(node: HvigorNode) {
            console.log('hello harTasks!');
        }
    }
}
export default {
    system: harTasks,
    plugins: [harTask()]
}
```

[hvigorfile.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/CompilingAndBuilding/library/hvigorfile.ts#L3-L20)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-64*