---
title: @performance/no-use-any-import
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-no-use-any-import
category: 指南
updated_at: 2026-03-13T04:38:12.396Z
---

# @performance/no-use-any-import

使用import的方式引入对应的模块时，建议按需引用使用到的变量代替“import \*”的方式，以减少.ets文件的执行耗时和文件中所有export变量的初始化过程。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@performance/no-use-any-import": "warn",
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```typescript
// Index.ets
import { hilog } from '@kit.PerformanceAnalysisKit';
import { One } from '../utils/Numbers'; // It is recommended to reference variables on demand
hilog.info(0x0000, 'testTag', '%{public}d', One); // Only the variable One is used here
// Numbers.ets
export const One: number = 1;
export const Two: number = 2;
```

## 反例

```typescript
// Index.ets
import { hilog } from '@kit.PerformanceAnalysisKit';
import * as nm from '../utils/Numbers'; // The import * method is not recommended
hilog.info(0x0000, 'testTag', '%{public}d', nm.One); // Only the variable One is used here
// Numbers.ets
export const One: number = 1;
export const Two: number = 2;
```

## 规则集

```cangjie
plugin:@performance/recommended
plugin:@performance/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-no-use-any-import*