---
title: Audio Vivid解码
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-audiodecoder
category: 指南
updated_at: 2026-03-24T10:58:40.702Z
---

# Audio Vivid解码

获取解封装后的数据，送入解码器中，使用解码器获取PCM和Metadata元数据。详细的API请参考[AudioCodec模块](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-audiocodec)。

Audio Vivid解码当前支持的规格如下表所示。

| 规格项 | 支持范围 |
| --- | --- |
| 支持采样率 | 32000，44100，48000，96000，192000 |
| 支持码率范围 | 16000~3075000 |
| 支持声道数 | 1~16 |
| 支持的位深 | S16，S24 |

## 在CMake脚本中链接到动态库

```
target\_link\_libraries(sample PUBLIC
libnative\_media\_codecbase.so libnative\_media\_core.so
libnative\_media\_acodec.so libnative\_media\_avdemuxer.so libnative\_media\_avsource.so
)
```

## 添加头文件

```cpp
//解封装头文件
#include "multimedia/player\_framework/native\_avdemuxer.h"
#include <string>
// 解封装解码传递信息结构体
struct AudioSampleInfo {
std::string audioCodecMime = "";
int32\_t audioSampleFormat = 0;
int32\_t audioSampleRate = 0;
int32\_t audioChannelCount = 0;
int64\_t audioChannelLayout = 0;
uint8\_t audioCodecConfig\[100\] = {0};
size\_t audioCodecSize = 0;
};
AudioSampleInfo  info;
```

## 定义相关实例

**定义CodecBufferInfo**

解码码流的属性定义，为后面传给播放的码流数据封装。

```
struct CodecBufferInfo {
    uint32\_t bufferIndex = 0;
    uintptr\_t \*buffer = nullptr;
    uint8\_t \*bufferAddr = nullptr;
    OH\_AVCodecBufferAttr attr = {0, 0, 0, AVCODEC\_BUFFER\_FLAGS\_NONE};
    CodecBufferInfo(uint8\_t \*addr) : bufferAddr(addr){};
    CodecBufferInfo(uint8\_t \*addr, int32\_t bufferSize)
        : bufferAddr(addr), attr({0, bufferSize, 0, AVCODEC\_BUFFER\_FLAGS\_NONE}){};
    CodecBufferInfo(uint32\_t argBufferIndex, OH\_AVMemory \*argBuffer, OH\_AVCodecBufferAttr argAttr)
        : bufferIndex(argBufferIndex), buffer(reinterpret\_cast<uintptr\_t \*>(argBuffer)), attr(argAttr){};
    CodecBufferInfo(uint32\_t argBufferIndex, OH\_AVMemory \*argBuffer)
        : bufferIndex(argBufferIndex), buffer(reinterpret\_cast<uintptr\_t \*>(argBuffer)){};
    CodecBufferInfo(uint32\_t argBufferIndex, OH\_AVBuffer \*argBuffer)
        : bufferIndex(argBufferIndex), buffer(reinterpret\_cast<uintptr\_t \*>(argBuffer)) {
        OH\_AVBuffer\_GetBufferAttr(argBuffer, &attr);
    };
};
```

**定义解码工作队列**

```
class CodecUserData {
public:
    SampleInfo \*sampleInfo = nullptr;
    // 输入帧数
    uint32\_t inputFrameCount\_ = 0;
    // 输入队列锁，防止多线程同时操作输入队列
    std::mutex inputMutex\_;
    // 输入线程的条件变量，当输入队列为空时用于阻塞输入线程
    std::condition\_variable inputCond\_;
    // 输入buffer队列，存放编解码器传给用户用来写入输入数据的buffer
    std::queue<CodecBufferInfo> inputBufferInfoQueue\_;
    // 输出帧数
    uint32\_t outputFrameCount\_ = 0;
    // 输出队列锁，防止多线程同时操作输出队列
    std::mutex outputMutex\_;
    // 输出线程的条件变量，当输出队列为空时用于阻塞输出线程
    std::condition\_variable outputCond\_;
    std::mutex renderMutex\_;
    std::condition\_variable renderCond\_;
    // 输出buffer队列，存放编解码器传给用户用来存放输出数据的buffer
    std::queue<CodecBufferInfo> outputBufferInfoQueue\_;
    std::shared\_ptr<AudioDecoder> audioCodec\_;
    std::queue<unsigned char> renderQueue\_;
    void ClearQueue() {
        {
            std::unique\_lock<std::mutex> lock(inputMutex\_);
            auto emptyQueue = std::queue<CodecBufferInfo>();
            inputBufferInfoQueue\_.swap(emptyQueue);
        }
        {
            std::unique\_lock<std::mutex> lock(outputMutex\_);
            auto emptyQueue = std::queue<CodecBufferInfo>();
            outputBufferInfoQueue\_.swap(emptyQueue);
        }
    }
};
```

