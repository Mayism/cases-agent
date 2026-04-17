---
title: 查询密钥别名集(ArkTS)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-list-aliases-arkts
category: 指南
updated_at: 2026-03-12T13:27:39.360Z
---

# 查询密钥别名集(ArkTS)

HUKS提供了接口供应用查询密钥别名集。

说明

轻量级智能穿戴不支持查询密钥别名集功能。

## 开发步骤

1.  初始化密钥属性集，用于查询指定密钥别名集TAG。TAG仅支持[HUKS\_TAG\_AUTH\_STORAGE\_LEVEL](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-huks#hukstag)。
    
2.  调用接口[listAliases](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-huks#hukslistaliases12)，查询密钥别名集。
    

```TypeScript
/*
 * 以下查询密钥别名集Promise操作使用为例
 */
import { huks } from '@kit.UniversalKeystoreKit'
async function testListAliases() {
  /* 1.初始化密钥属性集 */
  let queryProperties: Array<huks.HuksParam> = [
    {
      tag: huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL,
      value: huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE
    }
  ];
  let queryOptions: huks.HuksOptions = {
    properties: queryProperties
  };
  try {
    /* 2.查询密钥别名集 */
    let result: huks.HuksListAliasesReturnResult = await huks.listAliases(queryOptions);
    console.info(`promise: listAliases success`);
  } catch (error) {
    console.error(`promise: listAliases fail`);
    throw (error as Error);
  }
}
```

[QueryKeyAliasSet.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/UniversalKeystoreKit/OtherOperations/QueryKeyAliasSet/entry/src/main/ets/pages/QueryKeyAliasSet.ets#L16-L43)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/huks-list-aliases-arkts*