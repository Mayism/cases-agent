---
title: 如何在ArkTS侧管理Native侧的C++对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-77
category: FAQ
updated_at: 2026-03-13T03:35:48.973Z
---

# 如何在ArkTS侧管理Native侧的C++对象

**问题现象**

在ArkTS层管理C++层分配的对象，并通过接口访问C++层的业务。

**解决措施**

C++层分配一个类对象，返回该对象的地址给ArkTS层。ArkTS层通过自定义类对象的number属性存储C++层返回的地址。后续涉及对C++层对象的业务处理时，ArkTS层调用接口将地址传递到C++层处理。

声明TestClass：

```
class TestClass {
public:
    int GetValue() {
        return this->value;
    }
    void SetValue(int value) {
        this->value = value;
    }
private:
    int value = 999;
};
```

[TestClass.h](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSManageCObjects/src/main/cpp/TestClass.h#L21-L31)

C++层将定义的对象地址返回到ArkTS层：

```cpp
#include "napi/native\_api.h"
#include "TestClass.h"
#include "hilog/log.h"
#define LOG\_TAG "MY\_TAG"
static napi\_value DefineObject(napi\_env env, napi\_callback\_info info) {
    OH\_LOG\_INFO(LOG\_APP, "enter DefineObject");
    napi\_value result;
    auto a = new TestClass();
    int64\_t addrValue = (int64\_t)a;
    napi\_create\_bigint\_int64(env, addrValue, &result);
    OH\_LOG\_INFO(LOG\_APP, "end DefineObject, addrValue:%{public}ld", addrValue);
    return result;
}
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSManageCObjects/src/main/cpp/napi_init.cpp#L19-L33)

C++层接收ArkTS层传递过来的对象地址完成业务：

```
static napi\_value CallObject(napi\_env env, napi\_callback\_info info) {
    OH\_LOG\_INFO(LOG\_APP, "enter CallObject");
    size\_t argc = 1;
    napi\_value args\[1\] = {nullptr};
    napi\_get\_cb\_info(env, info, &argc, args, nullptr, nullptr);
    int64\_t addrValue = 0;
    bool flag = false;
    napi\_get\_value\_bigint\_int64(env, args\[0\], &addrValue, &flag);
    TestClass \*a = (TestClass \*)addrValue;
    OH\_LOG\_INFO(LOG\_APP, "CallObject, addrValue:%{public}ld", addrValue);
    OH\_LOG\_INFO(LOG\_APP, "CallObject, value:%{public}d", a->GetValue());
    a->SetValue(888);
    return nullptr;
}
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSManageCObjects/src/main/cpp/napi_init.cpp#L37-L50)

ArkTS侧调用接口：

```typescript
import testNapi from 'libentry.so';
@Entry
@Component
struct Index {
  @State message: string = 'DefineObject';
  @State message2: string = 'CallObject';
  addr: number = 0;
  build() {
    Column() {
      Button(this.message)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.addr = testNapi.defineObject();
          console.log('testTag:' + this.addr.toString());
        })
      Button(this.message2)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          if (this.addr != 0) {
            testNapi.callObject(this.addr);
            this.message2 = 'CallObject';
          } else {
            this.message2 = 'want define Object';
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}
```

[Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ArkTSManageCObjects/src/main/ets/pages/Index.ets#L19-L53)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-77*