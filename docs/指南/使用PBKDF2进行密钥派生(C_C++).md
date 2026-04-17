---
title: 使用PBKDF2进行密钥派生(C/C++)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-key-derivation-using-pbkdf2-ndk
category: 指南
updated_at: 2026-03-12T12:36:31.294Z
---

# 使用PBKDF2进行密钥派生(C/C++)

对应的算法规格请查看[密钥派生算法规格：PBKDF2](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-key-derivation-overview#pbkdf2算法)。

## 开发步骤

1.  调用[OH\_CryptoKdfParams\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-kdf-h#oh_cryptokdfparams_create)，指定字符串参数'PBKDF2'，创建密钥派生参数对象。
    
2.  调用[OH\_CryptoKdfParams\_SetParam](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-kdf-h#oh_cryptokdfparams_setparam)，设置PBKDF2所需的参数。示例如下：
    
    -   CRYPTO\_KDF\_KEY\_DATABLOB：用于生成派生密钥的原始密码。
    -   CRYPTO\_KDF\_SALT\_DATABLOB：盐值。
    -   CRYPTO\_KDF\_ITER\_COUNT\_INT：重复运算的次数，需要为正整数。
3.  调用[OH\_CryptoKdf\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-kdf-h#oh_cryptokdf_create)，指定字符串参数'PBKDF2|SHA256'，创建密钥派生函数对象。
    
4.  调用[OH\_CryptoKdf\_Derive](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-crypto-kdf-h#oh_cryptokdf_derive)，指定目标密钥的字节长度，进行密钥派生。
    

```cpp
#include "CryptoArchitectureKit/crypto_architecture_kit.h"
#include <stdio.h>
#include <string.h>
static OH_Crypto_ErrCode doTestPbkdf2()
{
    // 创建PBKDF2参数对象。
    OH_CryptoKdfParams *params = nullptr;
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_Create("PBKDF2", &params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    // 设置密码。
    const char *password = "123456";
    Crypto_DataBlob passwordBlob = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(password)),
        .len = strlen(password)
    };
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_KEY_DATABLOB, &passwordBlob);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(params);
        return ret;
    }
    // 设置盐值。
    const char *salt = "saltstring";
    Crypto_DataBlob saltBlob = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(salt)),
        .len = strlen(salt)
    };
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SALT_DATABLOB, &saltBlob);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(params);
        return ret;
    }
    // 设置迭代次数。
    int iterations = 10000;
    Crypto_DataBlob iterationsBlob = {
        .data = reinterpret_cast<uint8_t *>(&iterations),
        .len = sizeof(int)
    };
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_ITER_COUNT_INT, &iterationsBlob);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(params);
        return ret;
    }
    // 创建密钥派生函数对象。
    OH_CryptoKdf *kdfCtx = nullptr;
    ret = OH_CryptoKdf_Create("PBKDF2|SHA256", &kdfCtx);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(params);
        return ret;
    }
    // 派生密钥。
    Crypto_DataBlob out = {0};
    uint32_t keyLength = 32; // 生成32字节的密钥。
    ret = OH_CryptoKdf_Derive(kdfCtx, params, keyLength, &out);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdf_Destroy(kdfCtx);
        OH_CryptoKdfParams_Destroy(params);
        return ret;
    }
    printf("Derived key length: %u\n", out.len);
    // 清理资源。
    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoKdf_Destroy(kdfCtx);
    OH_CryptoKdfParams_Destroy(params);
    return CRYPTO_SUCCESS;
}
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/crypto-key-derivation-using-pbkdf2-ndk*