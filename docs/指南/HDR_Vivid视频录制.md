---
title: HDR Vivid视频录制
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hdr-vivid-video-recorder
category: 指南
updated_at: 2026-03-24T10:58:43.724Z
---

# HDR Vivid视频录制

开发者可以调用本模块的Native API接口，实现在视频录制中支持HDR Vivid标准。

视频录制的主要流程是“相机采集 > 编码 > 封装成mp4文件”。

## HDR Vivid视频编码

应用创建H.265编码器，配置profile(main 10)相机底层包含HDR Vivid的surfacebuffer内容，编码器消费surfacebuffer编码生成对应码流。

说明

仅在Surface模式下支持HDR Vivid视频编码。

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
    #include <multimedia/player\_framework/native\_avcodec\_videoencoder.h>
    #include <multimedia/player\_framework/native\_avcapability.h>
    #include <multimedia/player\_framework/native\_avcodec\_base.h>
    #include <multimedia/player\_framework/native\_avformat.h>
    #include <multimedia/player\_framework/native\_avbuffer.h>
    #include <fstream>
    ```
    
2.  创建编码器实例。
    
    应用可以通过名称或媒体类型创建编码器。示例中的变量说明如下：
    
    -   videoEnc：视频编码器实例的指针；
    -   OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC：HEVC格式视频编解码器。
    
    ```
    // 通过mimetype创建H.265编码器实例。
    OH\_AVCodec \*videoEnc = OH\_VideoEncoder\_CreateByMime(OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC);
    ```
    
3.  配置异步回调函数。
    
    添加头文件：
    
    ```cpp
    #include <condition\_variable>
    #include <queue>
    #include <mutex>
    ```
    ```
    struct CodecBufferInfo {
        uint32\_t bufferIndex = 0;
        OH\_AVBuffer \*buffer = nullptr;
        uint8\_t \*bufferAddr = nullptr;
        OH\_AVCodecBufferAttr attr = {0, 0, 0, AVCODEC\_BUFFER\_FLAGS\_NONE};
    };
    std::mutex outputMutex\_;
    std::condition\_variable outputCond\_;
    std::queue<CodecBufferInfo> outputBufferInfoQueue\_;
    // 设置OH\_AVCodecOnNewOutputBuffer回调函数，编码完成帧送入输出队列。
    void OnNewOutputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData) {
        (void)codec;
        std::unique\_lock<std::mutex> lock(outputMutex\_);
        outputBufferInfoQueue\_.emplace(index, buffer);
        outputCond\_.notify\_all();
    }
    ```
    
    具体可参考：[视频编码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-encoding#surface模式)中的“步骤3：调用OH\_VideoEncoder\_RegisterCallback()设置回调函数”。
    
4.  配置编码器。
    
    可选配置视频帧宽度、视频帧高度、视频颜色格式。
    
    ```
    // 配置编码Profile为MAIN10（必须）。
    int32\_t profile = static\_cast<int32\_t>(HEVC\_PROFILE\_MAIN\_10);
    // 配置视频原色。
    int32\_t primary = static\_cast<int32\_t>(OH\_ColorPrimary::COLOR\_PRIMARY\_BT2020);
    // 配置传输特性。
    int32\_t transfer = static\_cast<int32\_t>(OH\_TransferCharacteristic::TRANSFER\_CHARACTERISTIC\_PQ);// PQ或者HLG。
    // 配置最大矩阵系数。
    int32\_t matrix = static\_cast<int32\_t>(OH\_MatrixCoefficient::MATRIX\_COEFFICIENT\_BT2020\_CL);
    // 配置关键帧的间隔，单位为毫秒。
    int32\_t iFrameInterval = 100;
    OH\_AVFormat \*format = OH\_AVFormat\_Create();
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_PROFILE, profile);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_COLOR\_PRIMARIES, primary);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_TRANSFER\_CHARACTERISTICS, transfer);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_MATRIX\_COEFFICIENTS, matrix);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_I\_FRAME\_INTERVAL, iFrameInterval);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_RANGE\_FLAG, 1);
    // 配置编码器。
    int32\_t ret = OH\_VideoEncoder\_Configure(videoEnc, format);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    OH\_AVFormat\_Destroy(format);
    ```
    
5.  获取surface，并设置给相机。
    
    具体可参考：[视频编码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-encoding#surface模式)中的“步骤6：获取surface”。
    
6.  调用OH\_VideoEncoder\_Start()启动编码器。
    
    具体可参考：[视频编码Surface模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-encoding#surface模式)中的“步骤8：调用OH\_VideoEncoder\_Start()启动编码器”。
    

## HDR Vivid视频封装

调用Muxer可以将HDR Vivid码流封装成文件，码流格式需指定为hevc码流，并设置宽、高、isHDRVivid信息。Color信息通常需要从编码获取并设置给封装器。

### 在 CMake 脚本中链接动态库

```
target\_link\_libraries(sample PUBLIC libnative\_media\_avmuxer.so)
target\_link\_libraries(sample PUBLIC libnative\_media\_core.so)
```

说明

上述'sample'字样仅为示例，此处由开发者根据实际工程目录自定义。

### 开发步骤

1.  添加头文件。
    
    ```cpp
    #include <multimedia/player\_framework/native\_avmuxer.h>
    #include <multimedia/player\_framework/native\_avcodec\_base.h>
    #include <multimedia/player\_framework/native\_avformat.h>
    #include <multimedia/player\_framework/native\_avbuffer.h>
    #include <fcntl.h>
    ```
    
2.  调用OH\_AVMuxer\_Create()创建封装器实例对象。
    
    ```
    // 设置封装格式为mp4。
    OH\_AVOutputFormat outputFormat = AV\_OUTPUT\_FORMAT\_MPEG\_4;
    // 以读写方式创建fd。
    int32\_t fd = open("test.mp4", O\_CREAT | O\_RDWR | O\_TRUNC, S\_IRUSR | S\_IWUSR);
    OH\_AVMuxer \*muxer = OH\_AVMuxer\_Create(fd, outputFormat);
    ```
    
3.  添加视频轨，并指定类型为HDR Vivid类型。
    
    ```
    int videoTrackId = -1;
    uint8\_t \*buffer = ...; // 编码config data，如果没有可以不传。
    size\_t size = ...;  // 编码config data的长度，根据实际情况配置。
    OH\_AVFormat \*formatVideo = OH\_AVFormat\_Create();
    OH\_AVFormat\_SetStringValue(formatVideo, OH\_MD\_KEY\_CODEC\_MIME, OH\_AVCODEC\_MIMETYPE\_VIDEO\_HEVC); // 必填。
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_WIDTH, 1280); // 必填。
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_HEIGHT, 720); // 必填。
    // (可选)HDR Vivid视频封装时必填，指定为HDR Vivid视频。
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_VIDEO\_IS\_HDR\_VIVID, 1);
    // （可不设置，封装器从编码码流xps自动解析） 设置Color信息，如下。
    // 这些信息也可以通过调用OH\_VideoEncoder\_GetOutputDescription(OH\_AVCodec \*codec)接口从编码器中获取。
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_RANGE\_FLAG, 1);
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_COLOR\_PRIMARIES, OH\_ColorPrimary::COLOR\_PRIMARY\_BT2020);
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_TRANSFER\_CHARACTERISTICS, OH\_TransferCharacteristic::TRANSFER\_CHARACTERISTIC\_PQ); // PQ或者HLG。
    OH\_AVFormat\_SetIntValue(formatVideo, OH\_MD\_KEY\_MATRIX\_COEFFICIENTS, OH\_MatrixCoefficient::MATRIX\_COEFFICIENT\_BT2020\_CL);
    ret = OH\_AVMuxer\_AddTrack(muxer, &videoTrackId, formatVideo);
    if (ret != AV\_ERR\_OK || videoTrackId < 0) {
        // 视频轨添加失败。
    }
    OH\_AVFormat\_Destroy(formatVideo); // 销毁。
    ```
    

## 处理视频帧数据

1.  写入封装数据。
    
    ```
    // start后，才能开始写入数据。
    int trackId = videoTrackId; // 选择写的媒体轨。
    // 取出回调函数OnNewOutputBuffer送入输出队列的帧buffer。
    CodecBufferInfo bufferInfo = outputBufferInfoQueue\_.front();
    outputBufferInfoQueue\_.pop();
    ret = OH\_AVMuxer\_WriteSampleBuffer(muxer, trackId, bufferInfo.buffer);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    ```
    
2.  调用OH\_VideoEncoder\_FreeOutputBuffer()释放编码帧。
    
    ```
    // 释放已完成写入的数据，index为对应输出队列的下标。
    ret = OH\_VideoEncoder\_FreeOutputBuffer(videoEnc, bufferInfo.bufferIndex);
    if (ret != AV\_ERR\_OK) {
        // 异常处理。
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/hdr-vivid-video-recorder*