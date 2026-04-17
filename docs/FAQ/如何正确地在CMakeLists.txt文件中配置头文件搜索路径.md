---
title: 如何正确地在CMakeLists.txt文件中配置头文件搜索路径
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-43
category: FAQ
updated_at: 2026-03-13T03:31:36.465Z
---

# 如何正确地在CMakeLists.txt文件中配置头文件搜索路径

请按照以下示例进行配置：

**例1****：**

目录结构：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d9/v3/iKmkSkpOT3uCkjINqS1Sjw/zh-cn_image_0000002199836868.png?HW-CC-KV=V1&HW-CC-Date=20260313T033130Z&HW-CC-Expire=86400&HW-CC-Sign=F19AEE846AA176640D9ADABB375FB16B06EB40BF78C40A64F13E19BF8959D81F)

CMakeLists.txt配置头文件搜索路径：

include\_directories(${NATIVERENDER\_ROOT\_PATH}/include)

cpp文件中引用头文件:

#include 'test.h'

**例2****：**

目录结构：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a8/v3/zROMaIdITSuyxkJ5bKqsng/zh-cn_image_0000002234797125.png?HW-CC-KV=V1&HW-CC-Date=20260313T033130Z&HW-CC-Expire=86400&HW-CC-Sign=A4297C0E26038FCE23184C91739EF6423D5889E438F6F76867449B259BADA7E6)

CMakeLists.txt配置头文件搜索路径：

include\_directories(${NATIVERENDER\_ROOT\_PATH})

cpp文件中引用头文件:

#include 'include/test/test.h'

**例3：**

目录结构：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/de/v3/1_WlrbZYSsy6iWrhTBPqKg/zh-cn_image_0000002234956969.png?HW-CC-KV=V1&HW-CC-Date=20260313T033130Z&HW-CC-Expire=86400&HW-CC-Sign=48C4C7BA664DE8E9B75BDDDEC9F44AFCB28CEFCC6644A778B27FF7EA09639359)

CMakeLists.txt配置头文件搜索路径：

include\_directories(${NATIVERENDER\_ROOT\_PATH}/include)

cpp文件中引用头文件:

#include 'test/test.h'

**例4:**

目录结构：

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/51/v3/_hlHYjq6QfCct2ON0CO7xA/zh-cn_image_0000002199996680.png?HW-CC-KV=V1&HW-CC-Date=20260313T033130Z&HW-CC-Expire=86400&HW-CC-Sign=2E4478C2D55F4C2F6870FAFBEE3CF63B1BB4D8F6E4F5EB84E2809DE8469A8F10)

CMakeLists.txt配置头文件搜索路径:

include\_directories(${NATIVERENDER\_ROOT\_PATH}/include/test)

cpp文件中引用头文件:

#include 'test.h'

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-ndk-43*