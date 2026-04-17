---
title: Audio Vivid解封装
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-avdemuxer
category: 指南
updated_at: 2026-03-24T10:58:40.747Z
---

# Audio Vivid解封装

获取到Audio Vivid封装的mp4文件后，先调用解封装相关接口，选中音频轨，读取每一帧Audio Vivid，送入解码器中（可参考[Audio Vivid解码](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-audiodecoder)）。详细的API请参考[AVDemuxer模块](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avdemuxer)。

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
#include <string.h>
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

## 开发步骤

1.  创建解封装实例。
    
    ```
    // ts code获取fd和size
    let inputFile = fs.openSync(filepath,fs.OpenMode.READ\_ONLY);
    if (inputFile) {
        let inputFileState = fs.statSync(inputFile.fd);
        let inputFileSize = inputFileState.size;
    }
    ```
    ```
    //C++ code
    OH\_AVSource \*source = OH\_AVSource\_CreateWithFD(inputFd,0,inputFileSize);
    OH\_AVDemuxer \*demuxer = OH\_AVDemuxer\_CreateWithSource(source);
    auto sourceFormat = std::shared\_ptr<OH\_AVFormat>(OH\_AVSource\_GetSourceFormat(source\_), OH\_AVFormat\_Destroy);
    int32\_t trackCount = 0;
    OH\_AVFormat\_GetIntValue(sourceFormat.get(), OH\_MD\_KEY\_TRACK\_COUNT, &trackCount);
    ```
    
2.  选中音频轨。
    
    ```
    int32\_t trackCount = 0;
    OH\_AVFormat\_GetIntValue(sourceFormat.get(), OH\_MD\_KEY\_TRACK\_COUNT, &trackCount);
    for (int32\_t index = 0; index < trackCount; index++) {
    int trackType = -1;
    auto trackFormat =
        std::shared\_ptr<OH\_AVFormat>(OH\_AVSource\_GetTrackFormat(source\_, index), OH\_AVFormat\_Destroy);
    // 获取轨道类型
    OH\_AVFormat\_GetIntValue(trackFormat.get(), OH\_MD\_KEY\_TRACK\_TYPE, &trackType);
    // 判断当前轨道为音频轨
    if (trackType == MEDIA\_TYPE\_AUD) {
        // 选中音频轨
        OH\_AVDemuxer\_SelectTrackByID(demuxer, index);
        // 获取位深
        OH\_AVFormat\_GetIntValue(trackFormat.get(), OH\_MD\_KEY\_AUDIO\_SAMPLE\_FORMAT, &info.audioSampleFormat);
        // 获取声道数
        OH\_AVFormat\_GetIntValue(trackFormat.get(), OH\_MD\_KEY\_AUD\_CHANNEL\_COUNT, &info.audioChannelCount);
        // 获取声道布局
        OH\_AVFormat\_GetLongValue(trackFormat.get(), OH\_MD\_KEY\_CHANNEL\_LAYOUT, &info.audioChannelLayout);
        // 获取采样率
        OH\_AVFormat\_GetIntValue(trackFormat.get(), OH\_MD\_KEY\_AUD\_SAMPLE\_RATE, &info.audioSampleRate);
        // 获取额外配置信息
        uint8\_t \*addr = nullptr;
        OH\_AVFormat\_GetBuffer(trackFormat.get(), OH\_MD\_KEY\_CODEC\_CONFIG, &addr, &info.audioCodecSize);
        memcpy((void \*)info.audioCodecConfig, (void \*)addr, info.audioCodecSize);
        // 获取解码器类型
        char \*audioCodecMime;
        OH\_AVFormat\_GetStringValue(trackFormat.get(), OH\_MD\_KEY\_CODEC\_MIME, const\_cast<char const \*\*>(&audioCodecMime));
        info.audioCodecMime = audioCodecMime;
        int32\_t trackId = index;
        break;
        }
    }
    ```
    
3.  读取每一帧数据。
    
    ```
    OH\_AVBuffer \*buffer;
    int32\_t ret = OH\_AVDemuxer\_ReadSampleBuffer(demuxer, trackId, buffer);
    ```
    
4.  释放解封装实例。
    
    ```
    int32\_t Release()
    {
        if (demuxer != nullptr) {
            OH\_AVDemuxer\_Destroy(demuxer);
            demuxer = nullptr;
        }
        if (source != nullptr) {
            OH\_AVSource\_Destroy(source);
            source = nullptr;
        }
        return AVCODEC\_SAMPLE\_ERR\_OK;
    }
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/audiovivid-avdemuxer*