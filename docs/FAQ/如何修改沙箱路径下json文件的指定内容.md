---
title: 如何修改沙箱路径下json文件的指定内容
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-5
category: FAQ
updated_at: 2026-03-13T04:33:30.111Z
---

# 如何修改沙箱路径下json文件的指定内容

可以通过以下步骤来完成：

```typescript
import { fileIo } from '@kit.CoreFileKit';
// In the utility class, retrieve the Context from the Entry Ability and save it to AppStore, then use AppStore to retrieve it in the utility class
let context = AppStorage.get("context") as UIContext;
let filePath = context.getHostContext()!.filesDir + '/people.json';
class Student {
  name: string = 'zhangsan';
  age: number = 10;
}
let student = new Student();
// 1 Create a file and write its contents
let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
fileIo.writeSync(file.fd, JSON.stringify(student))
fileIo.close(file);
// 2 Read the contents of the JSON file through fileIo.readSync.
let data = fileIo.readTextSync(filePath);
let obj: Student = JSON.parse(data);
// 3 Change the specified content name to lisi
obj.name = 'lisi';
// 4 Rewrite JSON file
let fileModify = fileIo.openSync(filePath, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
fileIo.writeSync(fileModify.fd, JSON.stringify(obj));
fileIo.close(fileModify);
// 5 Read the latest content
let content = fileIo.readTextSync(filePath);
console.info(`ModifySanFileContent content is :${content}`);
```

[UpdateSandboxJson.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CoreFileKit/entry/src/main/ets/pages/UpdateSandboxJson.ets#L21-L48)

**参考链接**

[文件管理](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-file-fs)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-local-file-manager-5*