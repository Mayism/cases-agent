---
title: HiDebug接口使用示例(C/C++)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hidebug-guidelines-ndk
category: 指南
updated_at: 2026-03-24T10:58:21.413Z
---

# HiDebug接口使用示例(C/C++)

HiDebug C/C++接口功能独立，需要获取调试信息时直接调用。具体调用示例请参考下文。

## 通用开发示例

下文展示如何在应用内使用HiDebug NDK接口以进行线程栈回溯，且获取进程内线程的CPU使用率：

步骤一：创建项目

1.  使用DevEco Studio新建一个Native C++工程，并新增文件“test\_backtrace.cpp”与“test\_backtrace.h”，目录结构如下：
    
    ```
    entry:
      src:
        main:
          cpp:
            - types:
              - libentry:
                - index.d.ts
            - CMakeLists.txt
            - napi\_init.cpp
            - test\_backtrace.cpp
            - test\_backtrace.h
          ets:
            pages:
              - Index.ets
    ```
    
2.  编辑“test\_backtrace.h”文件，内容如下：
    
    ```
    #ifndef MYAPPLICATION\_TESTBACKTRACE\_H
    #define MYAPPLICATION\_TESTBACKTRACE\_H
    void BacktraceCurrentThread();
    #endif // MYAPPLICATION\_TESTBACKTRACE\_H
    ```
    
    [test\_backtrace.h](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/cpp/test_backtrace.h#L16-L23)
    
3.  编辑“test\_backtrace.cpp”文件, 内容如下：
    
    ```cpp
    #include "test\_backtrace.h"
    #include <condition\_variable>
    #include <csignal>
    #include <unistd.h>
    #include <sys/syscall.h>
    #include "hidebug/hidebug.h"
    #include "hilog/log.h"
    #define MAX\_FRAME\_SIZE 256 // 最大栈回溯深度，应根据业务场景调整该值。
    namespace {
        constexpr auto LOG\_PRINT\_DOMAIN = 0xFF00;
    }
    class BackTraceObject { // 封装了抓栈过程中需要使用的资源，在使用过程中请注意线程安全和异步信号安全。
    public:
        static BackTraceObject& GetInstance();
        BackTraceObject(const BackTraceObject&) = delete;
        BackTraceObject& operator=(const BackTraceObject&) = delete;
        BackTraceObject(BackTraceObject&&) = delete;
        BackTraceObject& operator=(BackTraceObject&&) = delete;
        bool Init(uint32\_t size);
        void Release();
        int BackTraceFromFp(void\* startFp, int size); // 该函数异步信号安全。
        void SymbolicAddress(int index); // 该函数耗费性能，请避免频繁调用。
        void PrintStackFrame(void\* pc, const HiDebug\_StackFrame& frame);
    private:
        BackTraceObject() = default;
        ~BackTraceObject() = default;
        HiDebug\_Backtrace\_Object backtraceObject\_ = nullptr;
        void\*\* pcs\_ = nullptr;
    };
    BackTraceObject& BackTraceObject::GetInstance() // 单例模式，用于信号处理和请求抓栈线程的数据交互。注意该类非异步信号安全，业务逻辑应确保同一时刻仅单个线程访问。
    {
        static BackTraceObject instance;
        return instance;
    }
    bool BackTraceObject::Init(uint32\_t size) // 初始化资源。
    {
        backtraceObject\_ = OH\_HiDebug\_CreateBacktraceObject();
        if (backtraceObject\_ == nullptr || size > MAX\_FRAME\_SIZE) {
            return false;
        }
        pcs\_ = new (std::nothrow) void\* \[size\]{nullptr};
        if (pcs\_ == nullptr) {
            return false;
        }
        return true;
    }
    void BackTraceObject::Release() // 释放资源。
    {
        OH\_HiDebug\_DestroyBacktraceObject(backtraceObject\_);
        backtraceObject\_ = nullptr;
        delete\[\] pcs\_;
        pcs\_ = nullptr;
    }
    int BackTraceObject::BackTraceFromFp(void\* startFp, int size) // 栈回溯获取pc地址。
    {
        if (size <= MAX\_FRAME\_SIZE) {
            return OH\_HiDebug\_BacktraceFromFp(backtraceObject\_, startFp, pcs\_, size); // OH\_HiDebug\_BacktraceFromFp接口调用示例。
        }
        return 0;
    }
    void BackTraceObject::PrintStackFrame(void\* pc, const HiDebug\_StackFrame& frame) // 输出栈内容。
    {
        if (frame.type == HIDEBUG\_STACK\_FRAME\_TYPE\_JS) { // 根据栈帧的类型，区分不同的栈帧输出方式。
            OH\_LOG\_Print(LOG\_APP, LOG\_INFO, LOG\_PRINT\_DOMAIN, "testTag",
                "js stack frame info for pc: %{public}p is "
                "relativePc: %{public}p "
                "line: %{public}d "
                "column: %{public}d "
                "mapName: %{public}s "
                "functionName: %{public}s "
                "url: %{public}s "
                "packageName: %{public}s.",
                pc,
                reinterpret\_cast<void\*>(frame.frame.js.relativePc),
                frame.frame.js.line,
                frame.frame.js.column,
                frame.frame.js.mapName,
                frame.frame.js.functionName,
                frame.frame.js.url,
                frame.frame.js.packageName);
        } else {
            OH\_LOG\_Print(LOG\_APP, LOG\_INFO, LOG\_PRINT\_DOMAIN, "testTag",
                "native stack frame info for pc: %{public}p is "
                "relativePc: %{public}p "
                "funcOffset: %{public}p "
                "mapName: %{public}s "
                "functionName: %{public}s "
                "buildId: %{public}s "
                "reserved: %{public}s.",
                pc,
                reinterpret\_cast<void\*>(frame.frame.native.relativePc),
                reinterpret\_cast<void\*>(frame.frame.native.funcOffset),
                frame.frame.native.mapName,
                frame.frame.native.functionName,
                frame.frame.native.buildId,
                frame.frame.native.reserved);
        }
    }
    void BackTraceObject::SymbolicAddress(int index)  // 栈解析接口。
    {
        if (index < 0 || index >= MAX\_FRAME\_SIZE) {
            return;
        }
        OH\_HiDebug\_SymbolicAddress(backtraceObject\_, pcs\_\[index\], this,
            \[\] (void\* pc, void\* arg, const HiDebug\_StackFrame\* frame) {
                reinterpret\_cast<BackTraceObject\*>(arg)->PrintStackFrame(pc, \*frame);
            }); // 调用OH\_HiDebug\_SymbolicAddress接口解析栈。
    }
    void BacktraceCurrentThread() // 该接口非线程安全，同一时刻只能由一个线程使用。
    {
        if (!BackTraceObject::GetInstance().Init(MAX\_FRAME\_SIZE)) { // 注意：在调用栈回溯函数之前，需申请资源，且不可重复初始化。
            BackTraceObject::GetInstance().Release();
            OH\_LOG\_Print(LOG\_APP, LOG\_WARN, LOG\_PRINT\_DOMAIN, "testTag", "failed init backtrace object.");
            return;
        }
        int pcSize = BackTraceObject::GetInstance().BackTraceFromFp(\_\_builtin\_frame\_address(0), MAX\_FRAME\_SIZE);
        for (int i = 0; i < pcSize; i++) {
            BackTraceObject::GetInstance().SymbolicAddress(i); // 主线程获取pc后，对pc值进行栈解析。
        }
        BackTraceObject::GetInstance().Release(); // 栈回溯并且解析结束后，及时释放资源。
    }
    ```
    
    [test\_backtrace.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/cpp/test_backtrace.cpp#L16-L148)
    
4.  编辑“CMakeLists.txt”文件，添加库依赖：
    
    ```
    \# 新增动态库依赖libohhidebug.so和libhilog\_ndk.z.so（日志输出）
    add\_library(entry SHARED napi\_init.cpp test\_backtrace.cpp)
    target\_link\_libraries(entry PUBLIC libace\_napi.z.so libhilog\_ndk.z.so libohhidebug.so)
    ```
    
5.  编辑“napi\_init.cpp”文件，导入依赖文件并定义测试方法：
    
    ```cpp
    #include <thread>
    #include "hidebug/hidebug.h"
    #include "hilog/log.h"
    #include "test\_backtrace.h"
    #undef LOG\_TAG
    #define LOG\_TAG "testTag"
    \_\_attribute((noinline)) \_\_attribute((optnone)) void TestNativeFrames(int i)
    {
        if (i > 0) {
            TestNativeFrames(i - 1);
            return;
        }
        BacktraceCurrentThread();
    }
    \_\_attribute((noinline)) \_\_attribute((optnone)) napi\_value TestBackTrace(napi\_env env, napi\_callback\_info info)
    {
        TestNativeFrames(1);
        return nullptr;
    }
    napi\_value TestGetThreadCpuUsage(napi\_env env, napi\_callback\_info info)
    {
        HiDebug\_ThreadCpuUsagePtr cpuUsage = OH\_HiDebug\_GetAppThreadCpuUsage();
        while (cpuUsage != nullptr) {
            OH\_LOG\_INFO(LogType::LOG\_APP,
                "GetAppThreadCpuUsage: threadId %{public}d, cpuUsage: %{public}f", cpuUsage->threadId, cpuUsage->cpuUsage);
            cpuUsage = cpuUsage->next; // 获取下一个线程的cpu使用率对象指针。
        }
        OH\_HiDebug\_FreeThreadCpuUsage(&cpuUsage); // 释放内存，防止内存泄露。
        return nullptr;
    }
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/cpp/napi_init.cpp#L19-L54)
    
    注册“TestHiDebugNdk”为ArkTS接口并初始化主线程的信号处理函数：
    
    ```
    napi\_property\_descriptor desc\[\] = {
        { "testGetThreadCpuUsage", nullptr, TestGetThreadCpuUsage, nullptr, nullptr, nullptr, napi\_default, nullptr },
        { "testBackTrace", nullptr, TestBackTrace, nullptr, nullptr, nullptr, napi\_default, nullptr },
    };
    ```
    
    [napi\_init.cpp](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/cpp/napi_init.cpp#L59-L64)
    
6.  编辑“index.d.ts”文件，声明ArkTS接口：
    
    ```typescript
    export const testGetThreadCpuUsage: () => void;
    export const testBackTrace: () => void;
    ```
    
    [Index.d.ts](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/cpp/types/libentry/Index.d.ts#L16-L19)
    
7.  编辑“Index.ets”文件，添加触发接口调用的按钮，示例代码如下：
    
    导入依赖：
    
    ```typescript
    import testNapi from 'libentry.so';
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/ets/pages/Index.ets#L21-L23)
    
    定义测试方法：
    
    ```
    function testBackTraceJsFrame(i : number) : void {
      if (i > 0) {
        return testBackTraceJsFrame(i-1);
      }
      return testNapi.testBackTrace();
    }
    function testBackTrace() : void {
      testBackTraceJsFrame(3);
    }
    function testGetThreadCpuUsage() : void {
      testNapi.testGetThreadCpuUsage();
    }
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/ets/pages/Index.ets#L36-L51)
    
    添加按钮以触发接口调用：
    
    ```
    Button('testGetThreadCpuUsage')
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('60%')
      .height('5%')
      // 添加点击事件
      .onClick(testGetThreadCpuUsage);
    Button('testHiDebugBackTrace')
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('60%')
      .height('5%')
      // 添加点击事件
      .onClick(testBackTrace);
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/guide-snippets/blob/HarmonyOS-feature-20251117/PerformanceAnalysisKit/HiDebugTool/entry/src/main/ets/pages/Index.ets#L72-L94)
    

步骤二：运行工程

1.  点击DevEco Studio界面中的运行按钮，然后分别单击应用界面上的“testGetThreadCpuUsage”和“testHiDebugBackTrace”按钮。
    
2.  在DevEco Studio底部切换到“Log”窗口，设置日志过滤条件为“testTag”，即可查看相关日志：
    
    ```
    ...
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19261, cpuUsage: 0.000104
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19381, cpuUsage: 0.000000
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19382, cpuUsage: 0.000040
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19383, cpuUsage: 0.000010
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19384, cpuUsage: 0.000001
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19386, cpuUsage: 0.000038
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19387, cpuUsage: 0.000000
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19388, cpuUsage: 0.000007
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19389, cpuUsage: 0.000004
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19390, cpuUsage: 0.000007
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19391, cpuUsage: 0.000006
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19393, cpuUsage: 0.000001
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19394, cpuUsage: 0.000004
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19397, cpuUsage: 0.000002
    10-22 15:46:05.933   19261-19261   A00000/com.sam...gtool/testTag  com.sampl...ebugtool  I     GetAppThreadCpuUsage: threadId 19401, cpuUsage: 0.000001
    ...
    10-22 15:46:13.351   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     native stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* funcOffset: 0x38 mapName: /data/storage/el1/bundle/libs/arm64/libentry.so functionName: TestNativeFrames(int) buildId: b6d3429f6e2e594b1c696e13049dae7e51694099 reserved: (null).
    10-22 15:46:13.351   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     native stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* funcOffset: 0x30 mapName: /data/storage/el1/bundle/libs/arm64/libentry.so functionName: TestNativeFrames(int) buildId: b6d3429f6e2e594b1c696e13049dae7e51694099 reserved: (null).
    10-22 15:46:13.351   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     native stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* funcOffset: 0x1c mapName: /data/storage/el1/bundle/libs/arm64/libentry.so functionName: TestBackTrace(napi\_env\_\_\*, napi\_callback\_info\_\_\*) buildId: b6d3429f6e2e594b1c696e13049dae7e51694099 reserved: (null).
    ...
    10-22 15:46:13.354   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     js stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* line: 27 column: 21 mapName: /data/storage/el1/bundle/entry.hap functionName: testBackTraceJsFrame url: entry|entry|1.0.0|src/main/ets/pages/Index.ts packageName: .
    10-22 15:46:13.354   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     js stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* line: 25 column: 16 mapName: /data/storage/el1/bundle/entry.hap functionName: testBackTraceJsFrame url: entry|entry|1.0.0|src/main/ets/pages/Index.ts packageName: .
    10-22 15:46:13.354   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     js stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* line: 25 column: 16 mapName: /data/storage/el1/bundle/entry.hap functionName: testBackTraceJsFrame url: entry|entry|1.0.0|src/main/ets/pages/Index.ts packageName: .
    10-22 15:46:13.354   19261-19261   A0FF00/com.sam...gtool/testTag  com.sampl...ebugtool  I     js stack frame info for pc: \*\*\*\*\*\*\*\*\*\*\*\* is relativePc: \*\*\*\*\*\* line: 25 column: 16 mapName: /data/storage/el1/bundle/entry.hap functionName: testBackTraceJsFrame url: entry|entry|1.0.0|src/main/ets/pages/Index.ts packageName: ....
    ...
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hidebug-guidelines-ndk*