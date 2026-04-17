---
title: DevEco Studio上使用生成NAPI功能时， 提示“Failed to generate NAPI, check the napi_init.cpp file and try again. ”错误
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-coding-14
category: FAQ
updated_at: 2026-03-13T05:28:17.245Z
---

# DevEco Studio上使用生成NAPI功能时， 提示“Failed to generate NAPI, check the napi_init.cpp file and try again. ”错误

**问题现象**

右键单击函数， 在弹出的菜单中依次选择 Generate... > NAPI， 生成胶水代码报错。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c7/v3/g00juPOASmmb9VJ-05Zn2A/zh-cn_image_0000002229604349.png?HW-CC-KV=V1&HW-CC-Date=20260313T052812Z&HW-CC-Expire=86400&HW-CC-Sign=D384C763A98BDCC32A4C82B8C4C2519B38882A3B19AC392A59CF5A91B6F16E94)

**解决措施**

检查napi\_init.cpp文件的Init函数中是否初始化了napi\_property\_descriptor变量。没有初始化请添加napi\_property\_descriptor desc\[\] = {}; 然后重新生成NAPI。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/37/v3/mHo1HdqKQOmqBAmgBcA_Mw/zh-cn_image_0000002194318564.png?HW-CC-KV=V1&HW-CC-Date=20260313T052812Z&HW-CC-Expire=86400&HW-CC-Sign=B95FAE25DACA9E16CF81050A5B89FA781B00531897406856BF14A64FDD199988)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-coding-14*