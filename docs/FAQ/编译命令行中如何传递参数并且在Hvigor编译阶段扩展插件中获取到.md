---
title: 编译命令行中如何传递参数并且在Hvigor编译阶段扩展插件中获取到
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-79
category: FAQ
updated_at: 2026-03-13T05:37:35.592Z
---

# 编译命令行中如何传递参数并且在Hvigor编译阶段扩展插件中获取到

使用hvigor命令：

```shell
 > hvigorw -s -p key1=value2222
```

获取自定义参数代码：

```typescript
// hvigorfile.ts
import { harTasks } from '@ohos/hvigor-ohos-plugin';
import { hvigor } from '@ohos/hvigor';
export default {
    system: harTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[]         /* Custom plugin to extend the functionality of Hvigor. */
}
console.log('value===', hvigor.getParameter().getExtParam('key1'));
```

[hvigorfile.ts](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/library1/hvigorfile.ts#L3-L11)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-79*