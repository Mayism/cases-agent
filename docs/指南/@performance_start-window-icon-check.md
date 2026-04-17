---
title: @performance/start-window-icon-check
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-start-window-icon-check
category: 指南
updated_at: 2026-03-13T04:39:35.493Z
---

# @performance/start-window-icon-check

启动页图标分辨率建议不超过256 \* 256。

[冷启动响应时延场景](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-application-cold-start-optimization#section5953164714132)下，建议优先修改。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/start-window-icon-check": "suggestion",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

1、entry/src/main/module.json5中的mainElement对应的ability中配置了startWindowIcon

2、entry/src/main/resources/base/media目录下对应的图片文件分辨率小于等于256\*256

## 反例

1、entry/src/main/module.json5中的mainElement对应的ability中配置了startWindowIcon

2、entry/src/main/resources/base/media目录下对应的图片文件分辨率大于256\*256

## 规则集

```cangjie
plugin:@performance/recommended
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-start-window-icon-check*