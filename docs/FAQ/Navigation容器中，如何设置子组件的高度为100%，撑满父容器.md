---
title: Navigation容器中，如何设置子组件的高度为100%，撑满父容器
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-263
category: FAQ
updated_at: 2026-03-13T04:01:38.750Z
---

# Navigation容器中，如何设置子组件的高度为100%，撑满父容器

参考代码如下：

```typescript
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
const DOMAIN = 0x0000;
const TAG = 'FullNavigationSubComponent';
@Entry
@Component
struct FullNavigationSubComponent {
  context = this.getUIContext();
  onPageShow(): void {
    window.getLastWindow(this.context.getHostContext(), (err, win) => {
      if (err != null) {
        hilog.error(DOMAIN, TAG, `getLastWindow failed  code:${err.code};message:${err.message}`);
      } else {
        win.setWindowLayoutFullScreen(true);
      }
    })
  }
  build() {
    Navigation() {
      Column() {
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .title('Personalization Settings')
    .titleMode(NavigationTitleMode.Mini)
    .backgroundColor(Color.Grey)
  }
}
```

[FullNavigationSubcomponent.ets](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/ArkUI/entry/src/main/ets/pages/FullNavigationSubcomponent.ets#L21-L56)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkui-263*