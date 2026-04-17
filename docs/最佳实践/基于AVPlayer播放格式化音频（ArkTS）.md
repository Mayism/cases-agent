---
title: 基于AVPlayer播放格式化音频（ArkTS）
source: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts
category: 最佳实践
updated_at: 2026-03-13T02:22:49.486Z
---

# 基于AVPlayer播放格式化音频（ArkTS）

## 概述

AVPlayer可以用于播放格式化音频，支持WAV、MP3和FLAC等格式的音频。AVPlayer提供了ArkTS API和Native API，本文指导开发者使用AVPlayer的ArkTS API实现播放格式化音频的功能，主要涉及基本播控、精准跳转、静音播放、倍速播放、音量控制、焦点管理、后台播放与接入播控中心、冷启动等开发场景。

本文是音频播放系列文章的第3篇，实现的功能效果如下：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6/v3/dfATdrG4QgqRYw8fK1JfFw/zh-cn_image_0000002555217523.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=C09818EFB0F3316A28CAED3B9D72B6A81298258EC1E317EE48E3AB742133449F "点击放大") ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9c/v3/wYolLo1zRJ26Aj0uQFufvw/zh-cn_image_0000002524217626.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=564E7F1F8C1CE9B1FF9163C985DA8C5B258382C1E26BB28A49D56FF9777091A5 "点击放大") ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/97/v3/u4hJvP8tQ-GIN37Cq_Fecg/zh-cn_image_0000002555337497.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=A392257C22FFE821C58CDA12DF878C1EF69E0E9151F9B3B85CDBB25EFE31111F "点击放大")

## 场景分析

