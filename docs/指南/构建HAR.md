---
title: 构建HAR
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-har
category: 指南
updated_at: 2026-03-13T05:08:13.522Z
---

# 构建HAR

构建模式：DevEco Studio默认提供debug和release两种构建模式，同时支持开发者自定义构建模式。

产物格式：构建出的HAR包产物分为包含源码的HAR、包含js中间码的HAR以及包含字节码的HAR三种产物格式。

从DevEco Studio NEXT Beta1（5.0.3.800）版本开始，默认构建字节码HAR，用于提升发布产物的安全性。

## 使用约束

HAR自身的构建不建议引用本地模块，可能导致其他模块依赖该HAR包时安装失败，如果安装失败，需要在工程级oh-package.json5中配置[overrides](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-oh-package-json5#zh-cn_topic_0000001792256137_overrides)。

## 创建模块

1.  新建工程时选择API 10及以上的Stage模型，工程创建完成后，新建“Static Library”模块。模块创建方法可参考[在工程中添加Module](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-add-new-module)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/77/v3/oupNrt9BRcu1Y1KkVp8_eg/zh-cn_image_0000002532750173.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=C666073D886EED85910AE71A3384B3E30DCED19CA0E9CA7277ABDC18529770D6)
    
2.  编写代码。
    
    ```java
      library  // HAR根目录
      ├─libs  // 存放用户自定义引用的Native库，一般为.so文件
      └─src
      │   └─main
      │     ├─cpp
      │     │  ├─types  // 定义Native API对外暴露的接口
      │     │  │  └─liblibrary
      │     │  │      ├─index.d.ts
      │     │  │      └─oh-package.json5
      │     │  ├─CMakeLists.txt  // CMake配置文件
      │     │  └─napi_init.cpp  // C++源码文件
      │     └─ets  // ArkTS源码目录
      │     │  └─components
      │     │     └─MainPage.ets
      │     ├─resources  // 资源目录，用于存放资源文件，如图片、多媒体、字符串等
      │     └─module.json5  // 模块配置文件，包含当前HAR的配置信息
      ├─build-profile.json5  // Hvigor编译构建所需的配置文件，包含编译选项
      ├─hvigorfile.ts  // Hvigor构建脚本文件，包含构建当前模块的插件、自定义任务等
      ├─Index.ets  // HAR的入口文件，一般作为出口定义HAR对外提供的函数、组件等
      └─oh-package.json5  // HAR的描述文件，定义HAR的基本信息、依赖项等
    ```
    
3.  在oh-package.json5中“main”字段定义导出文件入口。若不设置“main”字段，默认以当前目录下Index.ets为入口文件，依据.ets>.ts>.js的顺序依次检索。以将ets/components/MainPage.ets文件设置为入口文件为例：
    
    ```css
    {
      ...
      "main": "./src/main/ets/components/MainPage.ets",
      ...
    }
    ```
    

## 字节码HAR

默认产物是包含字节码的HAR包，其中包含abc字节码、资源文件、配置文件、readme、changelog声明文件、license证书文件，提升发布到ohpm中心仓产物的安全性。

字节码HAR包中包含的是编译后的abc字节码，当字节码HAR被其他应用模块(HAP/HSP)依赖时，执行应用模块的编译构建，不需要再对依赖的HAR进行语法检查和编译等操作，相比源码HAR，可以有效提升应用模块的编译构建效率，提高安全性，降低代码泄漏的风险。

说明

由于构建字节码HAR需要生成二进制的格式，所以单独构建字节码HAR会比构建非字节码HAR耗时更多。

### 收益

-   字节码HAR可以降低代码泄漏的风险，增加反编译获取代码逻辑的难度。

-   采用ArkTS/TS语言开发的字节码HAR，被HAP/HSP集成时，可以减少语法检查、转换的耗时，提高构建性能。
-   字节码HAR可以减少编译时node的进程占用，有效降低内存占用。
-   通过其他代码生成工具生成的js语言HAR包，编译构建成字节码HAR后，被HAP/HSP集成时，可以减少编译阶段处理的文件和代码数量，降低内存，提高构建性能。

### 使用场景

从功能上来说所有的源码HAR包都可以按照任意顺序切换成字节码HAR。但是由于字节码HAR编译和集成的特点，按照推荐场景或顺序来逐步切换字节码HAR可能会获得比较好的性能、内存收益。以下场景中推荐切换使用字节码HAR：

