---
title: 使用HiCollie检测业务线程卡死卡顿问题（C/C++）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hicollie-guidelines-ndk
category: 指南
updated_at: 2026-03-24T10:58:19.810Z
---

# 使用HiCollie检测业务线程卡死卡顿问题（C/C++）

## 简介

用户在使用应用时，如果出现点击无反应或应用无响应等情况，并且持续时间超过一定限制，就会被定义为[应用冻屏](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/appfreeze-guidelines)。本文面向开发者介绍HiCollie模块对外提供检测业务线程卡死、卡顿，以及上报卡死事件的能力。

说明

在非主线程使用相关接口。

## 接口说明

| 接口名 | 描述 |
| --- | --- |
| OH_HiCollie_Init_StuckDetection | 注册应用业务线程卡死的周期性检测任务。用户实现回调函数, 用于定时检测业务线程卡死情况。默认检测时间：3s上报BUSSINESS_THREAD_BLOCK_3S告警事件，6s上报BUSSINESS_THREAD_BLOCK_6S卡死事件。 |
| OH_HiCollie_Init_StuckDetectionWithTimeout | 注册应用业务线程卡死的周期性检测任务。用户实现回调函数, 用于定时检测业务线程卡死情况。开发者可以设置卡死检测时间，可设置的时间范围：[3, 15]，单位：s。说明：从API version 18开始，支持该接口。 |
| OH_HiCollie_Init_JankDetection | 注册应用业务线程卡顿检测的回调函数。线程卡顿监控功能需要开发者实现两个卡顿检测回调函数，分别放在业务线程处理事件的前后。作为插桩函数，监控业务线程处理事件执行情况。 |
| OH_HiCollie_Report | 上报应用业务线程卡死事件，生成卡死故障日志，辅助定位应用卡死问题。先调用OH_HiCollie_Init_StuckDetection或OH_HiCollie_Init_StuckDetectionWithTimeout接口，初始化检测的task。如果task任务超时，结合业务逻辑，调用OH_HiCollie_Report接口上报卡死事件。 |

API接口的具体使用说明（参数使用限制、具体取值范围等）请参考[HiCollie](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-hicollie-h)。

## 检测原理

