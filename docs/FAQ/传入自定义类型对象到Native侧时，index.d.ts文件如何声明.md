---
title: 传入自定义类型对象到Native侧时，index.d.ts文件如何声明
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-61
category: FAQ
updated_at: 2026-03-13T03:34:21.441Z
---

# 传入自定义类型对象到Native侧时，index.d.ts文件如何声明

此处以testCb为例

```
class testCb {
  testNum: number = 0;
  testString: string = "";
}
```

[CustomObject.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/entry/src/main/ets/pages/CustomObject.ets#L21-L24)

方法一：

在index.d.ts文件中使用object类型进行声明。

```typescript
export const modifyObject: (a: object) => object;
```

[Index.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/entry/src/main/cpp/types/libentry/Index.d.ts#L47-L47)

方法二：

创建xx.ts文件，并在该文件中导出类。然后在index.d.ts文件中导入并使用该类。

test.ts 导出接口声明。

```typescript
export class testCa {
  testNum: number = 0;
  testString: string = "";
}
```

[CustomObject.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/entry/src/main/ets/pages/interface/CustomObject.ts#L19-L22)

在index.d.ts中导入并使用。

```typescript
import { testCa } from "../../../ets/pages/interface/CustomObject"
export const test1: (a: testCa) => void;
```

[Index.d.ts](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/entry/src/main/cpp/types/libentry/Index.d.ts#L37-L38)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-61*