---
title: 运行时提示“TypeError：Cannot read property xxx of undefined”错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-14
category: FAQ
updated_at: 2026-03-13T05:56:18.542Z
---

# 运行时提示“TypeError：Cannot read property xxx of undefined”错误

**问题现象**

在启动调试或运行C++应用/服务时，安装HAP出现错误，提示“error: install parse native so failed”错误信息，或者运行时提示“TypeError：Cannot read property xxx of undefined”错误。

**解决措施**

该问题是可能是由于设备支持的ABI类型与C++工程中配置的ABI类型不匹配导致，请通过如下步骤进行解决。

典型场景：

从4.1.3.400版本开始，abiFilters字段缺省配置为"arm64-v8a"，将默认只编译arm64-v8a一种ABI，若设备不支持64位ABI，构建出的包将无法运行在设备上，请根据设备支持的ABI，在build-profile.json5中的buildOption/externalNativeOptions内手动配置abiFilters的值。

```json
// HarmonyOS工程
"buildOption": {
  "externalNativeOptions": {
    "abiFilters": ["arm64-v8a", "x86_64"]
  },
}
// OpenHarmony工程
"buildOption": {
  "externalNativeOptions": {
    "abiFilters": ["arm64-v8a", "x86_64", "armeabi-v7a"]
  },
}
```

说明

-   如果工程有依赖HSP或者HAR模块，请确保所有包含C++代码的模块配置的ABI类型包含设备支持的Abi类型。
-   如果工程依赖的三方库包含so文件，请确保oh\_modules/三方库/libs目录包含有设备支持的ABI目录，如libs/arm64-v8a、/libs/x86\_64。
-   对于HarmonyOS应用，在DevEco Studio NEXT Developer Beta1（5.0.3.200）及以上版本不支持编译armeabi-v7a架构的so文件。

通用场景：

1.  将设备与DevEco Studio进行连接。
2.  打开命令行终端，并进入hdc目录：_DevEco Studio安装__目录_/sdk/default/openharmony/toolchains。
3.  执行如下命令，查询设备支持的ABI列表，返回结果为default/armeabi/arm64-v8a/x86/x86\_64中的一个或多个ABI类型。
    
    ```csharp
    hdc shell
    param get const.product.cpu.abilist
    ```
    
4.  根据查询返回结果，检查[模块级build-profile.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-hvigor-build-profile-V5#section11914746114811)文件中的“abiFilters”参数中的配置，规则如下：
    
    -   若返回结果为default，请执行如下命令，查询是否存在lib64文件夹。
        
        ```bash
        cd /system/
        ls
        ```
        
        ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/2d/v3/SRgcmYVOTuSeg8ACI55TKg/zh-cn_image_0000002434852810.png?HW-CC-KV=V1&HW-CC-Date=20260313T055424Z&HW-CC-Expire=86400&HW-CC-Sign=C37E7189682B75CDE5278E30006DC9481572CFB7CEFE1E0CA0195A320BF3AB70)
        
        -   存在lib64文件夹：则“abiFilters”参数中需要包含arm64-v8a类型。
        -   不存在lib64文件夹：则“abiFilters”参数中需要包含armeabi类型。
        
    -   若返回结果为armeabi/arm64-v8a/x86/x86\_64中的一个或多个，需要在“abiFilters”参数中**至少包含返回结果中的一个ABI**类型。

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-14*