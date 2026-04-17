---
title: 管理群组关键资产(ArkTS)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/asset-js-group-access-control
category: 指南
updated_at: 2026-03-12T12:20:00.687Z
---

# 管理群组关键资产(ArkTS)

以下为管理群组关键资产使用示例，请先查看开发指导：

-   [新增关键资产(ArkTS)](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/asset-js-add)
-   [删除关键资产(ArkTS)](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/asset-js-remove)
-   [更新关键资产(ArkTS)](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/asset-js-update)
-   [查询关键资产(ArkTS)](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/asset-js-query)

## 前置条件

在应用配置文件app.json5中，配置群组ID，如：demo\_group\_id。群组支持配置多个群组ID。

```perl
{
  "app": {
    // 其他配置项此处省略。
    "assetAccessGroups": [
      "demo_group_id",
      // "another_group_id",
      // ...
    ]
  }
}
```

## 新增群组关键资产

在群组中新增密码为demo\_pwd、别名为demo\_alias、附属信息为demo\_label的关键资产。

```TypeScript
import { asset } from '@kit.AssetStoreKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
function stringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}
export async function addGroupAsset(): Promise<string> {
  let result: string = '';
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.SECRET, stringToArray('demo_pwd'));
  attr.set(asset.Tag.ALIAS, stringToArray('demo_alias'));
  attr.set(asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('demo_label'));
  attr.set(asset.Tag.GROUP_ID, stringToArray('demo_group_id'));
  try {
    await asset.add(attr).then(() => {
      console.info(`Succeeded in adding Asset to the group.`);
      result = 'Succeeded in adding Asset to the group';
    }).catch((err: BusinessError) => {
      console.error(`Failed to add Asset to the group. Code is ${err.code}, message is ${err.message}`);
      result = 'Failed to add Asset to the group';
    })
  } catch (error) {
    let err = error as BusinessError;
    console.error(`Failed to add Asset to the group. Code is ${err?.code}, message is ${err?.message}`);
    result = 'Failed to add Asset to the group';
  }
  return result;
}
```