-   适用于SDK厂商对外提供SDK，以及高安全的场景，字节码HAR可以降低源码泄漏的风险。
-   采用muti-repo的开发模式，在被主工程合并集成时，所有依赖的HAR均可以发布成字节码HAR，从而提高主HAP的构建效率。
-   采用mono-repo的开发模式，工程中含有单个代码文件较大，或通过代码生成工具生成的代码量较大的ArkTS/TS/JS 的二方、三方SDK(HAR包)时，可考虑将这些HAR包构建成字节码HAR。
-   对内存要求较高的场景，可以通过切换字节码HAR，降低内存的占用。
-   通过ArkTS/TS/JS编写的HAR，且在依赖链条中处于较为底层的叶子节点，含有较少的源码依赖时，切换为字节码HAR会有较好的收益。

### 约束条件

-   字节码HAR使用的依赖需要配置在本模块的oh-package.json5的dependencies或dynamicDependencies中，如果不配置，后续字节码HAR被集成时可能会出现运行时异常。如果出现异常，部分场景可通过在hvigor-config.json5中配置ohos.byteCodeHar.integratedOptimization后重新编译，具体请参考[编译行为差异说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-dependencies#section957371853712)。
-   字节码HAR的oh-package.json5中配置的依赖名和依赖包的包名（即包内oh-package.json5中的name）需要保持一致。
-   依赖字节码HAR包时，该工程的build-profile.json5中的[useNormalizedOHMUrl](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-profile-app#section13181758123312)必须设置为true。
-   HAP/HSP/HAR依赖字节码HAR包时，HAP/HSP/HAR的oh-package.json5中配置的依赖名和字节码HAR包的oh-package.json5中的name需要保持一致。
-   HAP/HSP/HAR代码中import使用字节码HAR包时，\`import xxx from 'yyy'\`的依赖名yyy要和本模块oh-package.json5中配置的依赖名保持一致（包括大小写）。
-   依赖字节码HAR包时，字节码HAR的compatibleSdkVersion不能大于工程的compatibleSdkVersion。

### 操作步骤

1.  将工程级build-profile.json5的useNormalizedOHMUrl设置为true。
    
    说明
    
    从DevEco Studio NEXT Beta1（5.0.3.800）版本开始，工程级build-profile.json5中useNormalizedOHMUrl字段默认为true，byteCodeHar缺省默认值为true，无需执行步骤1和2。
    
    ```cangjie
    {
      "app": {
        "products": [
          {
             "buildOption": {
               "strictMode": {
                 "useNormalizedOHMUrl": true
               }
             }
          }
        ]
      }
    }
    ```
    
2.  在HAR模块的build-profile.json5中，将byteCodeHar设置为true。
    
    ```cangjie
    {
      "buildOption": {
        "arkOptions": {
          "byteCodeHar": true
        }
      }
    }
    ```
    
3.  点击DevEco Studio右上角图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ca/v3/yrhEH4IrTMmAZNejecT4vQ/zh-cn_image_0000002501070134.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=041388EB8AA7CF10B7C34DDC90EFFF95E5B8970C48E27B551B78DCEA0F2D3033)，选择**Build Mode，**默认为**<Default>**模式：在编译App时使用release模式，编译HAP/HSP/HAR时使用debug模式。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/jJi3xIaNRFKpTB4EgYapbg/zh-cn_image_0000002501070126.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=FC6BA8DF5BA73C6D83AF003B1B4C1DC5F71BA3D0051E344A5BC2D92E352535FE)
    
4.  （可选）在编译模式为release时，为保护代码资产，建议开启混淆，在模块级build-profile.json5文件的release的buildOptionSet配置中，将obfuscation/ruleOptions下的enable字段设置为true。混淆相关能力和具体规则请参考[代码混淆](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-build-obfuscation)。
    
    ```cangjie
    {
      "apiType": "stageMode",
      "buildOption": {
      },
      "buildOptionSet": [
        {
          "name": "release",
          "arkOptions": {
            // 混淆相关参数
            "obfuscation": {
              "ruleOptions": {
                // true表示进行混淆，false表示不进行混淆。5.0.3.600及以上版本默认为false
                "enable": true,
                // 混淆规则文件
                "files": [
                  "./obfuscation-rules.txt"
                ]
              },
              // consumerFiles中指定的混淆配置文件会在构建依赖这个library的工程或library时被应用
              "consumerFiles": [
                "./consumer-rules.txt"
              ]
            }
          },
        },
      ],
      "targets": [
        {
          "name": "default"
        }
      ]
    }
    ```
    
5.  （可选）如果开发者希望自定义打包到HAR产物中的文件，可在HAR模块的build-profile.json5文件中，配置include或exclude字段，支持glob语法。
    
    ```cangjie
    "buildOption": {
      "packingOptions": {
        "asset": {
          "include": ["./src/router.json5","router.json5"],    // 配置打包到HAR产物中的文件
          "exclude": ["./config/*"]     // 配置不打包到HAR产物中的文件
        }
      }
    }
    ```
    
    说明
    
    -   配置include字段时，以下目录不生效，即不会被打包到产物中：node\_modules、oh\_modules、.preview、build、.cxx、.test。
    -   配置exclude字段时，以下文件不生效，默认会打包：oh-package.json5。
    
6.  选中HAR模块的根目录，点击**Build > Make Module '<module-name>'**启动构建。
    
    说明
    
    若修改了HAR模块级oh-package.json5文件的version字段，请先执行**Build > Clean Project**操作，再重新进行Build全量构建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2f/v3/adVaC5VYRoqKoxDB-aDZmQ/zh-cn_image_0000002500910290.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=51FFB7C4A8423FF4072A4C6369B56C26868909696EC7D558E7E72931EB47B571)
    
    构建完成后，build目录下生成HAR包产物。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/bb/v3/OrcrcVixT5Gs9PcBhg0pBg/zh-cn_image_0000002532670203.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=729F468FE9815EE01AB15AD05D5F9FD0C2F280E30FA130444D56764EC6FB320B)
    
    HAR包产物解压后，结构如下：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2c/v3/_hUBKv1wT_eVDi4uYvU9oQ/zh-cn_image_0000002532750167.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=1259EBE9E77BFB4953F31C3F74CB7C324F18667DAD8A843607240273AAF4180D)
    

## 源码HAR

### 以debug模式构建

产物是包含源码的HAR包，其中包含源码、资源文件以及配置文件等，方便开发者进行本地调测，不包含build、node\_modules、oh\_modules、.cxx、.preview、.hvigor、.gitignore、.ohpmignore、.gitignore/.ohpmignore中配置的文件、cpp工程的CMakeLists.txt。

说明

-   源码HAR包中包含源代码，请谨慎分发，避免造成源代码泄露。
-   如果是native工程，以debug模式构建的native产物中不包含调试信息和符号表，如需调试，请参考[三方源码调试](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-source-code-debugging)。
-   从5.0.3.403版本开始，不再建议使用相对路径跨模块引用代码文件，若历史工程存在此场景的跨模块引用，会出现warning告警，请尝试将该文件移至本模块内，再重新进行编译。
-   从5.0.3.403版本开始，以debug/release模式构建HAR的流程使用相同的语法校验规则，若历史工程出现ArkTS语法报错，请按照报错信息修改代码，以符合ArkTS语言规范。

1.  在HAR模块的build-profile.json5中，将byteCodeHar设置为false。
    
    ```cangjie
    {
      "buildOption": {
        "arkOptions": {
          "byteCodeHar": false
        }
      }
    }
    ```
    
    说明
    
    使用DevEco Studio NEXT Beta1（5.0.3.800）之前的版本，模块级build-profile.json5的byteCodeHar字段的缺省默认值为false，无需执行本步骤。
    
2.  点击DevEco Studio右上角图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1/v3/U0fi-9sMSL2Mps425WYI1g/zh-cn_image_0000002501070130.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=A5F182ED0188374294B619DD3222B654941CF31946A2C9211431F8A4144A2E26)，**Build Mode**选择**debug。**默认为**<Default>**模式：在编译App时使用release模式，编译HAP/HSP/HAR时使用debug模式。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/6d/v3/-biebdd_TxabjPWiJuVRFA/zh-cn_image_0000002501070136.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=4BC1934C45A6D9D0851DEFE51AA43756D3B1738DA68131647AF5D7C916DA0E4A)
    
3.  （可选）若部分工程源文件无需构建到HAR包中，可在模块目录下新建.ohpmignore文件，或者在模块目录下的.gitignore文件中，配置打包时要忽略的文件，.ohpmignore文件中支持正则表达式写法，.gitignore文件中支持glob语法。DevEco Studio构建时将过滤掉.ohpmignore或.gitignore文件中所包含的文件/文件夹。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0a/v3/XIYIExamR-6qPq3T_8dZnQ/zh-cn_image_0000002500910304.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=F802BF142CA883650DC7DFDDD90458D5513147695164B18AE0C283BA4108E211)
    
4.  （可选）如果开发者希望自定义打包到HAR产物中的文件，可在HAR模块的build-profile.json5文件中，配置include或exclude字段，支持glob语法。配置include或exclude字段后，.gitignore和.ohpmignore文件将不再生效。
    
    ```cangjie
    "buildOption": {
      "packingOptions": {
        "asset": {
          "include": ["./src/router.json5","router.json5"],    // 配置打包到HAR产物中的文件
          "exclude": ["./config/*"]     // 配置不打包到HAR产物中的文件
        }
      }
    }
    ```
    
    说明
    
    -   配置include字段时，以下目录不生效，即不会被打包到产物中：node\_modules、oh\_modules、.preview、build、.cxx、.test。
    -   配置exclude字段时，以下文件不生效，默认会打包：oh-package.json5。
    
5.  选中HAR模块的根目录，点击**Build > Make Module '<module-name>'**启动构建。
    
    说明
    
    若修改了HAR模块级oh-package.json5文件的version字段，请先执行**Build > Clean Project**操作，再重新进行Build全量构建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2b/v3/LAMs3KiWS-SVeq4L9ZrRyA/zh-cn_image_0000002532750171.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=EBA4684CAF9FD07318B105F46A2020833DB47832DE093C30776ECFF4E3316287)
    
    构建完成后，build目录下生成HAR包产物。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c6/v3/KtKsuAkLRBqRBk-fcPrIvg/zh-cn_image_0000002532750157.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=26DFF8BA2EB929A2B577323329839AEA1897C520465CCCA0AA72055D5F602ABD)
    
    HAR包产物解压后，结构如下：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a1/v3/a_BBND2JSFObJw02eGpJcg/zh-cn_image_0000002532750169.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=5DB2BA600786F1FFB298669C3F297E4B1BC0C0D6B5F040F76A63710CAF9A6D65)
    

### 以release模式构建

从DevEco Studio NEXT Developer Beta3（5.0.3.600）版本开始，默认不开启混淆，构建产物和debug模式相同，请参考[以debug模式构建](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-har#section197792874110)。

为保护代码资产，建议开启混淆，开启后，构建产物是包含js中间码的HAR包，其中包含源码混淆后生成的js中间码文件、资源文件、配置文件、readme、changelog声明文件、license证书文件，用于发布到ohpm中心仓。

1.  在HAR模块的build-profile.json5中，将byteCodeHar设置为false。
    
    ```cangjie
    {
      "buildOption": {
        "arkOptions": {
          "byteCodeHar": false
        }
      }
    }
    ```
    
    说明
    
    使用DevEco Studio NEXT Beta1（5.0.3.800）之前的版本，模块级build-profile.json5的byteCodeHar字段的缺省默认值为false，无需执行本步骤。
    
2.  点击DevEco Studio右上角图标![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/84/v3/lwMTqgT-SQWTXUA9Gwc4_Q/zh-cn_image_0000002532750175.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=4C93A59C6552BE1640AC83F8E94DD6453DD7405A4D70BB92DDFB4526A1CEE8FB)，**Build Mode**中选择**release。**默认为**<Default>**模式：在编译App时使用release模式，编译HAP/HSP/HAR时使用debug模式。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/92/v3/p-FO3gG1QEeNnu4zQlOz3Q/zh-cn_image_0000002501070138.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=DE44703469525181BECFD7B35F69470F46DA1A758F581FC4A270E849A41B4865)
    
3.  在[编译模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-compilation-options-customizing-guide#section192461528194916)为release时，为保护代码资产，建议开启混淆，在模块级build-profile.json5文件的release的buildOptionSet配置中，将obfuscation/ruleOptions下的enable字段设置为true。混淆相关能力和具体规则请参考[代码混淆](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-build-obfuscation)。
    
    ```cangjie
    {
      "apiType": "stageMode",
      "buildOption": {
      },
      "buildOptionSet": [
        {
          "name": "release",
          "arkOptions": {
            // 混淆相关参数
            "obfuscation": {
              "ruleOptions": {
                // true表示进行混淆，false表示不进行混淆。5.0.3.600及以上版本默认为false
                "enable": true,
                // 混淆规则文件
                "files": [
                  "./obfuscation-rules.txt"
                ]
              },
              // consumerFiles中指定的混淆配置文件会在构建依赖这个library的工程或library时被应用
              "consumerFiles": [
                "./consumer-rules.txt"
              ]
            }
          },
        },
      ],
      "targets": [
        {
          "name": "default"
        }
      ]
    }
    ```
    
4.  （可选）如果开发者希望自定义打包到HAR产物中的文件，可在HAR模块的build-profile.json5文件中，配置include或exclude字段，支持glob语法。
    
    ```cangjie
    "buildOption": {
      "packingOptions": {
        "asset": {
          "include": ["./src/router.json5","router.json5"],    // 配置打包到HAR产物中的文件
          "exclude": ["./config/*"]     // 配置不打包到HAR产物中的文件
        }
      }
    }
    ```
    
    说明
    
    -   配置include字段时，以下目录不生效，即不会被打包到产物中：node\_modules、oh\_modules、.preview、build、.cxx、.test。
    -   配置exclude字段时，以下文件不生效，默认会打包：oh-package.json5。
    
5.  选中HAR模块的根目录，点击**Build > Make Module '<module-name>'**启动构建。
    
    说明
    
    若修改了HAR模块级oh-package.json5文件的version字段，请先执行**Build > Clean Project**操作，再重新进行Build全量构建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/0d/v3/LUlSdyVqSiSGN6pF7R1k7g/zh-cn_image_0000002501070128.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=5A11525EE0E505D3ED2230BDE5C7346EE2DC8558E10D1DDB0FDCDFB876DB4F95)
    
    构建完成后，build目录下生成HAR包产物。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/68/v3/s1WUd7DOSCuUoFmCZSHpqA/zh-cn_image_0000002500910302.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=FBF57C36F22F6E904D26C459834C38C66684B190BD98FFD4FF8502106C22C5BD)
    
    HAR包产物解压后，结构如下：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/35/v3/dE5-QuyyT5KdhJ6p7yzmtA/zh-cn_image_0000002500910308.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=F449A2E91A276092384DDF4E47E01653AF78D6ABB28886EEE78BD3170467CF21)
    

## 对HAR进行签名

DevEco Studio在构建HAR流程的基础上，支持对HAR进行签名。签名后的HAR包后续可用于接入生态市场，接入流程请参考[SDK类商品接入说明](https://developer.huawei.com/consumer/cn/doc/start/dev-mall-marketplace-sp-sdkservice-access-explain-0000001866499490)。

说明

1\. 该能力只在Compatible SDK 5.0.0(12)及以上版本的SDK中支持。

2\. 该能力需开启Hvigor的Daemon能力，请确保当前工程开启了Daemon，打开**File > Settings**（macOS为**DevEco Studio > Preferences/Settings） > Build, Execution, Deployment > Build Tools > Hvigor**，勾选字段**Enable the Daemon for tasks**。

1.  在hvigor-config.json5中，开启构建签名HAR开关：
    
    ```cangjie
    {
      "properties": {
        "ohos.sign.har": true
      }
    }
    ```
    
2.  配置工程签名信息，配置流程请参考[配置签名信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-publish-app#section793484619307)。
3.  选中HAR模块的根目录，点击**Build > Make Module '<module-name>'**启动构建。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/45/v3/BQvtIswBRIycgkbG6P4JHQ/zh-cn_image_0000002532750165.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=398D4D4326197BFF687A7CBDB0F2A9C178A8D17D9F03E40017FC9D6D9FDA8291)
    
    构建完成后，build目录下生成签名HAR包产物。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/4b/v3/7SF1WxntRI6OY9ScgJqEqw/zh-cn_image_0000002532670209.png?HW-CC-KV=V1&HW-CC-Date=20260313T050731Z&HW-CC-Expire=86400&HW-CC-Sign=566D5275D8979D3A29A3CFBB88FB2FF502563CD84FF23E7203D8676290FB778A)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-har*