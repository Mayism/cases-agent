---
title: 基于AVPlayer播放格式化音频（C++）
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp
category: 最佳实践
updated_at: 2026-03-13T02:22:53.859Z
---

# 基于AVPlayer播放格式化音频（C++）

## 概述

AVPlayer可以用于播放格式化音频，支持WAV、MP3和FLAC等格式的音频。AVPlayer提供了ArkTS API和Native API，指导开发者使用AVPlayer的Native API实现播放格式化音频的功能，主要涉及基本播控、精准跳转、静音播放、倍速播放、音量控制、焦点管理、后台播放与接入播控中心、冷启动等开发场景。

本文是音频播放系列文章的第4篇，实现的功能效果如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/FP__YEqaQB60CGxbL-mw6Q/zh-cn_image_0000002524217640.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=E62FB55306345385F5622EED26CD00596BDE72F9BD32626A385B1C744756B0F6 "点击放大") ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bf/v3/HfMbFDnjQoKzYQ2osHCBuQ/zh-cn_image_0000002555337515.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=A0B3B8B5D0C266E9EB14825703CE6244194551F4EA8DFBA238314144906DBA17 "点击放大") ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1c/v3/URPFr0JHTn6-YDxakIl-nw/zh-cn_image_0000002524057652.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=9F4B0FAE3EEF7473F7C2D499FE55CDCB8251E3E230EB95B5E5E328C0C2263D3D "点击放大")

## 场景分析

