---
title: 查询密钥别名集(C/C++)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-list-aliases-ndk
category: 指南
updated_at: 2026-03-12T13:27:40.759Z
---

# 查询密钥别名集(C/C++)

HUKS提供了接口供应用查询密钥别名集。

说明

轻量级智能穿戴不支持查询密钥别名集功能。

## 在CMake脚本中链接相关动态库

```plaintext
target_link_libraries(entry PUBLIC libhuks_ndk.z.so)
```

## 开发步骤

1.  初始化密钥属性集。用于查询指定密钥别名集TAG，TAG仅支持[OH\_HUKS\_TAG\_AUTH\_STORAGE\_LEVEL](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-huks-type-h#oh_huks_tag)。
    
2.  调用接口[OH\_Huks\_ListAliases](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-huks-api-h#oh_huks_listaliases)，查询密钥别名集。
    

```cpp
/* 以下查询密钥别名集为例 */
#include "huks/native_huks_api.h"
#include "huks/native_huks_param.h"
#include "napi/native_api.h"
#include <string.h>
OH_Huks_Result InitParamSet(
   struct OH_Huks_ParamSet **paramSet,
   const struct OH_Huks_Param *params,
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
struct OH_Huks_Param g_testQueryParam[] = {
   {
       .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL,
       .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE
   },
};
static napi_value ListAliases(napi_env env, napi_callback_info info)
{
   struct OH_Huks_ParamSet *testQueryParamSet = nullptr;
   struct OH_Huks_KeyAliasSet *outData = nullptr;
   struct OH_Huks_Result ohResult;
   do {
       /* 1.初始化密钥属性集 */
       ohResult = InitParamSet(&testQueryParamSet, g_testQueryParam,
           sizeof(g_testQueryParam) / sizeof(OH_Huks_Param));
       if (ohResult.errorCode != OH_HUKS_SUCCESS) {
           break;
       }
       /* 2.查询密钥别名集 */
       ohResult = OH_Huks_ListAliases(testQueryParamSet, &outData);
   } while (0);
   OH_Huks_FreeParamSet(&testQueryParamSet);
   OH_Huks_FreeKeyAliasSet(outData);
   napi_value ret;
   napi_create_int32(env, ohResult.errorCode, &ret);
   return ret;
}
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/UniversalKeystoreKit/OtherOperations/QueryKeyAliasSet/entry/src/main/cpp/napi_init.cpp#L16-L74)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-list-aliases-ndk*