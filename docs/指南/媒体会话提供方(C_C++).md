---
title: 媒体会话提供方(C/C++)
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/using-ohavsession-developer
category: 指南
updated_at: 2026-03-24T10:58:48.770Z
---

# 媒体会话提供方(C/C++)

OHAVSession系统提供的通过使用C API实现媒体会话提供方，从而在媒体会话控制方（例如播控中心）中展示媒体相关信息，及响应媒体会话控制方下发的播控命令。

## 使用入门

开发者使用[native\_avsession.h](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-avsession-h)实现媒体会话，需要添加对应的头文件。

### 在 CMake 脚本中链接动态库

```
target\_link\_libraries(entry PUBLIC libohavsession.so)
```

### 添加头文件

```cpp
#include <multimedia/av\_session/native\_avmetadata.h>
#include <multimedia/av\_session/native\_avsession.h>
#include <multimedia/av\_session/native\_avsession\_errors.h>
```

## 开发步骤及注意事项

开发者可以通过以下几个步骤在NDK接入本地会话。

1.  创建会话并激活媒体，需要传入会话类型AVSession\_Type，自定义的TAG，以及应用的包名、ability名字。
    
    ```
    OH\_AVSession\* avsession;
    OH\_AVSession\_Create(SESSION\_TYPE\_AUDIO, "testsession", "com.example.application", "MainAbility", &avsession);
    OH\_AVSession\_Activate(avsession);
    ```
    
    AVSession\_Type包含如下四种类型：
    
    -   SESSION\_TYPE\_AUDIO
    -   SESSION\_TYPE\_VIDEO
    -   SESSION\_TYPE\_VOICE\_CALL
    -   SESSION\_TYPE\_VIDEO\_CALL
2.  应用内播放对应的媒体资源时，同步设置媒体元数据信息。
    
    要设置元数据，需使用OH\_AVMetadataBuilder构造具体的数据，生成一个OH\_AVMetadata。生成OH\_AVMetadata后，使用OH\_AVMetadata的各个功能接口进行资源的设置。
    
    使用OH\_AVMetadataBuilder构造元数据示例：
    
    ```
    // 创建OH\_AVMetadataBuilder构造器。
    OH\_AVMetadataBuilder\* builder;
    OH\_AVMetadataBuilder\_Create(&builder);
    OH\_AVMetadata\* ohMetadata;
    OH\_AVMetadataBuilder\_SetTitle(builder, "Anonymous title");
    OH\_AVMetadataBuilder\_SetArtist(builder, "Anonymous artist");
    OH\_AVMetadataBuilder\_SetAuthor(builder, "Anonymous author");
    OH\_AVMetadataBuilder\_SetAlbum(builder, "Anonymous album");
    OH\_AVMetadataBuilder\_SetWriter(builder, "Anonymous writer");
    OH\_AVMetadataBuilder\_SetComposer(builder, "Anonymous composer");
    OH\_AVMetadataBuilder\_SetDuration(builder, DURATION\_TIME); // DURATION\_TIME = 3600
    // MediaImageUri只支持网络地址。
    OH\_AVMetadataBuilder\_SetMediaImageUri(builder, "https://xxx.xxx.xx");
    OH\_AVMetadataBuilder\_SetSubtitle(builder, "Anonymous subtitle");
    OH\_AVMetadataBuilder\_SetDescription(builder, "For somebody");
    // Lyric只支持媒体歌词内容（应用需将歌词内容拼接为一个字符串传入）。
    OH\_AVMetadataBuilder\_SetLyric(builder, "balabala");
    OH\_AVMetadataBuilder\_SetAssetId(builder, "000");
    OH\_AVMetadataBuilder\_SetSkipIntervals(builder, SECONDS\_30);
    OH\_AVMetadataBuilder\_SetDisplayTags(builder,  AVSESSION\_DISPLAYTAG\_AUDIO\_VIVID);
    /\*\*
     \* generate an AVMetadata 构造AVMetadata对象
     \*/
    OH\_AVMetadataBuilder\_GenerateAVMetadata(builder, &ohMetadata);
    /\*\*
     \* set AVMetadata 设置AVMetadata对象
     \*/
    OH\_AVSession\_SetAVMetadata(avsession, ohMetadata);
    ```
    
    在不使用AVMetadata之后，开发者应该执行OH\_AVMetadataBuilder\_Destroy接口来销毁元数据，且不要继续使用。
    
    ```
    OH\_AVMetadata\_Destroy(ohMetadata);
    OH\_AVMetadataBuilder\_Destroy(builder);
    ```
    
