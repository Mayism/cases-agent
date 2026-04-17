---
title: ArkTS是否支持多继承
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-95
category: FAQ
updated_at: 2026-03-13T03:03:37.246Z
---

# ArkTS是否支持多继承

接口支持多继承，类仅支持单继承。示例如下：

```typescript
class TestClassA {
  address: string = '';
}
class TestClassB {
  name: string = '';
}
// report errors：Classes can only extend a single class.
// class TestClassC extends TestClassA, TestClassB {
// }
interface AreaSize {
  calculateAreaSize(): number;
}
interface Cal {
  Sub(a: number, b: number): number;
}
interface Area extends AreaSize, Cal {
  areaName: string;
  length: number;
  width: number;
}
```

[AreaSize.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/AreaSize.ets#L21-L45)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-95*