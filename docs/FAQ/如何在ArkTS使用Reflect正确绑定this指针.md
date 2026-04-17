---
title: 如何在ArkTS使用Reflect正确绑定this指针
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-113
category: FAQ
updated_at: 2026-03-13T03:05:39.351Z
---

# 如何在ArkTS使用Reflect正确绑定this指针

参考以下示例代码，注意只有对象的get/set方法才能绑定this指针。

```typescript
class ReflectClass {
  private a = 'a';
  get getA() {
    return () => {
      return this.a;
    };
  }
  set setA(a: string) {
    this.a = a;
  }
}
function testInvoke() {
  const reflectClass = new ReflectClass();
  const fn: Function = Reflect.get(reflectClass, 'getA', reflectClass);
  console.info(fn());
}
@Entry
@Component
struct ReflectBoundThis {
  aboutToAppear(): void {
    testInvoke();
  }
  build() {
  }
}
```

[ReflectBoundThis.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/ReflectBoundThis.ets#L21-L55)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-113*