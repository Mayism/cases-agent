---
title: 如何实现使用AVPlayer播放音频的过程中打断当前播放去播放另一个音频
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-media-3
category: FAQ
updated_at: 2026-03-13T05:15:12.787Z
---

# 如何实现使用AVPlayer播放音频的过程中打断当前播放去播放另一个音频

需要先调用[reset()](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-media-avplayer#reset9)打断前一个音频，然后切换音频源。因为reset()是异步的，所以调用reset()的语句需加上await关键字。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-media-3*