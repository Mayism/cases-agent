---
title: @performance/high-frequency-log-check
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-high-frequency-log-check
category: 指南
updated_at: 2026-03-13T04:36:50.966Z
---

# @performance/high-frequency-log-check

不建议在高频函数中使用Hilog。

高频函数包括：onTouch、onItemDragMove、onDragMove、onMouse、onVisibleAreaChange、onAreaChange、onScroll（已废弃）、onWillScroll。

高耗时函数处理场景下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/high-frequency-log-check": "warn",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
// Test.ets
@Entry
@Component
struct Index {
  build() {
    Column() {
      Scroll()
        .onWillScroll(() => {
          const TAG = 'onWillScroll';
        })
    }
  }
}
```

## 反例

```typescript
// Test.ets
import hilog from '@ohos.hilog';
@Entry
@Component
struct Index {
  build() {
    Column() {
      Scroll()
        .onWillScroll(() => {
          // Avoid printing logs
          hilog.info(1001, 'Index', 'onWillScroll');
        })
    }
  }
}
```

## 规则集

```cangjie
plugin:@performance/recommended
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-high-frequency-log-check*