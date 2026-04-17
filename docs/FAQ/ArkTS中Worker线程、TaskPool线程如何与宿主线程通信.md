---
title: ArkTS中Worker线程、TaskPool线程如何与宿主线程通信
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-36
category: FAQ
updated_at: 2026-03-13T03:12:58.587Z
---

# ArkTS中Worker线程、TaskPool线程如何与宿主线程通信

Worker通过PostMessage向父线程发送任务。TaskPool通过sendData向父线程发送消息，触发任务。

PostMessage接口示例如下：

```typescript
import { worker } from '@kit.ArkTS';
const workerInstance = new worker.ThreadWorker("entry/ets/workers/worker.ets");
let buffer = new ArrayBuffer(8);
workerInstance.postMessage(buffer, [buffer]);
```

[CommunicateHostThread.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/CommunicateHostThread.ets#L21-L25)

sendData接口示例如下：

```typescript
import { taskpool } from '@kit.ArkTS';
@Concurrent
function ConcurrentFunc(num: number): number {
  let res: number = num * 10;
  taskpool.Task.sendData(res);
  return num;
}
```

[CommunicateHostThread2.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/CommunicateHostThread2.ets#L21-L28)

**参考链接**

[postMessage](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-worker#postmessage9)，[sendData](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-taskpool#senddata11)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-36*