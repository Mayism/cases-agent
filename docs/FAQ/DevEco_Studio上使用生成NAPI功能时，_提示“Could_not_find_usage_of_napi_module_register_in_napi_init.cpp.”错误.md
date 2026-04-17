---
title: DevEco Studio上使用生成NAPI功能时， 提示“Could not find usage of napi_module_register in napi_init.cpp.”错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-coding-15
category: FAQ
updated_at: 2026-03-13T05:28:24.853Z
---

# DevEco Studio上使用生成NAPI功能时， 提示“Could not find usage of napi_module_register in napi_init.cpp.”错误

**问题现象**

右键单击函数， 在弹出的菜单中依次选择 Generate... > NAPI， 生成胶水代码报错。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e8/v3/l3tDr_uhTWK0qi0u2xONzA/zh-cn_image_0000002229758437.png?HW-CC-KV=V1&HW-CC-Date=20260313T052818Z&HW-CC-Expire=86400&HW-CC-Sign=4103C800CD63371E9076D01E433C8EEBB74A130120487B93D805AC05598EB028)

**解决措施**

检查napi\_init.cpp文件的RegisterEntryModule函数中是否调用了napi\_module\_register函数。napi\_module\_register的参数类型为napi\_module\*, napi\_module初始化示例代码如下图所示。然后重新生成NAPI。

字段含义：

nm\_version: N-API模块版本

nm\_flags: 模块的属性标志

nm\_filename: N-API模块的文件名

nm\_register\_func: 注册函数

nm\_modname: 模块名称

nm\_priv: 私有数据指针

reserved: 保留字段

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/b8/v3/3o0DDqD2TEuUrux_-LGDkA/zh-cn_image_0000002519864254.png?HW-CC-KV=V1&HW-CC-Date=20260313T052818Z&HW-CC-Expire=86400&HW-CC-Sign=1020D679774FD053CAD17D0291D01131B085C1208C8C0F15D1ABD7546CF25B44)

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/1/v3/3uWqj7SjQi2W_k6LBHGDHg/zh-cn_image_0000002229603969.png?HW-CC-KV=V1&HW-CC-Date=20260313T052818Z&HW-CC-Expire=86400&HW-CC-Sign=F8A0E08801F8DDC1B96E4B8066F63A08981BFEB589E4A1F4F5089E680F80DDDB)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-coding-15*