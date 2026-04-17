---
title: ModuleManager模块加载流程是什么样的
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-109
category: FAQ
updated_at: 2026-03-13T03:04:58.642Z
---

# ModuleManager模块加载流程是什么样的

napi\_module结构体包含模块注册所需的信息，具体定义如下：

```cpp
static napi_module demoModule = {
  .nm_version = 1, // Nm version number, default value is 1, type is int
  .nm_flags = 0, // Nm identifier, type unsigned int
  .nm_filename = nullptr, // File name, not currently paid attention to, use default value, type is char*
  .nm_register_func = Init, // Specify the entry function for nm, type napi_addon_register_func
  .nm_modname = "entry", // Specify the module name for TS page import, type char*
  .nm_priv = ((void*)0),  // Not paying attention for now, just use the default, type is void*
  .reserved = { 0 } // Not paying attention for now, just use the default value, type is void*
};
```

[DemoModule.cpp](https://gitcode.com/HarmonyOS_Samples/faqsnippets/blob/master/ArkTS/entry/src/main/ets/pages/DemoModule.cpp#L21-L29)

在requireNapi中，loadNativeModule加载模块，会先通过FindNativeModuleByCache在缓存中寻找目标module，如果在缓存中找到，使用GetNativeModulePath拼接so路径，最后用LoadModuleLibrary打开so；如果没有在缓存中找到，则要先查找dlopen打开对应so，打开so后，native中的extern "C" \_\_attribute\_\_((constructor)) void RegisterModule(void)函数进行NativeModule加载，然后完成static napi\_value Init(napi\_env env, napi\_value export)中的实际注册动作，返回一个js对象export，该js对象上挂载了开发者提供的native方法，以便于开发者在js侧调用。模块加载流程简介如下图：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b4/v3/KhTbAFsjTjym0tRgVKCDCw/zh-cn_image_0000002229604001.png?HW-CC-KV=V1&HW-CC-Date=20260313T030453Z&HW-CC-Expire=86400&HW-CC-Sign=3D981B83CFA47F48ACC16494B18AC2325D115381598202AC54B639405E610003 "点击放大")

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-arkts-109*