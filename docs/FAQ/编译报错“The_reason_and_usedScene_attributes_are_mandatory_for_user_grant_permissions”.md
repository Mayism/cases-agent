---
title: 编译报错“The reason and usedScene attributes are mandatory for user_grant permissions”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-38
category: FAQ
updated_at: 2026-03-13T05:33:21.977Z
---

# 编译报错“The reason and usedScene attributes are mandatory for user_grant permissions”

**问题现象**

DevEco Studio编译失败，提示“The reason and usedScene attributes are mandatory for user\_grant permissions”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/60/v3/7mtlHyNcTv24p8x5Bm5GQw/zh-cn_image_0000002194158568.png?HW-CC-KV=V1&HW-CC-Date=20260313T053315Z&HW-CC-Expire=86400&HW-CC-Sign=FDAED6410254148C55560F81624C9C67F90445C8B6FD5EF6A1493B7CCF6B3AE7 "点击放大")

**问题原因**

从DevEco Studio NEXT Developer Preview 2版本开始，新增规则：APP包中，所有entry和feature hap的module下的requestPermissions权限清单必须指定（可以为空，若非空则name必填；user\_grant权限则必填reason和usedScene字段）。

**解决措施**

进入对应module.json5文件中，补齐requestPermissions字段下的reason和usedScene字段。如以下示例：

```json
"requestPermissions": [
  {
    "name": "ohos.permission.READ_IMAGEVIDEO",
    "reason": "$string:module_desc",
    "usedScene": {
      "abilities": [
        "EntryAbility"
      ],
      "when": "inuse"
    }
  }
],
```

[module.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/main/module.json5#L56-L67)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-38*