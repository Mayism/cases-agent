---
title: 如何设置Task优先级
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-26
category: FAQ
updated_at: 2026-03-13T03:10:52.673Z
---

# 如何设置Task优先级

设置任务优先级，示例如下：

```typescript
import { taskpool } from '@kit.ArkTS';
@Concurrent
function printArgs(args: number): number {
  console.log("printArgs: " + args);
  return args;
}
let task: taskpool.Task = new taskpool.Task(printArgs, 100); // 100: test number
taskpool.execute(task, taskpool.Priority.HIGH).then((res) => {
  console.log("taskpool result is :" + res);
});
```

[SetTaskPriority.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/SetTaskPriority.ets#L21-L32)

-   HIGH：值为0，表示任务是高优先级。
-   MEDIUM：值为1，表示任务是中优先级。
-   LOW：值为2，表示任务是低优先级。

**参考链接**

[Priority](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-taskpool#priority)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-26*