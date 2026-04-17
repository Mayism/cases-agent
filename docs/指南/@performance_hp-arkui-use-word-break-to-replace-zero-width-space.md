---
title: @performance/hp-arkui-use-word-break-to-replace-zero-width-space
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-use-word-break-in-space
category: 指南
updated_at: 2026-03-13T04:36:14.844Z
---

# @performance/hp-arkui-use-word-break-to-replace-zero-width-space

建议使用word-break替换零宽空格(\\u200b)。

根据ArkUI编程规范，建议修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/hp-arkui-use-word-break-to-replace-zero-width-space": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```scss
@Component
export struct MyComponent {
  private diskName: string = '';
  build() {
    Text(this.diskName)
      .textAlign(TextAlign.Start)
      .wordBreak(WordBreak.BREAK_ALL)
  }
}
```

## 反例

```typescript
@Component
export struct MyComponent {
  private diskName: string = '';
  build() {
    Text(this.diskName.split("").join("\u200B"))
      .textAlign(TextAlign.Start)
  }
}
```

## 规则集

```sql
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_hp-arkui-use-word-break-in-space*