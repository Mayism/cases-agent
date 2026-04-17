---
title: 如何通过代码获取Hap包的打包时间
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-70
category: FAQ
updated_at: 2026-03-13T02:47:21.053Z
---

# 如何通过代码获取Hap包的打包时间

通过hvigor构建脚本实现，打包时将时间写入到一个Json文件，保存到rawfile目录下，然后在APP中直接读取这个文件的内容即可。hvigorfile.ts文件内容：

```typescript
import { appTasks } from '@ohos/hvigor-ohos-plugin';
import { hvigor } from '@ohos/hvigor';
import * as fs from 'fs';
import * as path from 'path';
// Callback function after node evaluation
hvigor.afterNodeEvaluate((hvigorNode) => {
  // Ensure this directory exists
  const resourcesDir = path.join(__dirname, 'entry/src/main/resources/rawfile');
  if (!fs.existsSync(resourcesDir)) {
    fs.mkdirSync(resourcesDir, { recursive: true });
  }
  // Write the build time into the JSON file
  const now = new Date();
  const buildTime = now.getFullYear() + '-'
    + String(now.getMonth() + 1).padStart(2, '0') + '-'
    + String(now.getDate()).padStart(2, '0') + ' '
    + String(now.getHours()).padStart(2, '0') + ':'
    + String(now.getMinutes()).padStart(2, '0') + ':'
    + String(now.getSeconds()).padStart(2, '0');
  const buildInfo = { 'buildTime': buildTime };
  fs.writeFileSync(
    path.join(resourcesDir, 'build_info.json'),
    JSON.stringify(buildInfo, null, 2)
  );
})
export default {
  system: appTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [] /* Custom plugin to extend the functionality of Hvigor. */
}
```

[hvigorfile.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/PackageStructureKit/hvigorfile.ts#L17-L48)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-70*