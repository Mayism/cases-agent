---
title: 如何将类Java语言的线程模型（内存共享）的实现方式转换成在ArkTS的线程模型下（内存隔离）的实现方式
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-46
category: FAQ
updated_at: 2026-03-13T02:59:13.924Z
---

# 如何将类Java语言的线程模型（内存共享）的实现方式转换成在ArkTS的线程模型下（内存隔离）的实现方式

可以利用TaskPool接口转换，具体分为以下五个场景：

-   场景一：主线程将独立任务放到子线程执行。代码示例：
    
    共享内存写法：
    
    ```typescript
    class Task {
      static run(args) {
        // Do some independent tasks
      }
    }
    let thread = new Thread(() => {
      let result = Task.run(args)
      // deal with result
    })
    ```
    
    [TaskPool.txt](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/utils/TaskPool.txt#L21-L29)
    
    ArkTS写法：
    
    ```typescript
    import { taskpool } from '@kit.ArkTS';
    @Concurrent
    function run(args: number) {
      // Do some independent tasks
    }
    let task: taskpool.Task = new taskpool.Task(run, 100); // 100: test number
    taskpool.execute(task).then((res) => {
      // Return result
    });
    ```
    
    [TaskPoolContrast.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/TaskPoolContrast.ets#L21-L30)
    
-   场景二：主线程在子线程使用类对象实例。代码示例：
    
    共享内存写法：
    
    ```typescript
    class Material {
      action(args) {
        // Do some independent tasks
      }
    }
    let material = new Material()
    let thread = new Thread(() => {
      let result = material.action(args)
      // deal with result
    })
    ```
    
    [TaskPool.txt](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/utils/TaskPool.txt#L33-L42)
    
    ArkTS写法：
    
    ```typescript
    import { taskpool } from '@kit.ArkTS';
    @Concurrent
    function runner(material: Material): void {
      return material.action(100); // 100: test number
    }
    @Sendable
    class Material {
      action(args: number) {
        // Do some independent tasks
      }
    }
    let material = new Material()
    taskpool.execute(runner, material).then((ret) => {
      // Return result
    })
    ```
    
    [TaskPoolContrast2.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/TaskPoolContrast2.ets#L21-L36)
    
-   场景三：子线程更新主线程状态。代码示例：
    
    共享内存写法：
    
    ```typescript
    class Task {
        run(args) {
            // deal with result
            runOnUiThread(() => {
                UpdateUI(result)
            })
        }
    }
    let task = new Task()
    let thread = new Thread(() => {
        let result = task.run(args)
        // Processing results
    })
    ```
    
    [TaskPool.txt](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/utils/TaskPool.txt#L46-L58)
    
    ArkTS写法：
    
    ```typescript
    import taskpool from '@ohos.taskpool'
    // let result: Object[] | undefined = undefined
    @Concurrent
    function runner(task:Task) {
      task.run()
    }
    @Sendable
    class Task {
      run(args?: Object[] | undefined) {
        // Do some independent tasks
        taskpool.Task.sendData(JsResult)
      }
    }
    let task = new Task()
    let run = new taskpool.Task(runner, task)
    run.onReceiveData((result?: Function | undefined) => {
      UpdateUI(result)
    })
    taskpool.execute(run).then((ret) => {
      // Return result
    })
    ```
    
    [TaskPoolContrast3.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/TaskPoolContrast3.ets#L21-L43)
    
-   场景四：子线程同步调用主线程接口。代码示例：
    
    ```typescript
    class SdkU3d {
        static getInst() {
            return SdkMgr.getInst();
        }
        getPropStr(str: string) {
            return xx;
        }
    }
    let thread = new Thread(() => {
        // In the game thread
        let sdk = SdkU3d.getInst()
        let ret = sdk.getPropStr("xx")
    })
    ```
    
    [TaskPool.txt](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/utils/TaskPool.txt#L62-L74)
    
    ArkTS写法：
    
    ```typescript
    import { MessageEvents, taskpool, worker } from '@kit.ArkTS';
    class SdkU3d {
      static getInst(): Object {
        return SdkMgr.getInst();
      }
      getPropStr(str: string) { }
    }
    let workerInstance = new worker.ThreadWorker("xx/worker.ts");
    workerInstance.registerGlobalCallObject("instance_xx", SdkU3d.getInst());
    workerInstance.postMessage("start");
    // In the game worker thread
    const mainPort = worker.workerPort;
    mainPort.onmessage = (e: MessageEvents): void => {
      let ret = mainPort.callGlobalCallObjectMethod("instance_xx", "getPropStr", 100); // 100: test number
    }
    ```
    
    [TaskPoolContrast4.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/TaskPoolContrast4.ets#L21-L35)
    

**参考链接**

[并发概述](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/concurrency-overview)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-46*