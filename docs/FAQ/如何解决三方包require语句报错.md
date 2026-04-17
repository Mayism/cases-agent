---
title: 如何解决三方包require语句报错
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-125
category: FAQ
updated_at: 2026-03-13T05:41:56.695Z
---

# 如何解决三方包require语句报错

**问题现象**

引入三方包时，编译出现错误。

**报错原因**

部分第三方包由npm迁移而来，其开发环境为Node。其中的require语法ArkCompiler不完全支持，导致运行时出现错误。

**场景1**：

```plaintext
// Module/src/test.json
{a: 1, b: 2}
//use.js
let test = require("Module/src/test.json")
```

**需修改为：**

// Module/src/test.json

```json
module.exports = {a: 1, b: 2}
```

[test.js](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/test.js#L18-L18)

//use.js

```javascript
let test = require("Module/src/test")
```

[use.js](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/use.js#L18-L18)

**场景2：**

```plaintext
// Module/package.json
...
main: "./src"
...
// use.js
let module = require("Module")
```

**需修改为：**

// Module/package.json

```json
"main": "./src/index.js",
```

[oh-package.json5](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/oh-package.json5#L7-L7)

// use.js

```javascript
let module = require("Module")
```

[use.js](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/use.js#L22-L22)

**场景3：**

编译时出现警告信息：

```plaintext
Plugin node-resolve: preferring built-in module 'util' over local alternative at '/Users/~/Documents/fe-module/demo/node_modules/util/util.js', pass 'preferBuiltins: false' to disable this behavior or 'preferBuiltins: true' to disable this warning
```

**解决方案**

修改rollup.config.js中的preferBuiltins字段。

```javascript
plugins: [
    resolve({
        preferBuiltins: false,    // true or false
        mainFields: ['module', 'main'],
        extensions
    })
];
```

[rollup.config.js](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/rollup.config.js#L18-L24)

**场景4：**

```javascript
import {Buffer} from 'buffer'
```

**需修改为：**

```javascript
import {Buffer} from 'buffer/'
```

[use.js](https://gitcode.com/harmonyos_samples/faqsnippets/blob/master/CompilingAndBuilding/entry/src/use.js#L26-L26)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-125*