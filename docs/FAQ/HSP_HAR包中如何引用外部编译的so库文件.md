---
title: HSP/HAR包中如何引用外部编译的so库文件
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-6
category: FAQ
updated_at: 2026-03-13T02:39:58.159Z
---

# HSP/HAR包中如何引用外部编译的so库文件

1.  libxxx.so库文件放入HAR或HSP的libs/arm64-v8a目录。设备类型不同时，需添加对应子目录。新版的arm64为libs/arm64-v8a，老版的arm64为libs/armeabi-v7a，x86模拟器为libs/x86\_64。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a5/v3/cbP3SjxgQVyLNi7wGoVTsw/zh-cn_image_0000002194158696.png?HW-CC-KV=V1&HW-CC-Date=20260313T023951Z&HW-CC-Expire=86400&HW-CC-Sign=1D67C2637EE3504F5780EBD095E482AF8B52B115948BB919312A80160C653ECF "点击放大")
    
2.  在src/main/cpp/CMakeLists.txt文件中链接so库文件。例如：target\_link\_libraries(entry PUBLIC libxxx)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-package-structure-6*