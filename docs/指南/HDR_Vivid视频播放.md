---
title: HDR Vivid视频播放
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hdr-vivid-video-player
category: 指南
updated_at: 2026-03-24T10:58:43.640Z
---

# HDR Vivid视频播放

开发者可以调用本模块的Native API接口，实现在视频播放中支持HDR Vivid标准。

视频播放的主要流程，是将视频文件“解封装 > 解码 > 送显/播放”。

## HDR Vivid视频解析

从视频文件中，可以解析出其是否为HDR Vivid视频，如果视频源为HDR Vivid视频，可以解析相关的信息，如元数据、颜色信息（Color）等。

### 在 CMake 脚本中链接动态库

```
target\_link\_libraries(sample PUBLIC libnative\_media\_codecbase.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_avdemuxer.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_avsource.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_core.so)
```

说明

上述'sample'字样仅为示例，此处由开发者根据实际工程目录自定义。

### 开发步骤

1.  添加头文件。
    
    ```cpp
    #include <multimedia/player\_framework/native\_avdemuxer.h>
    #include <multimedia/player\_framework/native\_avsource.h>
    #include <multimedia/player\_framework/native\_avcodec\_base.h>
    #include <multimedia/player\_framework/native\_avformat.h>
    #include <multimedia/player\_framework/native\_avbuffer.h>
    #include <fcntl.h>
    #include <sys/stat.h>
    #include <string>
    ```
    
2.  文件解析器。
    
    ```
    // 创建文件操作符 fd，打开时对文件实例必须有读权限（filePath 为待解封装文件路径，需预置文件，保证路径指向的文件存在）。
    std::string filePath = "test.mp4";
    int fd = open(filePath.c\_str(), O\_RDONLY);
    struct stat fileStatus {};
    // 获取fileSize。
    size\_t fileSize = 0;
    if (stat(filePath.c\_str(), &fileStatus) == 0) {
       fileSize = static\_cast<size\_t>(fileStatus.st\_size);
    } else {
        printf("get stat failed");
        return;
    }
    // 为 fd 资源文件创建 source 资源实例。
    OH\_AVSource \*source = OH\_AVSource\_CreateWithFD(fd, 0, fileSize);
    if (source == nullptr) {
       printf("create source failed");
       return;
    }
    ```
    
3.  获取视频轨道信息，查询文件HDR类型。
    
    ```
    int32\_t trackCount = 0;
    uint32\_t audioTrackIndex = 0;
    uint32\_t videoTrackIndex = 0;
    int32\_t trackType;
    ```
    ```
    // 从文件 source 信息获取文件轨道数。
    OH\_AVFormat \*sourceFormat = OH\_AVSource\_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
       printf("get source format failed");
       return;
    }
    bool getTrackRet = OH\_AVFormat\_GetIntValue(sourceFormat, OH\_MD\_KEY\_TRACK\_COUNT, &trackCount);
    if (!getTrackRet) {
        // 异常处理。
    }
    OH\_AVFormat\_Destroy(sourceFormat);
    for (uint32\_t index = 0; index < (static\_cast<int32\_t>(trackCount)); index++) {
       // 获取轨道信息。
       OH\_AVFormat \*format = OH\_AVSource\_GetTrackFormat(source, index);
       if (format == nullptr) {
          printf("get track format failed");
          return;
       }
       // 判断轨道类型。
       static\_cast<OH\_MediaType>(trackType) == OH\_MediaType::MEDIA\_TYPE\_AUD ? audioTrackIndex = index : videoTrackIndex = index;
       // 查询文件HDR类型，是否为HDR Vivid视频。
       int32\_t isHDRVivid = 0;
       bool getHdrRet = OH\_AVFormat\_GetIntValue(format, OH\_MD\_KEY\_VIDEO\_IS\_HDR\_VIVID, &isHDRVivid);
       if (getHdrRet == false || isHDRVivid == 0) {
          printf("is not HDRVivid ");
          return;
       }
       OH\_AVFormat\_Destroy(format); // 销毁。
    }
    ```
    

## HDR Vivid视频解码

应用创建H.265解码器，并配置宽、高、format信息。解码器解析码流，生成对应的视频帧数据以及元数据。

当前支持surface输出与buffer输出两种类型，差异如下：

在接口调用的过程中，两种方式的接口调用方式基本一致，但存在以下差异点：

-   Surface模式下，应用在解码器就绪前，必须调用OH\_VideoDecoder\_SetSurface接口设置OHNativeWindow。
-   Buffer模式下，可以通过调用OH\_AVBuffer\_GetNativeBuffer接口将buffer转换为nativebuffer，再通过调用OH\_NativeBuffer\_GetMetadataValue接口获取元数据。

### 在 CMake 脚本中链接动态库

```
target\_link\_libraries(sample PUBLIC libnative\_media\_codecbase.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_core.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_vdec.so)
```

说明

上述'sample'字样仅为示例，此处由开发者根据实际工程目录自定义。

### 定义基础结构

本部分示例代码按照C++17标准编写，仅作参考。开发者可以参考此部分，定义自己的buffer对象。

