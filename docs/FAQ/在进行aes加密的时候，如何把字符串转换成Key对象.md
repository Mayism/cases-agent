---
title: 在进行aes加密的时候，如何把字符串转换成Key对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-crypto-architecture-28
category: FAQ
updated_at: 2026-03-13T04:52:08.889Z
---

# 在进行aes加密的时候，如何把字符串转换成Key对象

可参考如下代码：

```typescript
import { buffer, util } from '@kit.ArkTS';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
@Entry
@Component
struct GetKey {
  // Convert string to byte stream
  stringToUint8Array(str: string) {
    return new Uint8Array(buffer.from(str, 'utf-8').buffer);
  }
  //Import key
  async getKey() {
    let symAlgName = 'AES128';
    let symKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgName);
    let dataUint8Array = this.stringToUint8Array('294A2561FEFDF08D');
    let keyBlob: cryptoFramework.DataBlob = { data: dataUint8Array };
    console.info('keyBlob', JSON.stringify(keyBlob))
    let symKey = await symKeyGenerator.convertKey(keyBlob);
    return symKey;
  }
  build() {
    Column({ space: 10 }) {
      Button('aes加密时,字符串转换成Key对象')
        .onClick(() => {
          this.getKey();
        })
    }
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}
```

[GetKey.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CryptoArchitectureKit/entry/src/main/ets/pages/GetKey.ets#L21-L54)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-crypto-architecture-28*