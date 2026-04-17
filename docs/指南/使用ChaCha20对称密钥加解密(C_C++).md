---
title: 使用ChaCha20对称密钥加解密(C/C++)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-chacha20-encrypt-decrypt-ndk
category: 指南
updated_at: 2026-03-12T12:28:22.232Z
---

# 使用ChaCha20对称密钥加解密(C/C++)

从API22开始，算法库支持该算法。

对应的算法规格请查看[对称密钥加解密算法规格：ChaCha20](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-sym-encrypt-decrypt-spec#chacha20)。

## 在CMake脚本中链接相关动态库

```plaintext
target_link_libraries(entry PUBLIC libohcrypto.so)
```

## 开发步骤

**创建对象**

调用[OH\_CryptoSymKeyGenerator\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-key-h#oh_cryptosymkeygenerator_create)、[OH\_CryptoSymKeyGenerator\_Generate](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-key-h#oh_cryptosymkeygenerator_generate)，生成密钥算法为ChaCha20的对称密钥（OH\_CryptoSymKey）。

如何生成ChaCha20对称密钥，开发者可参考下文示例，并结合[对称密钥生成和转换规格：ChaCha20](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-sym-key-generation-conversion-spec#chacha20)和[随机生成对称密钥](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-generate-sym-key-randomly-ndk)理解。参考文档与示例可能存在入参差异，请注意区分。

**加密**

1.  调用[OH\_CryptoSymCipher\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_create)，指定字符串参数'ChaCha20'，创建对称密钥类型为ChaCha20的Cipher实例，用于完成加密操作。
    
2.  调用[OH\_CryptoSymCipherParams\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipherparams_create)创建参数对象，调用[OH\_CryptoSymCipherParams\_SetParam](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipherparams_setparam)设置对应的加密参数。
    
3.  调用[OH\_CryptoSymCipher\_Init](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_init)，设置模式为加密（CRYPTO\_ENCRYPT\_MODE），指定加密密钥（OH\_CryptoSymKey）和对应的加密参数（OH\_CryptoSymCipherParams），初始化加密Cipher实例。
    
4.  调用[OH\_CryptoSymCipher\_Update](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_update)，更新数据（明文）。
    
5.  调用[OH\_CryptoSymCipher\_Final](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_final)，获取加密后的数据。
    
    说明
    
    由于已使用update传入数据，此处data传入null。
    
    doFinal输出结果可能为null，在访问具体数据前，需要先判断结果是否为null，避免产生异常。
    
6.  调用[OH\_CryptoSymKeyGenerator\_Destroy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-key-h#oh_cryptosymkeygenerator_destroy)、[OH\_CryptoSymCipher\_Destroy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_destroy)、[OH\_CryptoSymCipherParams\_Destroy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipherparams_destroy)销毁各对象。
    

**解密**

1.  调用[OH\_CryptoSymCipher\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_create)，指定字符串参数'ChaCha20'，创建对称密钥类型为ChaCha20的Cipher实例，用于完成解密操作。
    
2.  调用[OH\_CryptoSymCipher\_Init](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_init)，设置模式为解密（CRYPTO\_DECRYPT\_MODE），指定解密密钥（OH\_CryptoSymKey）和对应的解密参数（OH\_CryptoSymCipherParams），初始化解密Cipher实例。
    
3.  调用[OH\_CryptoSymCipher\_Update](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_update)，更新数据（密文）。
    
4.  调用[OH\_CryptoSymCipher\_Final](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-sym-cipher-h#oh_cryptosymcipher_final)，获取解密后的数据。
    

```cpp
#include <string.h>
#include "CryptoArchitectureKit/crypto_common.h"
#include "CryptoArchitectureKit/crypto_sym_cipher.h"
static OH_Crypto_ErrCode doTestChaCha20()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    Crypto_DataBlob encData = {.data = nullptr, .len = 0};
    Crypto_DataBlob decData = {.data = nullptr, .len = 0};
    char *plainText = const_cast<char *>("this is test!");
    Crypto_DataBlob msgBlob = {.data = (uint8_t *)(plainText), .len = strlen(plainText)};
    uint8_t iv[16] = {1, 2, 4, 12, 3, 4, 2, 3, 3, 2, 0, 4, 3, 1, 0, 10}; // 示例代码iv值，开发者可使用安全随机数生成。
    Crypto_DataBlob ivBlob = {.data = iv, .len = sizeof(iv)};
    // 生成对称密钥。
    OH_Crypto_ErrCode ret;
    ret = OH_CryptoSymKeyGenerator_Create("ChaCha20", &genCtx);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    ret = OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    // 创建参数对象。
    ret = OH_CryptoSymCipherParams_Create(&params);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    // 设置参数。
    ret = OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, &ivBlob);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    // 加密。
    ret = OH_CryptoSymCipher_Create("ChaCha20", &encCtx);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    ret = OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    ret = OH_CryptoSymCipher_Final(encCtx, &msgBlob, &encData);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    // 解密。
    ret = OH_CryptoSymCipher_Create("ChaCha20", &decCtx);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    ret = OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params); // 解密使用的params与加密时相同。
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
    ret = OH_CryptoSymCipher_Final(decCtx, &encData, &decData);
    if (ret != CRYPTO_SUCCESS) {
        goto end;
    }
end:
    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    OH_Crypto_FreeDataBlob(&encData);
    OH_Crypto_FreeDataBlob(&decData);
    return ret;
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-chacha20-encrypt-decrypt-ndk*