[add\_group.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/AssetStoreKit/AssetStoreArkTS/entry/src/main/ets/operations/add_group.ets#L16-L48)

## 删除群组关键资产

在群组中删除别名为demo\_alias的关键资产。

```TypeScript
import { asset } from '@kit.AssetStoreKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
function stringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}
export async function removeGroupAsset(): Promise<string> {
  let result: string = '';
  let query: asset.AssetMap = new Map();
  query.set(asset.Tag.ALIAS, stringToArray('demo_alias')); // 此处指定别名删除单条群组关键资产，也可不指定别名删除多条群组关键资产。
  query.set(asset.Tag.GROUP_ID, stringToArray('demo_group_id'));
  try {
    await asset.remove(query).then(() => {
      console.info(`Succeeded in removing Asset from the group.`);
      result = 'Succeeded in removing Asset from the group';
    }).catch((err: BusinessError) => {
      console.error(`Failed to remove Asset from the group. Code is ${err.code}, message is ${err.message}`);
      result = 'Failed to remove Asset from the group';
    });
  } catch (err) {
    console.error(`Failed to remove Asset from the group. Code is ${err?.code}, message is ${err?.message}`);
    result = 'Failed to remove Asset from the group';
  }
  return result;
}
```

[remove\_group.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/AssetStoreKit/AssetStoreArkTS/entry/src/main/ets/operations/remove_group.ets#L16-L45)

## 更新群组关键资产

在群组中更新别名为demo\_alias的关键资产，明文更新为demo\_pwd\_new，附属属性更新为demo\_label\_new。

```TypeScript
import { asset } from '@kit.AssetStoreKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
function stringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}
export async function updateGroupAsset(): Promise<string> {
  let result: string = '';
  let query: asset.AssetMap = new Map();
  query.set(asset.Tag.ALIAS, stringToArray('demo_alias'));
  query.set(asset.Tag.GROUP_ID, stringToArray('demo_group_id'));
  let attrsToUpdate: asset.AssetMap = new Map();
  attrsToUpdate.set(asset.Tag.SECRET, stringToArray('demo_pwd_new'));
  attrsToUpdate.set(asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('demo_label_new'));
  try {
    await asset.update(query, attrsToUpdate).then(() => {
      console.info(`Succeeded in updating Asset in the group.`);
      result = 'Succeeded in updating Asset in the group';
    }).catch((err: BusinessError) => {
      console.error(`Failed to update Asset in the group. Code is ${err.code}, message is ${err.message}`);
      result = 'Failed to update Asset in the group';
    });
  } catch (err) {
    console.error(`Failed to update Asset in the group. Code is ${err?.code}, message is ${err?.message}`);
    result = 'Failed to update Asset in the group';
  }
  return result;
}
```

[update\_group.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/AssetStoreKit/AssetStoreArkTS/entry/src/main/ets/operations/update_group.ets#L16-L48)

## 查询单条群组关键资产明文

在群组中查询别名为demo\_alias的关键资产明文。

```TypeScript
import { asset } from '@kit.AssetStoreKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
function stringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}
function arrayToString(arr: Uint8Array): string {
  let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
  let str = textDecoder.decodeToString(arr, { stream: false });
  return str;
}
export async function queryGroupAssetPlaintext(): Promise<string> {
  let result: string = '';
  let query: asset.AssetMap = new Map();
  query.set(asset.Tag.ALIAS, stringToArray('demo_alias')); // 指定了群组关键资产别名，最多查询到一条满足条件的群组关键资产。
  query.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL); // 此处表示需要返回群组关键资产的所有信息，即属性+明文。
  query.set(asset.Tag.GROUP_ID, stringToArray('demo_group_id'));
  try {
    await asset.query(query).then((res: Array<asset.AssetMap>) => {
      for (let i = 0; i < res.length; i++) {
        // 解析secret。
        let secret: Uint8Array = res[i].get(asset.Tag.SECRET) as Uint8Array;
        // 将Uint8Array转换为string类型。
        let secretStr: string = arrayToString(secret);
      }
      result = 'Succeeded in querying group Asset plaintext';
    }).catch((err: BusinessError) => {
      console.error(`Failed to query Asset plaintext from the group. Code is ${err.code}, message is ${err.message}`);
      result = 'Failed to query Asset plaintext from the group';
    });
  } catch (err) {
    console.error(`Failed to query Asset plaintext from the group. Code is ${err?.code}, message is ${err?.message}`);
    result = 'Failed to query Asset plaintext from the group';
  }
  return result;
}
```

[query\_group\_plaintext.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/AssetStoreKit/AssetStoreArkTS/entry/src/main/ets/operations/query_group_plaintext.ets#L16-L57)

## 查询单条群组关键资产属性

在群组中查询别名为demo\_alias的关键资产属性。

```TypeScript
import { asset } from '@kit.AssetStoreKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
function stringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}
export async function queryGroupAssetAttribute(): Promise<string> {
  let result: string = '';
  let query: asset.AssetMap = new Map();
  query.set(asset.Tag.ALIAS, stringToArray('demo_alias')); // 指定了群组关键资产别名，最多查询到一条满足条件的群组关键资产。
  query.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ATTRIBUTES); // 此处表示仅返回群组关键资产属性，不包含群组关键资产明文。
  query.set(asset.Tag.GROUP_ID, stringToArray('demo_group_id'));
  try {
    await asset.query(query).then((res: Array<asset.AssetMap>) => {
      for (let i = 0; i < res.length; i++) {
        // 解析属性。
        let accessibility: number = res[i].get(asset.Tag.ACCESSIBILITY) as number;
        console.info(`Succeeded in getting accessibility, which is: ${accessibility}.`);
      }
      result = 'Succeeded in querying group Asset attribute';
    }).catch((err: BusinessError) => {
      console.error(`Failed to query Asset attribute from the group. Code is ${err.code}, message is ${err.message}`);
      result = 'Failed to query Asset attribute from the group';
    });
  } catch (err) {
    console.error(`Failed to query Asset attribute from the group. Code is ${err?.code}, message is ${err?.message}`);
    result = 'Failed to query Asset attribute from the group';
  }
  return result;
}
```

[query\_group\_attr.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Security/AssetStoreKit/AssetStoreArkTS/entry/src/main/ets/operations/query_group_attr.ets#L16-L50)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/asset-js-group-access-control*