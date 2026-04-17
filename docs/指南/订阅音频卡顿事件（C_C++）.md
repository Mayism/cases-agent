---
title: 订阅音频卡顿事件（C/C++）
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hiappevent-watcher-audio-jank-event-c
category: 指南
updated_at: 2026-03-24T10:58:09.143Z
---

# 订阅音频卡顿事件（C/C++）

## 接口说明

本文介绍如何使用HiAppEvent提供的C/C++接口订阅音频卡顿事件。详细使用说明请参考[HiAppEvent C API文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-hiappevent-h)。

| 接口名 | 描述 |
| --- | --- |
| int OH_HiAppEvent_AddWatcher(HiAppEvent_Watcher *watcher) | 添加应用事件观察者，以添加对应用事件的订阅。 |
| int OH_HiAppEvent_RemoveWatcher(HiAppEvent_Watcher *watcher) | 移除应用事件观察者，以移除对应用事件的订阅。 |

## 开发步骤

1.  获取示例工程的依赖项jsoncpp。
    
    参考[三方开源库jsoncpp代码仓](https://github.com/open-source-parsers/jsoncpp)README中**Amalgamated source**部分，获取jsoncpp.cpp、json.h和json-forwards.h三个文件。
    
2.  新建Native C++工程，并将上述文件导入到新建工程，目录结构如下。
    ```
    entry:
      src:
        main:
          cpp:
            - json:
                - json.h
                - json-forwards.h
            - types:
                libentry:
                  - index.d.ts
            - CMakeLists.txt
            - napi\_init.cpp
            - jsoncpp.cpp
          ets:
            - entryability:
                - EntryAbility.ets
            - pages:
                - Index.ets
    ```
    
3.  在“CMakeLists.txt”文件中，添加源文件和动态库。
    ```
    \# 新增jsoncpp.cpp(解析订阅事件中的json字符串)源文件
    add\_library(entry SHARED napi\_init.cpp jsoncpp.cpp)
    # 新增动态库依赖libhiappevent\_ndk.z.so和libhilog\_ndk.z.so(日志输出)
    target\_link\_libraries(entry PUBLIC libace\_napi.z.so libhilog\_ndk.z.so libhiappevent\_ndk.z.so)
    ```
    
4.  在“napi\_init.cpp”文件中，导入依赖文件，并定义LOG\_TAG。
    ```cpp
    #include "napi/native\_api.h"
    #include "json/json.h"
    #include "hilog/log.h"
    #include "hiappevent/hiappevent.h"
    #undef LOG\_TAG
    #define LOG\_TAG "testTag"
    ```
    
5.  订阅系统事件。
    -   onReceive类型观察者
        
        在“napi\_init.cpp”文件中，定义onReceive类型观察者的方法：
        ```
        //定义变量，用来缓存创建的观察者的指针。
        static HiAppEvent\_Watcher \*systemEventWatcher;
        static void OnReceive(const char \*domain, const struct HiAppEvent\_AppEventGroup \*appEventGroups, uint32\_t groupLen) {
            for (int i = 0; i < groupLen; ++i) {
                for (int j = 0; j < appEventGroups\[i\].infoLen; ++j) {
                    OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.domain=%{public}s", appEventGroups\[i\].appEventInfos\[j\].domain);
                    OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.name=%{public}s", appEventGroups\[i\].appEventInfos\[j\].name);
                    OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.eventType=%{public}d", appEventGroups\[i\].appEventInfos\[j\].type);
                    if (strcmp(appEventGroups\[i\].appEventInfos\[j\].domain, DOMAIN\_OS) \== 0 &&
                        strcmp(appEventGroups\[i\].appEventInfos\[j\].name, EVENT\_AUDIO\_JANK\_FRAME) \== 0) {
                        Json::Value params;
                        Json::Reader reader(Json::Features::strictMode());
                        Json::FastWriter writer;
                        if (reader.parse(appEventGroups\[i\].appEventInfos\[j\].params, params)) {
                            auto time = params\["time"\].asInt64();
                            auto bundleVersion = params\["bundle\_version"\].asString();
                            auto bundleName = params\["bundle\_name"\].asString();
                            auto faultType = params\["fault\_type"\].asString();
                            auto happenTime = params\["happen\_time"\].asInt64();
                            auto maxFrameTime = params\["max\_frame\_time"\].asInt64();
                            OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.time=%{public}ld", time);
                            OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.bundle\_version=%{public}s", bundleVersion.c\_str());
                            OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.bundle\_name=%{public}s", bundleName.c\_str());
                            OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.fault\_type=%{public}s", faultType.c\_str());
                            OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.happen\_time=%{public}ld", happenTime);
                            OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.max\_frame\_time=%{public}ld", maxFrameTime);
                        }
                    }
                }
            }
        }
        static napi\_value RegisterWatcher(napi\_env env, napi\_callback\_info info) {
            // 开发者自定义观察者名称，系统根据观察者名称识别不同的观察者。
            systemEventWatcher = OH\_HiAppEvent\_CreateWatcher("onReceiverWatcher");
            // 订阅的事件为AUDIO\_JANK\_FRAME。
            const char \*names\[\] = {EVENT\_AUDIO\_JANK\_FRAME};
            // 此处开发者订阅了系统事件AUDIO\_JANK\_FRAME。
            OH\_HiAppEvent\_SetAppEventFilter(systemEventWatcher, DOMAIN\_OS, 0, names, 1);
            // 开发者通过调用OH\_HiAppEvent\_SetWatcherOnReceive函数设置已实现的回调函数，观察者接收到事件后会触发OnReceive回调。
            OH\_HiAppEvent\_SetWatcherOnReceive(systemEventWatcher, OnReceive);
            // 启动观察者以监听事件。
            OH\_HiAppEvent\_AddWatcher(systemEventWatcher);
            return {};
        }
        ```
        
    -   onTrigger类型观察者
        
        在“napi\_init.cpp”文件中，定义OnTrigger类型观察者：
        
        ```
        // 开发者可以自行实现获取已监听到事件的回调函数，其中events指针指向内容仅在该函数内有效。
        static void OnTake(const char \*const \*events, uint32\_t eventLen) {
            Json::Reader reader(Json::Features::strictMode());
            Json::FastWriter writer;
            for (int i = 0; i < eventLen; ++i) {
                Json::Value eventInfo;
                if (reader.parse(events\[i\], eventInfo)) {
                    auto domain =  eventInfo\["domain\_"\].asString();
                    auto name = eventInfo\["name\_"\].asString();
                    auto type = eventInfo\["type\_"\].asInt();
                    OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.domain=%{public}s", domain.c\_str());
                    OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.name=%{public}s", name.c\_str());
                    OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.eventType=%{public}d", type);
                    if (domain ==  DOMAIN\_OS && name == EVENT\_AUDIO\_JANK\_FRAME) {
                        auto time = eventInfo\["time"\].asInt64();
                        auto bundleVersion = eventInfo\["bundle\_version"\].asString();
                        auto bundleName = eventInfo\["bundle\_name"\].asString();
                        auto faultType = eventInfo\["fault\_type"\].asString();
                        auto happenTime = eventInfo\["happen\_time"\].asInt64();
                        auto maxFrameTime = eventInfo\["max\_frame\_time"\].asInt64();
                        OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.time=%{public}ld", time);
                        OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.bundle\_version=%{public}s", bundleVersion.c\_str());
                        OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.bundle\_name=%{public}s", bundleName.c\_str());
                        OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.fault\_type=%{public}s", faultType.c\_str());
                        OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.happen\_time=%{public}ld", happenTime);
                        OH\_LOG\_INFO(LogType::LOG\_APP, "HiAppEvent eventInfo.params.max\_frame\_time=%{public}ld", maxFrameTime);
                    }
                }
            }
        }
        // 开发者可以自行实现订阅回调函数，以便对获取到的事件打点数据进行自定义处理。
        static void OnTrigger(int row, int size) {
            // 接收回调后，获取指定数量的已接收事件。
            OH\_HiAppEvent\_TakeWatcherData(systemEventWatcher, row, OnTake);
        }
        static napi\_value RegisterWatcher(napi\_env env, napi\_callback\_info info) {
            // 开发者自定义观察者名称，系统根据不同的名称来识别不同的观察者。
            systemEventWatcher = OH\_HiAppEvent\_CreateWatcher("onTriggerWatcher");
            // 设置订阅的事件为EVENT\_AUDIO\_JANK\_FRAME。
            const char \*names\[\] \= {EVENT\_AUDIO\_JANK\_FRAME};
            // 开发者订阅感兴趣的事件，此处订阅了系统事件。
            OH\_HiAppEvent\_SetAppEventFilter(systemEventWatcher, DOMAIN\_OS, 0, names, 1);
            // 开发者设置已实现的回调函数，需OH\_HiAppEvent\_SetTriggerCondition设置的条件满足方可触发。
            OH\_HiAppEvent\_SetWatcherOnTrigger(systemEventWatcher, OnTrigger);
            // 开发者可以设置订阅触发回调的条件，此处是设置新增事件打点数量为1个时，触发onTrigger回调。
            OH\_HiAppEvent\_SetTriggerCondition(systemEventWatcher, 1, 0, 0);
            // 使观察者开始监听订阅的事件。
            OH\_HiAppEvent\_AddWatcher(systemEventWatcher);
            return {};
        }
        ```
        
6.  将RegisterWatcher注册为ArkTS接口。
    
    在“napi\_init.cpp”文件中，将RegisterWatcher注册为ArkTS接口：
    
    ```
    static napi\_value Init(napi\_env env, napi\_value exports)
    {
        napi\_property\_descriptor desc\[\] = {
            { "registerWatcher", nullptr, RegisterWatcher, nullptr, nullptr, nullptr, napi\_default, nullptr }
        };
    napi\_define\_properties(env, exports, sizeof(desc) / sizeof(desc\[0\]), desc);
    return exports;
    }
    ```
    
    在“index.d.ts”文件中，定义ArkTS接口：
    
    ```typescript
    export const registerWatcher: () => void;
    ```
    
7.  在“EntryAbility.ets”文件的onCreate()函数中添加接口调用。
    ```typescript
    // 导入依赖模块
    import testNapi from 'libentry.so';
    // 在onCreate()函数中新增接口调用
    // 启动时，注册系统事件观察者
    testNapi.registerWatcher();
    ```
    
8.  编辑工程中的“entry > src > main > ets > pages > Index.ets”文件，添加一个模拟写入音频数据回调函数normalCallback，在该回调中模拟卡顿主动返回INVALID（不送数据）来触发卡顿故障事件。
    ```
    let g\_invalidCount = 0;
    function normalCallback(buffer: ArrayBuffer) {
      if (g\_invalidCount > 0) {
        g\_invalidCount--;
        return audio.AudioDataCallbackResult.INVALID;
      }
      //在此添加写数据逻辑
      return audio.AudioDataCallbackResult.VALID;
    }
    ```
    
9.  编辑工程中的“entry > src > main > ets > pages > Index.ets”文件，添加一个卡顿触发按钮，改变INVALID返回次数，模拟相应音频卡顿。
    ```
    Row() {
      Button("卡顿").onClick(async () => {
        g\_invalidCount = 30;
      })
    }
    ```
    
10.  编辑工程中的“entry > src > main > ets > pages > Index.ets”文件，在创建AudioRender实例时，进行耗时操作回调
     ```
     audio.createAudioRenderer(audioRendererOptions, (err, renderer) => { // 创建AudioRenderer实例
       if (!err) {
         console.info(\`${TAG}: creating AudioRenderer success\`);
         this.renderModel = renderer;
         if (this.renderModel !== undefined) {
           this.renderModel.on('writeData', normalCallback);
         }
       } else {
         console.info(\`${TAG}: creating AudioRenderer failed, error: ${err.message}\`);
       }
     });
     ```
     
11.  AudioRender正常播放时，点击卡顿按钮，即可触发耗时回调，触发音频卡顿事件。
12.  每次音频卡顿触发后，可以在Log窗口看到对系统事件数据的处理日志。
     ```
     HiAppEvent eventInfo.domain=OS
     HiAppEvent eventInfo.name=AUDIO\_JANK\_FRAME
     HiAppEvent eventInfo.eventType=1
     HiAppEvent eventInfo.params.time=1762739184665
     HiAppEvent eventInfo.params.bundle\_version=1.0.0
     HiAppEvent eventInfo.params.bundle\_name=com.samples.audio
     HiAppEvent eventInfo.params.fault\_type=application
     HiAppEvent eventInfo.params.happen\_time=176273918
     HiAppEvent eventInfo.params.max\_frame\_time=220
     ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hiappevent-watcher-audio-jank-event-c*