1.  添加头文件。
    
    ```cpp
    #include <condition\_variable>
    #include <memory>
    #include <mutex>
    #include <queue>
    #include <shared\_mutex>
    #include <multimedia/player\_framework/native\_avcodec\_videodecoder.h>
    #include <multimedia/player\_framework/native\_avcapability.h>
    #include <multimedia/player\_framework/native\_avcodec\_base.h>
    #include <multimedia/player\_framework/native\_avformat.h>
    #include <multimedia/player\_framework/native\_avbuffer.h>
    #include <fstream>
    ```
    
2.  解码器回调buffer的信息。
    
    ```
    struct CodecBufferInfo {
        CodecBufferInfo(uint32\_t index, OH\_AVBuffer \*buffer): index(index), buffer(buffer), isValid(true) {}
        // 回调buffer。
        OH\_AVBuffer \*buffer = nullptr;
        // 回调buffer对应的index。
        uint32\_t index = 0;
        // 判断当前buffer信息是否有效。
        bool isValid = true;
    };
    ```
    
3.  解码输入输出队列。
    
    ```
    class CodecBufferQueue {
    public:
        // 将回调buffer的信息传入队列。
        void Enqueue(const std::shared\_ptr<CodecBufferInfo> bufferInfo)
        {
            std::unique\_lock<std::mutex> lock(mutex\_);
            bufferQueue\_.push(bufferInfo);
            cond\_.notify\_all();
        }
        // 获取回调buffer的信息。
        std::shared\_ptr<CodecBufferInfo> Dequeue(int32\_t timeoutMs = 1000)
        {
            std::unique\_lock<std::mutex> lock(mutex\_);
            (void)cond\_.wait\_for(lock, std::chrono::milliseconds(timeoutMs), \[this\]() { return !bufferQueue\_.empty(); });
            if (bufferQueue\_.empty()) {
                return nullptr;
            }
            std::shared\_ptr<CodecBufferInfo> bufferInfo = bufferQueue\_.front();
            bufferQueue\_.pop();
            return bufferInfo;
        }
        // 清空队列，之前的回调buffer设置为不可用。
        void Flush()
        {
            std::unique\_lock<std::mutex> lock(mutex\_);
            while (!bufferQueue\_.empty()) {
                std::shared\_ptr<CodecBufferInfo> bufferInfo = bufferQueue\_.front();
                // Flush、Stop、Reset、Destroy操作之后，之前回调的buffer信息设置为无效。
                bufferInfo->isValid = false;
                bufferQueue\_.pop();
            }
        }
    private:
        std::mutex mutex\_;
        std::condition\_variable cond\_;
        std::queue<std::shared\_ptr<CodecBufferInfo>> bufferQueue\_;
    };
    ```
    
4.  全局变量。
    
    仅作参考，可以根据实际情况将其封装到对象中。
    
    ```
    // 解码器实例指针。
    OH\_AVCodec \*videoDec = nullptr;
    // 解码器同步锁。
    std::shared\_mutex codecMutex;
    // 解码器输入队列。
    CodecBufferQueue inQueue;
    // 解码器输出队列。
    CodecBufferQueue outQueue;
    ```
    

### 开发步骤

**Surface模式**

1.  创建H.265解码器实例。
    
    应用可以通过名称或媒体类型创建解码器。示例中的变量说明如下：
    
    -   videoDec：视频解码器实例的指针。
    -   OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC：HEVC格式视频编解码器。
    
    ```
    // 通过mimetype创建H.265解码器实例。
    OH\_AVCodec \*videoDec = OH\_VideoDecoder\_CreateByMime(OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC);
    ```
    
2.  配置异步回调函数。
    
    ```
    // 解码输入回调OH\_AVCodecOnNeedInputBuffer实现。
    static void OnNeedInputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData)
    {
        // 输入帧的数据buffer和对应的index送入inQueue队列。
        (void)codec;
        (void)userData;
        inQueue.Enqueue(std::make\_shared<CodecBufferInfo>(index, buffer));
    }
    ```
    
    具体可参考：[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)中的“步骤-3：调用OH\_VideoDecoder\_RegisterCallback()设置回调函数”。
    
3.  配置解码器。
    
    具体可参考：[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)中的“步骤-5：调用OH\_VideoDecoder\_Configure()配置解码器”。
    
4.  设置surface。
    
    具体可参考：[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)中的“步骤-6：设置surface”。
    
