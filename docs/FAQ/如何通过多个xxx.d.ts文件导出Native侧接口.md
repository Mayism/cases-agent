---
title: 如何通过多个xxx.d.ts文件导出Native侧接口
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-63
category: FAQ
updated_at: 2026-03-13T03:34:40.383Z
---

# 如何通过多个xxx.d.ts文件导出Native侧接口

**问题现象**

由于底部C++库规模较大，向外暴露的接口数量较多，建议将其拆分成多个.d.ts文件以便归类。

**解决措施**

在oh-package.json5中的types字段只能指定一个出口。如果需要封装多个.d.ts文件中的接口，可以使用重导出的方式。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/24/v3/QgfA-Rn-T0qCKdXaibDKHg/zh-cn_image_0000002194318472.png?HW-CC-KV=V1&HW-CC-Date=20260313T033434Z&HW-CC-Expire=86400&HW-CC-Sign=CDD6D09440D94845CAED3794A7BF4BE745C6AA5450AA387722A62D8C8DE4DFA4 "点击放大")

实现方式：

在index1.d.ts文件中声明Native侧导出接口，然后通过index.d.ts文件重导出到ArkTS侧使用。

在index1.d.ts文件中导出接口。

```typescript
export const sub: (a: number, b: number) => number;
```

[index1.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/Modulea/src/main/cpp/types/libmodulea/index1.d.ts#L5-L5)

在index.d.ts文件中重导出这些接口。

```typescript
export {sub} from './index1'
export const add: (a: number, b: number) => number;
```

[Index.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/Modulea/src/main/cpp/types/libmodulea/Index.d.ts#L5-L6)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-63*