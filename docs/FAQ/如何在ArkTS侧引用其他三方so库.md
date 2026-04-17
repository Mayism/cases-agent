---
title: 如何在ArkTS侧引用其他三方so库
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-21
category: FAQ
updated_at: 2026-03-13T03:29:19.398Z
---

# 如何在ArkTS侧引用其他三方so库

**解决措施**

在ArkTS中引用三方库so需要具备以下三个文件：xxx.so、Index.d.ts和oh-package.json5。其中，Index.d.ts和oh-package.json5在C++模板中自带，也可以手动创建。在需要调用的模块根目录下的oh-package.json5中声明so库的根目录路径。然后在代码中使用import语句引用oh-package.json5中声明的依赖名称。此方案仅适用于已经适配了Native的so库。因此，在编译生成so库时，需要实现功能函数并注册其Native侧接口，同时提供对应的Native侧接口声明文件Index.d.ts和配置文件oh-package.json5。

1.  将so文件移动到libs文件夹下对应架构的目录。如果在纯ArkTS工程中，还需将编译三方库时生成的libc++\\\_xxx.so移动到该目录。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/cd/v3/hHIaHnaSSwmEIvPhJEb2pA/zh-cn_image_0000002194318516.png?HW-CC-KV=V1&HW-CC-Date=20260313T032913Z&HW-CC-Expire=86400&HW-CC-Sign=51C23B30E3F9CD854B8E577CE572203877D96D99DF690F84CA4F3A93B587900D "点击放大")
    
2.  在src/main/cpp/types目录下创建新目录，并将Index.d.ts和oh-package.json5文件移动到该目录下。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/73/v3/NJnPkws7RhWKV98JqB_OlQ/zh-cn_image_0000002229604289.png?HW-CC-KV=V1&HW-CC-Date=20260313T032913Z&HW-CC-Expire=86400&HW-CC-Sign=7303BCB14A66731931A5DBC56D144F572D9FD45526503D1B289B8D0EC353BA54 "点击放大")
    
3.  在模块级的oh-package.json5文件中声明该 so 库的根目录路径。
    
    ```json
    "dependencies": {
      "libimportthirdpartylibraries.so": "file:./src/main/cpp/types/libimportthirdpartylibraries",
      "libapplication.so": "file:./src/main/cpp/types/libapplication"
    },
    ```
    
    [oh-package.json5](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ImportThirdPartyLibraries/oh-package.json5#L12-L15)
    
4.  在代码中引用并调用oh-package.json5中声明的依赖。
    
    ```typescript
    import testNapi from 'libimportthirdpartylibraries.so';
    import myNapi from 'libapplication.so';
    @Entry
    @Component
    struct Index {
      @State message: string = 'Hello World';
      build() {
        Row() {
          Column() {
            Text(this.message)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                console.info(`MyTest NAPI 2 + 3 = ${myNapi.add(2, 3)}`);
                console.info(`MyTest NAPI 2 - 3 = ${testNapi.sub(2, 3)}`);
              })
          }
          .width('100%')
        }
        .height('100%')
      }
    }
    ```
    
    [Index.ets](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/Ndk/Ndk2/ImportThirdPartyLibraries/src/main/ets/pages/Index.ets#L19-L42)
    

运行结果：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ad/v3/twBngffMTbqvd5A6ZwqY7Q/zh-cn_image_0000002229758785.png?HW-CC-KV=V1&HW-CC-Date=20260313T032913Z&HW-CC-Expire=86400&HW-CC-Sign=293315C7C2609224324FCF42173DFD41AD640A0A92C977EF090C0C2C38F25648 "点击放大")

**参考链接**

[在ArkTS侧引用三方so库](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-dynamic-link-library#section166546365376)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-21*