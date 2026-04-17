---
title: hvigor-config.json5文件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options
category: 指南
updated_at: 2026-03-13T05:07:12.376Z
---

# hvigor-config.json5文件

## 配置文件结构

hvigor-config.json5文件整体的结构如下。

```json
modelVersion
dependencies
execution
└── analyze
└── daemon
└── incremental
└── parallel
└── typeCheck
└── optimizationStrategy
logging
└── level
debugging
└── stacktrace
nodeOptions
└── maxOldSpaceSize
└── maxSemiSpaceSize
└── exposeGC
javaOptions
└── Xmx
properties
└── hvigor.cacheDir
└── ohos.buildDir
└── enableSignTask
└── ohos.arkCompile.maxSize
└── hvigor.pool.cache.capacity
└── hvigor.pool.maxSize
└── ohos.pack.compressLevel
└── hvigor.analyzeHtml
└── hvigor.dependency.useNpm
└── ohos.compile.lib.entryfile
└── ohos.align.target
└── ohos.fallback.target
└── ohos.arkCompile.sourceMapDir
└── ohos.collect.debugSymbol
└── hvigor.enableMemoryCache
└── hvigor.memoryThreshold
└── ohos.nativeResolver
└── ohos.arkCompile.noEmitJs
└── ohos.arkCompile.singleFileEmit
└── ohos.sign.har
└── hvigor.keepDependency
└── ohos.arkCompile.emptyBundleName
└── ohos.uiTransform.Optimization
└── ohos.har.excludeHspDependencies
└── ohos.processLib.optimization
└── ohos.obfuscationRules.optimization
└── hvigor.incremental.optimization
└── hvigor.task.schedule.optimization
└── ohos.byteCodeHar.integratedOptimization
└── ohos.rollupCache.usePathPlaceholder
└── ohos.rollupCache.useSourceHash
└── ohos.arkCompile.writeRollupCache
└── ohos.align.deviceTypes
└── ohos.dependencies.types.enable
└── ohos.defaults.release.cmakebuildtype
└── ohos.defaults.autoLazyImport
parameterFile
```

## 配置文件字段说明

hvigor-config.json5配置文件包含以下字段。

