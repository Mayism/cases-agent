---
title: 如何读取rawfile中的xml文件并转化为string类型
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-localization-3
category: FAQ
updated_at: 2026-03-13T04:39:04.513Z
---

# 如何读取rawfile中的xml文件并转化为string类型

使用resourceManager的getRawFileContent接口获取xml数据。使用util工具函数中的decodeToString接口将数据转化为string类型。

参考代码如下：

```typescript
import { BusinessError } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';
// In the utility class, retrieve the Context from the Entry Ability and save it to AppStore, then use AppStore to retrieve it in the utility class
let context = AppStorage.get("context") as UIContext;
try {
  context.getHostContext()!.resourceManager.getRawFileContent('test.xml', (error, value) => {
    if (error != null) {
      console.log('error is ' + error);
    } else {
      let rawFile = value;
      let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM : true });
      let rawFileString = textDecoder.decodeToString( rawFile , {stream: false});
    }
  });
} catch (error) {
  let code = (error as BusinessError).code;
  let message = (error as BusinessError).message;
  console.error(`callback getRawFileContent failed, error code: ${code}, message: ${message}.`);
}
```

[RawXmlFileToStringParser.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/LocalizationKit/entry/src/main/ets/pages/RawXmlFileToStringParser.ets#L21-L41)

**参考链接**

[getRawFileContent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-resource-manager#getrawfilecontent9)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-localization-3*