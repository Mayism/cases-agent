---
title: 对象中函数的this如何指向外层
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-139
category: FAQ
updated_at: 2026-03-13T03:09:01.554Z
---

# 对象中函数的this如何指向外层

通过箭头函数实现。参考代码如下：

```typescript
interface T {
  start: () => number
}
@Component
struct PointingOuterLayer {
  @State num: number = 1
  obj: T = {
    start: () => {
      return this.num
    }
  }
```

[PointingOuterLayer.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/PointingOuterLayer.ets#L21-L31)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-139*