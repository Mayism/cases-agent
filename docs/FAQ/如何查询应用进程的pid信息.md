---
title: 如何查询应用进程的pid信息
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-81
category: FAQ
updated_at: 2026-03-13T02:52:13.056Z
---

# 如何查询应用进程的pid信息

可以通过以下两种方式获取：

-   方式一：通过以下命令查询应用进程信息。
    
    执行hdc shell命令，进入设备的命令行。执行“ps -ef”命令，查看所有正在运行的进程信息。
    
-   方式二：通过调用[process](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-process)相关接口查询。
    
    ```typescript
    import { process } from '@kit.ArkTS';
    let pid = process.pid;
    ```
    
    [PidMsg.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AbilityKit/entry/src/main/ets/pages/PidMsg.ets#L5-L7)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-81*