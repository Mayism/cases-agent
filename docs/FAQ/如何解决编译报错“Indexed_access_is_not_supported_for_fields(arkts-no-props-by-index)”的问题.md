---
title: 如何解决编译报错“Indexed access is not supported for fields(arkts-no-props-by-index)”的问题
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-126
category: FAQ
updated_at: 2026-03-13T05:42:02.664Z
---

# 如何解决编译报错“Indexed access is not supported for fields(arkts-no-props-by-index)”的问题

**问题现象**

动态调用类或接口的字段会导致编译报错：Indexed access is not supported for fields (arkts-no-props-by-index)。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e3/v3/ZTZUAh96Q7y7isF6s4tFNg/zh-cn_image_0000002229604089.png?HW-CC-KV=V1&HW-CC-Date=20260313T054157Z&HW-CC-Expire=86400&HW-CC-Sign=46EA0ECEECF0FB13CD6A15EA3A3F410CDC90B8D38163F89D751585C4263DF00F)

**解决方案**

修改代码：

```typescript
getValue(breakpoint: string): T {
  return Reflect.get(this.options, breakpoint) as T;
}
```

[BreakPointType.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/main/ets/commpent/BreakPointType.ets#L19-L21)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-126*