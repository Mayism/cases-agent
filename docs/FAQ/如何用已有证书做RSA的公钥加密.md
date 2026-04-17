---
title: 如何用已有证书做RSA的公钥加密
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-crypto-architecture-23
category: FAQ
updated_at: 2026-03-13T04:51:46.479Z
---

# 如何用已有证书做RSA的公钥加密

**问题场景**

使用PEM格式证书中的公钥调用示例中的 \`rsaPubKeyEncrypt()\` 方法时，初始化失败。使用指南中示例的公钥可以成功加密，但加密后的数据转换为字符串后显示为乱码。

**解决措施**

将内容转换为字符串时，可以将其转换为Base64或十六进制。具体转换方法请参考以下代码：

```
function uint8ArrayToHexStr(data: Uint8Array): string {
  let hexString = '';
  let i: number;
  for (i = 0; i < data.length; i++) {
    let char = ('00' + data\[i\].toString(16)).slice(-2);
    hexString += char;
  }
  return hexString;
}
```

[RsaPubKeyEncrypt.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/e56d79f92d56df249533f4b232cf5ad4ac1655f0/CryptoArchitectureKit/entry/src/main/ets/pages/RsaPubKeyEncrypt.ets#L53-L61)

参考如下代码内容，使用正确的证书数据进行处理。

```typescript
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
async function rsaPubKeyEncrypt(pubKey: cryptoFramework.PubKey, plainText: cryptoFramework.DataBlob) {
  try {
    let asyKeyGenerator = cryptoFramework.createAsyKeyGenerator('RSA1024');
    let keyGenPromise: cryptoFramework.KeyPair =
      await asyKeyGenerator.convertKey({ data: pubKey.getEncoded().data }, null);
    let cipher = cryptoFramework.createCipher('RSA1024|PKCS1');
    await cipher.init(cryptoFramework.CryptoMode.ENCRYPT\_MODE, keyGenPromise.pubKey, null);
    let encryptData = await cipher.doFinal(plainText);
    return uint8ArrayToHexStr(encryptData.data);
  } catch (err) {
    console.info(err);
    return uint8ArrayToHexStr(new Uint8Array());
  }
}
```

[RsaPubKeyEncrypt.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/e56d79f92d56df249533f4b232cf5ad4ac1655f0/CryptoArchitectureKit/entry/src/main/ets/pages/RsaPubKeyEncrypt.ets#L34-L49)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-crypto-architecture-23*