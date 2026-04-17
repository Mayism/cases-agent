---
title: 如何在Native侧构建一个ArkTS对象
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-45
category: FAQ
updated_at: 2026-03-13T03:31:51.063Z
---

# 如何在Native侧构建一个ArkTS对象

1.  调用接口napi\_create\_object创建对象。
    
    ```cpp
    // Create object arg_order in the native layer
    napi_value arg_object;
    napi_create_object(env, &arg_object);
    ```
    
    [napi\_create\_arkts.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/NativeCpp/napi_create_arkts.cpp#L11-L13)
    
2.  调用接口napi\_set\_named\_property给对象属性赋值。
    
    ```cpp
    napi_value testNum, testString;
    // Set the property testNum and assign a value of 123 to the arg_order object created above
    napi_create_int32(env, 123, &testNum);
    napi_set_named_property(env, arg_object, "testNum", testNum);
    // Set the property testString and assign 'Pure' to the arg_order object created above
    napi_create_string_utf8(env, "Pure", NAPI_AUTO_LENGTH, &testString);
    napi_set_named_property(env, arg_object, "testString", testString);
    ```
    
    [napi\_create\_arkts.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/entry/src/main/cpp/NativeCpp/napi_create_arkts.cpp#L17-L23)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-45*