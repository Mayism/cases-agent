---
title: 使用UBSan检测未定义行为
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ubsan
category: 指南
updated_at: 2026-03-13T05:00:56.474Z
---

# 使用UBSan检测未定义行为

代码中出现未定义行为，最初可能不会产生任何问题，但是随着代码的复杂度提高，未定义行为可能造成程序崩溃或发生错误，检测出根源会变得更加困难。UBSan（Undefined Behavior Sanitizer）可以检测代码中出现的未定义行为，帮助用户清除未定义行为引起的运行时错误。

常见的未定义行为有：

-   除数为零。
-   使用未对齐的指针，或未对齐的引用。
-   浮点数转换导致的溢出。
-   访问空指针。

该功能从DevEco Studio 5.1.0 Release版本开始支持。

## 使用约束

ASan、TSan、UBSan、HWASan不能同时开启，四个只能开启其中一个。

## 使能UBSan

可通过以下两种方式使能UBSan。

### 方式一

点击****Run > Edit Configurations >** Diagnostics**，勾选**UndefinedBehaviorSanitizer**开启检测。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b6/v3/rZ7bREvQRgSMiPXYYH8yiw/zh-cn_image_0000002532670123.png?HW-CC-KV=V1&HW-CC-Date=20260313T050019Z&HW-CC-Expire=86400&HW-CC-Sign=5325CDEF2361011B8606398B4237993F06E07A6B909F4B5223623722AEFD5F1F)

### 方式二

在需要使能UBSan的模块中，通过添加构建参数开启UBSan检测插桩，在对应模块的模块级build-profile.json5中添加命令参数：

```json
"arguments": "-DOHOS_ENABLE_UBSAN=ON"
```

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e6/v3/zAkJbrdBTV28YI7NhA70vg/zh-cn_image_0000002501070048.png?HW-CC-KV=V1&HW-CC-Date=20260313T050019Z&HW-CC-Expire=86400&HW-CC-Sign=6E5156A49A316956E13D16B2624D3588316BBD84925AA628BF85FC81ACA96E4B)

## 启用UBSan

1.  运行或调试当前应用。
2.  当检测出未定义行为时，弹出UBSan log信息，点击信息中的链接即可跳转到未定义行为的代码处。日志中的异常检测类型请参考[UBSan异常检测类型](https://developer.huawei.com/consumer/cn/doc/best-practices/bpta-stability-ubsan-detection#section124211321406)。
    
    说明
    
    无论[编译模式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-compilation-options-customizing-guide#section192461528194916)是debug或release，均有链接可直接跳转至源码。
    

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/dc/v3/VGszb6P5QpWyzhuWxB79iw/zh-cn_image_0000002532670125.png?HW-CC-KV=V1&HW-CC-Date=20260313T050019Z&HW-CC-Expire=86400&HW-CC-Sign=F64858C3304923C9DB289AAE201EF460D0B286486E3D5A73EDDD33B1B72F95E1)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ubsan*