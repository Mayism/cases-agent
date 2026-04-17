---
title: 使用HiTraceMeter跟踪性能（C/C++）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hitracemeter-guidelines-ndk
category: 指南
updated_at: 2026-03-24T10:58:12.618Z
---

# 使用HiTraceMeter跟踪性能（C/C++）

## 简介

HiTraceMeter提供系统性能打点接口。开发者在关键代码位置调用这些API，能够有效跟踪进程轨迹，查看系统和应用性能。

## 接口说明

性能打点跟踪接口由HiTraceMeter模块提供，详细API请参考[trace.h](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-trace-h)。

| 方法 | 接口描述 |
| --- | --- |
| void OH_HiTrace_StartTraceEx(HiTrace_Output_Level level, const char* name, const char* customArgs) | 开启一个同步时间片跟踪事件，分级控制跟踪输出。说明：从API version 19开始，支持该接口。 |
| void OH_HiTrace_FinishTraceEx(HiTrace_Output_Level level) | 结束一个同步时间片跟踪事件，分级控制跟踪输出。level必须与流程开始的OH_HiTrace_StartTraceEx()对应参数值保持一致。说明：从API version 19开始，支持该接口。 |
| void OH_HiTrace_StartAsyncTraceEx(HiTrace_Output_Level level, const char* name, int32_t taskId, const char* customCategory, const char* customArgs) | 开启一个异步时间片跟踪事件，分级控制跟踪输出。taskId是trace中用来表示关联的ID，如果有多个name相同的任务并行执行，则开发者每次调用OH_HiTrace_StartAsyncTraceEx()时，传入的taskId需不同；如果具有相同name的任务是串行执行的，则taskId可以相同。说明：从API version 19开始，支持该接口。 |
| void OH_HiTrace_FinishAsyncTraceEx(HiTrace_Output_Level level, const char* name, int32_t taskId) | 结束一个异步时间片跟踪事件，分级控制跟踪输出。level、name和taskId必须与流程开始的OH_HiTrace_StartAsyncTraceEx()对应参数值保持一致。说明：从API version 19开始，支持该接口。 |
| void OH_HiTrace_CountTraceEx(HiTrace_Output_Level level, const char* name, int64_t count) | 整数跟踪事件，分级控制跟踪输出。name、count两个参数分别用来标记一个跟踪的整数变量名及整数值。说明：从API version 19开始，支持该接口。 |
| bool OH_HiTrace_IsTraceEnabled(void) | 判断当前是否开启应用trace捕获。使用hitrace命令行工具等方式开启采集时返回true，未开启采集或停止采集后返回false，此时调用HiTraceMeter性能跟踪打点接口无效。说明：从API version 19开始，支持该接口。 |
| int32_t OH_HiTrace_RegisterTraceListener(OH_HiTrace_TraceEventListener callback) | 注册应用trace捕获开关通知回调，使用callback异步回调。注册成功后，立即执行一次回调函数，后续回调函数由应用trace捕获开关状态变化触发执行。说明：从API version 22开始，支持该接口。 |
| int32_t OH_HiTrace_UnregisterTraceListener(int32_t index); | 注销应用trace捕获开关通知回调。说明：从API version 22开始，支持该接口。 |

注意

