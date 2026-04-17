---
title: 如何遍历JSON对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-111
category: FAQ
updated_at: 2026-03-13T03:05:27.125Z
---

# 如何遍历JSON对象

具体请参考如下示例代码：

```typescript
import { ArrayList } from '@kit.ArkTS';
interface Winner { num: number };
let tmpStr: Record<string, Winner> = JSON.parse('{ "0": {"num": 1}, "1": {"num": 2} }');
const arrayList: ArrayList<Winner> = new ArrayList();
Object.entries(tmpStr).forEach((item) => {
  const value = item[1];
  arrayList.add(value);
})
```

[Entries.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/Entries.ets#L21-L30)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-111*