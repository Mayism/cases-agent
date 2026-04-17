---
title: debug启动调试
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-debug
category: 指南
updated_at: 2026-03-13T04:54:29.403Z
---

# debug启动调试

可以按照如下方式启动调试会话。

1.  如果需要设置断点调试，找到需要暂停的代码片段，点击该代码行的左侧边线，或将光标置于该行上并按Ctrl + F8（macOS为Command+F8）。如果无法添加断点，请查看FAQ[调试过程中无法添加断点](https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-debugging-1)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/83/v3/m0jchRrrSAixWanE5G_sxQ/zh-cn_image_0000002501069838.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=71B7B3D4D91EF2E7F192F0905030F3062725035676B649B1DA3C1A84D4B978F7)
    
    设置断点后，调试能够在正确的断点处中断，并高亮显示该行。
    
2.  在设备选择框中，选择调试的设备。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/d4/v3/4hd7zI-pTDiwdB4ujeqQnQ/zh-cn_image_0000002532749861.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=00DB3695A32BB42919896C2DF6E02F2EE22E70AA7136AD985A415BA41B87F226)
    
3.  选择启动调试的配置，在模块选择框中选择需要调试的模块。也可以通过Edit Configurations[配置调试参数](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-run-debug-configurations)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/63/v3/yvSIIEqiQ-uQTJO60PzQwg/zh-cn_image_0000002500909986.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=256E2D64B36B85D981A719128C9D48DDB82FA9C75EF03F055BEDC1232EF273D6)
    
4.  在工具栏中，单击Debug![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/42/v3/QXVdR_glQ5ubdcUN0tTAvw/zh-cn_image_0000002532749853.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=D83AEBB21DBFAEF01F911F18D9A0CF01034F3772FBF9354E78843A1507776ADB)。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/c2/v3/B0L8PUWATIm6C9h3EhzOEg/zh-cn_image_0000002501069836.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=FA8B94484A2476AED57682AD61A73290BC0F53419ABC2F658E195B0BCCBEED78)
    
    或者在工具栏中Run中选择Debug。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/32/v3/_HJUKYZNSKerk0pwJoPijw/zh-cn_image_0000002532669917.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=C58338E0E370BA4D4CFD05E7E47ADB90C4634DBD5D7B84A82AED741E0863865D)
    
5.  启动调试后，开发者可以通过[调试器](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-debugger)进行代码调试。
    
    如有断点会在断点处高亮，并展示当前断点处的Frames和Variables。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/19/v3/deEl1o3-Rgi6xJoUKfXbwQ/zh-cn_image_0000002532669909.png?HW-CC-KV=V1&HW-CC-Date=20260313T045351Z&HW-CC-Expire=86400&HW-CC-Sign=0B40DE78E07FCA15E29E80F3C2AA7CA8790DD747BC82F06EE03D6A705F1EF39D)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-debug*