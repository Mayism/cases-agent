---
title: @performance/nested-post-frame-callback-check
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-nested-post-frame-callback-check
category: 指南
updated_at: 2026-03-13T04:38:34.266Z
---

# @performance/nested-post-frame-callback-check

postFrameCallback会请求vsync，循环嵌套调用postFrameCallback会导致一直请求vsync，从而引起无效渲染问题。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/nested-post-frame-callback-check": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
import {FrameCallback } from '@kit.ArkUI';
class MyFrameCallback extends FrameCallback {
  private tag: string;
  constructor(tag: string) {
    super();
    this.tag = tag;
  }
  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
  }
}
@Entry
@Component
struct Index {
  build() {
    Row() {
      Button('Invoke postFrameCallback')
        .onClick(() => {
          this.getUIContext().postFrameCallback(new MyFrameCallback("normTask"));
        })
    }
  }
}
```

## 反例

```typescript
import { FrameCallback, UIContext } from '@kit.ArkUI';
class MyFrameCallback extends FrameCallback {
  private tag: string;
  constructor(tag: string) {
    super();
    this.tag = tag;
    const uiContext = new UIContext();
    uiContext.postFrameCallback(new MyFrameCallback1("normTask1"));
  }
  onFrame(frameTimeNanos: number) {
    new UIContext().postFrameCallback(new MyFrameCallback1("normTask1"));
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
  }
}
class MyFrameCallback1 extends FrameCallback {
  private tag: string;
  constructor(tag: string) {
    super();
    this.tag = tag;
  }
  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback1 ' + this.tag + ' ' + frameTimeNanos.toString());
  }
}
@Entry
@Component
struct Index {
  build() {
    Row() {
      Button('Nested postFrameCallback')
        .onClick(() => {
          this.getUIContext().postFrameCallback(new MyFrameCallback("normTask"));
        })
    }
  }
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-nested-post-frame-callback-check*