[用户态trace格式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hitracemeter-view#用户态trace格式说明)使用竖线 | 作为分隔符，所以通过HiTraceMeter接口传递的字符串类型参数应避免包含该字符，以防止trace解析异常。

### 接口分类

HiTraceMeter打点接口主要分为三类：同步时间片跟踪接口、异步时间片跟踪接口和整数跟踪接口。HiTraceMeter接口实现均为同步，同步和异步针对的是被跟踪的业务。同步业务使用同步时间片跟踪接口，异步业务使用异步时间片跟踪接口。HiTraceMeter打点接口可与[HiTraceChain](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hitracechain-guidelines-ndk)一起使用，进行跨设备、跨进程或跨线程的打点关联与分析。

### 接口使用场景

-   同步时间片跟踪接口
    
    用于顺序执行的打点场景，需按序成对使用OH\_HiTrace\_StartTraceEx()接口和OH\_HiTrace\_FinishTraceEx()接口，否则会导致trace文件在smartperf等可视化工具上显示异常。
    
-   异步时间片跟踪接口
    
    在异步操作执行前调用OH\_HiTrace\_StartAsyncTraceEx()接口进行开始打点，在异步操作完成后调用OH\_HiTrace\_FinishAsyncTraceEx()接口进行结束打点。
    
    解析trace时，通过name和taskId参数识别不同的异步跟踪。所以这两个接口必须按序成对使用，并传入相同的name和taskId。
    
    不同的异步流程中应使用不同的name和taskId，但在异步跟踪流程不会同时发生的情况下，可以使用相同的name和taskId。
    
    调用错误会导致trace文件在smartperf等可视化工具上显示异常。
    
-   整数跟踪接口
    
    用于跟踪整数变量。整数值变动时调用OH\_HiTrace\_CountTraceEx()接口，可在smartperf的泳道图中观察变动情况。由于从开始采集到首次打点存在时间差，这段时间的数值无法查看。
    

### 参数解析

| 参数名 | 类型 | 说明 |
| --- | --- | --- |
| level | enum | 跟踪输出级别，低于系统阈值的跟踪将不会被输出。log版本阈值为HITRACE_LEVEL_INFO，nolog版本阈值为HITRACE_LEVEL_COMMERCIAL。 |
| name | const char* | 要跟踪的任务名称或整数变量名称。 |
| taskId | int32_t | 用来表示关联的ID，如果有多个name相同的任务并行执行，则开发者每次调用OH_HiTrace_StartAsyncTraceEx()时，传入的taskId需不同。 |
| count | int64_t | 整数变量的值。 |
| customCategory | const char* | 自定义聚类名称，用于聚合同一类异步跟踪打点。若不需要聚类，可传入一个空字符串。 |
| customArgs | const char* | 自定义键值对，若有多组键值对，使用逗号进行分隔，例"key1=value1,key2=value2"。若不需要该参数，可传入一个空字符串。 |
| callback | void (*)(bool) | 注册的回调函数。 |
| index | int32_t | OH_HiTrace_RegisterTraceListener()返回的回调索引。 |

说明

[用户态trace](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hitracemeter-view#用户态trace格式说明)总长度限制为512字符，超过部分将会被截断。建议name、customCategory和customArgs三个字段的总长度不超过420字符，以避免trace被截断。

## 开发步骤

以下为一个使用HiTraceMeter打点接口的Native C++应用示例。

### 步骤一：创建项目

1.  在DevEco Studio中新建工程，选择“Native C++”，工程的目录结构如下。
    
    ```
    ├── entry
    │   ├── src
    │       ├── main
    │       │   ├── cpp
    │       │   │   ├── CMakeLists.txt
    │       │   │   ├── napi\_init.cpp
    │       │   │   └── types
    │       │   │       └── libentry
    │       │   │           ├── Index.d.ts
    │       │   │           └── oh-package.json5
    │       │   ├── ets
    │       │   │   ├── entryability
    │       │   │   │   └── EntryAbility.ets
    │       │   │   ├── entrybackupability
    │       │   │   │   └── EntryBackupAbility.ets
    │       │   │   └── pages
    │       │   │       └── Index.ets
    ```
    
2.  在“entry > src > main > cpp > CMakeLists.txt”文件中新增libhitrace\_ndk.z.so和libhilog\_ndk.z.so动态链接库，完整的文件内容如下。
    
    ```
    \# the minimum version of CMake.
    cmake\_minimum\_required(VERSION 3.5.0)
    project(HiTraceChainTest03)
    set(NATIVERENDER\_ROOT\_PATH &#36;{CMAKE\_CURRENT\_SOURCE\_DIR})
    if(DEFINED PACKAGE\_FIND\_FILE)
        include(&#36;{PACKAGE\_FIND\_FILE})
    endif()
    include\_directories(&#36;{NATIVERENDER\_ROOT\_PATH}
                        &#36;{NATIVERENDER\_ROOT\_PATH}/include)
    add\_library(entry SHARED napi\_init.cpp)
    target\_link\_libraries(entry PUBLIC libace\_napi.z.so libhitrace\_ndk.z.so libhilog\_ndk.z.so)
    ```
    
    [CMakeLists.txt](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiTrace/HitraceMeter_NDK/entry/src/main/cpp/CMakeLists.txt#L1-L17)
    
3.  编辑“entry > src > main > cpp > napi\_init.cpp”文件，在Add函数中调用HiTraceMeter NDK\_C接口进行性能打点跟踪，完整的示例代码如下。
    
    ```cpp
    #include <cstdio>
    #include <cstring>
    #include "hilog/log.h"
    #include "hitrace/trace.h"
    #include "napi/native\_api.h"
    #undef LOG\_TAG
    #define LOG\_TAG "traceTest"
    static napi\_value Add(napi\_env env, napi\_callback\_info info)
    {
        // 第一个异步跟踪任务开始
        HiTrace\_Output\_Level level = HITRACE\_LEVEL\_COMMERCIAL;
        constexpr int64\_t taskIdOne = 1001;
        OH\_HiTrace\_StartAsyncTraceEx(level, "myTestAsyncTrace", taskIdOne, "categoryTest", "key=value");
        // 开始计数任务
        int64\_t traceCount = 0;
        traceCount++;
        OH\_HiTrace\_CountTraceEx(level, "myTestCountTrace", traceCount);
        // 业务流程
        OH\_LOG\_INFO(LogType::LOG\_APP, "myTraceTest running, taskId: 1001");
        // 第二个异步跟踪任务开始，同时第一个跟踪的同名任务还没结束，出现了并行执行，对应接口的taskId需要不同
        constexpr int64\_t taskIdTwo = 1002;
        OH\_HiTrace\_StartAsyncTraceEx(level, "myTestAsyncTrace", taskIdTwo, "categoryTest", "key=value");
        // 开始计数任务
        traceCount++;
        OH\_HiTrace\_CountTraceEx(level, "myTestCountTrace", traceCount);
        // 业务流程
        OH\_LOG\_INFO(LogType::LOG\_APP, "myTraceTest running, taskId: 1002");
        // 结束taskId为1001的异步跟踪任务
        OH\_HiTrace\_FinishAsyncTraceEx(level, "myTestAsyncTrace", taskIdOne);
        // 结束taskId为1002的异步跟踪任务
        OH\_HiTrace\_FinishAsyncTraceEx(level, "myTestAsyncTrace", taskIdTwo);
        // 开始同步跟踪任务
        OH\_HiTrace\_StartTraceEx(level, "myTestSyncTrace", "key=value");
        // 业务流程
        OH\_LOG\_INFO(LogType::LOG\_APP, "myTraceTest running, synchronizing trace");
        // 结束同步跟踪任务
        OH\_HiTrace\_FinishTraceEx(level);
        // 若通过HiTraceMeter性能打点接口传递的参数的生成过程比较复杂，此时可以通过isTraceEnabled判断当前是否开启应用trace捕获，
        // 在未开启应用trace捕获时，避免该部分性能损耗
        constexpr int64\_t taskIdThree = 1003;
        constexpr int loopTime = 10;
        if (OH\_HiTrace\_IsTraceEnabled()) {
            char customArgs\[128\] = "key0=value0";
            for (int index = 1; index < loopTime; index++) {
                char buffer\[16\];
                snprintf(buffer, sizeof(buffer), ",key%d=value%d", index, index);
                strncat(customArgs, buffer, sizeof(customArgs) - strlen(customArgs) - 1);
            }
            OH\_HiTrace\_StartAsyncTraceEx(level, "myTestAsyncTrace", taskIdThree, "categoryTest", customArgs);
            OH\_LOG\_INFO(LogType::LOG\_APP, "myTraceTest running, taskId: 1003");
            OH\_HiTrace\_FinishAsyncTraceEx(level, "myTestAsyncTrace", taskIdThree);
        } else {
            OH\_LOG\_INFO(LogType::LOG\_APP, "myTraceTest running, trace is not enabled");
        }
        size\_t requireArgc = 2;
        size\_t argc = 2;
        napi\_value args\[2\] = {nullptr};
        napi\_get\_cb\_info(env, info, &argc, args, nullptr, nullptr);
        napi\_valuetype valuetype0;
        napi\_typeof(env, args\[0\], &valuetype0);
        napi\_valuetype valuetype1;
        napi\_typeof(env, args\[1\], &valuetype1);
        double value0;
        napi\_get\_value\_double(env, args\[0\], &value0);
        double value1;
        napi\_get\_value\_double(env, args\[1\], &value1);
        napi\_value sum;
        napi\_create\_double(env, value0 + value1, &sum);
        return sum;
    }
    EXTERN\_C\_START
    static napi\_value Init(napi\_env env, napi\_value exports)
    {
        napi\_property\_descriptor desc\[\] = {
            { "add", nullptr, Add, nullptr, nullptr, nullptr, napi\_default, nullptr }
        };
        napi\_define\_properties(env, exports, sizeof(desc) / sizeof(desc\[0\]), desc);
        return exports;
    }
    EXTERN\_C\_END
    static napi\_module demoModule = {
        .nm\_version = 1,
        .nm\_flags = 0,
        .nm\_filename = nullptr,
        .nm\_register\_func = Init,
        .nm\_modname = "entry",
        .nm\_priv = ((void\*)0),
        .reserved = { 0 },
    };
    extern "C" \_\_attribute\_\_((constructor)) void RegisterEntryModule(void)
    {
        napi\_module\_register(&demoModule);
    }
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiTrace/HitraceMeter_NDK/entry/src/main/cpp/napi_init.cpp#L16-L127)
    

### 步骤二：采集trace信息并查看

1.  在DevEco Studio Terminal窗口中执行如下命令，开启应用trace捕获。
    
    ```
    PS D:\\xxx\\xxx> hdc shell
    $ hitrace --trace\_begin app
    ```
    
2.  单击DevEco Studio界面上的运行按钮，启动应用。点击应用界面的“Hello World”文本，执行包含HiTraceMeter打点的业务逻辑。然后执行如下命令抓取trace数据，并使用“myTest”关键字过滤trace数据（示例打点接口传递的name字段前缀均为“myTest”）。
    
    ```
    $ hitrace --trace\_dump | grep myTest
    ```
    
    成功抓取的trace数据如下所示。
    
    ```
    <...>-49837   (-------) \[002\] .... 349137.708093: tracing\_mark\_write: S|49837|H:myTestAsyncTrace|1001|M62|categoryTest|key=value
    <...>-49837   (-------) \[002\] .... 349137.708103: tracing\_mark\_write: C|49837|H:myTestCountTrace|1|M62
    <...>-49837   (-------) \[002\] .... 349137.708201: tracing\_mark\_write: S|49837|H:myTestAsyncTrace|1002|M62|categoryTest|key=value
    <...>-49837   (-------) \[002\] .... 349137.708209: tracing\_mark\_write: C|49837|H:myTestCountTrace|2|M62
    <...>-49837   (-------) \[002\] .... 349137.708239: tracing\_mark\_write: F|49837|H:myTestAsyncTrace|1001|M62
    <...>-49837   (-------) \[002\] .... 349137.708246: tracing\_mark\_write: F|49837|H:myTestAsyncTrace|1002|M62
    <...>-49837   (-------) \[002\] .... 349137.708252: tracing\_mark\_write: B|49837|H:myTestSyncTrace|M62|key=value
    <...>-49837   (-------) \[002\] .... 349137.708301: tracing\_mark\_write: S|49837|H:myTestAsyncTrace|1003|M62|categoryTest|key0=value0,key1=value1,key2=value2,key3=value3,key4=value4,key5=value5,key6=value6,key7=value7,key8=value8,key9=value9
    <...>-49837   (-------) \[002\] .... 349137.708323: tracing\_mark\_write: F|49837|H:myTestAsyncTrace|1003|M62
    ```
    

### 步骤三：停止采集trace

1.  执行以下命令，结束应用trace捕获。
    
    ```
    $ hitrace --trace\_finish
    ```
    
2.  再次点击应用界面的“Hello World”文本，此时应用trace捕获已关闭，OH\_HiTrace\_IsTraceEnabled()接口返回false。在DevEco Studio Log窗口使用关键字“not enabled”进行过滤，会打印如下日志。
    
    ```
    myTraceTest running, trace is not enabled
    ```
    
    说明
    
    log版本在使用hitrace --trace\_finish命令停止采集后会自动拉起快照模式，打开应用trace捕获，此时OH\_HiTrace\_IsTraceEnabled()接口返回true，不会打印上述日志。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hitracemeter-guidelines-ndk*