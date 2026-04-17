---
title: 如何获取BuildProfile中的值
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-72
category: FAQ
updated_at: 2026-03-13T05:37:02.669Z
---

# 如何获取BuildProfile中的值

生成 BuildProfile 文件后，可以通过相对路径在代码中引入该文件。例如，在 HAR 模块的 Index.ets 文件中使用该文件：

```typescript
import BuildProfile from './BuildProfile';
```

[Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/CompilingAndBuilding/library/Index.ets#L3-L4)

获取 BuildProfile 类中的值：

```typescript
const HAR_VERSION: string = BuildProfile.HAR_VERSION;
const BUILD_MODE_NAME: string = BuildProfile.BUILD_MODE_NAME;
const DEBUG: boolean = BuildProfile.DEBUG;
```

[Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/CompilingAndBuilding/library/Index.ets#L8-L11)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/90/v3/aaEPkRs8Q7WXYD6ne09UiQ/zh-cn_image_0000002229604169.png?HW-CC-KV=V1&HW-CC-Date=20260313T053657Z&HW-CC-Expire=86400&HW-CC-Sign=1EEBA19EB20D41BD3CA263D86E1DE3CE458829006CC522EBFC38D20D6FEA390C "点击放大")

**参考链接**

[HAR运行时获取编译构建参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-get-build-profile-para-guide#section68146594553)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-72*