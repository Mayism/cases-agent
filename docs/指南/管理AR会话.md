---
title: 管理AR会话
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arengine-c-arsession
category: 指南
updated_at: 2026-03-12T18:42:20.490Z
---

# 管理AR会话

## 概要

对于任何AR应用，都需要创建一个AR会话[AREngine\_ARSession](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arengine-capi-arengine#ga2dbf3585f50628750ec855501c043650)，用于管理AR Engine的系统状态。

## 引入AR Engine

1.  引入头文件。
    
    ```cpp
    #include "ar/ar_engine_core.h"
    ```
    
2.  编写CMakeLists.txt。
    
    ```cpp
    find_library(
        # Sets the name of the path variable.
        arengine-lib
        # Specifies the name of the NDK library that
        # you want CMake to locate.
        libarengine_ndk.z.so
    )
    target_link_libraries(entry PUBLIC
        ${arengine-lib}
    )
    ```
    

## 创建AR会话

应用开始时，调用[HMS\_AREngine\_ARSession\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arengine-capi-arengine#ga47713cb18234569e03b5216b6c8442d3)函数创建一个AR会话。

```cpp
AREngine_ARSession *arSession = nullptr;
HMS_AREngine_ARSession_Create(nullptr, nullptr, &arSession);
```

## 自定义配置AR会话

创建一个[AREngine\_ARConfig](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arengine-capi-arengine#gab0b32ef6018535fd30000f4b6d65f619)对象来配置当前AR会话。如缺省，则使用默认配置，具体配置可参考[HMS\_AREngine\_ARConfig\_Create](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arengine-capi-arengine#ga97376432184fe702f2451e32b52298fb)。

```cpp
// 创建一个拥有合理默认配置的配置对象。
AREngine_ARConfig *arConfig = nullptr;
HMS_AREngine_ARConfig_Create(arSession, &arConfig);
// 此处配置arConfig。
// 配置AREngine_ARSession会话。
HMS_AREngine_ARSession_Configure(arSession, arConfig);
// 释放指定的配置对象的内存空间。
HMS_AREngine_ARConfig_Destroy(arConfig);
```

具体可配置项，请参考[AR Engine API参考](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arengine-capi)。

## 销毁AR会话

应用结束时，调用[HMS\_AREngine\_ARSession\_Destroy](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arengine-capi-arengine#ga3a2be9998c9cd6373ff1f5209b645a95)函数销毁当前的AR会话。

```cpp
HMS_AREngine_ARSession_Destroy(arSession);
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arengine-c-arsession*