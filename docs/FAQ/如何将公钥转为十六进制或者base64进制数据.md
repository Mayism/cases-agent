---
title: 如何将公钥转为十六进制或者base64进制数据
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-crypto-architecture-18
category: FAQ
updated_at: 2026-03-13T04:51:08.431Z
---

# 如何将公钥转为十六进制或者base64进制数据

公钥转为十六进制或Base64编码数据，参考代码如下：

```typescript
import { buffer, util } from '@kit.ArkTS';
@Entry
@Component
struct PubKeysConvert {
  build() {
    Column(){
      Button('公钥转十六进制').onClick(() => {
        let pubKeyData = '公钥'
        let res = buffer.from(pubKeyData).toString('hex')
        console.info('公钥转十六进制',res)
      })
      Button('公钥转base64').onClick(() => {
        let pubKeyUint8Array = new Uint8Array(buffer.from('公钥','utf-8').buffer)
        let res = new util.Base64Helper().encodeToStringSync(pubKeyUint8Array)
        console.info('公钥转base64',res)
      })
    }
  }
}
```

[PubKeysConvert.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CryptoArchitectureKit/entry/src/main/ets/pages/PubKeysConvert.ets#L21-L40)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-crypto-architecture-18*