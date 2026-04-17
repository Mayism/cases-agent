---
title: @performance/hp-arkui-avoid-empty-callback
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-avoid-empty-callback
category: 指南
updated_at: 2026-03-13T04:32:07.112Z
---

# @performance/hp-arkui-avoid-empty-callback

避免设置空的系统回调监听。

根据ArkUI编程规范，建议修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkui-avoid-empty-callback": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
@Component
struct MyComponent {
  doSomething() {
    //业务逻辑
  }
  build() {
    Button('Click', { type: ButtonType.Normal, stateEffect: true })
      .onClick(() => {
        this.doSomething()
      })
  }
}
```

## 反例

```cangjie
@Component
struct MyComponent {
  build() {
    Button('Click', { type: ButtonType.Normal, stateEffect: true })
      .onClick(() => {
        // 无业务逻辑
      })
  }
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-avoid-empty-callback*