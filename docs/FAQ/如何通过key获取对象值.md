---
title: 如何通过key获取对象值
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-108
category: FAQ
updated_at: 2026-03-13T03:04:52.844Z
---

# 如何通过key获取对象值

ArkTS中不支持通过索引访问字段，要使用索引的话可以考虑Record<key, value>，参考代码如下：

```typescript
class Student {
  data: Record<string, string> = { 'name': 'aaa', 'age': 'bbb' };
}
@Entry
@Component
struct KeyObject {
  build() {
    Column() {
      Button('click')
        .onClick(() => {
          let student = new Student();
          console.info(`${student.data['name']}`);
        })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}
```

[KeyObject.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/KeyObject.ets#L21-L42)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-108*