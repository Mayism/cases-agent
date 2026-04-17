---
title: @security/no-cycle
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-cycle
category: 指南
updated_at: 2026-03-13T04:27:56.730Z
---

# @security/no-cycle

该规则禁止使用循环依赖。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@security/no-cycle": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
// foo.ets
import {} from './bar';
// bar.ets
import {} from './index';
```

## 反例

```javascript
// foo.ets
import {} from './bar';
// bar.ets
import {} from './foo';
```

说明

反例中foo.ets文件依赖了bar.ets文件，bar.ets文件同时依赖了foo.ets文件，造成了循环依赖。

## 规则集

```sql
plugin:@security/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-cycle*