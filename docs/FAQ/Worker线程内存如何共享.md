---
title: Worker线程内存如何共享
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-66
category: FAQ
updated_at: 2026-03-13T03:15:18.407Z
---

# Worker线程内存如何共享

Worker底层采用Actor模型，线程间隔离，内存不共享。要实现内存共享，可以传输SharedArrayBuffer对象。

在使用SharedArrayBuffer对象存储数据时，需要通过原子操作确保同步性，即下一个操作必须在上一个操作完成后开始。

参考代码如下：

1.在Index.ets中创建两个ThreadWorker。

```typescript
import { worker } from '@kit.ArkTS';
@Component
export struct ThreadWorkerView {
  build() {
    Column() {
      Button('测试Worker线程内存共享')
        .width(200)
        .onClick(() => {
          let sab = new SharedArrayBuffer(32);
          let i32a = new Int32Array(sab);
          i32a[0] = 0;
          let producer = new worker.ThreadWorker("entry/ets/pages/ThreadWorkerSharedArrayBuffer/WorkerProducer.ets");
          producer.postMessage(sab);
          let consumer = new worker.ThreadWorker("entry/ets/pages/ThreadWorkerSharedArrayBuffer/WorkerConsumer.ets");
          consumer.postMessage(sab);
        })
    }
  }
}
```

[ShareWorkerThreadMemory.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/ShareWorkerThreadMemory.ets#L21-L40)

2.在build-profile.json5的buildOption中添加字段。

```json
"buildOption": {
  "sourceOption": {
    "workers": [
      "./src/main/ets/pages/ThreadWorkerSharedArrayBuffer/WorkerProducer.ets",
      "./src/main/ets/pages/ThreadWorkerSharedArrayBuffer/WorkerConsumer.ets"
    ]
  }
},
```

[ShareWorkerThreadMemory.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/ShareWorkerThreadMemory.json5#L9-L16)

3.编写worker\_producer.ets脚本。

```typescript
import { MessageEvents, worker } from '@kit.ArkTS';
const workerPort = worker.workerPort;
workerPort.onmessage = (e: MessageEvents): void => {
  let i32a = new Int32Array(e.data);
  console.info("Worker Producer: received sab");
  setInterval(() => {
    let length = i32a.length;
    for (let i = 1; i < length; i++) {
      i32a[i] = Math.random() * length;
    }
    Atomics.notify(i32a, 0, 1); // notify customer
  }, 2000);
}
```

[Worker\_producer.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/Worker_producer.ets#L21-L34)

4.编写worker\_consumer.ets脚本。

```typescript
import { MessageEvents, worker } from '@kit.ArkTS';
const workerPort = worker.workerPort;
workerPort.onmessage = (e: MessageEvents): void => {
  let i32a = new Int32Array(e.data);
  console.info("Worker Customer: received sab");
  while (true) {
    Atomics.wait(i32a, 0, 0);
    let length = i32a.length;
    for (let i = length - 1; i > 0; i--) {
      console.info("arraybuffer " + i + " value is " + i32a[i]);
      i32a[i] = i;
    }
  }
}
```

[Worker\_consumer.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/Worker_consumer.ets#L21-L35)

**参考链接**

[@ohos.worker (启动一个Worker)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-worker)

[多线程并发概述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/multi-thread-concurrency-overview)

[Actor模型](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/multi-thread-concurrency-overview#actor模型)

[内存共享模型](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/multi-thread-concurrency-overview#内存共享模型)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-66*