**定义回调函数**

```
class SampleCallback {
public:
    // 报错回调函数，当编解码器内部报错时调用，返回给用户相应错误码
    static void OnCodecError(OH\_AVCodec \*codec, int32\_t errorCode, void \*userData);
    // 参数修改回调函数，当编解码器参数被修改时调用，返回给用户被修改后的format参数
    static void OnCodecFormatChange(OH\_AVCodec \*codec, OH\_AVFormat \*format, void \*userData);
    // 输入回调函数，当编解码器需要输入时调用，返回给用户用来写入输入数据的buffer及其对应的index
    static void OnNeedInputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData);
    // 输出回调函数，当编解码器生成新的输出数据时调用，返回给用户用来存放输出数据的buffer及其对应的index
    static void OnNewOutputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData);
};
void SampleCallback::OnCodecError(OH\_AVCodec \*codec, int32\_t errorCode, void \*userData) {
    (void)codec;
    (void)errorCode;
    (void)userData;
}
void SampleCallback::OnCodecFormatChange(OH\_AVCodec \*codec, OH\_AVFormat \*format, void \*userData) {
}
void SampleCallback::OnNeedInputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData) {
    if (userData == nullptr) {
        return;
    }
    (void)codec;
    CodecUserData \*codecUserData = static\_cast<CodecUserData \*>(userData);
    std::unique\_lock<std::mutex> lock(codecUserData->inputMutex\_);
    // 将输入buffer存放到输入队列中
    codecUserData->inputBufferInfoQueue\_.emplace(index, buffer);
    // 通知输入线程开始运行
    codecUserData->inputCond\_.notify\_all();
}
void SampleCallback::OnNewOutputBuffer(OH\_AVCodec \*codec, uint32\_t index, OH\_AVBuffer \*buffer, void \*userData) {
    if (userData == nullptr) {
        return;
    }
    (void)codec;
    CodecUserData \*codecUserData = static\_cast<CodecUserData \*>(userData);
    std::unique\_lock<std::mutex> lock(codecUserData->outputMutex\_);
    // 将输出buffer存放到输出队列中
    codecUserData->outputBufferInfoQueue\_.emplace(index, buffer);
    // 通知输出线程开始运行
    codecUserData->outputCond\_.notify\_all();
}
```

## 开发步骤

1.  创建解码实例。
    
    ```
    // 创建解码器
    OH\_AVCodec \* decoder = OH\_AudioCodec\_CreateByMime(info.audioCodecMime,false);
    // 参数配置
    OH\_AVFormat \*format = OH\_AVFormat\_Create();
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_AUDIO\_SAMPLE\_FORMAT, SAMPLE\_S16LE); //或者S24LE
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_AUD\_CHANNEL\_COUNT, sampleInfo.audioChannelCount);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_AUD\_SAMPLE\_RATE, sampleInfo.audioSampleRate);
    OH\_AVFormat\_SetIntValue(format, OH\_MD\_KEY\_AAC\_IS\_ADTS, 1);
    OH\_AVFormat\_SetLongValue(format, OH\_MD\_KEY\_BITRATE, 96422);//码率，当前作为参考，解封装也可以获取到
    OH\_AVFormat\_SetBuffer(format, OH\_MD\_KEY\_CODEC\_CONFIG, sampleInfo.audioCodecConfig, sampleInfo.audioCodecSize);
    bool res = OH\_AVFormat\_SetLongValue(format, OH\_MD\_KEY\_CHANNEL\_LAYOUT, sampleInfo.audioChannelLayout);
    ret = OH\_AudioCodec\_Configure(decoder, format);
    OH\_AVFormat\_Destroy(format);
    format = nullptr;
    // 设置回调，用于输入输出buffer准备完毕后由系统回调出来
    int32\_t ret = OH\_AudioCodec\_RegisterCallback(decoder,
        {SampleCallback::OnCodecError, SampleCallback::OnCodecFormatChange,
         SampleCallback::OnNeedInputBuffer, SampleCallback::OnNewOutputBuffer},codecUserData);
    // 准备回调和参数设置完毕后通知系统解码器准备好了，下一步准备启动。
    ret = OH\_AudioCodec\_Prepare(decoder)
    ```
    
