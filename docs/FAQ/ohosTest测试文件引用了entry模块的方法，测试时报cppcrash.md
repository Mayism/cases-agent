---
title: ohosTest测试文件引用了entry模块的方法，测试时报cppcrash
source: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-8
category: FAQ
updated_at: 2026-03-13T06:02:58.843Z
---

# ohosTest测试文件引用了entry模块的方法，测试时报cppcrash

**问题现象**

如果ohosTest测试文件引用了entry的方法，并且entry中存在以普通形式（例如"entry/ets/workers/Worker.ets"）加载worker时，测试执行期间会报cppcrash。

![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/a2/v3/eBmSXNt0Qwae-a8SCzdZJQ/zh-cn_image_0000002194318400.png?HW-CC-KV=V1&HW-CC-Date=20260313T060254Z&HW-CC-Expire=86400&HW-CC-Sign=24DA35E6B84E320276BE68093D3628C91E41F2279744E2A7DD83B65A954E0C67)

**解决措施**

修改entry中实例化worker的路径形式为带@标识的路径加载形式或相对路径加载形式，再次执行测试以确保可以正常通过。

-   @标识路径加载形式("@entry/ets/workers/Worker.ets")：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/e/v3/CJ8-dYBBQ6S3Lx0qHPIJ5w/zh-cn_image_0000002194158792.png?HW-CC-KV=V1&HW-CC-Date=20260313T060254Z&HW-CC-Expire=86400&HW-CC-Sign=A20A3AC49C477C99E4A4F6733F45262C04AA3043CB38601FD6CD572CBA11B758)
    
-   相对路径加载形式("../workers/Worker.ets")：
    
    ![](https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_scene_100_1/97/v3/LhV7lKuLSPu3KrCzkzgxFQ/zh-cn_image_0000002229758665.png?HW-CC-KV=V1&HW-CC-Date=20260313T060254Z&HW-CC-Expire=86400&HW-CC-Sign=C7E28B45328E49D1F5422395C56E00B4073081A9310CC25D57A434D0D05DE509)

---

*来源: https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-app-test-8*