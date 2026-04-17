---
title: 获取设备的位置信息开发指导（C/C++）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/location-guidelines-capi
category: 指南
updated_at: 2026-03-24T11:01:34.794Z
---

# 获取设备的位置信息开发指导（C/C++）

## 场景介绍

开发者可以调用OpenHarmony位置相关接口，监听设备的位置变化。

## 函数说明

| 名称 | 描述 |
| --- | --- |
| OH_Location_IsLocatingEnabled(bool* enabled) | 查询位置开关是否开启。 |
| OH_Location_StartLocating(const Location_RequestConfig* requestConfig) | 启动定位并订阅位置变化。 |
| Location_ResultCode OH_Location_StopLocating(const Location_RequestConfig* requestConfig) | 停止定位并取消订阅位置变化。 |
| OH_LocationInfo_GetBasicInfo(Location_Info* location) | 从定位结果中获取基本信息，如经纬度、海拔、速度等信息。 |
| OH_LocationInfo_GetAdditionalInfo(Location_Info* location, char* additionalInfo, uint32_t length) | 从定位结果中获取附加信息。附加信息是一个JSON格式的字符串。 |
| OH_Location_CreateRequestConfig(void) | 创建一个位置请求参数结构体实例。 |
| OH_Location_DestroyRequestConfig(Location_RequestConfig* requestConfig) | 销毁位置请求参数实例并回收内存。 |
| OH_LocationRequestConfig_SetUseScene(Location_RequestConfig* requestConfig, Location_UseScene useScene) | 设置发起定位时的用户活动场景。如果设置了useScene，则powerConsumptionScene无效。如果未设置useScene，且设置了powerConsumptionScene，则该参数生效。如果两个参数都不设置，则默认useScene为LOCATION_USE_SCENE_DAILY_LIFE_SERVICE,powerConsumptionScene参数无效。 |
| OH_LocationRequestConfig_SetPowerConsumptionScene(Location_RequestConfig* requestConfig, Location_PowerConsumptionScene powerConsumptionScene) | 设置发起定位时的功耗场景。 |
| OH_LocationRequestConfig_SetInterval(Location_RequestConfig* requestConfig, int interval) | 设置定位结果上报时间间隔。 |
| OH_LocationRequestConfig_SetCallback(Location_RequestConfig* requestConfig, Location_InfoCallback callback, void* userData) | 设置用于接收位置上报的回调函数。 |

## 开发步骤

1.  新建一个Native C++工程。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0f/v3/kjdYcE7TSmO52f4snCGEKA/zh-cn_image_0000002290459145.png?HW-CC-KV=V1&HW-CC-Date=20260324T110134Z&HW-CC-Expire=86400&HW-CC-Sign=A7F227C54D69D90D2E8E5072F15FB2655FA63913268181041A1B2E5ED6C508F1)
    
2.  获取设备的位置信息，需要有位置权限，位置权限申请的方法和步骤见[申请位置权限开发指导](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/location-permission-guidelines)。
    
3.  CMakeLists.txt文件中引入动态依赖库。
    
    ```
    target\_link\_libraries(entry PUBLIC libace\_napi.z.so)
    target\_link\_libraries(entry PUBLIC libhilog\_ndk.z.so)
    target\_link\_libraries(entry PUBLIC liblocation\_ndk.so)
    ```
    
4.  在napi\_init.cpp文件中编码，首先导入模块。
    
    ```cpp
    #include "napi/native\_api.h"
    #include "LocationKit/oh\_location.h"
    #include "LocationKit/oh\_location\_type.h"
    #include "hilog/log.h"
    #include <stdlib.h>
    ```
    