**表1** hvigor-config.json5文件字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| modelVersion | 必选 | 字符串 | 开发态版本号。 |
| dependencies | 必选 | 对象 | 当前工程执行构建任务时，依赖的构建插件及版本，为npm源组件。说明修改dependencies后，请根据界面提示，点击编辑器右上角Sync Now安装依赖。 |
| [execution](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section6901191119219) | 可选 | 对象 | 执行构建的相关配置参数，仅在命令行场景下生效。 |
| [logging](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section85176471028) | 可选 | 对象 | 日志相关配置参数。 |
| [debugging](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section76575554217) | 可选 | 对象 | 调测相关配置参数。 |
| [nodeOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section74431812314) | 可选 | 对象 | Node相关配置参数。 |
| [javaOptions](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section7929682318) | 可选 | 对象 | java相关配置参数。 |
| [properties](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section260315160319) | 可选 | 对象 | 额外配置参数。 |
| [parameterFile](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options#section24539147532) | 可选 | 字符串 | 自定义的参数化配置文件路径。从DevEco Studio 6.0.2 Beta1版本开始支持。 |

## execution

execution是执行构建的相关配置参数，除了optimizationStrategy字段外，其他字段仅在命令行构建场景下生效，如果通过DevEco Studio菜单栏构建，需要在**File >** **Settings**（macOS为**DevEco Studio > Preferences/Settings**） **> Build, Execution, Deployment > Build Tools > Hvigor**中设置。

**表2** execution字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| analyze | 可选 | 字符串/布尔值 | 构建分析模式。normal（默认值）：普通模式，通过简单打点数据进行分析。原default模式已废弃。advanced：进阶模式，通过更加详细的打点数据进行分析。如果需要更详细的任务耗时数据，请选择该模式。原verbose模式已废弃。ultrafine：超精细化模式，与advanced模式相比，在ArkTS编译阶段记录更详细的打点数据，但开启后可能导致编译构建时间更长。从DevEco Studio 6.0.0 Beta1版本开始支持。false：不启用构建分析。 |
| daemon | 可选 | 布尔值 | 是否启用守护进程编译。true（缺省默认值）：启用。false：不启用。 |
| incremental | 可选 | 布尔值 | 是否启用增量编译。true（缺省默认值）：启用。false：不启用。 |
| parallel | 可选 | 布尔值 | 是否启用并行编译。true（缺省默认值）：启用。false：不启用。 |
| typeCheck | 可选 | 布尔值 | 是否启用构建脚本hvigorfile.ts文件的类型检查，启用后构建效率可能会有所降低。true：启用。false（缺省默认值）：不启用。 |
| optimizationStrategy | 可选 | 字符串 | 指定构建模式。从DevEco Studio 5.1.1 Release版本开始支持。performance：性能优先模式，可加快构建速度，但会占用更多内存。memory（缺省默认值）：内存优先模式，可以减少编译内存占用。说明更改模式后，首次编译会执行全量编译。 |

execution字段示例：

```cangjie
{
  "execution": {
    "analyze": "normal",
    "daemon": true,
    "incremental": true,
    "parallel": true,
    "typeCheck": false,
    "optimizationStrategy": "performance",
  }
}
```

## logging

logging是日志相关配置参数。

**表3** logging字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| level | 可选 | 字符串 | 构建时打印日志的级别。debug：调测日志。info（缺省默认值）：基本信息日志。warn：告警日志。error：错误日志。 |

logging字段示例：

```cangjie
{
  "logging": {
    "level": "debug"
  }
}
```

## debugging

debugging是调测相关配置参数。

**表4** debugging字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| stacktrace | 可选 | 布尔值 | 是否启用堆栈跟踪。true：启用。false（缺省默认值）：不启用。 |

debugging字段示例：

```cangjie
{
  "debugging": {
    "stacktrace": true
  }
}
```

## nodeOptions

nodeOptions是Node相关配置参数。

**表5** nodeOptions字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| maxOldSpaceSize | 可选 | 整型数值 | 启用守护进程编译时，为守护进程设置最大的老生代内存大小，单位为MB，默认为8192MB。当工程代码量较大出现JS内存溢出时，可以调整该参数。 |
| maxSemiSpaceSize | 可选 | 整型数值 | 启用守护进程编译时，为守护进程设置新生代内存最大的半空间大小，单位为MB，默认为16MB。增加半空间大小可能会提高Node.js的吞吐量，但会消耗更多内存。该字段从DevEco Studio 5.1.0 Release版本开始支持。 |
| exposeGC | 可选 | 布尔值 | 是否启用GC（Garbage Collection，内存回收），启用后会优化编译过程的峰值内存。true（缺省默认值）：启用。false：不启用。 |

nodeOptions字段示例：

```cangjie
{
  "nodeOptions": {
    "maxOldSpaceSize": 8192,
    "maxSemiSpaceSize": 16,
    "exposeGC": true,
  }
}
```

## javaOptions

javaOptions是java相关配置参数。

**表6** javaOptions字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| Xmx | 可选 | 整型数值 | 设置JVM最大堆内存，单位为MB，默认为512MB。 |

javaOptions字段示例：

```cangjie
{
  "javaOptions": {
    "Xmx": 512
  }
}
```

## properties

properties是额外配置参数。除了在hvigor-config.json5中配置properties外，还可以通过命令行参数-c或--config指定properties，命令行优先级比hvigor-config.json5更高，命令行配置方式请参考[命令行构建工具（hvigorw）](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-commandline#section92386011817)。

**表7** properties字段说明

| 字段名称 | 可选/必选 | 类型 | 含义 |
| --- | --- | --- | --- |
| hvigor.cacheDir | 可选 | 字符串 | 指定项目根目录下的.hvigor缓存文件夹的存放路径。说明同名的不同工程不可指定相同的存放位置。 |
| ohos.buildDir | 可选 | 字符串 | 指定项目的构建产物目录（build目录）存放位置。说明同名的不同工程不可指定相同的存放位置。 |
| enableSignTask | 可选 | 布尔值 | 是否启用HAP或HSP签名任务。true（缺省默认值）：启用。false：不启用。 |
| ohos.arkCompile.maxSize | 可选 | 整型数值 | 指定编译ArkTS线程的数量，默认为5。 |
| hvigor.pool.cache.capacity | 可选 | 整型数值 | 定义内存中缓存数据的容量，默认为4，数值越小，内存中缓存数据越少。配置为0，表示不启用内存缓存配置。 |
| hvigor.pool.maxSize | 可选 | 整型数值 | 指定编译过程中的线程数量，相比ohos.arkCompile.maxSize增加签名、打包等任务的线程。默认值为“工程的模块数”和“电脑虚拟核数-1”两者的较小值。 |
| ohos.pack.compressLevel | 可选 | 字符串 | 设置打包hap（压缩so）或app（压缩hap）时的压缩率等级。压缩率越高，压缩速度越慢。fast（缺省默认值）：最低等级的压缩率，压缩速度最快。standard：适中等级的压缩率，压缩速度适中。ultimate：最高等级的压缩率，压缩速度最慢。 |
| hvigor.analyzeHtml | 可选 | 布尔值 | 是否生成构建可视化html文件。true：生成构建可视化html文件。生成的html文件存放在工程的.hvigor/report目录下，该文件可直接在浏览器中打开。false（缺省默认值）：不生成构建可视化html文件。 |
| hvigor.dependency.useNpm | 可选 | 布尔值 | 指定是否使用npm下载hvigor依赖。若未配置该字段，当Node.js版本 ≥ 16时，默认使用pnpm下载依赖。在某些特定场景，可以通过配置该字段指定使用npm下载依赖。true：对于任意Node版本，都使用npm下载依赖。false（缺省默认值）：Node.js版本 ≥ 16时，使用pnpm下载依赖；Node.js版本 ＜ 16时，使用npm下载依赖。 |
| ohos.compile.lib.entryfile | 可选 | 布尔值 | 指定是否从入口文件开始编译：true：表示从模块的入口文件开始编译，将编译入口文件及被引用的文件，没被引用的文件不会参与编译流程。false（缺省默认值）：表示将src/main/ets下的ets和ts文件进行全量编译，涉及到以下场景：构建HSP时，存在于src/main/ets下的ets和ts文件都会被编译到产物中。release模式对HAR混淆或构建字节码HAR时，存在于src/main/ets下的ets和ts文件都会被编译到产物中。构建HAP/HSP时，存在于动态依赖的HAR模块src/main/ets下的ets和ts文件都会被编译到产物中。 |
| ohos.align.target | 可选 | 字符串 | [多产物构建target](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-customized-multi-targets-and-products-guides#section7121513141619) |
| ohos.fallback.target | 可选 | 字符串数组 | [多产物构建target](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-customized-multi-targets-and-products-guides#section7121513141619) |
| ohos.arkCompile.sourceMapDir | 可选 | 字符串 | 指定sourceMap文件的生成路径，方便开发者进行堆栈的回栈与错误信息的定位，当前仅支持Stage模型。若没有指定路径，默认生成在build/{productName}/outputs/{targetName}/mapping下。说明从API 12开始支持。 |
| ohos.collect.debugSymbol | 可选 | 布尔值 | [sourceMap](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-exception-stack-parsing-principle#section666114451518) |
| hvigor.enableMemoryCache | 可选 | 布尔值 | 是否开启缓存，开启缓存会加快增量编译速度，关闭缓存能够节省内存占用，但是会增加增量编译时间。true（缺省默认值）：开启。false：不开启。 |
| hvigor.memoryThreshold | 可选 | 整型数值 | 内存管理阈值，单位为MB，当编译构建占用内存超过此阈值时，新加入的编译任务会等待，直到正在进行的编译任务结束，新的编译任务才能开始，此配置将导致编译时间延长。说明配置该字段后，即使hvigor.enableMemoryCache配置为true，也不进行缓存。该字段配置为很小的值时，构建任务会串行执行，等效于配置ohos.arkCompile.maxSize:1；配置为很大的值时，与不配置没有差异。 |
| ohos.nativeResolver | 可选 | 布尔值 | ArkTS编译过程中是否使用高性能插件进行依赖寻址，使用高性能插件可以降低编译过程的峰值内存，加快编译速度。true（缺省默认值）：使用。false：不使用。 |
| ohos.arkCompile.noEmitJs | 可选 | 布尔值 | [优化编译中间产物生成](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-experimental-properties#section11117155101617) |
| ohos.arkCompile.singleFileEmit | 可选 | 布尔值 | [文件写入磁盘](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-experimental-properties#section1131619813214) |
| ohos.sign.har | 可选 | 布尔值 | [构建签名HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-har#section116791730173713) |
| hvigor.keepDependency | 可选 | 布尔值 | 是否保持hsp中的所有依赖。如果保持则不对依赖进行处理，如果不保持，则只会保留hsp模块中的hsp相关依赖。true（缺省默认值）：保持。false：不保持。 |
| ohos.arkCompile.emptyBundleName | 可选 | 布尔值 | ArkTS编译转换后的产物，bundleName字段是否为空值。true：bundleName字段的值是空值。false（缺省默认值）：bundleName字段是应用实际的包名。说明仅支持在EntryAbility中使用loadContentByName加载首页，同时使用Navigation导航进行页面跳转时设置为true，否则会导致应用闪退。预览时暂不支持配置该字段，字段默认取值为false。 |
| ohos.uiTransform.Optimization | 可选 | 布尔值 | 是否对ArkTS编译转换后的产物中的bundleName字段开启优化。true：开启，bundleName字段的值是变量。false（缺省默认值）：不开启，bundleName字段是应用实际的包名。该字段从DevEco Studio 5.0.5 Beta1版本开始支持。说明该字段对字节码HAR不生效，字节码HAR产物的bundleName字段的值默认是变量。预览时暂不支持配置该字段，字段默认取值为false。 |
| ohos.har.excludeHspDependencies | 可选 | 布尔值 | 构建har包时，产物module.json中是否排除依赖的hsp，排除后，module.json中不包含dependencies字段。true：排除。false（缺省默认值）：不排除。该字段从DevEco Studio 5.1.0 Release版本开始支持。 |
| ohos.processLib.optimization | 可选 | 布尔值 | [ProcessLibs任务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-task-process#li671313965913) |
| ohos.obfuscationRules.optimization | 可选 | 布尔值 | release模式开启混淆时，是否优化三方依赖中混淆配置文件的收集方式，优化后可以减少收集耗时，加快编译速度。true：优化。false（缺省默认值）：不优化。该字段从DevEco Studio 5.1.0 Release版本开始支持。 |
| hvigor.incremental.optimization | 可选 | 布尔值 | [任务增量判断优化](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-experimental-properties#section95571022144613) |
| hvigor.task.schedule.optimization | 可选 | 布尔值 | [任务调度优化](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-experimental-properties#section09371546164610) |
| ohos.byteCodeHar.integratedOptimization | 可选 | 布尔值 | [编译行为差异说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-dependencies#section957371853712) |
| ohos.rollupCache.usePathPlaceholder | 可选 | 布尔值 | 是否将build目录下rollup缓存中的绝对路径替换为占位符。该功能是实验特性，开启后会造成读写缓存性能降低。true：是，即缓存中是占位符。false（缺省默认值）：否，即缓存中是绝对路径。从DevEco Studio 6.0.0 Beta1版本开始支持。 |
| ohos.rollupCache.useSourceHash | 可选 | 布尔值 | 是否将build目录下rollup缓存中的源码替换为对应的hash内容，减少缓存大小。该功能是实验特性，可以提升缓存对比和读写性能。true：是，即缓存源码hash。false（缺省默认值）：否，即缓存源码内容。从DevEco Studio 6.0.0 Beta1版本开始支持。 |
| ohos.arkCompile.writeRollupCache | 可选 | 布尔值 | build目录下是否写入rollup缓存。true（缺省默认值）：写缓存。false：不写缓存。从DevEco Studio 6.0.0 Beta2版本开始支持。 |
| ohos.align.deviceTypes | 可选 | 字符串数组 | 指定归一的设备类型，构建APP时，当HAP/HSP的module.json5中的设备类型是ohos.align.deviceTypes的超集时，模块才会被打包到APP中，同时打包后产物中的设备类型会被设置为ohos.align.deviceTypes的值。从DevEco Studio 6.0.0 Beta2版本开始支持。说明仅支持Stage模型。 |
| ohos.dependencies.types.enable | 可选 | 布尔值 | [源码HAR包](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-har#section197792874110) |
| ohos.defaults.release.cmakebuildtype | 可选 | 字符串 | [arguments字段](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-exception-stack-parsing-principle#section147714466283) |
| ohos.defaults.autoLazyImport | 可选 | 布尔值 | [延迟加载（lazy import）](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-lazy-import) |

properties字段示例：

```cangjie
{
  "properties": {
    "hvigor.cacheDir": "D://tmp",
    "ohos.buildDir": "D://tmp",
    "enableSignTask": true,
    "ohos.arkCompile.maxSize": 6,
    "hvigor.pool.cache.capacity": 2,
    "hvigor.pool.maxSize": 8,
    "ohos.pack.compressLevel": "standard",
    "hvigor.analyzeHtml": true,
    "hvigor.dependency.useNpm": false,
    "ohos.compile.lib.entryfile": true,
    "ohos.align.target": "target1",
    "ohos.fallback.target": ["target1", "target2"],
    "ohos.arkCompile.sourceMapDir": "D://MyProject",
    "ohos.collect.debugSymbol": false,
    "hvigor.enableMemoryCache": true,
    "hvigor.memoryThreshold": 1000,
    "ohos.nativeResolver": true,
    "ohos.arkCompile.noEmitJs": true,
    "ohos.arkCompile.singleFileEmit": true,
    "ohos.sign.har": true,
    "hvigor.keepDependency": false,
    "ohos.arkCompile.emptyBundleName": true,
    "ohos.align.deviceTypes": ["phone", "tablet"],
    "ohos.defaults.release.cmakebuildtype": "RelWithDebInfo",
  }
}
```

## parameterFile

从DevEco Studio 6.0.2 Beta1版本开始，编译构建新增参数化配置功能。开发者可添加一个参数化文件（json5格式文件），在该文件中维护构建配置文件build-profile.json5中部分字段的值，工程级或者各模块的build-profile.json5将根据该文件中的键值对进行配置，满足不同构建场景下，开发者快速切换构建配置的需要。

### 配置说明

在hvigor-config.json5文件中添加parameterFile配置，并指定parameterFile文件路径。配置规则如下：

-   parameterFile文件配置相对路径，并以工程下hvigor-config.json5文件为起点，如："parameterFile": "./parameterFile.json5"。
-   parameterFile文件内容采用json5格式，支持多层json对象嵌套。
-   parameterFile文件中的参数化key支持自定义，参数化value类型及配置要求和对应要替换的字段保持一致，具体可查看build-profile.json5文件中对应的字段。
-   build-profile.json5中支持参数化的字段有：source.sourceRoots，resource.directories，buildProfileFields，其他字段均不支持。
-   在build-profile.json5中以“@param:key”的形式引用parameterFile文件中对应的自定义字段，示例如下。
-   不支持在hvigorfile.ts脚本中使用参数化配置。

### 示例

hvigor-config.json5的parameterFile字段示例：

```cangjie
{
  "nodeOptions": {
    ...
  },
  "parameterFile": "./parameterFile.json5"
}
```

parameterFile所指向文件的配置示例：

```cangjie
{
  "source": {
    "customizedSourceRoot1": "./src/default1",
    "customizedSourceRoot2": "./src/default2"
  }
}
```

模块级build-profile.json5示例，以多个har模块为例：

```cangjie
// har1模块build-profile.json5
"targets": [
  {
    "name": "default",
    "source": {
      "sourceRoots": ["@param:source.customizedSourceRoot1"]   // 使用时必须以'@param:'开头，构建时sourceRoots会被替换为'./src/default1'
    }
  }
]
// har2模块build-profile.json5
"targets": [
  {
    "name": "default",
    "source": {
      "sourceRoots": ["@param:source.customizedSourceRoot2"]
    }
  }
]
```

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-set-options*