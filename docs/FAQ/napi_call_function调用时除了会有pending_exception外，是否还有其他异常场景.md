---
title: napi_call_function调用时除了会有pending exception外，是否还有其他异常场景
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-69
category: FAQ
updated_at: 2026-03-13T03:35:16.477Z
---

# napi_call_function调用时除了会有pending exception外，是否还有其他异常场景

调用NAPI接口时可能会产生异常，因此在业务的关键流程中需要对接口调用的结果进行判断，以检查是否出现异常。例如：

```
napi\_status status = napi\_create\_object(env, &object);
if (status != napi\_ok) {
    napi\_throw\_error(env, nullptr, "Error");
return;
}
```

[napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/ndk1/Modulea/src/main/cpp/napi_init.cpp#L9-L13)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-69*