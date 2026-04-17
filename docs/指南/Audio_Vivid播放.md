---
title: Audio Vivid播放
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-audiorenderer
category: 指南
updated_at: 2026-03-24T10:58:41.469Z
---

# Audio Vivid播放

在获取到解码后的Audio Vivid的PCM数据和元数据之后，可以调用OHAudio的相关播放接口，进行Audio Vivid格式音源的渲染播放。详细的API说明请参考[OHAudio API参考](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-ohaudio)。

## 在CMake脚本中链接到动态库

```
target\_link\_libraries(sample PUBLIC libohaudio.so)
```

## 添加头文件

```cpp
#include <ohaudio/native\_audiorenderer.h>
#include <ohaudio/native\_audiostreambuilder.h>
```

## 开发步骤

开发者可以通过以下几个步骤来实现一个简单的播放功能。

1.  创建构造器。
    
    OHAudio提供OH\_AudioStreamBuilder接口，遵循构造器设计模式，用于构建音频流。在Audio Vivid播放场景下，需要选择OH\_AudioStream\_Type为AUDIOSTREAM\_TYPE\_RENDERER，创建一个渲染播放类型的音频构造器。
    
    ```
    OH\_AudioStreamBuilder\* builder;
    OH\_AudioStreamBuilder\_Create(&builder, AUDIOSTREAM\_TYPE\_RENDERER);
    ```
    
2.  配置音频流参数。
    
    创建音频播放构造器后，可以设置音频流所需要的参数，可以参考以下案例。
    
    Audio Vivid音源搭配系统空间音频渲染算法，播放效果和体验最佳。系统会根据输出音频流的工作场景（OH\_AudioStream\_Usage），选择使用对应的空间音频渲染效果，当前支持的工作场景包括音乐、电影和有声读物。
    
    ```
    // 设置音频采样率为48000Hz
    OH\_AudioStreamBuilder\_SetSamplingRate(builder, 48000);
    // 设置音频声道为10 （假定输入Audio Vivid音源是5.1.2声床 + 2对象格式）
    OH\_AudioStreamBuilder\_SetChannelCount(builder, 10);
    // 设置音频声道布局为5.1.2 （声道布局只考虑声床，若想使用默认声道布局，可以传入 CH\_LAYOUT\_UNKNOWN 参数）
    OH\_AudioStreamBuilder\_SetChannelLayout(builder, CH\_LAYOUT\_5POINT1POINT2);
    // 设置音频采样格式
    OH\_AudioStreamBuilder\_SetSampleFormat(builder, AUDIOSTREAM\_SAMPLE\_S16LE);
    // 设置音频流的编码类型为Audio Vivid编码类型
    OH\_AudioStreamBuilder\_SetEncodingType(builder, AUDIOSTREAM\_ENCODING\_TYPE\_AUDIOVIVID);
    // 设置输出音频流的工作场景，根据实际工作场景选择音乐、电影、有声读物等类型
    OH\_AudioStreamBuilder\_SetRendererInfo(builder, AUDIOSTREAM\_USAGE\_MUSIC);
    ```
    
3.  设置音频回调函数。
    
    OHAudio使用回调模式进行音频流数据的写入，以及各种音频事件的上报，应用可以按需选择需要监听的音频事件。
    
    ```
    // 自定义音频流事件函数
    int32\_t MyOnStreamEvent(
        OH\_AudioRenderer\* renderer,
        void\* userData,
        OH\_AudioStream\_Event event)
    {
        // 根据event表示的音频流事件信息，更新播放器状态和界面
        return 0;
    }
    // 自定义音频中断事件函数
    int32\_t MyOnInterruptEvent(
        OH\_AudioRenderer\* renderer,
        void\* userData,
        OH\_AudioInterrupt\_ForceType type,
        OH\_AudioInterrupt\_Hint hint)
    {
        // 根据type和hint表示的音频中断信息，更新播放器状态和界面
        return 0;
    }
    // 自定义异常回调函数
    int32\_t MyOnError(
        OH\_AudioRenderer\* renderer,
        void\* userData,
        OH\_AudioStream\_Result error)
    {
        // 根据error表示的音频异常信息，做出相应的处理
        return 0;
    }
    // 自定义同时写入PCM数据和元数据函数
    int32\_t MyOnWriteDataWithMetadata(
        OH\_AudioRenderer\* renderer,
        void\* userData,
        void\* audioData,
        int32\_t audioDataSize,
        void\* metadata,
        int32\_t metadataSize)
    {
        // 将待播放的PCM数据和元数据，分别按audioDataSize和metadataSize写入buffer
        return 0;
    }
    ```
    
    调用系统的注册监听接口，将上述定义好的回调函数进行配置。
    
    为了避免不可预期的行为，在设置音频回调函数时，请确认OH\_AudioRenderer\_Callbacks的每一个回调都被自定义的回调方法或空指针初始化。
    
    对于Audio Vivid播放场景，需要另外使用OH\_AudioRenderer\_WriteDataWithMetadataCallback进行PCM和元数据写入。
    
    ```
    // 配置回调函数
    OH\_AudioRenderer\_Callbacks callbacks;
    // Audio Vivid播放时，该回调可以置空，使用元数据回调方式进行数据写入
    callbacks.OH\_AudioRenderer\_OnWriteData = nullptr;
    // 对音频流事件进行监听，如果不需要，可以使用 nullptr 赋值
    callbacks.OH\_AudioRenderer\_OnStreamEvent = MyOnStreamEvent;
    // 对音频中断事件进行监听，如果不需要，可以使用 nullptr 赋值
    callbacks.OH\_AudioRenderer\_OnInterruptEvent = MyOnInterruptEvent;
    // 对音频异常事件进行监听，如果不需要，可以使用 nullptr 赋值
    callbacks.OH\_AudioRenderer\_OnError = MyOnError;
    //设置输出音频流的回调
    OH\_AudioStreamBuilder\_SetRendererCallback(builder, callbacks, nullptr);
    // 配置回调函数
    OH\_AudioRenderer\_WriteDataWithMetadataCallback metadataCallback = MyOnWriteDataWithMetadata;
    // 设置同时写入PCM数据和元数据的回调
    OH\_AudioStreamBuilder\_SetWriteDataWithMetadataCallback(builder, metadataCallback, nullptr);
    ```
    
4.  使用配置好的构造器，构造播放音频流。
    
    ```
    OH\_AudioRenderer\* audioRenderer;
    OH\_AudioStreamBuilder\_GenerateRenderer(builder, &audioRenderer);
    ```
    
5.  使用音频流。
    
    可以使用以下接口，实现对音频流的控制，完成开始播放、暂停播放、停止播放、清除缓存等基本操作。
    
    在不再使用该条音频流时，可以释放播放实例，以便更好地管理内存。
    
    | 接口 | 说明 |
    | --- | --- |
    | OH_AudioRenderer_Start | 开始播放 |
    | OH_AudioRenderer_Pause | 暂停播放 |
    | OH_AudioRenderer_Stop | 停止播放 |
    | OH_AudioRenderer_Flush | 释放缓存数据 |
    | OH_AudioRenderer_Release | 释放播放实例 |
    
6.  释放构造器。
    
    当构造器不再使用时，需要释放相关资源。
    
    ```
    OH\_AudioStreamBuilder\_Destroy(builder);
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-audiorenderer*