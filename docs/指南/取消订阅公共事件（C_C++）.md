---
title: 取消订阅公共事件（C/C++）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/native-common-event-unsubscription
category: 指南
updated_at: 2026-03-12T13:48:44.201Z
---

# 取消订阅公共事件（C/C++）

## 场景介绍

订阅者在完成业务需求之后，需要取消订阅公共事件。

## 接口说明

详细的API说明请参考[oh\_commonevent.h](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-oh-commonevent-h)。

| 接口名 | 描述 |
| --- | --- |
| [CommonEvent_ErrCode OH_CommonEvent_UnSubscribe(const CommonEvent_Subscriber* subscriber)](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-oh-commonevent-h#oh_commonevent_unsubscribe) | 取消订阅公共事件。 |

## 开发步骤

1.  引用头文件。
    
    ```C
    #include "hilog/log.h"
    #include "BasicServicesKit/oh_commonevent.h"
    ```
    
    [common\_event\_unsubscribe.h](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Basic-Services-Kit/common_event/NativeCommonEvent/entry/src/main/cpp/common_event_unsubscribe.h#L19-L22)
    
2.  在CMake脚本中添加动态链接库。
    
    ```plaintext
    target_link_libraries(entry PUBLIC
        libace_napi.z.so
        libhilog_ndk.z.so
        libohcommonevent.so
    )
    ```
    
3.  取消订阅公共事件。
    
    订阅者订阅公共事件并完成业务需求后，可以通过[OH\_CommonEvent\_UnSubscribe](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-oh-commonevent-h#oh_commonevent_unsubscribe)主动取消订阅事件。
    
    ```cpp
    void Unsubscribe(CommonEvent_Subscriber *subscriber)
    {
        // 通过传入订阅者来退订事件
        int32_t ret = OH_CommonEvent_UnSubscribe(subscriber);
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "OH_CommonEvent_UnSubscribe ret <%{public}d>.", ret);
    }
    ```
    
    [common\_event\_unsubscribe.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/Basic-Services-Kit/common_event/NativeCommonEvent/entry/src/main/cpp/common_event_unsubscribe.cpp#L17-L24)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/native-common-event-unsubscription*