---
title: @performance/hp-arkui-use-local-var-to-replace-state-var
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-use-local-var-to-replace-state-var
category: 指南
updated_at: 2026-03-13T04:35:28.137Z
---

# @performance/hp-arkui-use-local-var-to-replace-state-var

建议使用临时变量替换状态变量。

通用丢帧场景下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkui-use-local-var-to-replace-state-var": "warn",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
@Entry
@Component
struct MyComponent {
  @State message: string = '';
  appendMsg(newMsg: string) {
      let message = this.message;
      message += newMsg;
      message += ";";
      message += "<br/>";
      this.message = message;
  }
  build() {
    // 业务代码...
  }
}
```

## 反例

```typescript
@Entry
@Component
struct MyComponent {
  @State message: string = '';
  appendMsg(newMsg: string) {
      this.message += newMsg;
      this.message += ";";
      this.message += "<br/>";
  }
  build() {
    // 业务代码...
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

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-use-local-var-to-replace-state-var*