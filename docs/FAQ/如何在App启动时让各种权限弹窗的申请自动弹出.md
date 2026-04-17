---
title: 如何在App启动时让各种权限弹窗的申请自动弹出
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-92
category: FAQ
updated_at: 2026-03-13T02:52:43.989Z
---

# 如何在App启动时让各种权限弹窗的申请自动弹出

将requestPermissionsFromUser接口放到EntryAbility.ets文件的loadContent回调中，参考代码如下：

```typescript
windowStage.loadContent('pages/Index', (err) => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(this.context, ['ohos.permission.ACCESS_BLUETOOTH'])
    .then((data: PermissionRequestResult) => {
      console.info('data:' + JSON.stringify(data));
      console.info('data permissions:' + data.permissions);
      console.info('data authResults:' + data.authResults);
    }).catch((err: BusinessError) => {
    console.error('data:' + JSON.stringify(err));
  });
});
```

[EntryAbilityRequest.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AbilityKit/entry/src/main/ets/entryability/EntryAbilityRequest.ets#L28-L38)

在设置文件中声明目标权限：

```json
"requestPermissions": [
  {
    "name": "ohos.permission.ACCESS_BLUETOOTH",
    "usedScene": {
      "abilities": [
        "EntryAbility"
      ],
      "when": "inuse"
    },
    "reason": "$string:app_name"
  }
],
```

[module\_request.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/AbilityKit/entry/src/main/module_request.json5#L10-L21)

**参考链接**

[abilityAccessCtrl.createAtManager](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-abilityaccessctrl#abilityaccessctrlcreateatmanager)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ability-92*