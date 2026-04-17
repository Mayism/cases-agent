---
title: 使用video组件播放视频时，如何刷新重新加载视频？比如网络异常导致播放失败等情况
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-media-5
category: FAQ
updated_at: 2026-03-13T05:15:24.623Z
---

# 使用video组件播放视频时，如何刷新重新加载视频？比如网络异常导致播放失败等情况

先将URL设置为空，再改回原来的值，示例代码如下：

```typescript
@Component
export struct VideoErrorReload {
  @State url: string = 'https://******';
  build() {
    Column({ space: 20 }) {
      Video({ src: this.url })
        .height(300)
      Button('重新url')
        .onClick(() => {
          let temp = this.url;
          this.url = '';
          setTimeout(() => {
            this.url = temp;
          }, 100);
        })
    }
  }
}
```

[VideoErrorReload.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/AudioKit/entry/src/main/ets/pages/VideoErrorReload.ets#L6-L25)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-media-5*