| 场景名称 | 描述 | 实现方案 |
| --- | --- | --- |
| [基础播控](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts#section1764813377511) | 音频资源的加载、播放、暂停、退出等操作。 | [AVPlayer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer) |
| [跳转播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts#section16920851193717) | 滑动进度条精准跳转到指定时间进行播放。 | [Slider组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider) |
| [静音播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts#section125715278533) | 点击按钮设置静音播放。 | [setMediaMuted()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setmediamuted12) |
| [切换歌曲播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts#section590418431566) | 点击上一首或下一首或歌单列表中的歌曲进行不同歌曲播放。 | [reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#reset9-1) |
| [倍速设置](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts#section189460361122) | 滑动倍速调节面板调节播放速度。 | [setSpeed()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setspeed9) |
| [音量设置](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts#section88718617116) | 滑动音量调节面板调节播放音量。 | [setVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setvolume9) |
| [接入播控中心](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section06660114245) | 通过播控中心，控制播放、暂停、切换音频、调整播放进度、切换循环模式 | [接入播控中心](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section06660114245) |
| [后台播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section1749719114143) | 音频切换到后台播放。 | [后台播放](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section1749719114143) |
| [接入播控中心冷启动和历史歌单](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section476545143517) | 应用退出后，播控中心显示历史歌单，点击播控中心播放按钮拉起应用播放，或者点击歌单拉起应用播放。 | [接入播控中心冷启动和历史歌单](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-pcm-audio-based-audiorenderer#section476545143517) |

## 基础播控

### 场景描述

通过[AVPlayer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer)实现核心音频播放控制能力，包括音频资源加载、播放、暂停、停止及退出等操作。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/33/v3/xQKGGudlTFaFgLCFTNlg3g/zh-cn_image_0000002524057632.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=F2C4B97E976F60372587EB41B186768B64425D0877B16353C92B41ABDFEE8A37 "点击放大")

### 实现原理

核心原理是使用[AVPlayer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer)接口实现播放、暂停等功能，需要特别注意的是，AVPlayer播放器在执行不同的操作前，必须要保证此时处于正确的状态，比如执行播放操作前，只有当前状态在prepared/paused/completed时，才能正确执行，否则系统可能会抛出异常或生成其他未定义的行为。AVPlayer的播放状态和不同接口间的关系参考[使用AVPlayer播放视频](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-playback)一节中的播放状态变化示意图。

主要的开发步骤如下：

1.  开发者可以通过[createAVPlayer()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-f#mediacreateavplayer9)构建一个AVPlayer实例，创建成功后，此时播放器处于idle状态。
2.  注册[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)回调，主动获取当前状态变化。
    
    注意
    
    因为AVPlayer播放器的接口是否能正常执行和当前的播放器状态有必然联系，建议开发者务必注册[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)状态监听或者使用AVPlayer的state属性主动获取当前状态，保证在正确的状态下执行对应操作。以免发生异常，影响开发效率。
    
3.  注册[on('error')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onerror9)回调，发生异常后，监听错误事件，可以快速根据报错信息进行定位。
4.  通过url、fdSrc等属性设置播放资源，设置成功后，播放器会进入initialized状态。
5.  执行[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口准备播放音频。需在[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)事件中，监听到播放器成功触发至initialized状态后，才能调用。执行完[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口后，播放器会进入prepared状态。
6.  执行[play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#play9)接口，播放音频资源。
    
    注意
    
    第4步设置完url、fdSrc等属性后，播放器并不是就立刻进入initialized状态；第5步执行完[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口，播放器也不是立刻进入prepared，都是需在[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)事件中，监听到播放器成功触发至initialized状态后，才能执行下一步的操作，否则接口会执行异常。
    
    7\. 执行[pause()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#pause9)接口，暂停音频资源。
    
    8\. 执行[stop()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#stop9)接口，停止播放音频资源。
    
    9\. 执行[release()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#release9)，销毁播放资源。
    

### 开发步骤

1\. 通过[createAVPlayer()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-f#mediacreateavplayer9)创建一个AVPlayer实例。

```typescript
// Initialize the player
public async initAVPlayer() {
  if (this.avPlayer) {
    Logger.info(TAG, 'avPlayer already created');
    return;
  }
  this.avPlayer = await media.createAVPlayer();
  this.genSpeedMap();
  Logger.info(TAG, `createAVPlayer success， curState is ${this.avPlayer?.state}`);
  this.setAVPlayerCallbacks();
  Logger.info(TAG, `setAVPlayerCallbacks success，curState is ${this.avPlayer?.state}`);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L59-L70)

2\. 注册[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)回调，主动获取当前状态变化。

```typescript
// Watch state
private stateChangeCallback() {
  if (!this.avPlayer) {
    Logger.error(TAG, `stateChangeCallback , avPlayer is undefined`);
    return;
  }
  this.avPlayer.on('stateChange', async (state: media.AVPlayerState, reason: media.StateChangeReason) => {
    this.currentState = state;
    switch (state) {
      case 'idle':
        Logger.info(TAG, `state idle called , resson is ${reason}`);
        break;
      case 'initialized':
        Logger.info(TAG, `state initialized called , resson is ${reason}`);
        this.setAudioRendererInfo();
        this.prepare();
        break;
      case 'prepared':
        Logger.info(TAG, `state prepared called , resson is ${reason}`);
        if (this.waitPlay) {
          this.play();
        }
        break;
      // ...
    }
  });
  Logger.info(TAG, `set stateChangeCallback success`);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L259-L308)

3\. 注册[on('error')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onerror9)回调，发生异常后，监听错误事件。

```typescript
private errorCallback() {
  if (!this.avPlayer) {
    return;
  }
  this.avPlayer.on('error', (error: BusinessError) => {
    Logger.error(TAG, `errorCallback , code is ${error.code} message is ${error.message}`);
  });
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L248-L255)

4\. 通过[url](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#属性)、[fdSrc](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#属性)等属性设置播放资源。

```typescript
async loadSongAssent(songRawFileDescriptor: resourceManager.RawFileDescriptor) {
  if (!songRawFileDescriptor) {
    Logger.error(TAG, `loadSongAssent faile : songRawFileDescriptor get failed`);
    return;
  }
  if (!this.avPlayer) {
    return;
  }
  this.avPlayer.fdSrc = songRawFileDescriptor;
  Logger.info(TAG, `set avPlayer url is ${this.avPlayer.fdSrc}，curState is ${this.avPlayer?.state}`);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L21-L31)

5\. 执行[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口准备播放音频。

```typescript
// Prepare the player
public async prepare() {
  if (!this.avPlayer) {
    Logger.info(TAG, 'avPlayer is undefined')
    return;
  }
  await this.avPlayer.prepare().then(() => {
    Logger.info(TAG, `prepare success , curState is ${this.avPlayer?.state}`);
    AppStorage.setOrCreate('totalTime', MediaTools.msToCountdownTime(this.avPlayer?.duration!));
    AppStorage.setOrCreate('totalMsTime', this.avPlayer?.duration!);
    AppStorage.setOrCreate('progressMax', this.avPlayer?.duration!);
  });
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L74-L86)

6\. 执行[play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#play9)接口，开始播放音频资源。

```typescript
public async play() {
  if (!this.avPlayer) {
    Logger.info(TAG, 'avPlayer is undefined')
    return;
  }
  if (this.currentState !== 'prepared' && this.currentState !== 'paused' && this.currentState !== 'stopped' &&
    this.currentState !== 'completed') {
    this.waitPlay = true;
    Logger.info(TAG, 'avPlayer current playState is not prepared')
    return;
  }
  await this.avPlayer.play();
  this.waitPlay = false;
  Logger.info(TAG, 'play success');
  this.updateIsPlay(true);
  Logger.info(TAG, `curState is ${this.avPlayer?.state}`);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L124-L140)

7\. 执行[pause()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#pause9)接口，暂停播放。

```typescript
public pause() {
  if (!this.avPlayer) {
    Logger.info(TAG, 'avPlayer is undefined')
    return;
  }
  this.avPlayer.pause();
  this.updateIsPlay(false);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L144-L151)

8\. 执行[stop()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#stop9)接口，停止播放音频。

```typescript
public async stop() {
  if (!this.avPlayer) {
    Logger.error(TAG, 'avPlayer is undefined')
    return;
  }
  await this.avPlayer.stop();
  await this.avPlayer.reset();
  Logger.info(TAG, 'avPlayer stop success')
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L165-L173)

9\. 执行[release()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#release9)，销毁播放资源。

```typescript
public release() {
  if (!this.avPlayer) {
    Logger.error(TAG, 'avPlayer is undefined')
    return;
  }
  this.avPlayer.release();
  Logger.error(TAG, 'avPlayer release success');
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L188-L195)

## 跳转播放

### 场景描述

通过点击或拖动进度条精准跳转到指定时间进行播放。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/09/v3/j0s3LVMdQTyrRqyqFkyJhA/zh-cn_image_0000002555217525.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=D2AC94D27C7BB7FC510D5828A8671ED344311E9A828BECD0D811D35ADF9BA72B "点击放大")

### 实现原理

使用[Slider组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider)实现进度条，在[onChange()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider#onchange)回调中触发进度调节获取目标时间，使用AVPlayer的[seek()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#seek9)接口，跳转到目标时间。

### 开发步骤

使用AVPlayer的[seek()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#seek9)接口，跳转到目标时间。

```typescript
public seek(ms: number) {
  if (!this.avPlayer) {
    Logger.info(TAG, 'avPlayer is undefined')
    return;
  }
  this.avPlayer.seek(ms);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L155-L161)

## 静音播放

### 场景描述

通过界面按钮快捷切换音频播放静音状态，实现一键开启或关闭静音。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/34/v3/j48r4ctvTAW4aeoOTDtUww/zh-cn_image_0000002524217628.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=49975DBE5E92C917789B22C37132DD5ACD4AD17519BD831020E45684AF11BC9E "点击放大")

### 实现原理

使用AVPlayer的[setMediaMuted()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setmediamuted12)接口，第二个参数设置为true为开启静音播放，设置为false为取消静音播放。

### 开发步骤

调用AVPlayer的[setMediaMuted()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setmediamuted12)设置静音。

```typescript
public setSilentMode(isSilentMode: boolean) {
  if (!this.avPlayer) {
    Logger.error(TAG, 'avPlayer is undefined')
    return;
  }
  this.avPlayer.setMediaMuted(media.MediaType.MEDIA_TYPE_AUD, isSilentMode);
  Logger.info(TAG, `avPlayer setMediaMuted is ${isSilentMode} success`)
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L177-L184)

## 切换歌曲播放

### 场景描述

点击上一首或下一首或歌单列表中的歌曲进行不同歌曲播放。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/9f/v3/SZWtehwdRKKoT0RQvqJIXQ/zh-cn_image_0000002555337501.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=AAC669F9798BEB534CCA3DEA4DBE05D51E7D8B4F61DFD3E3C6B8F56E77DA5ECF "点击放大")

### 实现原理

使用[reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#reset9-1)接口重置播放器状态，给AVPlayer的fd或fdSrc属性赋值为新的歌曲资源，实现播放不同歌曲的功能。

### 开发步骤

1\. 停止当前播放的歌曲， 用[reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#reset9-1)接口重置播放器状态。

```typescript
public async stop() {
  if (!this.avPlayer) {
    Logger.error(TAG, 'avPlayer is undefined')
    return;
  }
  await this.avPlayer.stop();
  await this.avPlayer.reset();
  Logger.info(TAG, 'avPlayer stop success')
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L165-L173)

2\. 给AVPlayer的fd或fdSrc属性赋值为新的歌曲资源。

```typescript
async loadSongAssent(songRawFileDescriptor: resourceManager.RawFileDescriptor) {
  if (!songRawFileDescriptor) {
    Logger.error(TAG, `loadSongAssent faile : songRawFileDescriptor get failed`);
    return;
  }
  if (!this.avPlayer) {
    return;
  }
  this.avPlayer.fdSrc = songRawFileDescriptor;
  Logger.info(TAG, `set avPlayer url is ${this.avPlayer.fdSrc}，curState is ${this.avPlayer?.state}`);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L21-L31)

## 倍速设置

### 场景描述

滑动倍速调节面板调节播放速度。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/74/v3/QXtzMUxeQS2Rz0JQ_J5JDw/zh-cn_image_0000002524057634.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=5C730A0BEDDFEE746E13713D4EAA0503B6D0E93117D66B3927FF6FFBFD299963 "点击放大")

### 实现原理

通过调节面板获取目标速度值，输入到[setSpeed()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setspeed9)接口中，实现设置播放速度的功能。

### 开发步骤

1\. 通过调节面板获取速度值，传入[setSpeed()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setspeed9)接口中。

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

[ControlAreaComponent.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/view/ControlAreaComponent.ets#L379-L393)

2\. 使用[setSpeed()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setspeed9)接口设置播放速度。

```typescript
// Set Speed
public setSpeed(speed: number) {
  if (!this.avPlayer) {
    Logger.info(TAG, 'avPlayer is undefined')
    return;
  }
  Logger.info(TAG, `set speed is ${speed}`)
  this.avPlayer.setSpeed(this.switchSpeed(speed));
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L100-L108)

## 音量设置

### 场景描述

滑动音量调节面板调节播放音量。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b8/v3/X8-HDdBtQiio6igaQ06oyA/zh-cn_image_0000002555217531.gif?HW-CC-KV=V1&HW-CC-Date=20260313T022242Z&HW-CC-Expire=86400&HW-CC-Sign=C63CF13B2AD265866219B8C8EA4BC5E20C195E4AB137D5E840E1B55A3DAADFAF "点击放大")

### 实现原理

通过调节面板获取目标音量值，输入到[setVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setvolume9)接口中，实现设置播放音量的功能。

### 开发步骤

1\. 通过调节面板获取音量值，传入[setVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setvolume9)接口中。

```typescript
Slider({
  value: this.volume,
  min: 0,
  max: 100,
  step: 1,
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

[ControlAreaComponent.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/view/ControlAreaComponent.ets#L313-L329)

2\. 使用[setVolume()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#setvolume9)设置播放音量。

```typescript
// Set Volume
public setVolume(volume: number) {
  if (!this.avPlayer) {
    Logger.info(TAG, 'avPlayer is undefined')
    return;
  }
  Logger.info(TAG, `set volume is ${volume}`)
  this.avPlayer.setVolume(volume / 100);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L112-L120)

## 常见问题

### 执行AVPlayer的方法时失败，返回错误信息“Operation not allowed.”

**问题现象**

在调用AVPlayer的prepare、play、stop等方法时，会执行失败，返回错误信息“Operation not allowed.”。如以下场景。

-   设置完url、fdSrc等属性后，代码下一行就立刻执行[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口，执行出错，返回错误信息“Operation not allowed.”。
-   同样，执行完[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口，代码下一行立刻执行[play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#play9)接口，执行出错，返回错误信息“Operation not allowed.”。

**可能原因**

AVPlayer的当前状态不支持此操作，执行接口前检查下当前AVPlayer的播放状态。AVPlayer播放器在执行不同的操作前，必须要保证此时处于正确的状态，比如执行播放操作前，只有当前状态在prepared/paused/completed时，才能正确执行。针对问题现象中举例的两种场景，其错误的原因可能如下。

-   设置完url、fdSrc等属性后，AVPlayer并不是就立刻进入initialized状态，如果设置完url属性后就立刻执行[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口，当代码运行此行时，AVPlayer的播放状态可能还是处于idle的状态，并没有变成initialized，这时就可能产生“Operation not allowed.”的错误。
-   同样，执行完[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口，AVPlayer也不是立刻进入prepared状态，如果此时立刻执行[play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#play9)接口，AVPlayer的播放状态可能还没有变成prepared状态，执行就可能报错。

**解决方案**

1\. 先了解在AVPlayer的不同播放状态下，可以执行哪些接口。熟悉AVPlayer的播放状态和不同接口间的关系，可以参考[使用AVPlayer播放视频](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/video-playback)一节中的播放状态变化示意图。

2\. 保证在在正确的播放状态下，执行对应的接口。建议开发者务必注册[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)状态监听，当监听到AVPlayer的播放状态到达目标状态时，执行对应的接口。在[on('stateChange')](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#onstatechange9)中监听到AVPlayer处于initialized状态时，再执行[prepare()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#prepare9)接口，监听到AVPlayer处于prepared状态时，再执行[play()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#play9)接口。

```typescript
// Watch state
private stateChangeCallback() {
  if (!this.avPlayer) {
    Logger.error(TAG, `stateChangeCallback , avPlayer is undefined`);
    return;
  }
  this.avPlayer.on('stateChange', async (state: media.AVPlayerState, reason: media.StateChangeReason) => {
    this.currentState = state;
    switch (state) {
      case 'idle':
        Logger.info(TAG, `state idle called , resson is ${reason}`);
        break;
      case 'initialized':
        Logger.info(TAG, `state initialized called , resson is ${reason}`);
        this.setAudioRendererInfo();
        this.prepare();
        break;
      case 'prepared':
        Logger.info(TAG, `state prepared called , resson is ${reason}`);
        if (this.waitPlay) {
          this.play();
        }
        break;
      // ...
    }
  });
  Logger.info(TAG, `set stateChangeCallback success`);
}
```

[AVPlayerController.ets](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts/blob/master/entry/src/main/ets/common/utils/mediautils/AVPlayerController.ets#L259-L308)

## 示例代码

-   [基于AVPlayer播放格式化音频（ArkTS）](https://gitcode.com/HarmonyOS_Samples/avplayer-play-formatted-audio-arkts)

---

*来源: https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-playing-formatted-audio-based-avplayer-arkts*