3.  跟随媒体播放状态的变化，及时更新媒体播放状态。
    
    媒体播放状态，包含状态值、播放位置、播放速度、收藏状态等，可以按需使用对应的接口进行设置。
    
    ```
    AVSession\_ErrCode ret = AV\_SESSION\_ERR\_SUCCESS;
    // 设置播放状态，其中state范围应为\[0,11\]。
    AVSession\_PlaybackState state = PLAYBACK\_STATE\_PREPARING;
    ret = OH\_AVSession\_SetPlaybackState(avsession, state);
    // ...
    // 设置播放位置。
    AVSession\_PlaybackPosition\* playbackPosition = new AVSession\_PlaybackPosition;
    playbackPosition->elapsedTime = ELAPSED\_TIME; // ELAPSED\_TIME = 1000
    playbackPosition->updateTime = UPDATE\_TIME; // UPDATE\_TIME = 16111150
    ret = OH\_AVSession\_SetPlaybackPosition(avsession, playbackPosition);
    ```
    
4.  注册播控命令事件监听，便于响应用户通过媒体会话控制方，例如播控中心下发的播控命令。
    
    说明
    
    媒体会话提供方在注册相关固定播控命令事件监听时，监听的事件会在媒体会话控制方的getValidCommands()方法中体现，即媒体会话控制方认为该方法有效，因此在需要时会触发相应的事件。为了保证媒体会话控制方下发的播控命令可以被正常执行，媒体会话提供方请勿进行无逻辑的空实现监听。
    
    调用注册接口后，在业务结束时需要调用取消注册接口，避免出现异常。
    
    Session侧目前支持的播控命令包括：
    
    -   播放
    -   暂停
    -   停止
    -   上一首
    -   下一首
    -   快退
    -   快进
    -   设置进度
    -   设置收藏
    
    ```
    // 设置播放/暂停/停止/上一首/下一首回调。
    // CONTROL\_CMD\_PLAY = 0; 播放。
    // CONTROL\_CMD\_PAUSE = 1; 暂停。
    // CONTROL\_CMD\_STOP = 2;  停止。
    // CONTROL\_CMD\_PLAY\_NEXT = 3; 下一首。
    // CONTROL\_CMD\_PLAY\_PREVIOUS = 4; 上一首。
    AVSession\_ControlCommand command = CONTROL\_CMD\_PLAY;
    OH\_AVSessionCallback\_OnCommand commandCallback = \[\](OH\_AVSession\* session, AVSession\_ControlCommand command,
        void\* userData) -> AVSessionCallback\_Result {
        return AVSESSION\_CALLBACK\_RESULT\_SUCCESS;
    };
    int userData = 0;
    OH\_AVSession\_RegisterCommandCallback(avsession, command, commandCallback, (void \*)(&userData));
    // 设置快进回调。
    OH\_AVSessionCallback\_OnFastForward fastForwardCallback = \[\](OH\_AVSession\* session, uint32\_t seekTime,
        void\* userData) -> AVSessionCallback\_Result {
        return AVSESSION\_CALLBACK\_RESULT\_SUCCESS;
    };
    OH\_AVSession\_RegisterForwardCallback(avsession, fastForwardCallback, (void \*)(&userData));
    ```
    
    相关回调接口如下：
    
    | 接口 | 说明 |
    | --- | --- |
    | OH_AVSession_RegisterCommandCallback(OH_AVSession* avsession, AVSession_ControlCommand command, OH_AVSessionCallback_OnCommand callback, void* userData) | 注册通用播控的回调，支持：播放、暂停、停止、上一首、下一首回调。 |
    | OH_AVSession_RegisterForwardCallback(OH_AVSession* avsession, OH_AVSessionCallback_OnFastForward callback, void* userData) | 注册快进的回调。 |
    | OH_AVSession_RegisterRewindCallback(OH_AVSession* avsession, OH_AVSessionCallback_OnRewind callback, void* userData) | 注册快退的回调。 |
    | OH_AVSession_RegisterSeekCallback(OH_AVSession* avsession, OH_AVSessionCallback_OnSeek callback, void* userData) | 注册跳转的回调。 |
    | OH_AVSession_RegisterToggleFavoriteCallback(OH_AVSession* avsession, OH_AVSessionCallback_OnToggleFavorite callback, void* userData) | 注册收藏的回调。 |
    
5.  音视频应用在退出，并且不需要继续播放时，及时取消监听以及销毁媒体会话释放资源。示例代码如下所示：
    
    ```
    OH\_AVSession\_Destroy(avsession);
    ```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/using-ohavsession-developer*