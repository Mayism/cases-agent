---
title: 如何配置oh-package.json5动态依赖
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-48
category: FAQ
updated_at: 2026-03-13T05:34:23.318Z
---

# 如何配置oh-package.json5动态依赖

oh-package.json5文件中：

-   dependencies（生产依赖）：声明生产依赖，即代码中需要导入的HarmonyOS三方库，用于编译和运行阶段。
-   devDependencies（开发依赖）：用于项目的开发或测试阶段。
-   dynamicDependencies（动态依赖）：配置用于动态加载的HSP模块。

示例如下：

```json
{
  "name": "parameter-test",
  "version": "@param:version",
  "modelVersion": "5.0.4",
  "description": "test desc.",
  "main": "index.ets",
  "author": "test author",
  "license": "ISC",
  "dependencies": {
    "libtest1": "@param:dependencies.libtest1"
  },
  "devDependencies": {
    "libtest2": "@param:devDependencies.libtest2"
  },
  "dynamicDependencies": {
    "libtest3": "@param:dynamicDependencies.libtest3"
  },
  "parameterFile": '.parameterFile/parameterFile.json5',// Enable parameterization and specify the path to the parameterized configuration file
}
```

[oh-package.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ParameterTest/oh-package.json5#L3-L21)

**参考链接**

[oh-package.json5文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-oh-package-json5)，[添加依赖项](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-dependencies)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-compiling-and-building-48*