---
title: 创建视频解码器和NativeWindow初始化并行
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/parallel-decoding-nativewindow
category: 指南
updated_at: 2026-03-24T10:58:37.916Z
---

# 创建视频解码器和NativeWindow初始化并行

## 场景介绍

为了解码Surface模式的正常创建，在XComponent尚未创建或OpenGL后处理（NativeImage）尚未初始化的情况下，可以创建一个空的surface，以确保视频解码器能够正常创建和运行。

## 开发步骤

以下步骤描述了在surface的消费端没有创建之前，如何并行创建视频解码器和NativeWindow，让视频解码器正常创建执行。

**添加动态链接库**

```
target\_link\_libraries(sample PUBLIC libnative\_image.so)
target\_link\_libraries(sample PUBLIC libnative\_window.so)
target\_link\_libraries(sample PUBLIC libnative\_buffer.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_vdec.so)
```

说明

上述'sample'字样仅为示例，此处由开发者根据实际工程目录自定义。

**头文件**

```cpp
#include <iostream>
#include <string>
#include <native\_image/native\_image.h>
#include <native\_window/external\_window.h>
#include <native\_buffer/native\_buffer.h>
#include <multimedia/player\_framework/native\_avcodec\_videodecoder.h>
```

1.  创建OH\_NativeImage实例。
    
    ```
    // 创建NativeImage实例，作为surface的消费者。
    OH\_NativeImage\* image = OH\_ConsumerSurface\_Create();
    ```
    
2.  获取对应的数据生产者端NativeWindow。
    
    ```
    // 获取生产者NativeWindow。
    OHNativeWindow\* nativeImageWindow = OH\_NativeImage\_AcquireNativeWindow(image);
    ```
    
3.  设置NativeWindow的宽高。
    
    ```
    int code = SET\_BUFFER\_GEOMETRY;
    int32\_t width = 800;
    int32\_t height = 600;
    int32\_t ret = OH\_NativeWindow\_NativeWindowHandleOpt(nativeImageWindow, code, width, height);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    ```
    
4.  注册NativeImage的回调函数。
    
    注册OH\_NativeImage的监听者OH\_OnFrameAvailableListener，包括：
    
    -   context 用户自定义的上下文信息；
    -   onFrameAvailable 有buffer可获取触发时的回调函数。
    
    ```
    // onFrameAvailable实现。
    static void onFrameAvailable()
    {
      OHNativeWindowBuffer \*buffer = nullptr;
      int fenceFd;
      // 通过消费端的OH\_NativeImage获取一个OHNativeWindowBuffer。
      OH\_NativeImage\_AcquireNativeWindowBuffer(image, &buffer, &fenceFd);
      // 通过OH\_NativeImage实例将OHNativeWindowBuffer归还到buffer队列中。
      OH\_NativeImage\_ReleaseNativeWindowBuffer(image, buffer, fenceFd);
    }
    static void context()
    {
      // 开发者自定义的上下文信息。
    }
    // 设置回调监听者。
    OH\_OnFrameAvailableListener listener = {&onFrameAvailable, &context};
    // 设置帧可用回调。
    ret = OH\_NativeImage\_SetOnFrameAvailableListener(image, listener);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    ```
    
    说明
    
    在此示例中，回调函数的实现仅仅是将buffer取出来并释放，开发者可以根据业务需求自行拓展。
    
5.  配置解码器。
    
    具体开发指导请参考[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)“步骤-5：调用OH\_VideoDecoder\_Configure()配置解码器”。
    
6.  设置surface。
    
    在应用业务真正的surface消费端创建成功之前，可以先使用上面临时创建的消费端连接解码器。
    
    示例中的变量说明如下：
    
    -   videoDec：视频解码器实例的指针。创建方式可参考[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)“步骤-2：创建解码器实例对象”。
    
    ```
    ret = OH\_VideoDecoder\_SetSurface(videoDec, nativeImageWindow);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    ```
    
7.  启动解码器。
    
    具体开发指导请参考[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)“步骤-8：调用OH\_VideoDecoder\_Start()启动解码器”。
    
8.  设置surface。
    
    在应用业务真正的surface消费端创建成功后，可以调用OH\_VideoDecoder\_SetSurface接口，将解码输出重定向到新的surface上。
    
    本例中的nativeWindow，有两种方式获取：
    
    1.  如果解码后直接显示，则从XComponent组件获取，获取方式请参考 [XComponent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-xcomponent)；
    2.  如果解码后接OpenGL后处理，则从NativeImage获取，获取方式请参考 [NativeImage](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/native-image-guidelines)。
    
    ```
    ret = OH\_VideoDecoder\_SetSurface(videoDec, nativeWindow);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    ```
    
9.  销毁OH\_NativeImage实例。
    
    在调用OH\_VideoDecoder\_Destroy接口后，调用OH\_NativeImage\_Destroy接口销毁OH\_NativeImage实例。
    
    ```
    // 销毁OH\_NativeImage实例。
    OH\_NativeImage\_Destroy(&image);
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/parallel-decoding-nativewindow*