1.  业务线程卡顿OH\_HiCollie\_Init\_JankDetection故障规格，请参考[主线程超时事件检测原理](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hiappevent-watcher-mainthreadjank-events#检测原理)。
    
2.  业务线程卡死故障：
    
    （1）OH\_HiCollie\_Init\_StuckDetection检测原理：应用的watchdog线程会周期性进行业务线程判活检测。当判活检测超过3s没有被执行，上报BUSSINESS\_THREAD\_BLOCK\_3S线程告警事件；超过6s依然没有被执行，会上报BUSSINESS\_THREAD\_BLOCK\_6S线程卡死事件。两个事件根据系统匹配规则生成appfreeze故障日志。
    
    （2）OH\_HiCollie\_Init\_StuckDetectionWithTimeout检测原理：应用的watchdog线程会周期性进行业务线程判活检测。当判活检测超过stuckTimeout时间没有被执行，上报BUSSINESS\_THREAD\_BLOCK\_3S告警事件；超过stuckTimeout \* 2时间，依然没有被执行，会上报BUSSINESS\_THREAD\_BLOCK\_6S线程卡死事件。两个事件匹配生成appfreeze故障日志。
    

## 日志规格

1.  业务线程卡死故障日志以appfreeze-开头，生成在“设备/data/log/faultlog/faultlogger/”路径下。该日志文件名格式为“appfreeze-应用包名-应用UID-毫秒级时间”。具体规格可参考[应用冻屏（AppFreeze）日志规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/appfreeze-guidelines#日志规格)。
    
2.  OH\_HiCollie\_Init\_StuckDetection日志规格，请参考[主线程超时事件日志规格](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/apptask-timeout-guidelines#日志规格)。
    

## 开发步骤

下文将展示如何在应用内增加一个按钮，并单击该按钮以调用HiCollie Ndk接口。

1.  新建Native C++工程，目录结构如下：
    
    ```
    entry:
      src:
        main:
          cpp:
            types:
              libentry:
                - index.d.ts
            - CMakeLists.txt
            - napi\_init.cpp
          ets:
            entryability:
              - EntryAbility.ts
            pages:
              - Index.ets
    ```
    
2.  编辑“CMakeLists.txt”文件，添加源文件及动态库：
    
    ```
    \# 新增动态库依赖libhilog\_ndk.z.so(日志输出)
    target\_link\_libraries(entry PUBLIC libace\_napi.z.so libhilog\_ndk.z.so libohhicollie.so)
    ```
    
3.  编辑“napi\_init.cpp”文件，导入依赖的文件，定义LOG\_TAG，下述代码步骤用于模拟卡死卡顿场景，具体使用请结合业务需要。示例代码如下：
    
    （1）**应用线程卡顿检测**： OH\_HiCollie\_Init\_JankDetection，示例代码如下：
    
    ```cpp
    #include <thread>
    #include <string>
    #include <unistd.h>
    #include "napi/native\_api.h"
    #include "hilog/log.h"
    #include "hicollie/hicollie.h"
    #undef LOG\_TAG
    #define LOG\_TAG "JankTest"
    //定义两个回调函数对象
    static OH\_HiCollie\_BeginFunc beginFunc\_;
    static OH\_HiCollie\_EndFunc endFunc\_;
    //定义监控应用显示开始、结束的回调函数
    void InitBeginFunc(const char\* eventName)
    {
        std::string str(eventName);
        OH\_LOG\_INFO(LogType::LOG\_APP, "InitBeginFunc eventName: %{public}s", str.c\_str());
    }
    void InitEndFunc(const char\* eventName)
    {
        std::string str(eventName);
        OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_EndFunc eventName: %{public}s", str.c\_str());
    }
    void StartDelayTimer()
    {
      //等待1s
      std::chrono::seconds delay(1);
      OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Init\_JankDetection delay before");
      std::this\_thread::sleep\_for(delay);
      OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Init\_JankDetection delay after");
    }
    //定义子线程回调函数
    void TestJankDetection()
    {
        // 初始化回调函数参数
        beginFunc\_ = InitBeginFunc;
        endFunc\_ = InitEndFunc;
        HiCollie\_DetectionParam param {0};
        // 初始化线程卡顿监控函数
        int initResult = OH\_HiCollie\_Init\_JankDetection(&beginFunc\_, &endFunc\_, param);
        // 线程启动1s内，不进行检测
        StartDelayTimer();
        // 成功结果：0
        OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Init\_JankDetection: %{public}d", initResult);
        int count = 0;
        while (count < 3) {
            // 设置处理开始回调函数，监控线程任务执行开始时长
            beginFunc\_("TestBegin");
            // 休眠350ms，模拟任务线程处理事件卡顿场景
            usleep(350 \* 1000);
            // 设置处理结束回调函数，监控线程任务执行结束时长
            endFunc\_("TestEnd");
            count++;
        }
    }
    static napi\_value TestHiCollieJankNdk(napi\_env env, napi\_callback\_info info)
    {
        // 创建子线程
        std::thread threadObj(TestJankDetection);
        // 执行TestJankDetection任务
        threadObj.join();
        return 0;
    }
    EXTERN\_C\_START
    static napi\_value Init(napi\_env env, napi\_value exports)
    {
        napi\_property\_descriptor desc\[\] = {
            { "testHiCollieJankNdk", nullptr, TestHiCollieJankNdk, nullptr, nullptr, nullptr, napi\_default, nullptr },
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
    
    （2）**应用线程卡死检测**： OH\_HiCollie\_Init\_StuckDetection, 示例代码如下：
    
    ```cpp
    #include "napi/native\_api.h"
    #include "hilog/log.h"
    #include "hicollie/hicollie.h"
    #include <atomic>
    #include <thread>
    #include <string>
    #include <unistd.h>
    #undef LOG\_TAG
    #define LOG\_TAG "StruckTest"
    // 自定义阻塞时间，模拟卡死场景，单位：s
    const int64\_t BLOCK\_TIME = 3;
    // 设置应用线程执行任务情况标志位, true-正常，false-卡死
    std::shared\_ptr<std::atomic<bool>> appThreadIsAlive\_ = std::make\_shared<std::atomic<bool>>(true);
    // 设置上报应用线程卡死事件标志位
    std::shared\_ptr<std::atomic<bool>> isSixSecondEvent\_ = std::make\_shared<std::atomic<bool>>(false);
    void ReportEvent() {
        bool temp = isSixSecondEvent\_->load();
        int reportResult = OH\_HiCollie\_Report(&temp);
        // 成功：0
        OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Report: %{public}d, isSixSecondEvent: %{public}d", reportResult, isSixSecondEvent\_->load());
        isSixSecondEvent\_->store(temp);
    }
    void SetTimeout()
    {
      int64\_t now = std::chrono::duration\_cast<std::chrono::milliseconds>(std::chrono::
        system\_clock::now().time\_since\_epoch()).count();
      sleep(BLOCK\_TIME);
      int64\_t currentTime = std::chrono::duration\_cast<std::chrono::milliseconds>(std::chrono::
        system\_clock::now().time\_since\_epoch()).count();
      if (currentTime - now < BLOCK\_TIME) {
        appThreadIsAlive\_->store(true);
        return;
      }
      appThreadIsAlive\_->store(false);
    }
    // 开发者可自定义周期性检测任务
    void Timer()
    {
      // 每隔3s检查应用是否正常执行任务
      if (appThreadIsAlive\_->load()) {
        OH\_LOG\_INFO(LogType::LOG\_APP, "Check appThread isAlive.");
        // 更新appThreadIsAlive\_，正常执行下次检测时为true
        appThreadIsAlive\_->store(false);
        // 模拟超时场景
        SetTimeout();
        return;
      }
      ReportEvent();
    }
    //定义子线程回调函数
    void InitStuckDetection()
    {
      // 初始化线程卡死监控函数
      int initResult = OH\_HiCollie\_Init\_StuckDetection(Timer);
      // 成功结果：0
      OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Init\_StuckDetection: %{public}d", initResult);
    }
    static napi\_value TestHiCollieStuckNdk(napi\_env env, napi\_callback\_info info)
    {
      // 创建子线程
      std::thread threadObj(InitStuckDetection);
      // 执行任务
      threadObj.join();
      return 0;
    }
    EXTERN\_C\_START
    static napi\_value Init(napi\_env env, napi\_value exports)
    {
        napi\_property\_descriptor desc\[\] = {
            { "testHiCollieStuckNdk", nullptr, TestHiCollieStuckNdk, nullptr, nullptr, nullptr, napi\_default, nullptr },
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
    
    （3）**应用线程卡死检测，自定义检测时间**： OH\_HiCollie\_Init\_StuckDetectionWithTimeout，示例代码如下：
    
    ```cpp
    #include "napi/native\_api.h"
    #include "hilog/log.h"
    #include "hicollie/hicollie.h"
    #include <thread>
    #include <string>
    #include <unistd.h>
    #undef LOG\_TAG
    #define LOG\_TAG "StruckTest"
    // 自定义休眠时间，模拟卡死场景
    const int64\_t BLOCK\_TIME = 5;
    // 设置应用线程执行任务情况标志位, true-正常， false-卡死
    std::shared\_ptr<std::atomic<bool>> appThreadIsAlive\_ = std::make\_shared<std::atomic<bool>>(true);
    // 设置上报应用线程卡死事件标志位
    std::shared\_ptr<std::atomic<bool>> isSixSecondEvent\_ = std::make\_shared<std::atomic<bool>>(false);
    void ReportEvent() {
        bool temp = isSixSecondEvent\_->load();
        int reportResult = OH\_HiCollie\_Report(&temp);
        // 成功：0
        OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Report: %{public}d, isSixSecondEvent: %{public}d", reportResult, isSixSecondEvent\_->load());
        isSixSecondEvent\_->store(temp);
    }
    void SetTimeout()
    {
      int64\_t now = std::chrono::duration\_cast<std::chrono::milliseconds>(std::chrono::
        system\_clock::now().time\_since\_epoch()).count();
      sleep(BLOCK\_TIME);
      int64\_t currentTime = std::chrono::duration\_cast<std::chrono::milliseconds>(std::chrono::
        system\_clock::now().time\_since\_epoch()).count();
      if (currentTime - now < BLOCK\_TIME) {
        appThreadIsAlive\_->store(true);
        return;
      }
      appThreadIsAlive\_->store(false);
    }
    // 开发者可自定义周期性检测任务
    void Timer()
    {
      // 每隔5s检查应用是否正常执行任务
      if (appThreadIsAlive\_->load()) {
        OH\_LOG\_INFO(LogType::LOG\_APP, "Check appThread isAlive.");
        // 更新appThreadIsAlive\_，正常执行下次检测时为true
        appThreadIsAlive\_->store(false);
        // 模拟超时场景
        SetTimeout();
        return;
      }
      ReportEvent();
    }
    //定义子线程回调函数
    void InitStuckDetectionWithTimeout()
    {
      // 初始化线程卡死监控函数
      int initResult = OH\_HiCollie\_Init\_StuckDetectionWithTimeout(Timer, BLOCK\_TIME);
      // 成功结果：0
      OH\_LOG\_INFO(LogType::LOG\_APP, "OH\_HiCollie\_Init\_StuckDetection: %{public}d", initResult);
    }
    static napi\_value TestHiCollieStuckWithTimeoutNdk(napi\_env env, napi\_callback\_info info)
    {
      // 创建子线程
      std::thread threadObj(InitStuckDetectionWithTimeout);
      // 执行任务
      threadObj.join();
      return 0;
    }
    EXTERN\_C\_START
    static napi\_value Init(napi\_env env, napi\_value exports)
    {
        napi\_property\_descriptor desc\[\] = {
            { "testHiCollieStuckWithTimeoutNdk", nullptr, TestHiCollieStuckWithTimeoutNdk, nullptr, nullptr, nullptr, napi\_default, nullptr },
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
    
4.  将TestHiCollieNdk注册为ArkTS接口。
    
    （1）OH\_HiCollie\_Init\_JankDetection示例，编辑“index.d.ts”文件，定义ArkTS接口：
    
    ```typescript
    export const testHiCollieJankNdk: () => void;
    ```
    
    （2）OH\_HiCollie\_Init\_StuckDetection示例，编辑“index.d.ts”文件，定义ArkTS接口：
    
    ```typescript
    export const testHiCollieStuckNdk: () => void;
    ```
    
    （3）OH\_HiCollie\_Init\_StuckDetectionWithTimeout示例，编辑“index.d.ts”文件，定义ArkTS接口：
    
    ```typescript
    export const testHiCollieStuckWithTimeoutNdk: () => void;
    ```
    
5.  编辑“Index.ets”文件：
    
    ```typescript
    import testNapi from 'libentry.so'
    @Entry
    @Component
    struct Index {
      build() {
        RelativeContainer() {
          Column() {
            //选择下方对应的功能，可在此处添加不同的点击事件
          }
          .width('100%')
        }
        .height('100%')
        .width('100%')
      }
    }
    ```
    
    （1）添加点击事件，触发OH\_HiCollie\_Init\_JankDetection方法。
    
    ```
    Column() {
      Button("testHiCollieJankNdk", { stateEffect:true, type: ButtonType.Capsule})
        .width('75%')
        .height(50)
        .margin(15)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(testNapi.testHiCollieJankNdk);
    }
    ```
    
    （2）添加点击事件，触发OH\_HiCollie\_Init\_StuckDetection方法。
    
    ```
    Column() {
      Button("testHiCollieStuckNdk", { stateEffect:true, type: ButtonType.Capsule})
        .width('75%')
        .height(50)
        .margin(15)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(testNapi.testHiCollieStuckNdk);
    }
    ```
    
    （3）添加点击事件，触发OH\_HiCollie\_Init\_StuckDetectionWithTimeout方法。
    
    ```
    Column() {
      Button("testHiCollieStuckWithTimeoutNdk", { stateEffect:true, type: ButtonType.Capsule})
        .width('75%')
        .height(50)
        .margin(15)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(testNapi.testHiCollieStuckWithTimeoutNdk);
    }
    ```
    
6.  点击DevEco Studio界面中的运行按钮，运行应用工程。
    
7.  在DevEco Studio的底部，切换到“Log”窗口，过滤自定义的LOG\_TAG。
    
    （1）点击“testHiCollieJankNdk”按钮。
    
    此时窗口将显示通过OH\_HiCollie\_Init\_JankDetection接口获取的应用业务线程采样栈的超时信息。可以通过订阅hiappevent获取对应的事件，参见[订阅主线程超时事件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hiappevent-watcher-mainthreadjank-events-arkts)。
    
    （2）点击“testHiCollieStuckNdk”按钮。
    
    此时窗口将显示通过OH\_HiCollie\_Init\_StuckDetection接口，初始化卡死检测回调函数。可以根据实际业务场景，自行定义卡死检测函数。
    
    （3）点击“testHiCollieStuckWithTimeoutNdk”按钮。
    
    此时窗口将显示通过OH\_HiCollie\_Init\_StuckDetectionWithTimeout接口，初始化卡死检测回调函数。可以根据实际业务场景，自行定义卡死检测函数，及卡死检测时间。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hicollie-guidelines-ndk*