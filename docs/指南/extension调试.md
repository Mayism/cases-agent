---
title: extension调试
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-extension
category: 指南
updated_at: 2026-03-13T04:55:20.028Z
---

# extension调试

开发者可通过两种方式对[Extension Ability](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/extensionability-overview)生命周期函数进行调试。

-   应用安装到设备上后，通过等待调试方式进行调试。
-   修改运行调试配置项，指定当前运行或调试的Ability为Extension Ability。

## 等待调试方式

1.  参考[等待调试](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-attach-to-process)对当前调试工程进行调试。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/50/v3/MvLypmdOTLKtIK6PScAHCA/zh-cn_image_0000002501070418.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=3992F265484280400DA79786520D5186A17DFF79EEA58635FDBDEC8E0F6BA0E9)
    
2.  在Extension Ability生命周期内设置断点。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/5e/v3/VnNePVxlQUe_Tw9A2P_-gg/zh-cn_image_0000002532750447.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=0BF2B0B7592C607354566D3BB7BB2FD5AE9E65E712D03CDFBA946B671F97B1A5)
    
3.  等待Extension Ability生命周期函数代码调用从而命中断点。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/78/v3/laeYvO57QEift_etW_eLgA/zh-cn_image_0000002532750443.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=FD078EC5F88A1D1A6E970C91DB05AA42A711CD084AEF011657E77D33E591EDC5)
    

## 修改运行配置方式

1.  在运行调试窗口，运行配置项**Launch Options**选择**Specified Ability**。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/ee/v3/Qr_TWPMOREOE74NzkMNY3Q/zh-cn_image_0000002501070426.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=E893750F32539A28862647AE493B8C0E9BBB03B7D3BD2123C507C78B56C7BF34)
    
2.  选择需要进行调试的Extension Ability。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/3f/v3/MZnojJ7IRpOR_EYIbSHjRg/zh-cn_image_0000002532670493.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=5CD25A3CA18E613154C0609D118708993C37516B373C3D8FC6CA7F07158F6DFA)
    
3.  点击**OK**保存配置后，点击调试按钮![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/25/v3/cTxV5ItgQGGPK8APdqv3Mw/zh-cn_image_0000002532670497.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=A29E03173D0CBBA2B7A25D8B46BD31C9E96609648CB1393A700BE6625FB94619)，启动调试即可命中 Extension Ability 中的生命周期函数断点。
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/20/v3/qoQCo9NcSWm1-MY44Y-YDA/zh-cn_image_0000002501070424.png?HW-CC-KV=V1&HW-CC-Date=20260313T045438Z&HW-CC-Expire=86400&HW-CC-Sign=E6C41059640D778904D6DB46F266A4112BB797618306B5D5DBAFB376FA20C794)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-debug-arkts-extension*