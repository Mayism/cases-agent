---
title: 如何将Map转换为JSON字符串
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-86
category: FAQ
updated_at: 2026-03-13T03:02:47.127Z
---

# 如何将Map转换为JSON字符串

将Map转换为Record后，再通过JSON.stringify()方法转换为JSON字符串。示例如下：

```typescript
let mapSource = new Map<string, string>();
mapSource.set('name', 'name1');
mapSource.set('width', '100');
mapSource.set('height', '50');
let jsonObject: Record<string, Object> = {};
mapSource.forEach((value, key) => {
  if (key !== undefined && value !== undefined) {
    jsonObject[key] = value;
  }
})
let jsonInfo: string = JSON.stringify(jsonObject);
@Entry
@Component
struct Index {
  build() {
    Column() {
      Button('Map to JSON')
        .onClick(() => {
          console.log('jsonInfo:', jsonInfo); // jsonInfo: {"name":"name1","width":"100","height":"50"}
        })
    }
  }
}
```

[MapSource.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/MapSource.ets#L21-L45)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-86*