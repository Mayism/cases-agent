---
title: 如何在Worker中开启多级子线程
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-121
category: FAQ
updated_at: 2026-03-13T03:15:55.741Z
---

# 如何在Worker中开启多级子线程

在Worker中开启多级子线程，具体可参考如下示例代码：

```typescript
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';
const workerInstance = new worker.ThreadWorker('entry/ets/pages/Worker.ets');
// The main thread passes information to the worker thread
workerInstance.postMessage('123');
// The main thread receives worker thread information
workerInstance.onmessage = (e: MessageEvents): void => {
  // Data: Information sent by the Worker thread
  let data: string = e.data;
  console.info(`main thread onmessage, data:${data}`);
  const workerInstance1 = new worker.ThreadWorker('entry/ets/pages/Work.ets');
  workerInstance1.postMessage('123');
  workerInstance1.onmessage = (e: MessageEvents): void => {
    // data：Information sent by worker threads
    let data1: string = e.data;
    console.info(`main thread onmessage1, data:${data1}`);
    // Destroy Worker object
    workerInstance1.terminate();
  }
  // After calling terminate, execute onexit
  workerInstance1.onexit = (code) => {
    console.info(`main thread terminate, code:${code}`);
  }
  // Destroy Worker object
  workerInstance.terminate();
}
// After calling terminate, execute onexit
workerInstance.onexit = (code) => {
  console.info(`main thread terminate, code:${code}`);
}
workerInstance.onerror = (err: ErrorEvent) => {
  console.error('main error message ' + err.message);
}
```

[EnableSubThreadInWorker.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/EnableSubThreadInWorker.ets#L21-L57)

```typescript
// Work.ets & Worker.ets
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';
// Create an object in the worker thread that communicates with the main thread
const workerPort = worker.workerPort;
// The worker thread receives information from the main thread
workerPort.onmessage = (e: MessageEvents): void => {
  // Data: Information sent by the main thread
  let data: string = e.data;
  console.info(`Work.ets onmessage: data ${data}`);
  // Worker thread sends information to main thread
  workerPort.postMessage('123');
}
// Callback for worker thread error
workerPort.onerror = (err: ErrorEvent) => {
  console.info('worker.ets onerror' + err.message);
}
```

[EnableSubThreadInWorker2.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/EnableSubThreadInWorker2.ets#L21-L40)

```json
"buildOption": {
  "sourceOption": {
    "workers": [
      "./src/main/ets/pages/Worker.ets",
      "./src/main/ets/pages/Work.ets"
    ]
  }
},
```

[EnableSubThreadInWork.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/EnableSubThreadInWork.json5#L9-L16)

**参考链接**

[@ohos.worker (启动一个Worker)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-worker)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-121*