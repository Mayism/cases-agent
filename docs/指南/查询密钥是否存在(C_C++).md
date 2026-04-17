---
title: 查询密钥是否存在(C/C++)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-check-key-ndk
category: 指南
updated_at: 2026-03-12T13:18:37.525Z
---

# 查询密钥是否存在(C/C++)

HUKS提供了接口供应用查询指定密钥是否存在。

## 在CMake脚本中链接相关动态库

```plaintext
target_link_libraries(entry PUBLIC libhuks_ndk.z.so)
```

## 开发步骤

1.  指定密钥别名，密钥别名命名规范参考[密钥生成介绍及算法规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-key-generation-overview)。
    
2.  初始化密钥属性集。用于查询时指定密钥的属性，查询单个密钥或者非群组密钥，可传空。
    
3.  调用接口[OH\_Huks\_IsKeyItemExist](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-huks-api-h#oh_huks_iskeyitemexist)，查询密钥是否存在。
    

```cpp
#include "huks/native_huks_api.h"
#include "huks/native_huks_param.h"
#include "napi/native_api.h"
#include <cstring>
OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param *params,
                            uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    return ret;
}
struct OH_Huks_Param g_testGenerateKeyParam[] = {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
                                                 {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
                                                 {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
                                                 {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE}};
/* 1.生成密钥 */
static OH_Huks_Result GenerateKeyHelper(const char *alias)
{
    struct OH_Huks_Blob aliasBlob = {.size = (uint32_t)strlen(alias), .data = (uint8_t *)alias};
    struct OH_Huks_ParamSet *testGenerateKeyParamSet = nullptr;
    struct OH_Huks_Result ohResult;
    do {
        ohResult = InitParamSet(&testGenerateKeyParamSet, g_testGenerateKeyParam,
                                sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
        if (ohResult.errorCode != OH_HUKS_SUCCESS) {
            break;
        }
        ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, testGenerateKeyParamSet, nullptr);
    } while (0);
    OH_Huks_FreeParamSet(&testGenerateKeyParamSet);
    return ohResult;
}
static napi_value IsKeyExist(napi_env env, napi_callback_info info)
{
    const char *alias = "test_key";
    struct OH_Huks_Blob keyAlias = {
        (uint32_t)strlen(alias),
        (uint8_t *)alias
    };
    /* 1.生成密钥 */
    OH_Huks_Result genResult = GenerateKeyHelper(alias);
    if (genResult.errorCode != OH_HUKS_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, genResult.errorCode, &ret);
        return ret;
    }
    /* 2.检查密钥是否存在 */
    struct OH_Huks_Result ohResult = OH_Huks_IsKeyItemExist(&keyAlias, nullptr);
    napi_value ret;
    napi_create_int32(env, ohResult.errorCode, &ret);
    return ret;
}
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/UniversalKeystoreKit/OtherOperations/CheckKeyExists/entry/src/main/cpp/napi_init.cpp#L15-L90)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-check-key-ndk*