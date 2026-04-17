---
title: AudioRenderer是否有跳转到某一帧的接口
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-audio-7
category: FAQ
updated_at: 2026-03-13T05:12:35.257Z
---

# AudioRenderer是否有跳转到某一帧的接口

AudioRenderer底层不支持跳转到某一帧。AudioRenderer接口由客户端主动发送数据，完成后即开始播放。而AvPlayer支持跳转到某一帧，因为它有数据源，例如文件。可使用avPlayer.seek()方法跳转到指定播放位置，只能在prepared/playing/paused/completed状态调用。

```typescript
let seekTime: number = 1000
avPlayer.seek(seekTime,media.SeekMode.SEEK_PREV_SYNC)
```

[AvSeek.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/AudioKit/entry/src/main/ets/pages/AvSeek.ets#L13-L14)

**参考链接**

[seek](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#seek9)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-audio-7*