| 场景名称 | 描述 | 实现方案 |
| --- | --- | --- |
| [基础播控](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp#section1764813377511) | 音频资源的加载、播放、暂停、退出等操作。 | [avplayer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#概述) |
| [跳转播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp#section16920851193717) | 滑动进度条精准跳转到指定时间进行播放。 | [Slider组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider) |
| [静音播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp#section125715278533) | 点击按钮设置静音播放。 | [OH_AVPlayer_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume) |
| [切换歌曲播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp#section590418431566) | 点击上一首或下一首或歌单列表中的歌曲进行不同歌曲播放。 | [OH_AVPlayer_Reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_reset) |
| [倍速设置](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp#section189460361122) | 滑动调节面板调节播放速度。 | [OH_AVPlayer_SetPlaybackRate()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setplaybackspeed) |
| [音量设置](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp#section88718617116) | 滑动调节面板调节播放音量。 | [OH_AVPlayer_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume) |
| [接入播控中心](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section06660114245) | 通过播控中心，控制播放、暂停、切换音频、调整播放进度、切换循环模式 | [接入播控中心](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section06660114245) |
| [后台播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section1749719114143) | 音频切换到后台播放。 | [后台播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section1749719114143) |
| [接入播控中心冷启动和历史歌单](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section476545143517) | 应用退出后，播控中心显示历史歌单，点击播控中心播放按钮拉起应用播放，或者点击歌单拉起应用播放。 | [接入播控中心冷启动和历史歌单](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section476545143517) |

## 基础播控

### 场景描述

通过[avplayer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#概述)接口实现核心音频播放控制能力，包括音频资源加载、播放、暂停、停止及退出等操作。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/55/v3/ncGY75knSKWg6OYSy2gXOw/zh-cn_image_0000002555217551.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=C1E9136FA88448B5BB2E78493A636287BFCCBB1839C6F9C7D8C4BB0331420381 "点击放大")

### 实现原理

核心原理是使用[avplayer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#概述)接口实现播放、暂停等功能，需要特别注意的是，播放器在执行不同的操作前，必须要保证此时处于正确的状态，比如执行播放操作前，只有当前状态在prepared/paused/completed时，才能正确执行，否则系统可能会抛出异常或生成其他未定义的行为。AVPlayer的播放状态和不同接口间的关系参考[使用AVPlayer播放音频](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/using-ndk-avplayer-for-playback)一节中的播放状态变化示意图。

主要的开发步骤如下：

1.  开发者可以通过[OH\_AVPlayer\_Create()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_create)构建一个avplayer实例，创建成功后，此时播放器处于idle状态。
2.  使用[OH\_AVPlayer\_SetOnInfoCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setoninfocallback)注册状态变化的回调，对状态变化做出响应。
    
    注意
    
    因为AVPlayer播放器的接口是否能正常执行和当前的播放器状态有必然联系，建议开发者务必使用[OH\_AVPlayer\_SetOnInfoCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setoninfocallback)注册状态变化的回调获取当前状态，保证在正确的状态下执行对应操作。以免发生异常，影响开发效率。
    
3.  使用[OH\_AVPlayer\_SetOnErrorCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setonerrorcallback)接口设置异常信息的回调，发生异常后，监听错误事件，可以快速根据报错信息进行定位。
4.  通过[OH\_AVPlayer\_SetFDSource()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setfdsource)设置播放资源，设置成功后，播放器会进入initialized状态。
5.  执行[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口准备播放音频，播放器会进入prepared状态。
6.  执行[OH\_AVPlayer\_Play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_play)接口，播放音频资源。
    
    注意
    
    第4步设置完url、fdSrc等属性后，播放器并不是就立刻进入initialized状态；第5步执行完[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口，播放器也不是立刻进入prepared，都是需在[OH\_AVPlayer\_SetOnInfoCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setoninfocallback)注册状态变化的回调中，监听到播放器成功触发至initialized状态后，才能执行下一步的操作，否则接口会执行异常。
    
    7\. 执行[OH\_AVPlayer\_Pause()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_pause)接口，暂停音频资源。
    
    8\. 执行[OH\_AVPlayer\_Stop()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_stop)接口，停止播放音频资源。
    
    9\. 执行[OH\_AVPlayer\_Release()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_release)接口，销毁播放资源。
    

### 开发步骤

1\. 通过[OH\_AVPlayer\_Create()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_create)创建一个AVPlayer实例。

```cpp
void AVPlayer::InitPlayer() {
    // Check the residual status of the previous player
    if (ohAVPlayer != nullptr) {
        OH_LOG_INFO(LOG_APP, "Previous audio player remained and release it.");
        ReleasePlayer();
    }
    ohAVPlayer = OH_AVPlayer_Create();
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Create AVPlayer instance failed.");
        return;
    }
    // ...
    OH_LOG_INFO(LOG_APP, "Init player successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L184-L214)

2\. 使用[OH\_AVPlayer\_SetOnInfoCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setoninfocallback)注册状态变化的回调，对状态变化做出响应。

```cpp
// Define OHAVPlayerOnInfoCallback function
static void OHAVPlayerOnInfoCallback(OH_AVPlayer *player, AVPlayerOnInfoType type, OH_AVFormat *infoBody,
                                     [[maybe_unused]] void *userData) {
    if (player == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OHAVPlayerOnInfoCallback: the player is null.");
        return;
    }
    switch (type) {
    case AV_INFO_TYPE_STATE_CHANGE: {
        int32_t playerState = 0;
        int32_t stateChangeReason = 0;
        OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_STATE, &playerState);
        OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_STATE_CHANGE_REASON, &stateChangeReason);
        OH_LOG_INFO(LOG_APP, "The player state has been changed, state: %{public}d, reason: %{public}d.", playerState,
                    stateChangeReason);
        OHAVPlayerOnStateChange(player, playerState);
    } break;
     // ...
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L139-L172)

```cpp
// On player state change and process it
static void OHAVPlayerOnStateChange(OH_AVPlayer *player, int32_t playerState) {
    AVPlayer::GetInstance().PlayerState = playerState;
    switch (playerState) {
    case AV_IDLE:
        OH_LOG_INFO(LOG_APP, "playerState: AV_IDLE.");
        break;
    case AV_INITIALIZED:
        // ...
            // Prepare player
            ret = OH_AVPlayer_Prepare(player);
            // ...
        break;
    case AV_PREPARED:
        OH_LOG_INFO(LOG_APP, "playerState: AV_PREPARED.");
        // ...
            if (AVPlayer::GetInstance().WaitPlay) {
                AVPlayer::GetInstance().PlaySong();
            }
            // ...
        break;
        // ...
    default:
        break;
    }
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L28-L119)

3\. 使用[OH\_AVPlayer\_SetOnErrorCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setonerrorcallback)设置异常信息的回调，发生异常后，监听错误事件。

```cpp
// Define OHAVPlayerOnErrorCallback function
static void OHAVPlayerOnErrorCallback([[maybe_unused]] OH_AVPlayer *player, int32_t errCode, const char *errMsg,
                                      [[maybe_unused]] void *userData) {
    OH_LOG_ERROR(LOG_APP, "OHAVPlayerOnErrorCallback, errCode: %{public}d, errMsg: %{public}s.", errCode, errMsg);
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L176-L180)

4\. 通过[OH\_AVPlayer\_SetFDSource()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setfdsource)设置播放资源。

```cpp
void AVPlayer::LoadSongInfo(uint32_t songFd, uint32_t songFileSize, uint32_t songFileOffset) {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    AVPlayerState playerState = AV_IDLE;
    auto ret = OH_AVPlayer_GetState(ohAVPlayer, &playerState);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Get player state failed, ret: %{public}d", ret);
        return;
    }
    // When the application loads or plays the first song for the first time, the player does not need to be reset
    // In addition, the player cannot be reset in idle state, otherwise an error will be reported
    // When playing for the first time, the player is in idle state after creation.
    if (playerState != AV_IDLE) {
        ret = OH_AVPlayer_Reset(ohAVPlayer);
        if (ret != AV_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "Reset player failed, ret: %{public}d", ret);
            return;
        }
    }
    ret = OH_AVPlayer_SetFDSource(ohAVPlayer, songFd, songFileOffset, songFileSize);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Load song information failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP,
                "Load song information successfully. "
                "Song fd: %{public}d, "
                "file size: %{public}d, "
                "file offset: %{public}d.",
                songFd, songFileSize, songFileOffset);
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L218-L257)

5\. 执行[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口准备播放音频。

```cpp
// Prepare player
ret = OH_AVPlayer_Prepare(player);
if (ret != AV_ERR_OK) {
    OH_LOG_ERROR(LOG_APP, "Prepare player failed, ret: %{public}d", ret);
    (void)OH_AVPlayer_Release(player);
    player = nullptr;
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L48-L56)

6\. 执行[OH\_AVPlayer\_Play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_play)接口，播放音频资源。

```cpp
void AVPlayer::PlaySong() {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    if (PlayerState != AV_PREPARED && PlayerState != AV_PAUSED && PlayerState != AV_STOPPED &&
        PlayerState != AV_COMPLETED) {
        WaitPlay = true;
        return;
    }
    auto ret = OH_AVPlayer_Play(ohAVPlayer);
    WaitPlay = false;
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Play song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Play song successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L261-L278)

7\. 执行[OH\_AVPlayer\_Pause()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_pause)接口，暂停播放音频。

```cpp
void AVPlayer::PauseSong() {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_Pause(ohAVPlayer);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Pause song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Pause song successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L294-L306)

8\. 执行[OH\_AVPlayer\_Stop()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_stop)接口，停止播放音频资源。

```cpp
void AVPlayer::StopSong() {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_Stop(ohAVPlayer);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Stop song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Stop song successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L310-L321)

9\. 执行[OH\_AVPlayer\_Release()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_release)接口，销毁播放资源。

```cpp
void AVPlayer::ReleasePlayer() {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_Release(ohAVPlayer);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Release player failed, ret: %{public}d", ret);
        return;
    }
    ohAVPlayer = nullptr;
    OH_LOG_INFO(LOG_APP, "Release player successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L388-L400)

## 跳转播放

### 场景描述

通过点击或拖动进度条精准跳转到指定时间进行播放。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/33/v3/dLOA2b4PQpmdlvluxDjezw/zh-cn_image_0000002524217654.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=6DF1A1EEBBDBEC9330B145E7990E41790D75CFCEF47DD8471F158C00730DF140 "点击放大")

### 实现原理

使用[Slider组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider)实现进度条，在[onChange()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider#onchange)回调中触发进度调节获取目标时间，使用AVPlayer的[seek()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#seek9)接口，跳转到目标时间。

### 开发步骤

使用avplayer的[OH\_AVPlayer\_Seek()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_seek)接口，跳转到目标时间。

```cpp
void AVPlayer::SeekPlaySong(uint32_t timeStamp) {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_Seek(ohAVPlayer, timeStamp, AV_SEEK_CLOSEST);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Seek song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Seek song successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L325-L336)

## 静音播放

### 场景描述

通过界面按钮快捷切换音频播放静音状态，实现一键开启或关闭静音。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/12/v3/kENUBtMsSAqOdSOMar--8g/zh-cn_image_0000002555337523.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=2924BDF16E7A7287C8E859EE68BFD228683568DA47D870471DCB71B67F5BD369 "点击放大")

### 实现原理

使用avplayer的[OH\_AVPlayer\_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume)接口设置音量为0，进入静音模式状态。

### 开发步骤

调用avplayer的[OH\_AVPlayer\_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume)接口，如果确定开启静音模式，则将音量设置成0。

```cpp
void AVPlayer::SetSilentMode(bool isSilentMode) {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    // If the isSilentMode is true, set the volume to 0; Otherwise, restore the latest volume value
    float volume = isSilentMode ? 0 : lastVolume;
    auto ret = OH_AVPlayer_SetVolume(ohAVPlayer, volume, volume);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "SetSilentMode: set app volume failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Set silent mode successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L371-L384)

## 切换歌曲播放

### 场景描述

点击上一首或下一首或歌单列表中的歌曲进行不同歌曲播放。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a9/v3/44zaox6VRfq9_CeSKKVDtQ/zh-cn_image_0000002524057660.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=69F032EDFD357B5F1345257127485DEC54623C748191220BE623DB62E78713F4 "点击放大")

### 实现原理

使用[OH\_AVPlayer\_Reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_reset)接口重置播放器状态，给AVPlayer的fd或fdSrc属性赋值为新的歌曲资源，实现播放不同歌曲的功能。

### 开发步骤

1\. 停止当前播放的歌曲。

```cpp
void AVPlayer::StopSong() {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_Stop(ohAVPlayer);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Stop song failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Stop song successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L310-L321)

2\. 用[OH\_AVPlayer\_Reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_reset)接口重置播放器状态。

```cpp
ret = OH_AVPlayer_Reset(ohAVPlayer);
if (ret != AV_ERR_OK) {
    OH_LOG_ERROR(LOG_APP, "Reset player failed, ret: %{public}d", ret);
    return;
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L237-L241)

3.使用[OH\_AVPlayer\_SetFDSource()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setfdsource)设置播放资源。

```cpp
void AVPlayer::LoadSongInfo(uint32_t songFd, uint32_t songFileSize, uint32_t songFileOffset) {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    AVPlayerState playerState = AV_IDLE;
    auto ret = OH_AVPlayer_GetState(ohAVPlayer, &playerState);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Get player state failed, ret: %{public}d", ret);
        return;
    }
    // When the application loads or plays the first song for the first time, the player does not need to be reset
    // In addition, the player cannot be reset in idle state, otherwise an error will be reported
    // When playing for the first time, the player is in idle state after creation.
    if (playerState != AV_IDLE) {
        ret = OH_AVPlayer_Reset(ohAVPlayer);
        if (ret != AV_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "Reset player failed, ret: %{public}d", ret);
            return;
        }
    }
    ret = OH_AVPlayer_SetFDSource(ohAVPlayer, songFd, songFileOffset, songFileSize);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Load song information failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP,
                "Load song information successfully. "
                "Song fd: %{public}d, "
                "file size: %{public}d, "
                "file offset: %{public}d.",
                songFd, songFileSize, songFileOffset);
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L218-L257)

## 倍速设置

### 场景描述

滑动倍速调节面板调节播放速度。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/f4/v3/VwoYpRxfSTOPqgJ9jkdACw/zh-cn_image_0000002555217553.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=29B7B702A3CF41702A5A2444EEF6159E5C40642698784AE1DDEBB5E0B45A1EF3 "点击放大")

### 实现原理

通过调节面板获取目标速度值，传入[OH\_AVPlayer\_SetPlaybackRate()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setplaybackrate)接口中，实现设置播放速度的功能。

### 开发步骤

1\. 通过调节面板获取速度值，传入[OH\_AVPlayer\_SetPlaybackRate()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setplaybackrate)接口中。

```typescript
Slider({
  value: this.speed,
  min: 0.25,
  max: 2,
  step: 0.25,
  style: SliderStyle.OutSet
})
  .layoutWeight(1)
  .showTips(true, this.speed.toString())
  .showSteps(true)
  .onChange((value: number, mode: SliderChangeMode) => {
    this.speed = value;
    MediaControlCenter.getInstance().setSpeed(this.speed);
    console.info('value:' + value + 'mode:' + mode.toString());
  })
```

[ControlAreaComponent.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/ets/view/ControlAreaComponent.ets#L378-L392)

2\. 使用[OH\_AVPlayer\_SetPlaybackRate()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setplaybackrate)接口设置播放倍速。

```cpp
void AVPlayer::SetPlayingSpeed(float speed) {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_SetPlaybackRate(ohAVPlayer, speed);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Set playing speed failed, ret: %{public}d", ret);
        return;
    }
    OH_LOG_INFO(LOG_APP, "Set playing speed successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L340-L351)

## 音量设置

### 场景描述

滑动音量调节面板调节播放音量。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/90/v3/6-usymEcTTqm9Zhn_Mtj_A/zh-cn_image_0000002524217656.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022246Z&HW-CC-Expire=86400&HW-CC-Sign=50A03A0F623EED3AEABA92ACE67F7BB20668FDF6DA3FE62BA44D296659E0B1BF "点击放大")

### 实现原理

通过调节面板获取目标音量值，输入到[OH\_AVPlayer\_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume)接口中，实现设置播放音量的功能。

### 开发步骤

1\. 通过调节面板获取音量值，传入[OH\_AVPlayer\_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume)接口中。

```typescript
Slider({
  value: this.volume,
  min: 0,
  max: 1,
  step: 0.1,
  style: SliderStyle.OutSet
})
  .showTips(false)
  .layoutWeight(1)
  .onChange((value: number, mode: SliderChangeMode) => {
    this.volume = value;
    if (this.volume === 0) {
      this.isSilentMode = true
    } else {
      this.isSilentMode = false;
    }
  })
```

[ControlAreaComponent.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/ets/view/ControlAreaComponent.ets#L312-L328)

2\. 使用[OH\_AVPlayer\_SetVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setvolume)设置播放音量。

```cpp
void AVPlayer::SetPlayingVolume(float volume) {
    if (ohAVPlayer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "The ohAVPlayer is null.");
        return;
    }
    auto ret = OH_AVPlayer_SetVolume(ohAVPlayer, volume, volume);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "Set app volume failed, ret: %{public}d", ret);
        return;
    }
    lastVolume = volume;
    OH_LOG_INFO(LOG_APP, "Set app volume successfully.");
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L355-L367)

## 常见问题

### 执行AVPlayer的方法时失败，返回错误码3

**问题现象**

在调用AVPlayer的[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)、[OH\_AVPlayer\_Play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_play)、[OH\_AVPlayer\_Stop()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_stop)等方法时，会执行失败，返回错误码3。如以下场景。

-   设置完url、fdSrc等属性后，代码下一行就立刻执行[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口，执行出错，返回错误码3。
-   同样，执行完[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口，代码下一行立刻执行[OH\_AVPlayer\_Play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_play)接口，执行出错，返回错误码3。

**可能原因**

通过[OH\_AVErrCode](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-averrors-h#oh_averrcode)错误码查出，错误码3对应的信息为“AV\_ERR\_INVALID\_VAL ”，可能得原因是AVPlayer的当前状态不支持此操作。AVPlayer播放器在执行不同的操作前，必须要保证此时处于正确的状态，比如执行播放操作前，只有当前状态在prepared/paused/completed时，才能正确执行。针对问题现象中举例的两种场景，其错误的原因可能如下。

-   设置完url、fdSrc等属性后，AVPlayer并不是就立刻进入initialized状态，如果设置完url属性后就立刻执行[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口，当代码运行此行时，AVPlayer的播放状态可能还是处于idle的状态，并没有变成initialized，这时就可能产生此错误。
-   同样，执行完[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口，AVPlayer也不是立刻进入prepared状态，如果此时立刻执行[OH\_AVPlayer\_Play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_play)接口，AVPlayer的播放状态可能还没有变成prepared状态，执行就可能报错。

**解决方案**

1\. 先了解在AVPlayer的不同播放状态下，可以执行哪些接口。熟悉AVPlayer的播放状态和不同接口间的关系，可以参考[使用AVPlayer播放音频](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/using-ndk-avplayer-for-playback)一节中的播放状态变化示意图一节中的播放状态变化示意图。

2\. 保证在在正确的播放状态下，执行对应的接口。建议开发者务必使用[OH\_AVPlayer\_SetOnInfoCallback()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_setoninfocallback)注册状态变化的回调，当监听到AVPlayer的播放状态到达目标状态时，执行对应的接口。当监听到AVPlayer处于initialized状态时，再执行[OH\_AVPlayer\_Prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_prepare)接口，监听到AVPlayer处于prepared状态时，再执行[OH\_AVPlayer\_Play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-avplayer-h#oh_avplayer_play)接口。

```cpp
// On player state change and process it
static void OHAVPlayerOnStateChange(OH_AVPlayer *player, int32_t playerState) {
    AVPlayer::GetInstance().PlayerState = playerState;
    switch (playerState) {
    case AV_IDLE:
        OH_LOG_INFO(LOG_APP, "playerState: AV_IDLE.");
        break;
    case AV_INITIALIZED:
        // ...
            // Prepare player
            ret = OH_AVPlayer_Prepare(player);
            // ...
        break;
    case AV_PREPARED:
        OH_LOG_INFO(LOG_APP, "playerState: AV_PREPARED.");
        // ...
            if (AVPlayer::GetInstance().WaitPlay) {
                AVPlayer::GetInstance().PlaySong();
            }
            // ...
        break;
        // ...
    default:
        break;
    }
}
```

[avplayer\_playing.cpp](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp/blob/master/entry/src/main/cpp/player/avplayer_playing.cpp#L28-L119)

## 示例代码

-   [基于AVPlayer播放格式化音频（C++）](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-cpp)

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-cpp*