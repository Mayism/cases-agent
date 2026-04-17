---
title: 编译报错“Duplicated files found in module entry. This may cause unexpected errors at runtime”
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-107
category: FAQ
updated_at: 2026-03-13T05:39:55.005Z
---

# 编译报错“Duplicated files found in module entry. This may cause unexpected errors at runtime”

**问题现象**

编译构建时，报错“Duplicated files found in module entry. This may cause unexpected errors at runtime”。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/15/v3/I_vw1DXVQautJ3KP9wQecA/zh-cn_image_0000002229603833.png?HW-CC-KV=V1&HW-CC-Date=20260313T053949Z&HW-CC-Expire=86400&HW-CC-Sign=C537FECED4583D7ABD89CFE481AA4AF38EC55633F81FE3C8700BFFB49155327A "点击放大")

**解决措施**

该报错是从不同的包中收集到了相同名称的so包，导致so包冲突，可在模块级build-profile.json5文件中添加enableOverride字段并设置true。更多内容可参考[模块级build-profile.json5文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-profile)。

```json
"buildOption": {
  "nativeLib": {
    "filter": {
      "enableOverride": true
    }
  }
},
```

[build-profile.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/library2/build-profile.json5#L5-L11)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-107*