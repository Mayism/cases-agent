---
title: @typescript-eslint/no-duplicate-imports
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-duplicate-imports
category: 指南
updated_at: 2026-03-13T04:16:28.855Z
---

# @typescript-eslint/no-duplicate-imports

禁止重复的模块导入。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-duplicate-imports": "error"
  }
}
```

## 选项

详情请参考[eslint/no-duplicate-imports选项](https://eslint.nodejs.cn/docs/latest/rules/no-duplicate-imports#选项)。

## 正例

```javascript
// foo和bar代表两个文件
import { foo } from './foo';
import bar from './bar';
```

## 反例

```javascript
// foo代表文件
import { foo } from './foo';
import { bar } from './foo';
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-duplicate-imports*