---
title: @typescript-eslint/no-require-imports
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-require-imports
category: 指南
updated_at: 2026-03-13T04:19:57.617Z
---

# @typescript-eslint/no-require-imports

禁止使用“require()”语法导入依赖。

该规则仅支持对.js/.ts文件进行检查。

## 规则配置

```cangjie
// code-linter.json5
{
  "rules": {
    "@typescript-eslint/no-require-imports": "error"
  }
}
```

## 选项

该规则无需配置额外选项。

## 正例

```javascript
// lib1 lib2 lib3为.js/.ts文件
import * as lib1 from './lib1';
import { lib2 } from './lib2';
import * as lib3 from './lib3';
```

## 反例

```javascript
// lib3为.js/.ts文件
import lib3 = require('./lib3');
```

## 规则集

```cangjie
plugin:@typescript-eslint/all
```

Code Linter代码检查规则的配置指导请参考[Code Linter代码检查](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-code-linter)。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide_no-require-imports*