5.  调用获取位置接口之前需要先判断位置开关是否打开。
    
    查询当前位置开关状态，返回结果为布尔值，true代表位置开关开启，false代表位置开关关闭，示例代码如下：
    
    ```
     static napi\_value OhLocationIsEnabled(napi\_env env, napi\_callback\_info info)
     {
         bool isEnabled = false;
         int resultCode = OH\_Location\_IsLocatingEnabled(&isEnabled);
         napi\_value result = NULL;
         napi\_get\_boolean(env, isEnabled, &result);
         return result;
     }
     // 在Init函数中补充接口。
     EXTERN\_C\_START
     static napi\_value Init(napi\_env env, napi\_value exports)
     {
         napi\_property\_descriptor desc\[\] = {
             {"ohLocationIsEnabled", NULL, OhLocationIsEnabled, NULL, NULL, NULL, napi\_default, NULL},
         };
         napi\_define\_properties(env, exports, sizeof(desc) / sizeof(desc\[0\]), desc);
         return exports;
     }
     EXTERN\_C\_END
    ```
    
6.  定位位置变化。
    
    ```
    // 定义一个请求参数
    struct Location\_RequestConfig \*g\_requestConfig = NULL;
    void \*mydata = NULL;
    // 定义一个回调函数用来接收位置信息
    void reportLocation(Location\_Info\* location, void\* userData)
    {
        Location\_BasicInfo baseInfo = OH\_LocationInfo\_GetBasicInfo(location);
        char additionalInfo\[1024\] = "";
        Location\_ResultCode result = OH\_LocationInfo\_GetAdditionalInfo(location, additionalInfo, sizeof(additionalInfo));
        if (mydata == userData) {
            OH\_LOG\_INFO(LOG\_APP, "userData is mydata");
        }
        return;
    }
    // 订阅位置信息
    static napi\_value OhLocationStartLocating(napi\_env env, napi\_callback\_info info)
    {
        if (g\_requestConfig == NULL) {
            g\_requestConfig = OH\_Location\_CreateRequestConfig();
        }
        OH\_LocationRequestConfig\_SetUseScene(g\_requestConfig, LOCATION\_USE\_SCENE\_NAVIGATION);
        OH\_LocationRequestConfig\_SetInterval(g\_requestConfig, 1);
        mydata = (void \*)malloc(sizeof("mydata")); // 用户自定义任意类型，callback 透传返回
        OH\_LocationRequestConfig\_SetCallback(g\_requestConfig, reportLocation, mydata);
        OH\_Location\_StartLocating(g\_requestConfig);
        int32\_t ret = 0;
        napi\_value result = NULL;
        napi\_create\_int32(env, ret, &result);
        return result;
    }
    //取消订阅位置信息， g\_requestConfig要和订阅时传入的对象保持一致
    static napi\_value OhLocationStopLocating(napi\_env env, napi\_callback\_info info)
    {
        OH\_Location\_StopLocating(g\_requestConfig);
        if (g\_requestConfig != NULL) {
            OH\_Location\_DestroyRequestConfig(g\_requestConfig);
            g\_requestConfig = NULL;
        }
        free(mydata);
        mydata = NULL;
        int32\_t ret = 0;
        napi\_value result = NULL;
        napi\_create\_int32(env, ret, &result);
        return result;
    }
    // 在Init函数中补充接口。
    EXTERN\_C\_START
    static napi\_value Init(napi\_env env, napi\_value exports)
    {
        napi\_property\_descriptor desc\[\] = {
            {"ohLocationStartLocating", NULL, OhLocationStartLocating, NULL, NULL, NULL, napi\_default, NULL},
            {"ohLocationStopLocating", NULL, OhLocationStopLocating, NULL, NULL, NULL, napi\_default, NULL},
        };
        napi\_define\_properties(env, exports, sizeof(desc) / sizeof(desc\[0\]), desc);
        return exports;
    }
    EXTERN\_C\_END
    ```
    
7.  在types/libentry路径下index.d.ts文件中引入Napi接口。
    
    ```typescript
     export const ohLocationIsEnabled: () => boolean;
     export const ohLocationStartLocating: () => number;
     export const ohLocationStopLocating: () => number;
    ```
    
8.  删除Index.ets中的已废弃函数。
    
    ```
    .onClick(() => {
        hilog.info(0x0000, 'testTag', 'Test NAPI 2 + 3 = %{public}d', testNapi.add(2, 3));
    })
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/location-guidelines-capi*