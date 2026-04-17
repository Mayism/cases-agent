---
title: 如何在构建任务中执行shell脚本
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-104
category: FAQ
updated_at: 2026-03-13T05:39:35.191Z
---

# 如何在构建任务中执行shell脚本

在hvigorfile.ts文件中执行如下示例：

```typescript
import { harTasks } from '@ohos/hvigor-ohos-plugin';
import { exec } from 'node:child_process';
import util from 'node:util';
const scriptPath = 'xxxx.bat';
export function customPluginFunction1(str?: string) {
  return {
    pluginId: 'CustomPluginID1',
    apply(pluginContext) {
      pluginContext.registerTask({
       // Write a custom task
        name: 'customTask1',
        run: (taskContext) => {
          console.log('run into: ');
          const execPromise = util.promisify(exec)
          execPromise(scriptPath).then(res => {
            console.log(res, 'res');
          }).catch(err => {
            console.log(err, 'err');
          })
        },
        // Confirm custom task insertion position
        dependencies: ['default@BuildJS'],
        postDependencies: ['default@CompileArkTS']
      })
    }
  }
}
export default {
  system: harTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [customPluginFunction1()] /* Custom plugin to extend the functionality of Hvigor. */
}
```

[hvigorfile.ts](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/library3/hvigorfile.ts#L3-L36)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-104*