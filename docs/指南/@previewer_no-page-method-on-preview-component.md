---
title: @previewer/no-page-method-on-preview-component
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-page-method-on-preview-component
category: 指南
updated_at: 2026-03-13T04:40:56.027Z
---

# @previewer/no-page-method-on-preview-component

禁止在非路由组件上实例化onPageShow、onPageHide、onBackPress等页面级方法。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@previewer/no-page-method-on-preview-component": "warn"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```less
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  onPageShow(): void {}
  onPageHide(): void {}
  onBackPress(): void {}
  build() {
    Row() {
      Column() {
        Text(this.message)
      }
    }
  }
}
```

## 反例

```less
@Preview
@Component
struct Index {
  @State message: string = 'Hello World';
  onPageShow(): void {}
  onPageHide(): void {}
  onBackPress(): void {}
  build() {
    Column() {
      Text(this.message)
    }
  }
}
```

## 规则集

```cangjie
plugin:@previewer/recommended
plugin:@previewer/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-page-method-on-preview-component*