2.  音频写入解码器。
    
    ```
    int32\_t PushInputData(CodecBufferInfo &info)
    {
        int32\_t  ret = OH\_AVBuffer\_SetBufferAttr(reinterpret\_cast<OH\_AVBuffer \*>(info.buffer), &info.attr);
        ret = OH\_AudioCodec\_PushInputBuffer(decoder, info.bufferIndex);
        return 0;
    }
    ```
    
3.  释放使用过的输出码流。
    
    ```
    int32\_t AudioDecoder::FreeOutputData(uint32\_t bufferIndex)
    {
        int32\_t ret = 0;
        ret = OH\_AudioCodec\_FreeOutputBuffer(decoder, bufferIndex);
        return ret ;
    }
    ```
    
4.  音频写入线程。
    
    ```
    CodecUserData\*audioDecContext\_ = new CodecUserData;
    void AudioDecInputThread()
    {
        while (true) {
            if(!isStarted\_){
               return;
            }
            std::unique\_lock<std::mutex> lock(audioDecContext\_->inputMutex\_);
            // 阻塞输入线程，直到程序运行结束，或者输入队列不为空
            bool condRet = audioDecContext\_->inputCond\_.wait\_for(
                lock, 5s, \[this\]() { return !isStarted\_ || !audioDecContext\_->inputBufferInfoQueue\_.empty(); });
            if(!isStarted\_ || audioDecContext\_->inputBufferInfoQueue\_.empty()){
               return;
            }
            // 获取输入buffer
            CodecBufferInfo bufferInfo = audioDecContext\_->inputBufferInfoQueue\_.front();
            audioDecContext\_->inputBufferInfoQueue\_.pop();
            audioDecContext\_->inputFrameCount\_++;
            lock.unlock();
            // 从解封装器中读取一帧数据写入输入buffer
            demuxer\_->ReadSample(demuxer\_->GetAudioTrackId(), reinterpret\_cast<OH\_AVBuffer \*>(bufferInfo.buffer), bufferInfo.attr);
            int32\_t ret = audioDecoder\_->PushInputData(bufferInfo);
            if(ret != 0){
                return;
            }
            if(bufferInfo.attr.flags & AVCODEC\_BUFFER\_FLAGS\_EOS){
                return;
            }
        }
        // StartRelease();
    }
    ```
    
5.  音频解码输出线程。
    
    ```
    void AudioDecOutputThread()
    {
        while (true) {
            if(!isStarted\_){
               return;
            }
            std::unique\_lock<std::mutex> lock(audioDecContext\_->outputMutex\_);
            // 阻塞输出线程，直到程序运行结束，或者输出队列不为空
            bool condRet = audioDecContext\_->outputCond\_.wait\_for(
                lock, 5s, \[this\]() { return !isStarted\_ || !audioDecContext\_->outputBufferInfoQueue\_.empty(); });
            if(!isStarted\_ || audioDecContext\_->outputBufferInfoQueue\_.empty()){
               return;
            }
            // 获取输出buffer
            CodecBufferInfo bufferInfo = audioDecContext\_->outputBufferInfoQueue\_.front();
            audioDecContext\_->outputBufferInfoQueue\_.pop();
            if(bufferInfo.attr.flags & AVCODEC\_BUFFER\_FLAGS\_EOS){
               return;
            }
            audioDecContext\_->outputFrameCount\_++;
            // 获取解码后的pcm数据
            uint8\_t \*source = OH\_AVBuffer\_GetAddr(reinterpret\_cast<OH\_AVBuffer \*>(bufferInfo.buffer));
            OH\_AVFormat \* format = OH\_AVBuffer\_GetParameter(reinterpret\_cast<OH\_AVBuffer \*>(bufferInfo.buffer));
            uint8\_t \* metadata;
            size\_t size;
            // 获取元数据
            OH\_AVFormat\_GetBuffer(format, OH\_MD\_KEY\_AUDIO\_VIVID\_METADATA, &metadata, &size);
    #ifdef DEBUG\_DECODE
            if (audioOutputFile\_.is\_open()) {
                audioOutputFile\_.write((const char\*)OH\_AVBuffer\_GetAddr(reinterpret\_cast<OH\_AVBuffer \*>(bufferInfo.buffer)), bufferInfo.attr.size);
            }
    #endif
            lock.unlock();
            int32\_t ret = audioDecoder\_->FreeOutputData(bufferInfo.bufferIndex);
            if(ret != 0){
                return;
            }
        }
    }
    ```
    
6.  启动解码。
    
    ```
    int ret = OH\_AudioCodec\_Start(decoder);
    ```
    
7.  停止和释放实例。
    
    ```
    OH\_AudioCodec\_Stop(decoder);
    OH\_AudioCodec\_Destroy(decoder);
    decoder = nullptr;
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-audiodecoder*