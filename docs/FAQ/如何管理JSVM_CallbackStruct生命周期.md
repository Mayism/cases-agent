---
title: 如何管理JSVM_CallbackStruct生命周期
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-jsvm-1
category: FAQ
updated_at: 2026-03-13T03:37:57.396Z
---

# 如何管理JSVM_CallbackStruct生命周期

**问题现象**

1.  使用 OH\_JSVM\_CreateFunction 创建的 JavaScript 函数在调用时导致应用崩溃。
    
    使用 new 在堆上分配JSVM\_CallbackStruct 的内存后，开发者需明确释放该内存的时机。
    

**可能原因**

由 OH\_JSVM\_CreateFunction 创建的 JavaScript 函数在使用时出现应用崩溃的问题，通常是因为 JSVM\_CallbackStruct 的生命周期管理不正确。错误代码示例如下：

```
JSVM\_Value CreateFunction(JSVM\_Env env) {
    JSVM\_CallbackStruct callbackStruct;
    callbackStruct.data = nullptr;
    callbackStruct.callback = \[\](JSVM\_Env env, JSVM\_CallbackInfo info) -> JSVM\_Value {
        return nullptr;
    };
    JSVM\_Value result = nullptr;
    OH\_JSVM\_CreateFunction(env, "foo", JSVM\_AUTO\_LENGTH, &callbackStruct, &result);
    return result;
}
void SomeFunction() {
    char stack\[\] = "hello world";
}
```

[Jsvm\_CallbackStruct.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Jsvm/entry/src/main/cpp/Jsvm_CallbackStruct.cpp#L6-L19)

执行以下代码时，应用程序会崩溃。

```
// ...
auto func = CreateFunction(env);
SomeFunction();
JSVM\_Value undef = nullptr;
OH\_JSVM\_GetUndefined(env, &undef);
JSVM\_Value result;
OH\_JSVM\_CallFunction(env, undef, func, 0, nullptr, &result);
// ...
```

[Jsvm\_CallbackStruct2.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Jsvm/entry/src/main/cpp/Jsvm_CallbackStruct2.cpp#L6-L17)

在 OH\_JSVM\_CallFunction 调用时，callbackStruct为栈上变量，OH\_JSVM\_CreateFunction 参数接收了栈内存地址（&callbackStruct）。调用 SomeFunction 后，栈内存被修改。在 OH\_JSVM\_CallFunction 中，执行 JSVM\_CallbackStruct 中的回调函数时，由于 JSVM\_CallbackStruct 的内存已修改，导致非法内存访问，应用崩溃。

**解决措施**

如果使用 OH\_JSVM\_CreateFunction 创建的 JavaScript 函数需要跨函数使用，JSVM\_CallbackStruct 必须从堆上申请，并且在 JavaScript 函数失效前不能释放。JSVM\_CallbackStruct的释放可以交给虚拟机的垃圾回收机制。通过调用 OH\_JSVM\_AddFinalizer，可以为 JavaScript 函数设置 Finalize 方法。当 JavaScript 函数被垃圾回收时，Finalize 方法会被调用，同时释放 JSVM\_CallbackStruct。示例如下：

```
JSVM\_Value CreateFunction(JSVM\_Env env) {
    JSVM\_Callback cb = new JSVM\_CallbackStruct;
    cb->data = nullptr;
    cb->callback = \[\](JSVM\_Env env, JSVM\_CallbackInfo info) -> JSVM\_Value { return nullptr; };
    JSVM\_Value result = nullptr;
    OH\_JSVM\_CreateFunction(env, "foo", JSVM\_AUTO\_LENGTH, cb, &result);
    OH\_JSVM\_AddFinalizer(
        env, result, reinterpret\_cast<void \*>(cb),
        \[\](JSVM\_Env env, void \*data, void \*hint) -> void {
            delete static\_cast<JSVM\_Callback>(data);
        }, nullptr, nullptr);
    return result;
}
```

[Jsvm\_CallbackStruct3.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Jsvm/entry/src/main/cpp/Jsvm_CallbackStruct3.cpp#L6-L20)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-jsvm-1*