5.  调用OH\_VideoDecoder\_Start()启动解码器。
    
    具体可参考：[视频解码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#surface模式)中的“步骤-8：调用OH\_VideoDecoder\_Start()启动解码器”。
    

**Buffer模式**

1.  创建H.265解码器实例。
    
    应用可以通过名称或媒体类型创建解码器。示例中的变量说明如下：
    
    -   videoDec：视频解码器实例的指针。
    -   OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC：HEVC格式视频编解码器。
    
    ```
    // 通过mimetype创建H.265解码器实例。
    OH\_AVCodec \*videoDec = OH\_VideoDecoder\_CreateByMime(OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC);
    ```
    
2.  配置异步回调函数。
    
    ```
    // 解码输入回调OH\_AVCodecOnNeedInputBuffer实现。
    static void OnNeedInputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData)
    {
        // 输入帧的数据buffer和对应的index送入inQueue队列。
        (void)codec;
        (void)userData;
        inQueue.Enqueue(std::make\_shared<CodecBufferInfo>(index, buffer));
    }
    // 解码输出回调OH\_AVCodecOnNewOutputBuffer实现。
    static void OnNewOutputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData)
    {
        // 完成帧的数据buffer和对应的index送入outQueue队列。
        (void)userData;
        outQueue.Enqueue(std::make\_shared<CodecBufferInfo>(index, buffer));
    }
    ```
    
    具体可参考：[视频解码Buffer模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#buffer模式)中的“步骤-3：调用OH\_VideoDecoder\_RegisterCallback()设置回调函数”。
    
3.  配置解码器。
    
    具体可参考：[视频解码Buffer模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#buffer模式)中的“步骤-5：调用OH\_VideoDecoder\_Configure()配置解码器”。
    
4.  调用OH\_VideoDecoder\_Start()启动解码器。
    
    具体可参考：[视频解码Buffer模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding#buffer模式)中的“步骤-7：调用OH\_VideoDecoder\_Start()启动解码器”。
    
5.  获取元数据。
    
    在 CMake 脚本中链接动态库。
    
    ```
    target\_link\_libraries(sample PUBLIC libnative\_buffer.so)
    ```
    
    添加头文件。
    
    ```cpp
    #include <string.h>
    #include <native\_buffer/native\_buffer.h>
    ```
    
    示例代码如下：
    
    ```
    // 元数据的大小。
    int32\_t size = 0;
    // 元数据实例指针。
    uint8\_t \*metadata = nullptr;
    // 存储元数据的容器。
    std::vector<uint8\_t> meta;
    // 取出回调函数OnNewOutputBuffer存到输出队列的帧buffer。
    std::shared\_ptr<CodecBufferInfo> bufferInfo = outQueue.Dequeue();
    std::shared\_lock<std::shared\_mutex> lock(codecMutex);
    if (bufferInfo == nullptr || !bufferInfo->isValid) {
        // 异常处理。
    }
    // 获取OH\_NativeBuffer指针实例。
    OH\_NativeBuffer \*nativeBuffer = OH\_AVBuffer\_GetNativeBuffer(bufferInfo.buffer);
    if (nativeBuffer != nullptr){
        // 获取static元数据。
        if (OH\_NativeBuffer\_GetMetadataValue(nativeBuffer, OH\_HDR\_STATIC\_METADATA, &size, &metadata) != 0){
            // 异常处理。
        } else {
            meta.resize(size);
            memcpy(&meta\[0\], metadata, size);
            delete\[\] metadata;
            metadata = nullptr;
        }
        // 获取dynamic元数据。
        if (OH\_NativeBuffer\_GetMetadataValue(nativeBuffer, OH\_HDR\_DYNAMIC\_METADATA, &size, &metadata) != 0){
            // 异常处理。
        } else {
            meta.resize(size);
            memcpy(&meta\[0\], metadata, size);
            delete\[\] metadata;
            metadata = nullptr;
        }
    }
    //销毁nativebuffer。
    if (nativeBuffer != nullptr) {
        OH\_NativeBuffer\_Unreference(nativeBuffer);
        nativeBuffer = nullptr;
    }
    ```
    

## 处理视频帧数据

1.  解封装，循环获取帧数据。
    
    ```
    bool videoIsEnd = false;
    // 为资源实例创建对应的解封装器。
    OH\_AVDemuxer \*demuxer = OH\_AVDemuxer\_CreateWithSource(source);
    // 取出回调函数OnNeedInputBuffer存到输入队列的帧buffer。
    std::shared\_ptr<CodecBufferInfo> bufferInfo = inQueue.Dequeue();
    std::shared\_lock<std::shared\_mutex> lock(codecMutex);
    if (bufferInfo == nullptr || !bufferInfo->isValid) {
        // 异常处理。
    }
    // 解封装帧数据。
    int32\_t ret = OH\_AVDemuxer\_ReadSampleBuffer(demuxer, videoTrackIndex, bufferInfo->buffer);
    if (ret == AV\_ERR\_OK) {
       // 可通过buffer获取并处理视频帧数据。
        OH\_AVCodecBufferAttr info;
        OH\_AVErrCode getBufferRet = OH\_AVBuffer\_GetBufferAttr(bufferInfo->buffer, &info);
        if (getBufferRet != AV\_ERR\_OK) {
            // 异常处理。
        }
        if (info.flags == OH\_AVCodecBufferFlags::AVCODEC\_BUFFER\_FLAGS\_EOS) {
            videoIsEnd = true;
        }
    }
    ```
    
2.  将解封装后的视频帧数据送入解码输入队列。
    
    ```
    // 送入解码输入队列进行解码，index为对应队列下标。
    ret = OH\_VideoDecoder\_PushInputBuffer(videoDec, bufferInfo->index);
    if (ret != AV\_ERR\_OK) {
       // 异常处理。
    }
    ```
    
    后续步骤具体可参考：[视频解码](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-decoding)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hdr-vivid-video-player*